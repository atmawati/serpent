

; SERPENT in x86 assembly
; Odzhan

.686
.model flat, stdcall

GOLDEN_RATIO    equ 09e3779b9h

SERPENT_ROUNDS  equ 32
SERPENT_BLK_LEN equ 16

SERPENT_KEY128  equ 16
SERPENT_KEY192  equ 24
SERPENT_KEY256  equ 32

SERPENT_ENCRYPT equ 0
SERPENT_DECRYPT equ 1

.code

; *****************************
; xor block
;
; esi=source
; edi=destination
; *****************************
blkxor proc
  pushad
  
  ; for (i=0; i<SERPENT_BLK_LEN/4; i++) {
  ;   dst->v32[i] ^= src->v32[i];
  ; }
  push   SERPENT_BLK_LEN/4
  pop    ecx
xor_blk:
  lodsd
  xor    eax, [edi]
  stosd
  loop   xor_blk
  popad
  ret
blkxor endp

; *****************************
; copy block
;
; esi=source
; edi=destination
; *****************************
blkcpy proc
  pushad
  
  ; for (i=0; i<SERPENT_BLK_LEN/4; i++) {
  ;   dst->v32[i] = src->v32[i];
  ; }
  movsd
  movsd
  movsd
  movsd
  popad
  ret
blkcpy endp

; *****************************
; clear block
;
; edi=blk
; *****************************
blkclr proc
  pushad
  
  ; for (i=0; i<SERPENT_BLK_LEN/4; i++) {
  ;   blk->v32[i] = 0;
  ; }
  xor    eax, eax
  stosd
  stosd
  stosd
  stosd
  popad
  ret
blkclr endp

; #define SHR_O(a) cy=(a) & 1; ((a) = (a) >> 1)
; #define SHR_I(a) ((a) = (cy ? 0x80 : 0x00) | ((a) >> 1))

serpent_ip proc
  pushad
  
  ; blkclr (out);
  call  blkclr
  
  push  16
  pop   ecx
