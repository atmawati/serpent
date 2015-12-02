;  Copyright © 2015 Odzhan, Peter Ferrie. All Rights Reserved.
;
;  Redistribution and use in source and binary forms, with or without
;  modification, are permitted provided that the following conditions are
;  met:
;
;  1. Redistributions of source code must retain the above copyright
;  notice, this list of conditions and the following disclaimer.
;
;  2. Redistributions in binary form must reproduce the above copyright
;  notice, this list of conditions and the following disclaimer in the
;  documentation and/or other materials provided with the distribution.
;
;  3. The name of the author may not be used to endorse or promote products
;  derived from this software without specific prior written permission.
;
;  THIS SOFTWARE IS PROVIDED BY AUTHORS "AS IS" AND ANY EXPRESS OR
;  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
;  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
;  DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
;  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
;  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
;  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
;  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
;  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
;  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;  POSSIBILITY OF SUCH DAMAGE.

; -----------------------------------------------
; serpent-256 block cipher in x86 assembly
;
; Written by Odzhan and Peter Ferrie
;
; Derived from C implementation by Daniel Otte, 
; author of AVR-crypto-lib
;
; size: 556 bytes
;
; global calls use cdecl convention
;
; -----------------------------------------------
  bits 32

GOLDEN_RATIO    equ 0x9e3779b9

SERPENT_ROUNDS  equ 32
SERPENT_BLK_LEN equ 16
SERPENT_KEY256  equ 32

SERPENT_ENCRYPT equ 0
SERPENT_DECRYPT equ 1

%ifndef BIN
    global _serpent_setkeyx
    global _serpent_encryptx
%endif

struc pushad_t
  _edi dd ?
  _esi dd ?
  _ebp dd ?
  _esp dd ?
  _ebx dd ?
  _edx dd ?
  _ecx dd ?
  _eax dd ?
  .size:
endstruc

%define x0 eax
%define x1 ebx
%define x2 ecx
%define x3 edx
%define x4 ebp

; ecx=0 for encrypt
; ecx=1 for decrypt
;
; edi = input
_serpent_ltx:
serpent_lt:
    pushad
    mov    esi, edi
    test   ecx, ecx
    
    lodsd
    xchg   x0, x3
    lodsd
    xchg   x0, x1
    lodsd
    xchg   x0, x2
    lodsd
    xchg   x0, x3
    
    jz     lt_enc   ; if ecx=0, encryption
    
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
    jmp    lt_end
lt_enc:
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
    
_serpent_encryptx:
serpent_encrypt:
    pushad
    mov    edi, [esp+32+ 4]  ; out
    mov    esi, [esp+32+ 8]  ; key
    mov    ecx, [esp+32+12]  ; enc
    call   load_bxor
    pushad
    push   4
    pop    ecx
    shl    ebp, cl
    add    esi, ebp
blk_l:
    lodsd
    xor    eax, [edi]
    stosd
    loop   blk_l
    popad
    ret
load_bxor:
    pop    edx
    jecxz  encrypt
    
    push   SERPENT_ROUNDS
    pop    ebp
    ; blkxor (out, key, i);
    call   edx ; blkxor
    jmp    sd_e
sd_l:
    ; serpent_lt (out, SERPENT_DECRYPT);
    call   serpent_lt
sd_e:
    dec    ebp               ; --i
    ; sbox128 (out, i, SERPENT_DECRYPT);
    call   sbox128
    ; blkxor (out, key, i);
    call   edx ; blkxor
    test   ebp, ebp
    jnz    sd_l
    popad
    ret
    
encrypt:
    xor    ebp, ebp          ; i=0
    jmp    se_e
se_l:
    ; serpent_lt (out, SERPENT_ENCRYPT);
    call   serpent_lt
se_e:
    ; blkxor (out, key, i);
    call   edx ; blkxor
    ; sbox128 (out, i, SERPENT_ENCRYPT);
    call   sbox128
    inc    ebp
    cmp    ebp, SERPENT_ROUNDS
    jne    se_l
    call   edx ; blkxor
    popad
    ret

_serpent_setkeyx:  
serpent_setkey:  
    pushad
    mov    esi, [esp+32+8]  ; esi = input
    
    ; copy key into local memory
    push   32
    pop    ecx
    sub    esp, ecx
    mov    edi, esp
    rep    movsb
    
    mov    esi, esp          ; esi = local key bytes
    mov    edi, [edi+32+4]   ; edi = key ctx
    ; ecx is i which is now 0
skey_init_j:
    xor    edx, edx           ; j=0
