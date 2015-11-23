

; -----------------------------------------------
; serpent in 32-bit x86 assembly
; odzhan
; derived from modified source of Daniel Otte
; -----------------------------------------------
bits 32

GOLDEN_RATIO    equ 0x9e3779b9

SERPENT_ROUNDS  equ 32
SERPENT_BLK_LEN equ 16

SERPENT_KEY128  equ 16
SERPENT_KEY192  equ 24
SERPENT_KEY256  equ 32

SERPENT_ENCRYPT equ 0
SERPENT_DECRYPT equ 1

%ifndef BIN
    global $@blkxor@8
%endif
; void blkxor (dst, src)
$@blkxor@8:
    pushad
    mov    edi, ecx
    mov    esi, edx
    push   4
    pop    ecx
blk_l:
    lodsd
    xor    eax, [edi]
    stosd
    loop   blk_l
    popad
    ret
    
%ifndef BIN    
    global $@blkcpy@8
%endif    
; void blkcpy (dst, src);
$@blkcpy@8:
    pushad
    mov    edi, ecx
    mov    esi, edx
    movsd
    movsd
    movsd
    movsd
    popad
    ret
    
%ifndef BIN
    global $@blkclr@4
%endif    
; void blkclr (in);
$@blkclr@4:
    pushad
    mov    edi, ecx
    xor    eax, eax
    stosd
    stosd
    stosd
    stosd
    popad
    ret
    
%ifndef BIN
    global $@serpent_ip@8
%endif    
; void serpent_ip (out, in);
$@serpent_ip@8:
    pushad
    call   $@blkclr@4
    mov    esi, edx ; in
    mov    edi, ecx ; out
    xor    ecx, ecx ; n=0
ip_n_l:
    xor    edx, edx ; m=0
ip_m_l:
    mov    eax, edx
    and    eax, 3
    mov    ebx, [esi+4*eax]
    shr    dword[esi+4*eax], 1
    and    ebx, 1
    shl    ebx, 7
    shr    byte[edi+ecx], 1
    or     byte[edi+ecx], bl
    
    inc    edx
    cmp    edx, 8
    jne    ip_m_l
    
    inc    ecx
    cmp    ecx, 16
    jne    ip_n_l
    
    popad
    ret
    
%ifndef BIN
    global $@serpent_fp@8
%endif    
; void serpent_fp (out, in);
$@serpent_fp@8:
    pushad
    call   $@blkclr@4
    mov    esi, edx ; in
    mov    edi, ecx ; out
    xor    ecx, ecx ; n=0
fp_n_l:
    xor    edx, edx ; m=0
fp_m_l:
    mov    ebx, [esi+4*ecx]
    shr    dword[esi+4*ecx], 1
    and    ebx, 1
    shl    ebx, 31
    mov    eax, edx
    and    eax, 3
    shr    dword[edi+4*eax], 1
    or     dword[edi+4*eax], ebx
    
    inc    edx
    cmp    edx, 32
    jne    fp_m_l
    
    inc    ecx
    cmp    ecx, 4
    jne    fp_n_l
    popad
    ret
    
%ifndef BIN
    global $@serpent_lt@8
%endif    
; void serpent_fp (out, in);

%define x0 eax
%define x1 ebx
%define x2 ecx
%define x3 edx
%define x4 ebp

; CF=0 for decrypt
; CF=1 for encrypt
$@serpent_lt@8:
    pushad
    mov    esi, ecx
    mov    edi, ecx
    
    dec    edx

    lodsd
    xchg   x0, x3
    
    lodsd
    xchg   x0, x1
    
    lodsd
    xchg   x0, x2
    
    lodsd
    xchg   x0, x3
    
    jz     lt_dec
    
    rol    x0, 13
    rol    x2, 3
    xor    x1, x0
    xor    x1, x2
    xor    x3, x2
    mov    x4, x0
    shl    x4, 3
    xor    x3, x4
    rol    x1, 1
    rol    x3, 7
    xor    x0, x1
    xor    x0, x3
    mov    x4, x1
    shl    x4, 7
    xor    x2, x3
    xor    x2, x4
    rol    x0, 5
    ror    x2, 10
    jmp    lt_end
