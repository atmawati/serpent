
; An assembler implementation of the Serpent algorithm designed by Ross
; Anderson, Eli Biham and Lars Knudsen. This code uses Dag Arne Osvik's
; Pentium optimised S-boxes and MMX instructions. It is implemented for
; bulk encryption with a precomputed key schedule and processes two 128 
; bit AES blocks at a time by mapping the corresponding 32-bit words of 
; the two blocks into high and low 32 bits of the 64-bit MMX registers.
; This means that the input and output block lengths for the encryption
; and decryption are 32 bytes rather than 16 bytes.   The interface for 
; setting up the key schedule is normal.
;
; Code:      Copyright (C) Brian Gladman
; S Boxes:   Copyright (C) 2000 Dag Arne Osvik
;
; Direct and derivative use is unrestricted provided these that these 
; copyrights are included with any source code and the origin of this 
; code is acknowledged in any product documentation or credits.
;
; Built using NASM with C calling conventions (Microsoft Visual C/C++).
;
; Performance for a PII/PIII Processor at 200MHz reference clock speed:
;
; 128 Bit:   Key Setup: 1483/1484 cycles
; Encrypt:   1138 cycles = 44.9 mbits/sec
; Decrypt:   1112 cycles = 46.0 mbits/sec
; 192 Bit:   Key Setup: 1491/1493 cycles
; Encrypt:   1134 cycles = 45.1 mbits/sec
; Decrypt:   1111 cycles = 46.0 mbits/sec
; 256 Bit:   Key Setup: 1468/1468 cycles
; Encrypt:   1134 cycles = 45.1 mbits/sec
; Decrypt:   1122 cycles = 45.6 mbits/sec

    GLOBAL  _serpent_name
    GLOBAL  _serpent_set_key
    GLOBAL  _serpent_encrypt    
    GLOBAL  _serpent_decrypt    

; The MMX register mm7 has all its bits set in the following macros so that
; 'xor mmr,mm7' is a negate operation on mmr.

%macro  sb0     5
        pxor    %4,%1   
        movq    %5,%2   
        pand    %2,%4   
        pxor    %5,%3   
        pxor    %2,%1   
        por     %1,%4   
        pxor    %1,%5   
        pxor    %5,%4   
        pxor    %4,%3   
        por     %3,%2   
        pxor    %3,%5   
        pxor    %5,mm7  
        por     %5,%2   
        pxor    %2,%4   
        pxor    %2,%5   
        por     %4,%1   
        pxor    %2,%4   
        pxor    %5,%4   
%endmacro

%macro  ib0     5
        pxor    %3,mm7  
        movq    %5,%2   
        por     %2,%1   
        pxor    %5,mm7  
        pxor    %2,%3   
        por     %3,%5   
        pxor    %2,%4   
        pxor    %1,%5   
        pxor    %3,%1   
        pand    %1,%4   
        pxor    %5,%1   
        por     %1,%2   
        pxor    %1,%3   
        pxor    %4,%5   
        pxor    %3,%2   
        pxor    %4,%1   
        pxor    %4,%2   
        pand    %3,%4   
        pxor    %5,%3   
%endmacro

%macro  sb1     5
        pxor    %1,mm7  
        pxor    %3,mm7  
        movq    %5,%1   
        pand    %1,%2   
        pxor    %3,%1   
        por     %1,%4   
        pxor    %4,%3   
        pxor    %2,%1   
        pxor    %1,%5   
        por     %5,%2   
        pxor    %2,%4   
        por     %3,%1   
        pand    %3,%5   
        pxor    %1,%2   
        pand    %2,%3   
        pxor    %2,%1   
        pand    %1,%3   
        pxor    %1,%5   
%endmacro

%macro  ib1     5
        movq    %5,%2   
        pxor    %2,%4   
        pand    %4,%2   
        pxor    %5,%3   
        pxor    %4,%1   
        por     %1,%2   
        pxor    %3,%4   
        pxor    %1,%5   
        por     %1,%3   
        pxor    %2,%4   
        pxor    %1,%2   
        por     %2,%4   
        pxor    %2,%1   
        pxor    %5,mm7  
        pxor    %5,%2   
        por     %2,%1   
        pxor    %2,%1   
        por     %2,%5   
        pxor    %4,%2   
