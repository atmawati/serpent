

.686
.model flat

.code

SHR_O macro a:req, cy:req
  ; c = a & 1;
  test   a, 1
  setc   cy
  ; a >>= 1;
  shr    a, 1
endm

SHR_I macro a:req, cy:req
  local lbl
  ; ((a) = (c ? 0x80 : 0x00) | ((a) >> 1))
  mov   a, 80h
  test  cy, cy
  shr   a, 1
endm

serpent_ip proc input:dword, output:dword
  local n:dword
  local m:dword
  
  pushad
  .repeat
    .repeat
      mov    eax, [m]
      and    ebx, 3
      mov    eax, [esi+4*ebx]
      test   eax, 1
      setc   dl
      shl    eax, 1
      mov    [esi+4*ebx], eax
      inc dword ptr[m]
    .until [m]==8
    inc dword ptr[n]
  .until [n]==16
  popad
  ret
serpent_ip endp

serpent_fp proc input:dword, output:dword
  pushad
  .repeat
    .repeat
      inc dword ptr[m]
    .until [m]==32
    inc dword ptr[n]
  .until [n]==4
  popad
  ret
serpent_fp endp

sbox128x proc box:dword, w:dword
  pushad
  popad
  ret
sbox128x endp

X0 equ <eax>
X1 equ <ebx>
X2 equ <ecx>
X3 equ <edx>

load_lt proc
  lodsd
  xchg    eax, edx
  lodsd
  xchg    eax, ebx
  lodsd
  xchg    eax, ecx
  lodsd
  xchg    eax, edx
  ret
load_lt endp

save_lt proc
  stosd
  xchg   eax, ebx
  stosd
  xchg   eax, ecx
  stosd
  xchg   eax, edx
  stosd
  ret
save_lt endp

serpent_lt proc b:dword
  pushad
  call   load_lt
  ; X0 = rotl32(X0, 13);
  rol    X0, 13
  ; X2 = rotl32(X2,  3);
  rol    X2, 3
  ; X1 ^= X0 ^ X2;
  xor    X1, X0
  xor    X1, X2
  ; X3 ^= X2 ^ (X0 << 3);
  mov    X4, X0
  shl    X4, 3
  xor    X3, X2
  xor    X3, X4
  ; X1 = rotl32(X1, 1);
  rol    X1, 1
  ; X3 = rotl32(X3, 7);
  rol    X3, 7
  ; X0 ^= X1 ^ X3;
  xor    X0, X1
  xor    X0, X3
  ; X2 ^= X3 ^ (X1 << 7);
  mov    X4, X1
  shl    X4, 7
  xor    X2, X3
  xor    X2, X4
  ; X0 = rotl32(X0, 5);
  rol    X0, 5
  ; X2 = rotr32(X2, 10);
  ror    X2, 10
  call   save_lt
  popad
  ret
serpent_lt endp

serpent_inv_lt proc b:dword
  pushad
  call   load_lt
	; X2 = rotl32(X2, 10);
  rol    X2, 10
	; X0 = rotr32(X0, 5);
  ror    X0, 5
	; X2 ^= X3 ^ (X1 << 7);
  mov    X4, X1
  shl    X4, 7
  xor    X2, X3
  xor    X2, X4
	; X0 ^= X1 ^ X3;
  xor    X0, X1
  xor    X0, X3
	; X3 = rotr32(X3, 7);
  ror    X3, 7
	; X1 = rotr32(X1, 1);
  ror    X1, 1
	; X3 ^= X2 ^ (X0 << 3);
  mov    X4, X0
  shl    X4, 3
  xor    X3, X2
  xor    X3, X4
	; X1 ^= X0 ^ X2;
  xor    X1, X0
  xor    X1, X2
	; X2 = rotr32(X2,  3);
  ror    X2, 3
	; X0 = rotr32(X0, 13);
  ror    X0, 13
  call   save_lt
  popad
  ret
serpent_inv_lt endp

GOLDEN_RATIO equ 09e3779b9lh

serpent_gen_w proc b:dword, i:dword
  ; ret = b[0] ^ b[3] ^ b[5] ^ b[7] ^ GOLDEN_RATIO ^ (uint32_t)i;
  mov    eax, [esi+4*0] ; b[0]
  xor    eax, [esi+4*3] ; b[3]
  xor    eax, [esi+4*7] ; b[7]
  xor    eax, GOLDEN_RATIO
  xor    eax, [i]
  ; ret = rotl32(ret, 11);
  rol    eax, 11
  ret
serpent_gen_w endp

serpent_enc proc
  local i:dword
  pushad
  .repeat
    ; memxor(buffer, ctx->k[i], 16);
    call  memxor
    ; sbox128(buffer, i);
    call  sbox128
    ; serpent_lt((uint8_t*)buffer);
    call  serpent_lt
  .until [i]==32
  popad
  ret
serpent_enc endp

serpent_dec proc
  pushad
  
  popad
  ret
serpent_dec endp

sbox label dword
  db 038h, 0F1h, 0A6h, 05Bh, 0EDh, 042h, 070h, 09Ch
  db 0FCh, 027h, 090h, 05Ah, 01Bh, 0E8h, 06Dh, 034h 
  db 086h, 079h, 03Ch, 0AFh, 0D1h, 0E4h, 00Bh, 052h
  db 00Fh, 0B8h, 0C9h, 063h, 0D1h, 024h, 0A7h, 05Eh
  db 01Fh, 083h, 0C0h, 0B6h, 025h, 04Ah, 09Eh, 07Dh
  db 0F5h, 02Bh, 04Ah, 09Ch, 003h, 0E8h, 0D6h, 071h
  db 072h, 0C5h, 084h, 06Bh, 0E9h, 01Fh, 0D3h, 0A0h
  db 01Dh, 0F0h, 0E8h, 02Bh, 074h, 0CAh, 093h, 056h
sbox_inv label dword
  db 0D3h, 0B0h, 0A6h, 05Ch, 01Eh, 047h, 0F9h, 082h
  db 058h, 02Eh, 0F6h, 0C3h, 0B4h, 079h, 01Dh, 0A0h
  db 0C9h, 0F4h, 0BEh, 012h, 003h, 06Dh, 058h, 0A7h
  db 009h, 0A7h, 0BEh, 06Dh, 035h, 0C2h, 048h, 0F1h
  db 050h, 083h, 0A9h, 07Eh, 02Ch, 0B6h, 04Fh, 0D1h
  db 08Fh, 029h, 041h, 0DEh, 0B6h, 053h, 07Ch, 0A0h
  db 0FAh, 01Dh, 053h, 060h, 049h, 0E7h, 02Ch, 08Bh
  db 030h, 06Dh, 09Eh, 0F8h, 05Ch, 0B7h, 0A1h, 042h
  
  end