lt_dec:
    rol    x2, 10
    ror    x0, 5
    mov    x4, x1
    shl    x4, 7
    xor    x2, x4
    xor    x2, x3
    xor    x0, x1
    xor    x0, x3
    ror    x3, 7
    ror    x1, 1
    mov    x4, x0
    shl    x4, 3
    xor    x3, x4
    xor    x3, x2
    xor    x1, x0
    xor    x1, x2
    ror    x2, 3
    ror    x0, 13
lt_end:
    stosd
    xchg   x0, x1
    stosd
    xchg   x0, x2
    stosd
    xchg   x0, x3
    stosd
    popad
    ret
   
%ifndef BIN   
    global $@serpent_enc@12
    ;extern $@sbox128@12
%endif    
$@serpent_enc@12:
    pushad
    call   $@blkcpy@8
    xor    ebx, ebx
    mov    esi, [esp+32+4] ; key
s_el:
    mov    edx, esi     ; &key[i]
    call   $@blkxor@8
    
    push   SERPENT_ENCRYPT
    mov    edx, ebx        ; i
    call   $@sbox128@12
    
    add    esi, 16         ; advance key
    
    cmp    ebx, SERPENT_ROUNDS-1
    jne    s_elt
    
    mov    edx, esi
    call   $@blkxor@8
    jmp    s_di
s_elt:
    mov    edx, SERPENT_ENCRYPT
    call   $@serpent_lt@8
s_di:
    inc    ebx
    cmp    ebx, SERPENT_ROUNDS
    jne    s_el
    
    popad
    ret

%ifndef BIN
    global $@serpent_dec@12
%endif    
$@serpent_dec@12:
    pushad
    call   $@blkcpy@8
    push   SERPENT_ROUNDS
    pop    ebx
    mov    esi, ebx
    shl    esi, 4
    add    esi, [esp+32+4] ; key
s_dl:
    cmp    ebx, SERPENT_ROUNDS
    jne    s_dlt
    
    mov    edx, esi
    call   $@blkxor@8
    jmp    s_sbx
s_dlt:
    mov    edx, SERPENT_DECRYPT
    call   $@serpent_lt@8    
s_sbx:
    dec    ebx
    sub    esi, 16
    
    push   SERPENT_DECRYPT
    mov    edx, ebx        ; i
    call   $@sbox128@12
    
    mov    edx, esi
    call   $@blkxor@8
    
    test   ebx, ebx
    jnz    s_dl
    
    popad
    ret
    
%ifndef BIN
    global $@serpent_setkeyx@12
%endif  
  
$@serpent_setkeyx@12:  
    pushad
    mov    ebp, ecx        ; ebp = key
    mov    esi, edx        ; input
    mov    ebx, [esp+32+4] ; inlen
    push   SERPENT_KEY256
    pop    ecx
    sub    esp, ecx        ; create workspace
    
    mov    edi, esp        ; set local to zero
    xor    eax, eax
    cmp    ecx, ebx
    pushfd
    rep    stosb
    popfd
    
    mov    edi, esp        ; copy key <= SERPENT_KEY256
    cmovae ecx, ebx
    setae  al
    rep    movsb           ; move input to local buffer

    dec    al
    mov    esi, esp        ; esi = s_ws
    mov    edi, ebp        ; edi = key
    jnz    skey_init
    or     byte [esi+ebx], 1
skey_init:
    xor    ebx, ebx        ; i=0
skey_il:
    xor    ecx, ecx        ; j=0
skey_jl:
    ; serpent_gen_w (s_ws.v32, i*4+j);
    mov    eax, [esi]
    xor    eax, [esi+3*4]
    xor    eax, [esi+5*4]
    xor    eax, [esi+7*4]
    xor    eax, GOLDEN_RATIO
    lea    edx, [ecx+4*ebx]
    xor    eax, edx
    rol    eax, 11
    stosd
    
    ; rotate left 32 bits
    pushad
    ; memmove (s_ws.v32, &s_ws.v32[1], 7);
    mov    edi, esi
    add    esi, 4
    push   7
    pop    ecx
    rep    movsd
    ; s_ws.v32[7] = key->x[i].v32[j];
    stosd
    popad
    
    ; j++
    inc    ecx
    cmp    ecx, 4
    jne    skey_jl
    
    ; i++
    inc    ebx
    cmp    ebx, SERPENT_ROUNDS
    jbe    skey_il
    
    ; -------------------------------
    xor    ebx, ebx   ; i=0