%endmacro

%macro  sb2     5
        movq    %5,%1   
        pand    %1,%3   
        pxor    %1,%4   
        pxor    %3,%2   
        pxor    %3,%1   
        por     %4,%5   
        pxor    %4,%2   
        pxor    %5,%3   
        movq    %2,%4   
        por     %4,%5   
        pxor    %4,%1   
        pand    %1,%2   
        pxor    %5,%1   
        pxor    %2,%4   
        pxor    %2,%5   
        pxor    %5,mm7  
%endmacro

%macro  ib2     5
        pxor    %3,%4   
        pxor    %4,%1   
        movq    %5,%4   
        pand    %4,%3   
        pxor    %4,%2   
        por     %2,%3   
        pxor    %2,%5   
        pand    %5,%4   
        pxor    %3,%4   
        pand    %5,%1   
        pxor    %5,%3   
        pand    %3,%2   
        por     %3,%1   
        pxor    %4,mm7  
        pxor    %3,%4   
        pxor    %1,%4   
        pand    %1,%2   
        pxor    %4,%5   
        pxor    %4,%1   
%endmacro

%macro  sb3     5
        movq    %5,%1   
        por     %1,%4   
        pxor    %4,%2   
        pand    %2,%5   
        pxor    %5,%3   
        pxor    %3,%4   
        pand    %4,%1   
        por     %5,%2   
        pxor    %4,%5   
        pxor    %1,%2   
        pand    %5,%1   
        pxor    %2,%4   
        pxor    %5,%3   
        por     %2,%1   
        pxor    %2,%3   
        pxor    %1,%4   
        movq    %3,%2   
        por     %2,%4   
        pxor    %2,%1   
%endmacro

%macro  ib3     5
        movq    %5,%3   
        pxor    %3,%2   
        pand    %2,%3   
        pxor    %2,%1   
        pand    %1,%5   
        pxor    %5,%4   
        por     %4,%2   
        pxor    %4,%3   
        pxor    %1,%5   
        pxor    %3,%1   
        por     %1,%4   
        pxor    %1,%2   
        pxor    %5,%3   
        pand    %3,%4   
        por     %2,%4   
        pxor    %2,%3   
        pxor    %5,%1   
        pxor    %3,%5   
%endmacro

%macro  sb4     5
        pxor    %2,%4   
        pxor    %4,mm7  
        pxor    %3,%4   
        pxor    %4,%1   
        movq    %5,%2   
        pand    %2,%4   
        pxor    %2,%3   
        pxor    %5,%4   
        pxor    %1,%5   
        pand    %3,%5   
        pxor    %3,%1   
        pand    %1,%2   
        pxor    %4,%1   
        por     %5,%2   
        pxor    %5,%1   
        por     %1,%4   
        pxor    %1,%3   
        pand    %3,%4   
        pxor    %1,mm7  
        pxor    %5,%3   
%endmacro

%macro  ib4     5
        movq    %5,%3   
        pand    %3,%4   
        pxor    %3,%2   
        por     %2,%4   
        pand    %2,%1   
        pxor    %5,%3   
        pxor    %5,%2   
        pand    %2,%3   
        pxor    %1,mm7  
        pxor    %4,%5   
        pxor    %2,%4   
        pand    %4,%1   
        pxor    %4,%3   
        pxor    %1,%2   
        pand    %3,%1   
        pxor    %4,%1   
        pxor    %3,%5   
        por     %3,%4   
        pxor    %4,%1   
        pxor    %3,%2   
%endmacro

%macro  sb5     5
        pxor    %1,%2   
        pxor    %2,%4   
        pxor    %4,mm7  
        movq    %5,%2   
        pand    %2,%1   
        pxor    %3,%4   
        pxor    %2,%3   
        por     %3,%5   
        pxor    %5,%4   
        pand    %4,%2   
        pxor    %4,%1   
        pxor    %5,%2   
        pxor    %5,%3   
        pxor    %3,%1   
        pand    %1,%4   
        pxor    %3,mm7  
        pxor    %1,%5   
        por     %5,%4   
        pxor    %3,%5   
