

; -----------------------------------------------
; serpent in 32-bit x86 assembly
; odzhan
; derived from modified source of Daniel Otte
;
; size: 646 bytes
;
; big thanks to Peter Ferrie for suggestions and inspiration
;
; global calls are cdecl
;
; -----------------------------------------------
bits 32

GOLDEN_RATIO    equ 0x9e3779b9

SERPENT_ROUNDS  equ 32
SERPENT_BLK_LEN equ 16

SERPENT_KEY128  equ 16
SERPENT_KEY192  equ 24
SERPENT_KEY256  equ 32

SERPENT_ENCRYPT equ 1
SERPENT_DECRYPT equ 0

; void blkxor (dst, src)
; expects src in esi, dst in edi
blkxor:
    pushad
    push   4
    pop    ecx
blk_l:
    lodsd
    xor    eax, [edi]
    stosd
    loop   blk_l
    popad
    ret
      
; void serpent_fp (out, in);

%define x0 eax
%define x1 ebx
%define x2 ecx
%define x3 edx
%define x4 ebp

; CF=0 for encrypt
; CF=1 for decrypt
;
; edi = input
serpent_lt:
    pushad
    mov    esi, edi
    
    lodsd
    xchg   x0, x3
    lodsd
    xchg   x0, x1
    lodsd
    xchg   x0, x2
    lodsd
    xchg   x0, x3
    
    jnc    lt_dec   ; if CF=0 do decryption
    
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
    global serpent_enc
    global _serpent_enc
%endif    
serpent_enc:
_serpent_enc:
    pushad
    mov    edi, [esp+32+ 4]  ; out
    mov    esi, [esp+32+ 8]  ; in
    ; blkcpy (out, in);
    pushad
    movsd
    movsd
    movsd
    movsd
    popad
    mov    esi, [esp+32+12]  ; key
    xor    edx, edx          ; i=0
s_el:
    ; blkxor (out, &key->x[i]);
    call   blkxor
    
    ; sbox128 (out, i, SERPENT_ENCRYPT);
    stc                      ; CF=1 SERPENT_ENCRYPT
    call   sbox128
    
    add    esi, 16
    
    cmp    edx, SERPENT_ROUNDS-1
    jne    s_elt
    
    ; blkxor (out, &key->x[SERPENT_ROUNDS]);
    call   blkxor
    jmp    s_edi
s_elt:
    ; serpent_lt (out, SERPENT_ENCRYPT);
    stc                      ; CF=1 SERPENT_ENCRYPT
    call   serpent_lt
s_edi:
    inc    edx
    cmp    edx, SERPENT_ROUNDS
    jne    s_el
    
    popad
    ret

%ifndef BIN
    global serpent_dec
    global _serpent_dec
%endif    
serpent_dec:
_serpent_dec:
    pushad
    mov    edi, [esp+32+ 4]  ; out
    mov    esi, [esp+32+ 8]  ; in
    ; blkcpy (out, in);
    push   16
    pop    ecx
    pushad
    rep    movsb
    popad
    shl    ecx, 1            ; *= 2 for default SERPENT_ROUNDS
    mov    esi, ecx          ; esi = 16
    shl    esi, 4            ; esi = 32*16
    add    esi, [esp+32+12]  ; key
    
    ; blkxor (out, &key->x[i]);
    call   blkxor
    jmp    s_sbx
s_dlt:
    ; serpent_lt (out, SERPENT_DECRYPT);
    clc                      ; CF=0 SERPENT_DECRYPT
    call   serpent_lt    
s_sbx:
    dec    ecx               ; --i
    sub    esi, 16
    mov    edx, ecx
    ; sbox128 (out, i-1, SERPENT_DECRYPT);
    clc                      ; CF=0 SERPENT_DECRYPT
    call   sbox128
    
    ; blkxor (out, &key->x[i-1]);
    call   blkxor
    
    test   ecx, ecx
    jnz    s_dlt
    popad
    ret
    
%ifndef BIN
    global serpent_setkey
    global _serpent_setkey
%endif  
  
serpent_setkey:  
_serpent_setkey:  
    pushad
    mov    ebp, [esp+32+ 4]  ; ebp = key_ctx
    mov    esi, [esp+32+ 8]  ; esi = key_data
    mov    ebx, [esp+32+12]  ; ebx = key_len
    push   32
    pop    ecx
    sub    esp, ecx          ; create workspace
    
    ; for (i=0; i<32; i++) {
    ;   s_ws.v8[i]=0;
    ; }
    mov    edi, esp          ; set local to zero
    xor    eax, eax
    cmp    ecx, ebx
    rep    stosb
    
    ; i=key_len > SERPENT_KEY256 ? SERPENT_KEY256 : key_len;
    ; memcpy (&s_ws.v8[0], key, i);
    mov    edi, esp           ; copy key <= SERPENT_KEY256
    cmovae ecx, ebx           ; is ecx less than key_len?
    setae  al
    rep    movsb              ; move key into workspace

    mov    esi, esp           ; esi = workspace
    mov    edi, ebp           ; edi = ctx
    or     byte [esi+ebx], al ; potential bug if ebx exceeds 256-bits