skey_loop_j:
    ; serpent_gen_w (s_ws.v32, j+4*i);
    mov    eax, [esi]
    xor    eax, [esi+3*4]
    xor    eax, [esi+5*4]
    xor    eax, [esi+7*4]
    xor    eax, GOLDEN_RATIO
    lea    ebx, [edx+4*ecx]
    xor    eax, ebx
    rol    eax, 11
    mov    [edi+4*edx], eax
    
    ; rotate workspace left 32 bits
    pushad
    push   esi
    cmpsd
    pop    edi
    push   7
    pop    ecx
    rep    movsd
    stosd
    popad
    
    ; j++
    inc    edx
    cmp    edx, 4
    jne    skey_loop_j
    
    ; apply sbox
    push   ecx
    push   3
    pop    ebp
    sub    ebp, ecx          ; 3 - i
    xor    ecx, ecx          ; ecx=SERPENT_ENCRYPT
    call   sbox128
    pop    ecx
    
    ; advance key
    add    edi, 16
    
    ; i++
    inc    ecx
    cmp    ecx, 32
    jbe    skey_init_j
    
    add    esp, 32
    popad
    ret
   
; void serpent_perm (out, in);
; edi = out
; esi = in
; CF = type
_serpent_permx:
serpent_perm:
    pushad
    xchg   eax, ecx    ; ecx should be zero
    push   16
    pop    ecx
    pushad
    rep    stosb
    popad
    cdq            ; m=0
    jnc    do_fp
    ; initial permutation
ip_n_l:
ip_m_l:
    mov    eax, edx
    and    eax, 3
    shr    dword[esi+4*eax], 1
    rcr    byte[edi], 1
    inc    edx
    test   dl, 7
    jne    ip_m_l
    inc    edi
    loop   ip_n_l
xit_perm:
    popad
    ret
    ; final permutation
do_fp:
    mov    cl, 4    ; n=4
fp_n_l:
fp_m_l:
    mov    eax, edx
    and    eax, 3
    shr    dword[esi], 1
    rcr    dword[edi+4*eax], 1
    inc    edx
    test   dl, 31
    jne    fp_m_l
    lodsd
    loop   fp_n_l
    popad
    ret
 
; ecx=0 : encryption
; ecx=1 : decryption
;
; edi = blk
; ebp = i
_sbox128x:
sbox128:
    pushad
    mov    edx, edi
    call   init_sbox    
; sbox
  db 038h, 0F1h, 0A6h, 05Bh, 0EDh, 042h, 070h, 09Ch
  db 0FCh, 027h, 090h, 05Ah, 01Bh, 0E8h, 06Dh, 034h 
  db 086h, 079h, 03Ch, 0AFh, 0D1h, 0E4h, 00Bh, 052h
  db 00Fh, 0B8h, 0C9h, 063h, 0D1h, 024h, 0A7h, 05Eh
  db 01Fh, 083h, 0C0h, 0B6h, 025h, 04Ah, 09Eh, 07Dh
  db 0F5h, 02Bh, 04Ah, 09Ch, 003h, 0E8h, 0D6h, 071h
  db 072h, 0C5h, 084h, 06Bh, 0E9h, 01Fh, 0D3h, 0A0h
  db 01Dh, 0F0h, 0E8h, 02Bh, 074h, 0CAh, 093h, 056h
; sbox_inv
  db 0D3h, 0B0h, 0A6h, 05Ch, 01Eh, 047h, 0F9h, 082h
  db 058h, 02Eh, 0F6h, 0C3h, 0B4h, 079h, 01Dh, 0A0h
  db 0C9h, 0F4h, 0BEh, 012h, 003h, 06Dh, 058h, 0A7h
  db 009h, 0A7h, 0BEh, 06Dh, 035h, 0C2h, 048h, 0F1h
  db 050h, 083h, 0A9h, 07Eh, 02Ch, 0B6h, 04Fh, 0D1h
  db 08Fh, 029h, 041h, 0DEh, 0B6h, 053h, 07Ch, 0A0h
  db 0FAh, 01Dh, 053h, 060h, 049h, 0E7h, 02Ch, 08Bh
  db 030h, 06Dh, 09Eh, 0F8h, 05Ch, 0B7h, 0A1h, 042h
  
init_sbox:
    pop    esi               ; esi=sbox
    jecxz  sb_and
    add    esi, 64           ; eax=sbox_inv
sb_and:
    and    ebp, 7            ; %= 8
    lea    esi, [esi+8*ebp]  ; esi = &sbox[i*8]
    
    sub    esp, 32           ; create 2 16-byte blocks
    mov    ebx, esp          ; ebx=sb
    mov    edi, esp          ; edi=sb
    mov    cl, 8             ; SERPENT_BLK_LEN/2
sb_l1:
    lodsb                    ; t = sbp[i/2];
    aam    16
    xchg   ah, al
    stosw
    loop   sb_l1
    
    ; serpent_perm (&tmp_blk, blk, SERPENT_IP);
    mov    esi, edx
    stc
    call   serpent_perm
    mov    esi, edi
    mov    cl, SERPENT_BLK_LEN
    push   esi
sb_l2:
    lodsb
    aam    16
    xchg   ah, al
    xlatb
    xchg   ah, al
    xlatb
    aad    16 
    stosb
    loop   sb_l2
    
    pop    esi
    mov    edi, edx
    ; serpent_perm (blk, &tmp_blk, SERPENT_FP);
    call   serpent_perm
    add    esp, 32
    popad
    ret