%endmacro

%macro  ib5     5
        pxor    %2,mm7  
        movq    %5,%4   
        pxor    %3,%2   
        por     %4,%1   
        pxor    %4,%3   
        por     %3,%2   
        pand    %3,%1   
        pxor    %5,%4   
        pxor    %3,%5   
        por     %5,%1   
        pxor    %5,%2   
        pand    %2,%3   
        pxor    %2,%4   
        pxor    %5,%3   
        pand    %4,%5   
        pxor    %5,%2   
        pxor    %4,%1   
        pxor    %4,%5   
        pxor    %5,mm7  
%endmacro

%macro  sb6     5
        pxor    %3,mm7  
        movq    %5,%4   
        pand    %4,%1   
        pxor    %1,%5   
        pxor    %4,%3   
        por     %3,%5   
        pxor    %2,%4   
        pxor    %3,%1   
        por     %1,%2   
        pxor    %3,%2   
        pxor    %5,%1   
        por     %1,%4   
        pxor    %1,%3   
        pxor    %5,%4   
        pxor    %5,%1   
        pxor    %4,mm7  
        pand    %3,%5   
        pxor    %3,%4   
%endmacro

%macro  ib6     5
        pxor    %1,%3   
        movq    %5,%3   
        pand    %3,%1   
        pxor    %5,%4   
        pxor    %3,mm7  
        pxor    %4,%2   
        pxor    %3,%4   
        por     %5,%1   
        pxor    %1,%3   
        pxor    %4,%5   
        pxor    %5,%2   
        pand    %2,%4   
        pxor    %2,%1   
        pxor    %1,%4   
        por     %1,%3   
        pxor    %4,%2   
        pxor    %5,%1   
%endmacro

%macro  sb7     5
        movq    %5,%3   
        pand    %3,%2   
        pxor    %3,%4   
        pand    %4,%2   
        pxor    %5,%3   
        pxor    %3,%2   
        pxor    %2,%1   
        por     %1,%5   
        pxor    %1,%3   
        pxor    %4,%2   
        pxor    %3,%4   
        pand    %4,%1   
        pxor    %4,%5   
        pxor    %5,%3   
        pand    %3,%1   
        pxor    %5,mm7  
        pxor    %3,%5   
        pand    %5,%1   
        pxor    %2,%4   
        pxor    %5,%2   
%endmacro

%macro  ib7     5
        movq    %5,%3   
        pxor    %3,%1   
        pand    %1,%4   
        pxor    %3,mm7  
        por     %5,%4   
        pxor    %4,%2   
        por     %2,%1   
        pxor    %1,%3   
        pand    %3,%5   
        pxor    %2,%3   
        pxor    %3,%1   
        por     %1,%3   
        pand    %4,%5   
        pxor    %1,%4   
        pxor    %5,%2   
        pxor    %4,%5   
        por     %5,%1   
        pxor    %4,%3
        pxor    %5,%3   
%endmacro

%macro  f_key   4
        movd    %1,[esi   ] 
        movd    %2,[esi+ 4] 
        movd    %3,[esi+ 8] 
        movd    %4,[esi+12] 
        movq    mm6,%1      
        psllq   mm6,32      
        por     %1,mm6      
        movq    mm6,%2      
        psllq   mm6,32      
        por     %2,mm6      
        movq    mm6,%3      
        psllq   mm6,32      
        por     %3,mm6      
        movq    mm6,%4      
        psllq   mm6,32      
        por     %4,mm6      
        add     esi,16      
%endmacro

%macro  t_key   4
        movq    [edi   ],%1 
        movq    [edi+ 8],%2 
        movq    [edi+16],%3 
        movq    [edi+24],%4 
        add     edi,32      
%endmacro