skey_il:
    xor    edx, edx           ; j=0
skey_jl:
    ; serpent_gen_w (s_ws.v32, i*4+j);
    mov    eax, [esi]
    xor    eax, [esi+3*4]
    xor    eax, [esi+5*4]
    xor    eax, [esi+7*4]
    xor    eax, GOLDEN_RATIO
    lea    ebx, [edx+4*ecx]
    xor    eax, ebx
    rol    eax, 11
    stosd
    
    ; rotate workspace left 32 bits
    pushad
    ; memmove (s_ws.v32, &s_ws.v32[1], 7);
    mov    edi, esi
    add    esi, 4
    push   7
    pop    ecx
    rep    movsd
    stosd                    ; s_ws.v32[7] = key->x[i].v32[j];
    popad
    
    ; j++
    inc    edx
    cmp    edx, 4
    jne    skey_jl
    
    ; i++
    inc    ecx
    cmp    ecx, SERPENT_ROUNDS
    jbe    skey_il
    
    ; -------------------------------
    xor    ecx, ecx          ; i=0
    mov    edi, ebp          ; edi = key
skey_sbx:
    ; sbox128 (&key->x[i], 3 - i, SERPENT_ENCRYPT);
    mov    edx, ecx          ; ecx=i
    neg    edx               ; 
    add    edx, 3            ; i - 3
    stc                      ; set carry flag for encryption
    call   sbox128
    add    edi, 16           ; advance key 1
    inc    ecx               ; i++
    cmp    ecx, SERPENT_ROUNDS
    jbe    skey_sbx
    add    esp, 32           ; free memory (using ecx-1 might be smaller)
    popad
    ret
   
; void serpent_ip (out, in);
; edi = out
; esi = in
; ecx = SERPENT_BLK_LEN
serpent_ip:
    pushad
    ; blkclr (out);
    xor    eax, eax
    pushad
    rep    stosb
    popad
ip_n_l:
    cdq            ; m=0
ip_m_l:
    mov    eax, edx
    and    eax, 3
    ; Peter Ferrie suggested these 2
    ; as replacement for old code
    shr    dword[esi+4*eax], 1
    rcr    byte[edi], 1
    inc    edx
    cmp    edx, 8
    jne    ip_m_l
    inc    edi
    loop   ip_n_l
    popad
    ret
       
; void serpent_fp (out, in);
; edi = out
; esi = in
serpent_fp:
    pushad
    ; blkclr (out);
    xor    eax, eax
    push   4
    pop    ecx
    pushad
    rep    stosd
    popad
fp_n_l:
    cdq          ; m=0
fp_m_l:
    mov    eax, edx
    and    eax, 3
    ; Peter Ferrie suggested using this
    ; slightly modified for changes
    shr    dword[esi], 1
    rcr    dword[edi+4*eax], 1
    inc    edx
    cmp    edx, 32
    jne    fp_m_l
    add    esi, 4
    loop   fp_n_l
    popad
    ret
 
; CF=1 : encryption
; CF=0 : decryption
;
; edi = blk
; edx = i
sbox128:
    pushad
    lea    esi, [sbox]        ; encryption sbox
    lea    eax, [sbox_inv]    ; decryption sbox
    cmovnc esi, eax           ; esi = (CF) ? sbox : sbox_inv
    and    edx, 7             ; %= 8
    lea    esi, [esi+8*edx]   ; esi = &sbox[i*8]
    sub    esp, 32            ; create 2 16-byte blocks
    mov    eax, esp           ; save in eax before saving blk in edi
    push   8                  ; load 16 bytes, 2 at a time
    pop    ecx
    push   edi                ; save pointer to blk
    xchg   eax, edi           ; edi = sb
sb_l1:
    lodsb                     ; t = sbp[i/2];
    ; Peter Ferrie suggested the following replacement
    aam    16
    xchg   ah, al
    ; sb.v8[i+0] = HI_NIBBLE(t);
    stosb
    xchg   ah, al
    ; sb.v8[i+1] = LO_NIBBLE(t);
    stosb
    ; -----------
    loop   sb_l1
    
    mov    cl, SERPENT_BLK_LEN
    ; restore blk and apply initial permutation
    ; edi now points to tmp_blk
    pop    esi
    ; serpent_ip (&tmp_blk, blk);
    call   serpent_ip
    
    mov    ebx, esp          ; ebx = sb
    push   esi               ; save blk again
    mov    esi, edi          ; esi = tmp_blk
    push   esi               ; save pointer to tmp_blk
sb_l2:
    lodsb                    ; t = tmp_blk.v8[i];
    ; Peter Ferrie optimized the following code
    aam    16
    xchg   ah, al
    xlatb
    xchg   ah, al
    xlatb
    aad    16 
    stosb
    loop   sb_l2
    
    ; restore tmp_blk and blk, then apply final permutation
    pop    esi
    pop    edi
    ; serpent_fp (blk, &tmp_blk);
    call   serpent_fp
    add    esp, 32
    popad
    ret
    
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
  

    