ip_l1:
  ; for (n=0; n<16; n++) {
  lodsb
ip_l2:
  ; for (m=0; m<8; m++) {
  ;   SHR_O(in->v32[m % 4])
  ;   cy=(a) & 1;
  mov   ebx, ebp
  and   ebx, 3
  mov   eax, [esi+4*ebx]
  test  eax, 1
  sete  dl
  ; ((a) = (a) >> 1)
  shr   eax, 1
  mov   [esi+4*ebx], eax
  ; SHR_I(out->v8[n]);
  ; ((a) = (cy ? 0x80 : 0x00) | ((a) >> 1))
  mov   dl, [edi]
  shr   dl, 1
  or    al, dl
  stosb
  
  inc   ebp
  cmp   ebp, 8
  jne   ip_l2
  
  loop  ip_l1
  popad
  ret
serpent_ip endp

; #define SHR_I(a) ((a) = (cy ? 0x80000000L : 0x00L) | ((a) >> 1))
serpent_fp proc
  pushad
  
  ; blkclr (out);
  call  blkclr
  
  ; for (n=0; n<4; n++) {
  push  4
  pop   ecx
fp_l1:
  lodsd
  ; for (m=0; m<32; m++) {
fp_l2:
  ; SHR_O(in->v32[n])
  ; cy=(a) & 1;
  test  eax, 1
  sete  dl
  ; ((a) = (a) >> 1)
  shr   eax, 1
  ; SHR_I(out->v32[m % 4]);  
  inc   ebp
  cmp   ebp, 32
  jne   fp_l2
  ; }
  loop  fp_l1
  ; }
  popad
  ret
serpent_fp endp

x0 equ <eax>
x1 equ <ebx>
x2 equ <ecx>
x3 equ <edx>
x4 equ <esi>

; perform linear transformation
serpent_lt proc
  pushad
  mov     edi, esi
  lodsd
  xchg    eax, x3
  lodsd
  xchg    eax, x1
  lodsd
  xchg    eax, x2
  lodsd
  xchg    eax, x3
  
  .if carry?
    ; x0 = rotl32(x0, 13);
    rol    x0, 13
    ; x2 = rotl32(x2,  3);
    rol    x2, 3
    ; x1 ^= x0 ^ x2;
    xor    x1, x0
    xor    x1, x2
    ; x3 ^= x2 ^ (x0 << 3);
    mov    x4, x0
    shl    x4, 3
    xor    x3, x2
    xor    x3, x4
    ; x1 = rotl32(x1, 1);
    rol    x1, 1
    ; x3 = rotl32(x3, 7);
    rol    x3, 7
    ; x0 ^= x1 ^ x3;
    xor    x0, x1
    xor    x0, x3
    ; x2 ^= x3 ^ (x1 << 7);
    mov    x4, x1
    shl    x4, 7
    xor    x2, x3
    xor    x2, x4
    ; x0 = rotl32(x0, 5);
    rol    x0, 5
    ; x2 = rotr32(x2, 10);
    ror    x2, 10
  .else
    ; x2 = rotl32(x2, 10);
    rol    x2, 10
    ; x0 = rotr32(x0, 5);
    ror    x0, 5
    ; x2 ^= x3 ^ (x1 << 7);
    mov    x4, x1
    shl    x4, 7
    xor    x2, x3
    xor    x2, x4
    ; x0 ^= x1 ^ x3;
    xor    x0, x1
    xor    x0, x3
    ; x3 = rotr32(x3, 7);
    ror    x3, 7
    ; x1 = rotr32(x1, 1);
    ror    x1, 1
    ; x3 ^= x2 ^ (x0 << 3);
    mov    x4, x0
    shl    x4, 3
    xor    x3, x2
    xor    x3, x4
    ; x1 ^= x0 ^ x2;
    xor    x1, x0
    xor    x1, x2
    ; x2 = rotr32(x2,  3);
    ror    x2, 3
    ; x0 = rotr32(x0, 13);
    ror    x0, 13
  .endif
  
  stosd
  xchg   eax, x1
  stosd
  xchg   eax, x2
  stosd
  xchg   eax, x3
  stosd
  popad
  ret
serpent_lt endp

serpent_gen_w proc
  ; ret = b[0] ^ b[3] ^ b[5] ^ b[7] ^ GOLDEN_RATIO ^ (uint32_t)i;
  mov    eax, [esi+4*0] ; b[0]
  xor    eax, [esi+4*3] ; b[3]
  xor    eax, [esi+4*7] ; b[7]
  xor    eax, GOLDEN_RATIO
  xor    eax, dword ptr[i]
  ; ret = rotl32(ret, 11);
  rol    eax, 11
  ret
serpent_gen_w endp

sbox128 proc blk:dword, box_idx:dword, enc_type:dword
  local sb[16]:byte
  local i:dword
  
  pushad
  lea    esi, [sbox]
  jnc    mod_idx
  lea    esi, [sbox_inv]
mod_idx:
  ; box_idx %= 8
  mov    eax, [box_idx]
  and    eax, 7
  lea    esi, [esi+8*eax]
  lea    edi, [sb]
  
  push   8
  pop    ecx
init_sbox:
  lodsb
  mov    ah, al
  ; sb.v8[2*i+0] = HI_NIBBLE(t);
  shr    al, 4
  stosb
  shr    eax, 12
  ; sb.v8[2*i+1] = LO_NIBBLE(t);
  stosb
  loop   init_sbox
  
  ; serpent_ip (blk, &tmp_blk);
  mov    esi, [blk]
  ;lea    edi, [tmp_blk]
  call   serpent_ip
  
  push   SERPENT_BLK_LEN
  pop    ecx
sbox_loop:
  ; t = tmp_blk.v8[i]
  lodsb
  mov    ah, al
  ; x = sb.v8[HI_NIBBLE(t)];
  movzx  edx, byte ptr[ebx+eax]
  or     bl, al
  xchg   eax, ebx
  stosb
  ; x = sb.v8[t >> 4]
  stosb
  loop   sbox_loop
  
  ; serpent_fp (&tmp_blk, blk);
  call   serpent_fp
  popad
  ret
sbox128 endp

keyspace union
  v8 byte 32 dup (?)
  v32 dword 8 dup (?)
keyspace ends

serpent_setkey proc C
  local x:keyspace
  
  pushad
  ; memset (&x, 0, sizeof (x));
  lea    edi, [x]
  push   sizeof x
  pop    ecx
  pushad
  xor    eax, eax
  rep    stosb
  popad
  ; memcpy (x.v8, input, inlen > 32 ? 32 : inlen);
  mov    eax, [esp+12]   ; inlen
  mov    esi, [esp+ 8]   ; input
  cmp    eax, ecx        ; SERPENT_KEY256
  cmovb  ecx, eax
  rep    movsb
  
  ; if (inlen < SERPENT_KEY256) {
  ;   x.v8[inlen] |= 1 << ((inlen*8) % 8);
  ; }
  cmovb  ecx, eax
  shl    eax, cl
  or     byte ptr[edi+ecx], 1
  
  push   SERPENT_ROUNDS
  pop    ecx
skey_l1:
  lodsd                 ; key->x[i].v32[j]
  
  ; for (i=0; i<=SERPENT_ROUNDS; i++) {
  ;   for (j=0; j<4; j++) {
  ;     key->x[i].v32[j] = serpent_gen_w (x.v32, i*4+j);
  ;    
  ;     // shift buffer one to the "left"
  ;     memmove (x.v32, &x.v32[1], 7*4);
  ;     x.v32[7] = key->x[i].v32[j];
  ;   }
  ; }
  
  ; for (i=0; i<=SERPENT_ROUNDS; i++) {
  ;   sbox128 (&key->x[i], 3 - i, SERPENT_ENCRYPT);
  ; }
sbox_loop:
  stc                ; SERPENT_ENCRYPT
  call   sbox128
  inc    ecx
  cmp    ecx, SERPENT_ROUNDS
  jbe    sbox_loop
  popad
  ret
serpent_setkey endp

serpent_enc proc C
  pushad
  
  mov    ebx, [esp+ 4] ; key
  mov    esi, [esp+ 8] ; in
  mov    edi, [esp+12] ; out
  
  ; blkcpy (out, in);
  call   blkcpy
  
  .while ecx < SERPENT_ROUNDS
    ; blkxor (out, &key->x[i]);
    call   blkxor
    ; sbox128 (out, i, SERPENT_ENCRYPT);
    stc
    call   sbox128
    .if ecx == SERPENT_ROUNDS - 1
      ; blkxor (out, &key->x[SERPENT_ROUNDS]);
      call   blkxor
    .else
      ; serpent_lt (out, SERPENT_ENCRYPT);
      stc
      call   serpent_lt
    .endif
  .endw
  popad
  ret
serpent_enc endp

serpent_dec proc C
  pushad
  
  mov    ebx, [esp+ 4] ; key
  mov    esi, [esp+ 8] ; in
  mov    edi, [esp+12] ; out
  
  ; blkcpy (out, in);
  call   blkcpy
  
  mov    esi, ebx
  mov    ecx, SERPENT_ROUNDS
  
  ; for (i=SERPENT_ROUNDS; i>0; --i) {
  .while ecx > 0
    .if ecx==SERPENT_ROUNDS
      ; blkxor (out, &key->x[i]);
      call   blkxor
    .else
      ; serpent_lt (out, SERPENT_DECRYPT);
      clc
      call   serpent_lt
    .endif
  
    ; sbox128 (out, i-1, SERPENT_DECRYPT);
    dec    ecx
    clc
    call   sbox128
  
    ; blkxor (out, &key->x[i-1]);
    sub    esi, 16
    call   blkxor
  .endw
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