%macro  rot     5
        movq    %5,%1   
        pslld   %1,13   
        psrld   %5,19   
        por     %1,%5   
        movq    %5,%3   
        pslld   %3,3    
        psrld   %5,29   
        por     %3,%5   
        movq    %5,%1   
        pslld   %5,3    
        pxor    %4,%3   
        pxor    %4,%5   
        pxor    %2,%1   
        pxor    %2,%3   
        movq    %5,%2   
        pslld   %2,1    
        psrld   %5,31   
        por     %2,%5   
        movq    %5,%4   
        pslld   %4,7    
        psrld   %5,25   
        por     %4,%5   
        movq    %5,%2   
        pxor    %1,%2   
        pxor    %1,%4   
        pslld   %5,7    
        pxor    %3,%4   
        pxor    %3,%5   
        movq    %5,%1   
        pslld   %1,5    
        psrld   %5,27   
        por     %1,%5   
        movq    %5,%3   
        pslld   %3,22   
        psrld   %5,10   
        por     %3,%5   
%endmacro

%macro  irot    5
        movq    %5,%3   
        psrld   %3,22   
        pslld   %5,10   
        por     %3,%5   
        movq    %5,%1   
        psrld   %1,5    
        pslld   %5,27   
        por     %1,%5   
        movq    %5,%2   
        pslld   %5,7    
        pxor    %3,%4   
        pxor    %3,%5   
        pxor    %1,%2   
        pxor    %1,%4   
        movq    %5,%4   
        psrld   %4,7    
        pslld   %5,25   
        por     %4,%5   
        movq    %5,%2   
        psrld   %2,1    
        pslld   %5,31   
        por     %2,%5   
        movq    %5,%1   
        pslld   %5,3    
        pxor    %4,%3   
        pxor    %4,%5   
        pxor    %2,%1   
        pxor    %2,%3   
        movq    %5,%3   
        psrld   %3,3    
        pslld   %5,29   
        por     %3,%5   
        movq    %5,%1   
        psrld   %1,13   
        pslld   %5,19   
        por     %1,%5   
%endmacro

    SECTION .text

_serpent_name:
    lea     eax,[name]
    ret

%macro  k_loop  5
    f_key   %1,%2,%3,%4
    sb3     %1,%2,%3,%4,%5
    t_key   %2,%3,%4,%5 
    f_key   %1,%2,%3,%4
    sb2     %1,%2,%3,%4,%5
    t_key   %3,%4,%2,%5 
    f_key   %1,%2,%3,%4
    sb1     %1,%2,%3,%4,%5
    t_key   %3,%1,%4,%2 
    f_key   %1,%2,%3,%4
    sb0     %1,%2,%3,%4,%5
    t_key   %2,%5,%3,%1 
    f_key   %1,%2,%3,%4
    sb7     %1,%2,%3,%4,%5
    t_key   %3,%5,%4,%1
    f_key   %1,%2,%3,%4
    sb6     %1,%2,%3,%4,%5
    t_key   %1,%2,%5,%3
    f_key   %1,%2,%3,%4
    sb5     %1,%2,%3,%4,%5
    t_key   %2,%4,%1,%3
    f_key   %1,%2,%3,%4
    sb4     %1,%2,%3,%4,%5
    t_key   %2,%5,%1,%4
%endmacro

%define in_key  20
%define key_len 24

_serpent_set_key:
        push    ebp
        push    ebx
        push    esi
        push    edi
        mov     edx,[esp + key_len]
        cmp     edx,256
        ja      near l3
        lea     ebx,[l_key]
        mov     esi,[esp + in_key]
        xor     eax,eax
        mov     ecx,edx
        add     ecx,31
        sar     ecx,5
        je      short l0
        mov     edi,ebx
        mov     eax,ecx
        rep     movsd
l0:     cmp     edx,256
        je      short l1
        mov     ecx,8
        sub     ecx,eax
        xor     eax,eax
        rep     stosd
        mov     ecx,edx
        mov     edx,1
        sal     edx,cl
        sar     ecx,5
        mov     eax,edx
        dec     eax
        and     eax,[ebx+4*ecx]
        or      eax,edx
        mov     [ebx+4*ecx],eax