skey_sbx:
    pushad
    push   SERPENT_ENCRYPT
    mov    edx, ebx
    neg    edx
    add    edx, 3
    mov    ecx, ebp
    call   $@sbox128@12
    popad
    add    ebp, 16  ; advance key
    inc    ebx
    cmp    ebx, SERPENT_ROUNDS
    jbe    skey_sbx
    
    ; restore stack
    add    esp, 32
    popad
    ret
    
%ifndef BIN
    global $@sbox128@12
%endif
; CF=0 : encryption
; CF=1 : decryption
$@sbox128@12:
    pushad
    
    ;int3
    
    mov    ebp, ecx   ; ebp = blk
    lea    esi, [sbox]
    lea    eax, [sbox_inv]
    mov    ecx, [esp+32+4] ; type
    dec    ecx
    cmovz  esi, eax
    and    edx, 7
    lea    esi, [esi+8*edx]
    sub    esp, 32
    push   8
    pop    ecx
    mov    edi, esp   ; edi = sb
sb_l1:
    ; t = sbp[i/2];
    lodsb
    mov    dl, al
    ; sb.v8[i+0] = HI_NIBBLE(t);
    shr    al, 4
    stosb
    xchg   eax, edx
    ; sb.v8[i+1] = LO_NIBBLE(t);
    and    al, 15
    stosb
    loop   sb_l1
    
    mov    edx, ebp ; blk
    mov    ecx, edi ; tmp_blk
    call   @serpent_ip@8
    
    push   SERPENT_BLK_LEN
    pop    ecx
    mov    esi, edi      ; esi = tmp_blk
    mov    ebx, esp      ; ebx = sb
    push   esi
sb_l2:
    ; t = tmp_blk.v8[i];
    lodsb
    mov    dl, al
    ; sb.v8[HI_NIBBLE(t)] << 4)
    shr    al, 4
    xlatb
    shl    al, 4
    ; sb.v8[LO_NIBBLE(t)]
    xchg   eax, edx
    and    al, 15
    xlatb
    or     al, dl
    stosb
    loop   sb_l2
    
    pop    edx               ; edx=tmp_blk
    mov    ecx, ebp
    call   @serpent_fp@8
    
    add    esp, 32
    popad
    ret    4
    
sbox:
  db 038h, 0F1h, 0A6h, 05Bh, 0EDh, 042h, 070h, 09Ch
  db 0FCh, 027h, 090h, 05Ah, 01Bh, 0E8h, 06Dh, 034h 
  db 086h, 079h, 03Ch, 0AFh, 0D1h, 0E4h, 00Bh, 052h
  db 00Fh, 0B8h, 0C9h, 063h, 0D1h, 024h, 0A7h, 05Eh
  db 01Fh, 083h, 0C0h, 0B6h, 025h, 04Ah, 09Eh, 07Dh
  db 0F5h, 02Bh, 04Ah, 09Ch, 003h, 0E8h, 0D6h, 071h
  db 072h, 0C5h, 084h, 06Bh, 0E9h, 01Fh, 0D3h, 0A0h
  db 01Dh, 0F0h, 0E8h, 02Bh, 074h, 0CAh, 093h, 056h
sbox_inv:
  db 0D3h, 0B0h, 0A6h, 05Ch, 01Eh, 047h, 0F9h, 082h
  db 058h, 02Eh, 0F6h, 0C3h, 0B4h, 079h, 01Dh, 0A0h
  db 0C9h, 0F4h, 0BEh, 012h, 003h, 06Dh, 058h, 0A7h
  db 009h, 0A7h, 0BEh, 06Dh, 035h, 0C2h, 048h, 0F1h
  db 050h, 083h, 0A9h, 07Eh, 02Ch, 0B6h, 04Fh, 0D1h
  db 08Fh, 029h, 041h, 0DEh, 0B6h, 053h, 07Ch, 0A0h
  db 0FAh, 01Dh, 053h, 060h, 049h, 0E7h, 02Ch, 08Bh
  db 030h, 06Dh, 09Eh, 0F8h, 05Ch, 0B7h, 0A1h, 042h
  

    