l1:     mov     esi,ebx
        mov     eax,0x9e3779b9
        mov     ebx,eax
        xor     eax,[esi+ 8]
        xor     ebx,[esi+12]
        xor     eax,[esi+16]
        xor     ebx,[esi+20]
        xor     eax,[esi+24]
        xor     ebx,[esi+28]
        xor     ecx,ecx
        push    esi
l2:     mov     edx,[esi]
        xor     edx,ecx
        xor     edx,ebx
        ror     edx,21
        mov     [esi+32],edx
        xor     eax,[esi+8]
        xor     eax,edx
        add     esi,4
        inc     ecx
        mov     edx,[esi]
        xor     edx,ecx
        xor     edx,eax
        ror     edx,21
        mov     [esi+32],edx
        xor     ebx,[esi+8]
        xor     ebx,edx
        add     esi,4
        inc     ecx
        cmp     ecx,132
        jne     l2
        pop     esi
        add     esi,4*8
        lea     edi,[m_key + 8*8]
        xor     eax,eax
        dec     eax
        movd    mm7,eax
        movd    mm6,eax
        psllq   mm6,32
        por     mm7,mm6
    
        k_loop  mm0,mm1,mm2,mm3,mm4
        k_loop  mm0,mm1,mm2,mm3,mm4 
        k_loop  mm0,mm1,mm2,mm3,mm4 
        k_loop  mm0,mm1,mm2,mm3,mm4 
        f_key   mm0,mm1,mm2,mm3
        sb3     mm0,mm1,mm2,mm3,mm4 
        t_key   mm1,mm2,mm3,mm4
        emms
l3:     pop     edi
        pop     esi
        pop     ebx
        pop     ebp
        ret

%macro  f_xor   4
        pxor    %1,[esi   ] 
        pxor    %2,[esi+ 8] 
        pxor    %3,[esi+16] 
        pxor    %4,[esi+24] 
        add     esi,32      
%endmacro

%macro  f_loop  5
    f_xor   %1,%2,%3,%4
    sb0     %1,%2,%3,%4,%5
    rot     %2,%5,%3,%1,%4  
    f_xor   %2,%5,%3,%1 
    sb1     %2,%5,%3,%1,%4
    rot     %3,%2,%1,%5,%4  
    f_xor   %3,%2,%1,%5
    sb2     %3,%2,%1,%5,%4
    rot     %1,%5,%2,%4,%3  
    f_xor   %1,%5,%2,%4
    sb3     %1,%5,%2,%4,%3
    rot     %5,%2,%4,%3,%1  
    f_xor   %5,%2,%4,%3
    sb4     %5,%2,%4,%3,%1
    rot     %2,%1,%5,%3,%4  
    f_xor   %2,%1,%5,%3
    sb5     %2,%1,%5,%3,%4
    rot     %1,%3,%2,%5,%4  
    f_xor   %1,%3,%2,%5
    sb6     %1,%3,%2,%5,%4
    rot     %1,%3,%4,%2,%5  
    f_xor   %1,%3,%4,%2
    sb7     %1,%3,%4,%2,%5
%endmacro 

%define in_blk  12
%define out_blk 16

_serpent_encrypt:
        push        ebp
        push        esi
        mov         esi,[esp + in_blk]
        movq        mm0,[esi]
        movq        mm2,[esi+8]
        movq        mm4,[esi+16]
        movq        mm5,[esi+24]
        movq        mm1,mm0
        movq        mm3,mm2
        punpckldq   mm0,mm4
        punpckhdq   mm1,mm4
        punpckldq   mm2,mm5
        punpckhdq   mm3,mm5

        lea         esi,[m_key + 8*8]
        pxor        mm7,mm7
        pcmpeqd     mm7,mm7

        f_loop      mm0,mm1,mm2,mm3,mm4
        rot         mm3,mm4,mm1,mm0,mm2
        f_loop      mm3,mm4,mm1,mm0,mm2
        rot         mm0,mm2,mm4,mm3,mm1
        f_loop      mm0,mm2,mm4,mm3,mm1
        rot         mm3,mm1,mm2,mm0,mm4
        f_loop      mm3,mm1,mm2,mm0,mm4
        f_xor       mm0,mm4,mm1,mm3 
    
        mov         esi,[esp + out_blk]
        movq        mm2,mm0
        movq        mm5,mm1
        punpckldq   mm0,mm4
        punpckldq   mm1,mm3
        punpckhdq   mm4,mm2
        punpckhdq   mm3,mm5
        pshufw      mm4,mm4,0x4e
        pshufw      mm3,mm3,0x4e
        movq        [esi   ],mm0
        movq        [esi+ 8],mm1
        movq        [esi+16],mm4
        movq        [esi+24],mm3
        emms
        pop         esi
        pop         ebp
        ret


%macro  i_xor   4
        sub     esi,32      
        pxor    %1,[esi   ] 
        pxor    %2,[esi+ 8] 
        pxor    %3,[esi+16] 
        pxor    %4,[esi+24] 
%endmacro

%macro  i_loop  5
    ib7     %1,%2,%3,%4,%5 
    i_xor   %4,%1,%2,%5 
    irot    %4,%1,%2,%5,%3 
    ib6     %4,%1,%2,%5,%3 
    i_xor   %1,%2,%3,%5 
    irot    %1,%2,%3,%5,%4 
    ib5     %1,%2,%3,%5,%4 
    i_xor   %2,%4,%5,%3 
    irot    %2,%4,%5,%3,%1 
    ib4     %2,%4,%5,%3,%1 
    i_xor   %2,%3,%5,%1 
    irot    %2,%3,%5,%1,%4 
    ib3     %2,%3,%5,%1,%4 
    i_xor   %1,%2,%5,%3 
    irot    %1,%2,%5,%3,%4 
    ib2     %1,%2,%5,%3,%4 
    i_xor   %2,%4,%5,%3 
    irot    %2,%4,%5,%3,%1 
    ib1     %2,%4,%5,%3,%1 
    i_xor   %1,%2,%3,%5 
    irot    %1,%2,%3,%5,%4 
    ib0     %1,%2,%3,%5,%4 
    i_xor   %1,%4,%2,%5
%endmacro

_serpent_decrypt
        push        ebp
        push        esi
        mov         esi,[esp + in_blk]
        movq        mm0,[esi]
        movq        mm2,[esi+8]
        movq        mm4,[esi+16]
        movq        mm5,[esi+24]
        movq        mm1,mm0
        movq        mm3,mm2
        punpckldq   mm0,mm4
        punpckhdq   mm1,mm4
        punpckldq   mm2,mm5
        punpckhdq   mm3,mm5

        lea         esi,[m_key + 8*140]
        pxor        mm7,mm7
        pcmpeqd     mm7,mm7

        i_xor       mm0,mm1,mm2,mm3
        i_loop      mm0,mm1,mm2,mm3,mm4
        irot        mm0,mm3,mm1,mm4,mm2
        i_loop      mm0,mm3,mm1,mm4,mm2 
        irot        mm0,mm4,mm3,mm2,mm1
        i_loop      mm0,mm4,mm3,mm2,mm1
        irot        mm0,mm2,mm4,mm1,mm3
        i_loop      mm0,mm2,mm4,mm1,mm3 

        mov         esi,[esp + out_blk]
        movq        mm4,mm0
        movq        mm5,mm2
        punpckldq   mm0,mm1
        punpckldq   mm2,mm3
        punpckhdq   mm1,mm4
        punpckhdq   mm3,mm5
        pshufw      mm1,mm1,0x4e
        pshufw      mm3,mm3,0x4e
        movq        [esi   ],mm0
        movq        [esi+ 8],mm2
        movq        [esi+16],mm1
        movq        [esi+24],mm3
        emms
        pop         esi
        pop         ebp
        ret

    SECTION .data

name:   DB          "serpent",0

    SECTION .bss

l_key   RESD        140
m_key   RESD        280

        end
