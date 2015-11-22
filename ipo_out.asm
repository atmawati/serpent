; mark_description "Intel(R) C++ Compiler XE for applications running on IA-32, Version 15.0.0.108 Build 20140726";
; mark_description "-O3 -fast -Fa";
	.686P
 	.387
	OPTION DOTNAME
	ASSUME	CS:FLAT,DS:FLAT,SS:FLAT
;ident "-defaultlib:libcpmt"
	INCLUDELIB <libmmt>
	INCLUDELIB <LIBCMT>
	INCLUDELIB <libirc>
	INCLUDELIB <svml_dispmt>
	INCLUDELIB <OLDNAMES>
	INCLUDELIB <libdecimal>
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _serpent_dec
TXTST0:
; -- Begin  _serpent_dec
;_serpent_dec	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _serpent_dec
; mark_begin;
IF @Version GE 800
  .MMX
ELSEIF @Version GE 612
  .MMX
  MMWORD TEXTEQU <QWORD>
ENDIF
IF @Version GE 800
  .XMM
ELSEIF @Version GE 614
  .XMM
  XMMWORD TEXTEQU <OWORD>
ENDIF
       ALIGN     16
	PUBLIC _serpent_dec
_serpent_dec	PROC NEAR 
; parameter 1: 8 + ebp
; parameter 2: 12 + ebp
; parameter 3: 16 + ebp
.B1.1:                          ; Preds .B1.0
        push      ebp                                           ;248.1
        mov       ebp, esp                                      ;248.1
        and       esp, -16                                      ;248.1
        push      esi                                           ;248.1
        push      edi                                           ;248.1
        push      ebx                                           ;248.1
        sub       esp, 212                                      ;248.1
        mov       ecx, DWORD PTR [12+ebp]                       ;247.6
        mov       ebx, DWORD PTR [16+ebp]                       ;247.6
        mov       DWORD PTR [140+esp], 0                        ;256.3
        mov       edi, DWORD PTR [ecx]                          ;254.3
        mov       DWORD PTR [ebx], edi                          ;254.3
        mov       eax, DWORD PTR [4+ecx]                        ;254.3
        mov       DWORD PTR [4+ebx], eax                        ;254.3
        mov       edx, DWORD PTR [8+ecx]                        ;254.3
        mov       DWORD PTR [8+ebx], edx                        ;254.3
        mov       ecx, DWORD PTR [12+ecx]                       ;254.3
        movdqu    xmm1, XMMWORD PTR [_2il0floatpacket.4]        ;264.5
                                ; LOE eax edx ecx edi xmm1
.B1.2:                          ; Preds .B1.10 .B1.1
        movsx     esi, BYTE PTR [140+esp]                       ;257.9
        test      esi, esi                                      ;257.12
        je        .B1.12        ; Prob 16%                      ;257.12
                                ; LOE eax edx ecx esi edi xmm1
.B1.3:                          ; Preds .B1.2
        mov       DWORD PTR [136+esp], esi                      ;
        mov       esi, eax                                      ;261.7
        mov       ebx, eax                                      ;261.7
        xor       esi, ecx                                      ;261.7
        rol       edi, 27                                       ;261.7
        shl       ebx, 7                                        ;261.7
        xor       edi, esi                                      ;261.7
        mov       esi, DWORD PTR [16+ebp]                       ;261.7
        xor       ebx, ecx                                      ;261.7
        rol       edx, 10                                       ;261.7
        xor       edx, ebx                                      ;261.7
        mov       ebx, edi                                      ;261.7
        rol       ebx, 19                                       ;261.7
        mov       DWORD PTR [156+esp], ebx                      ;261.7
        mov       DWORD PTR [esi], ebx                          ;261.7
        mov       ebx, edi                                      ;261.7
        rol       eax, 31                                       ;261.7
        xor       ebx, edx                                      ;261.7
        shl       edi, 3                                        ;261.7
        xor       eax, ebx                                      ;261.7
        rol       ecx, 25                                       ;261.7
        mov       ebx, edx                                      ;261.7
        xor       edx, edi                                      ;261.7
        rol       ebx, 29                                       ;261.7
        xor       ecx, edx                                      ;261.7
        mov       DWORD PTR [4+esi], eax                        ;261.7
        mov       DWORD PTR [8+esi], ebx                        ;261.7
        mov       DWORD PTR [12+esi], ecx                       ;261.7
        mov       esi, DWORD PTR [136+esp]                      ;266.28
        mov       edx, esi                                      ;266.28
        shl       edx, 4                                        ;266.28
        neg       edx                                           ;266.19
        add       edx, DWORD PTR [8+ebp]                        ;266.19
        mov       DWORD PTR [176+esp], ebx                      ;261.7
        mov       DWORD PTR [144+esp], edx                      ;266.19
                                ; LOE rsi eax ecx esi sil xmm1
.B1.4:                          ; Preds .B1.12 .B1.3
        neg       esi                                           ;256.33
        add       esi, 7                                        ;256.33
        and       esi, 7                                        ;264.5
        mov       DWORD PTR [152+esp], eax                      ;264.5
        mov       DWORD PTR [148+esp], ecx                      ;264.5
        mov       eax, DWORD PTR [156+esp]                      ;264.5
        movzx     edx, BYTE PTR [_sbox_inv+esi*8]               ;264.5
        mov       DWORD PTR [16+esp], edx                       ;264.5
        shr       edx, 4                                        ;264.5
        mov       BYTE PTR [esp], dl                            ;264.5
        movzx     edx, BYTE PTR [_sbox_inv+1+esi*8]             ;264.5
        mov       DWORD PTR [20+esp], edx                       ;264.5
        shr       edx, 4                                        ;264.5
        mov       BYTE PTR [2+esp], dl                          ;264.5
        movzx     edx, BYTE PTR [_sbox_inv+2+esi*8]             ;264.5
        mov       DWORD PTR [24+esp], edx                       ;264.5
        shr       edx, 4                                        ;264.5
        mov       BYTE PTR [4+esp], dl                          ;264.5
        movzx     edx, BYTE PTR [_sbox_inv+3+esi*8]             ;264.5
        mov       DWORD PTR [28+esp], edx                       ;264.5
        shr       edx, 4                                        ;264.5
        mov       BYTE PTR [6+esp], dl                          ;264.5
        movzx     edx, BYTE PTR [_sbox_inv+4+esi*8]             ;264.5
        mov       DWORD PTR [32+esp], edx                       ;264.5
        shr       edx, 4                                        ;264.5
        mov       ebx, DWORD PTR [16+esp]                       ;264.5
        mov       BYTE PTR [8+esp], dl                          ;264.5
        and       ebx, 15                                       ;264.5
        movzx     edx, BYTE PTR [_sbox_inv+5+esi*8]             ;264.5
        mov       BYTE PTR [1+esp], bl                          ;264.5
        mov       ebx, DWORD PTR [20+esp]                       ;264.5
        and       ebx, 15                                       ;264.5
        mov       BYTE PTR [3+esp], bl                          ;264.5
        mov       ebx, DWORD PTR [24+esp]                       ;264.5
        mov       DWORD PTR [36+esp], edx                       ;264.5
        and       ebx, 15                                       ;264.5
        shr       edx, 4                                        ;264.5
        mov       BYTE PTR [10+esp], dl                         ;264.5
        mov       BYTE PTR [5+esp], bl                          ;264.5
        movzx     edx, BYTE PTR [_sbox_inv+6+esi*8]             ;264.5
        mov       ebx, DWORD PTR [28+esp]                       ;264.5
        and       ebx, 15                                       ;264.5
        mov       BYTE PTR [7+esp], bl                          ;264.5
        mov       ebx, DWORD PTR [32+esp]                       ;264.5
        and       ebx, 15                                       ;264.5
        mov       BYTE PTR [9+esp], bl                          ;264.5
        mov       ebx, DWORD PTR [36+esp]                       ;264.5
        and       ebx, 15                                       ;264.5
        mov       BYTE PTR [11+esp], bl                         ;264.5
        mov       ebx, edx                                      ;264.5
        and       ebx, 15                                       ;264.5
        mov       BYTE PTR [13+esp], bl                         ;264.5
        shr       edx, 4                                        ;264.5
        movzx     ebx, BYTE PTR [_sbox_inv+7+esi*8]             ;264.5
        mov       BYTE PTR [12+esp], dl                         ;264.5
        mov       edx, ebx                                      ;264.5
        shr       edx, 4                                        ;264.5
        and       ebx, 15                                       ;264.5
        mov       BYTE PTR [14+esp], dl                         ;264.5
        xor       edx, edx                                      ;264.5
        mov       BYTE PTR [15+esp], bl                         ;264.5
        mov       DWORD PTR [160+esp], edx                      ;264.5
        mov       DWORD PTR [164+esp], edx                      ;264.5
        mov       DWORD PTR [168+esp], edx                      ;264.5
        mov       DWORD PTR [172+esp], edx                      ;264.5
                                ; LOE eax edx xmm1
.B1.5:                          ; Preds .B1.5 .B1.4
        mov       ecx, eax                                      ;264.5
        mov       edi, eax                                      ;264.5
        and       ecx, 1                                        ;264.5
        mov       ebx, DWORD PTR [152+esp]                      ;264.5
        mov       DWORD PTR [180+esp], edx                      ;
        movzx     esi, BYTE PTR [160+esp+edx]                   ;264.5
        mov       edx, ebx                                      ;264.5
        shl       ecx, 7                                        ;264.5
        and       edx, 1                                        ;264.5
        shr       esi, 1                                        ;264.5
        mov       DWORD PTR [188+esp], edx                      ;264.5
        or        ecx, esi                                      ;264.5
        mov       edx, DWORD PTR [176+esp]                      ;264.5
        mov       esi, ebx                                      ;264.5
        mov       DWORD PTR [184+esp], ecx                      ;264.5
        mov       ecx, edx                                      ;264.5
        and       ecx, 1                                        ;264.5
        mov       DWORD PTR [192+esp], ecx                      ;264.5
        shr       edx, 1                                        ;264.5
        mov       ecx, DWORD PTR [148+esp]                      ;264.5
        mov       DWORD PTR [196+esp], edx                      ;264.5
        mov       edx, ecx                                      ;264.5
        and       edx, 1                                        ;264.5
        mov       DWORD PTR [200+esp], edx                      ;264.5
        mov       edx, ecx                                      ;264.5
        shr       edx, 1                                        ;264.5
        and       edx, 1                                        ;264.5
        shr       ebx, 2                                        ;264.5
        shl       edx, 7                                        ;264.5
        mov       DWORD PTR [152+esp], ebx                      ;264.5
        mov       DWORD PTR [204+esp], edx                      ;264.5
        mov       edx, DWORD PTR [188+esp]                      ;264.5
        mov       ebx, DWORD PTR [184+esp]                      ;264.5
        shl       edx, 7                                        ;264.5
        shr       ebx, 1                                        ;264.5
        or        edx, ebx                                      ;264.5
        shr       ecx, 2                                        ;264.5
        mov       DWORD PTR [148+esp], ecx                      ;264.5
        mov       ecx, DWORD PTR [192+esp]                      ;264.5
        shl       ecx, 7                                        ;264.5
        shr       edx, 1                                        ;264.5
        shr       eax, 2                                        ;264.5
        or        ecx, edx                                      ;264.5
        mov       DWORD PTR [156+esp], eax                      ;264.5
        mov       eax, DWORD PTR [196+esp]                      ;264.5
        and       eax, 1                                        ;264.5
        movzx     ecx, cl                                       ;264.5
        shl       eax, 7                                        ;264.5
        mov       DWORD PTR [196+esp], eax                      ;264.5
        mov       eax, DWORD PTR [200+esp]                      ;264.5
        shr       edi, 1                                        ;264.5
        shl       eax, 7                                        ;264.5
        and       edi, 1                                        ;264.5
        shr       ecx, 1                                        ;264.5
        or        eax, ecx                                      ;264.5
        shr       esi, 1                                        ;264.5
        shl       edi, 7                                        ;264.5
        and       esi, 1                                        ;264.5
        shr       eax, 1                                        ;264.5
        or        edi, eax                                      ;264.5
        shl       esi, 7                                        ;264.5
        shr       edi, 1                                        ;264.5
        or        esi, edi                                      ;264.5
        and       esi, 255                                      ;264.5
        shr       esi, 1                                        ;264.5
        mov       edx, DWORD PTR [180+esp]                      ;264.5
        mov       edi, DWORD PTR [196+esp]                      ;264.5
        or        edi, esi                                      ;264.5
        shr       edi, 1                                        ;264.5
        mov       eax, DWORD PTR [204+esp]                      ;264.5
        or        eax, edi                                      ;264.5
        mov       BYTE PTR [160+esp+edx], al                    ;264.5
        inc       edx                                           ;264.5
        shr       DWORD PTR [176+esp], 2                        ;264.5
        mov       eax, DWORD PTR [156+esp]                      ;264.5
        cmp       edx, 16                                       ;264.5
        jb        .B1.5         ; Prob 91%                      ;264.5
                                ; LOE eax edx xmm1
.B1.6:                          ; Preds .B1.5
        movdqu    xmm0, XMMWORD PTR [160+esp]                   ;264.5
        pxor      xmm6, xmm6                                    ;264.5
        pmovzxbw  xmm6, xmm0                                    ;264.5
        pxor      xmm7, xmm7                                    ;264.5
        psraw     xmm6, 4                                       ;264.5
        movdqa    xmm2, xmm0                                    ;264.5
        pmovsxwd  xmm7, xmm6                                    ;264.5
        pxor      xmm4, xmm4                                    ;264.5
        psrldq    xmm6, 8                                       ;264.5
        pxor      xmm5, xmm5                                    ;264.5
        psrldq    xmm2, 8                                       ;264.5
        pmovsxwd  xmm6, xmm6                                    ;264.5
        pshufd    xmm3, xmm7, 57                                ;264.5
        pmovzxbw  xmm4, xmm2                                    ;264.5
        movd      eax, xmm7                                     ;264.5
        psraw     xmm4, 4                                       ;264.5
        pshufd    xmm7, xmm3, 57                                ;264.5
        movd      edx, xmm6                                     ;264.5
        pshufd    xmm6, xmm6, 57                                ;264.5
        movd      DWORD PTR [40+esp], xmm6                      ;264.5
        movd      edi, xmm3                                     ;264.5
        pshufd    xmm3, xmm7, 57                                ;264.5
        movd      esi, xmm7                                     ;264.5
        pshufd    xmm7, xmm6, 57                                ;264.5
        movd      DWORD PTR [44+esp], xmm7                      ;264.5
        pmovsxwd  xmm5, xmm4                                    ;264.5
        movd      ebx, xmm3                                     ;264.5
        pshufd    xmm3, xmm7, 57                                ;264.5
        movd      DWORD PTR [48+esp], xmm3                      ;264.5
        pshufd    xmm3, xmm5, 57                                ;264.5
        psrldq    xmm4, 8                                       ;264.5
        movd      DWORD PTR [52+esp], xmm5                      ;264.5
        pshufd    xmm5, xmm3, 57                                ;264.5
        pmovsxwd  xmm4, xmm4                                    ;264.5
        movd      DWORD PTR [60+esp], xmm5                      ;264.5
        pshufd    xmm6, xmm5, 57                                ;264.5
        pxor      xmm5, xmm5                                    ;264.5
        pshufd    xmm7, xmm4, 57                                ;264.5
        pmovzxbd  xmm5, xmm0                                    ;264.5
        movd      DWORD PTR [56+esp], xmm3                      ;264.5
        pand      xmm5, xmm1                                    ;264.5
        pshufd    xmm3, xmm7, 57                                ;264.5
        movd      DWORD PTR [64+esp], xmm6                      ;264.5
        movd      DWORD PTR [68+esp], xmm4                      ;264.5
        pshufd    xmm4, xmm3, 57                                ;264.5
        pshufd    xmm6, xmm5, 57                                ;264.5
        movsx     ecx, BYTE PTR [esp+eax]                       ;264.5
        movd      DWORD PTR [80+esp], xmm4                      ;264.5
        pshufd    xmm4, xmm6, 57                                ;264.5
        movd      eax, xmm5                                     ;264.5
        pshufd    xmm5, xmm4, 57                                ;264.5
        movd      DWORD PTR [96+esp], xmm5                      ;264.5
        movd      xmm5, ecx                                     ;264.5
        pinsrb    xmm5, BYTE PTR [esp+edi], 1                   ;264.5
        movd      DWORD PTR [76+esp], xmm3                      ;264.5
        movdqa    xmm3, xmm0                                    ;264.5
        psrldq    xmm3, 4                                       ;264.5
        movd      DWORD PTR [72+esp], xmm7                      ;264.5
        movd      DWORD PTR [88+esp], xmm6                      ;264.5
        movd      DWORD PTR [92+esp], xmm4                      ;264.5
        psrldq    xmm0, 12                                      ;264.5
        pinsrb    xmm5, BYTE PTR [esp+esi], 2                   ;264.5
        pinsrb    xmm5, BYTE PTR [esp+ebx], 3                   ;264.5
        pinsrb    xmm5, BYTE PTR [esp+edx], 4                   ;264.5
        mov       edx, DWORD PTR [40+esp]                       ;264.5
        mov       ecx, DWORD PTR [44+esp]                       ;264.5
        mov       ebx, DWORD PTR [48+esp]                       ;264.5
        pinsrb    xmm5, BYTE PTR [esp+edx], 5                   ;264.5
        pinsrb    xmm5, BYTE PTR [esp+ecx], 6                   ;264.5
        pinsrb    xmm5, BYTE PTR [esp+ebx], 7                   ;264.5
        mov       esi, DWORD PTR [52+esp]                       ;264.5
        mov       edi, DWORD PTR [56+esp]                       ;264.5
        mov       edx, DWORD PTR [60+esp]                       ;264.5
        pinsrb    xmm5, BYTE PTR [esp+esi], 8                   ;264.5
        pinsrb    xmm5, BYTE PTR [esp+edi], 9                   ;264.5
        pinsrb    xmm5, BYTE PTR [esp+edx], 10                  ;264.5
        pmovzxbd  xmm3, xmm3                                    ;264.5
        pmovzxbd  xmm2, xmm2                                    ;264.5
        pand      xmm3, xmm1                                    ;264.5
        mov       ecx, DWORD PTR [64+esp]                       ;264.5
        pand      xmm2, xmm1                                    ;264.5
        pshufd    xmm7, xmm3, 57                                ;264.5
        movd      DWORD PTR [100+esp], xmm3                     ;264.5
        pshufd    xmm3, xmm7, 57                                ;264.5
        movd      DWORD PTR [116+esp], xmm2                     ;264.5
        pshufd    xmm2, xmm2, 57                                ;264.5
        movd      DWORD PTR [108+esp], xmm3                     ;264.5
        pshufd    xmm4, xmm3, 57                                ;264.5
        pshufd    xmm3, xmm2, 57                                ;264.5
        movsx     eax, BYTE PTR [esp+eax]                       ;264.5
        pinsrb    xmm5, BYTE PTR [esp+ecx], 11                  ;264.5
        movd      DWORD PTR [112+esp], xmm4                     ;264.5
        pshufd    xmm4, xmm3, 57                                ;264.5
        movd      DWORD PTR [128+esp], xmm4                     ;264.5
        movd      DWORD PTR [104+esp], xmm7                     ;264.5
        movd      DWORD PTR [120+esp], xmm2                     ;264.5
        movd      DWORD PTR [124+esp], xmm3                     ;264.5
        mov       ecx, DWORD PTR [88+esp]                       ;264.5
        mov       DWORD PTR [84+esp], eax                       ;264.5
        movd      xmm4, DWORD PTR [84+esp]                      ;264.5
        pinsrb    xmm4, BYTE PTR [esp+ecx], 1                   ;264.5
        mov       ebx, DWORD PTR [68+esp]                       ;264.5
        mov       esi, DWORD PTR [72+esp]                       ;264.5
        mov       edi, DWORD PTR [76+esp]                       ;264.5
        pinsrb    xmm5, BYTE PTR [esp+ebx], 12                  ;264.5
        mov       ebx, DWORD PTR [92+esp]                       ;264.5
        pinsrb    xmm5, BYTE PTR [esp+esi], 13                  ;264.5
        pinsrb    xmm4, BYTE PTR [esp+ebx], 2                   ;264.5
        pinsrb    xmm5, BYTE PTR [esp+edi], 14                  ;264.5
        mov       esi, DWORD PTR [96+esp]                       ;264.5
        mov       edi, DWORD PTR [100+esp]                      ;264.5
        mov       edx, DWORD PTR [80+esp]                       ;264.5
        pinsrb    xmm4, BYTE PTR [esp+esi], 3                   ;264.5
        pinsrb    xmm5, BYTE PTR [esp+edx], 15                  ;264.5
        pinsrb    xmm4, BYTE PTR [esp+edi], 4                   ;264.5
        psllw     xmm5, 4                                       ;264.5
        pand      xmm5, XMMWORD PTR [_2il0floatpacket.5]        ;264.5
        mov       edx, DWORD PTR [104+esp]                      ;264.5
        mov       ecx, DWORD PTR [108+esp]                      ;264.5
        mov       ebx, DWORD PTR [112+esp]                      ;264.5
        pinsrb    xmm4, BYTE PTR [esp+edx], 5                   ;264.5
        pinsrb    xmm4, BYTE PTR [esp+ecx], 6                   ;264.5
        pinsrb    xmm4, BYTE PTR [esp+ebx], 7                   ;264.5
        mov       esi, DWORD PTR [116+esp]                      ;264.5
        mov       edi, DWORD PTR [120+esp]                      ;264.5
        mov       edx, DWORD PTR [124+esp]                      ;264.5
        pmovzxbd  xmm0, xmm0                                    ;264.5
        pinsrb    xmm4, BYTE PTR [esp+esi], 8                   ;264.5
        pand      xmm0, xmm1                                    ;264.5
        movd      DWORD PTR [132+esp], xmm0                     ;264.5
        pshufd    xmm0, xmm0, 57                                ;264.5
        pshufd    xmm2, xmm0, 57                                ;264.5
        pshufd    xmm3, xmm2, 57                                ;264.5
        movd      eax, xmm0                                     ;264.5
        pinsrb    xmm4, BYTE PTR [esp+edi], 9                   ;264.5
        pinsrb    xmm4, BYTE PTR [esp+edx], 10                  ;264.5
        mov       ecx, DWORD PTR [128+esp]                      ;264.5
        mov       ebx, DWORD PTR [132+esp]                      ;264.5
        mov       edx, DWORD PTR [16+ebp]                       ;264.5
        pinsrb    xmm4, BYTE PTR [esp+ecx], 11                  ;264.5
        pinsrb    xmm4, BYTE PTR [esp+ebx], 12                  ;264.5
        xor       ebx, ebx                                      ;264.5
        pinsrb    xmm4, BYTE PTR [esp+eax], 13                  ;264.5
        xor       esi, esi                                      ;264.5
        movd      eax, xmm2                                     ;264.5
        mov       DWORD PTR [edx], ebx                          ;264.5
        pinsrb    xmm4, BYTE PTR [esp+eax], 14                  ;264.5
        movd      eax, xmm3                                     ;264.5
        mov       DWORD PTR [4+edx], ebx                        ;264.5
        pinsrb    xmm4, BYTE PTR [esp+eax], 15                  ;264.5
        por       xmm5, xmm4                                    ;264.5
        movdqu    XMMWORD PTR [160+esp], xmm5                   ;264.5
        mov       DWORD PTR [8+edx], ebx                        ;264.5
        mov       DWORD PTR [12+edx], ebx                       ;264.5
                                ; LOE edx ebx esi xmm1
.B1.7:                          ; Preds .B1.9 .B1.6
        mov       ecx, DWORD PTR [160+esp+ebx*4]                ;264.5
        mov       eax, esi                                      ;264.5
        mov       DWORD PTR [208+esp], ebx                      ;264.5
                                ; LOE eax edx ecx xmm1
.B1.8:                          ; Preds .B1.8 .B1.7
        mov       edi, eax                                      ;264.5
        mov       esi, ecx                                      ;264.5
        and       edi, 3                                        ;264.5
        and       esi, 1                                        ;264.5
        shl       esi, 31                                       ;264.5
        inc       eax                                           ;264.5
        shr       ecx, 1                                        ;264.5
        mov       ebx, DWORD PTR [edx+edi*4]                    ;264.5
        shr       ebx, 1                                        ;264.5
        or        esi, ebx                                      ;264.5
        mov       DWORD PTR [edx+edi*4], esi                    ;264.5
        cmp       eax, 32                                       ;264.5
        jb        .B1.8         ; Prob 82%                      ;264.5
                                ; LOE eax edx ecx xmm1
.B1.9:                          ; Preds .B1.8
        mov       ebx, DWORD PTR [208+esp]                      ;
        xor       esi, esi                                      ;
        mov       DWORD PTR [160+esp+ebx*4], ecx                ;264.5
        inc       ebx                                           ;264.5
        cmp       ebx, 4                                        ;264.5
        jb        .B1.7         ; Prob 91%                      ;264.5
                                ; LOE edx ebx esi xmm1
.B1.10:                         ; Preds .B1.9
        mov       ecx, DWORD PTR [16+ebp]                       ;266.5
        mov       esi, DWORD PTR [144+esp]                      ;266.5
        mov       ebx, DWORD PTR [140+esp]                      ;256.3
        mov       edi, DWORD PTR [ecx]                          ;266.5
        inc       ebx                                           ;256.3
        xor       edi, DWORD PTR [496+esi]                      ;266.5
        mov       DWORD PTR [ecx], edi                          ;266.5
        mov       eax, DWORD PTR [4+ecx]                        ;266.5
        xor       eax, DWORD PTR [500+esi]                      ;266.5
        mov       DWORD PTR [4+ecx], eax                        ;266.5
        mov       edx, DWORD PTR [8+ecx]                        ;266.5
        xor       edx, DWORD PTR [504+esi]                      ;266.5
        mov       DWORD PTR [8+ecx], edx                        ;266.5
        mov       ecx, DWORD PTR [12+ecx]                       ;266.5
        xor       ecx, DWORD PTR [508+esi]                      ;266.5
        mov       DWORD PTR [140+esp], ebx                      ;256.3
        cmp       bl, 32                                        ;256.3
        jb        .B1.2         ; Prob 82%                      ;256.3
                                ; LOE eax edx ecx edi xmm1
.B1.11:                         ; Preds .B1.10
        mov       ebx, DWORD PTR [16+ebp]                       ;
        mov       DWORD PTR [12+ebx], ecx                       ;266.5
        add       esp, 212                                      ;268.1
        pop       ebx                                           ;268.1
        pop       edi                                           ;268.1
        pop       esi                                           ;268.1
        mov       esp, ebp                                      ;268.1
        pop       ebp                                           ;268.1
        ret                                                     ;268.1
                                ; LOE
.B1.12:                         ; Preds .B1.2                   ; Infreq
        mov       DWORD PTR [136+esp], esi                      ;
        shl       esi, 4                                        ;259.28
        mov       ebx, DWORD PTR [16+ebp]                       ;266.5
        neg       esi                                           ;259.21
        add       esi, DWORD PTR [8+ebp]                        ;259.21
        mov       DWORD PTR [144+esp], esi                      ;259.21
        mov       DWORD PTR [12+ebx], ecx                       ;266.5
        xor       edi, DWORD PTR [512+esi]                      ;259.7
        mov       DWORD PTR [ebx], edi                          ;259.7
        xor       eax, DWORD PTR [516+esi]                      ;259.7
        mov       DWORD PTR [4+ebx], eax                        ;259.7
        xor       edx, DWORD PTR [520+esi]                      ;259.7
        mov       DWORD PTR [8+ebx], edx                        ;259.7
        xor       ecx, DWORD PTR [524+esi]                      ;259.7
        mov       DWORD PTR [156+esp], edi                      ;259.7
        mov       DWORD PTR [176+esp], edx                      ;259.7
        mov       DWORD PTR [12+ebx], ecx                       ;259.7
        mov       esi, DWORD PTR [136+esp]                      ;259.7
        jmp       .B1.4         ; Prob 100%                     ;259.7
        ALIGN     16
                                ; LOE rsi eax ecx esi sil xmm1
; mark_end;
_serpent_dec ENDP
;_serpent_dec	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _serpent_dec
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _serpent_enc
TXTST1:
; -- Begin  _serpent_enc
;_serpent_enc	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _serpent_enc
; mark_begin;
       ALIGN     16
	PUBLIC _serpent_enc
_serpent_enc	PROC NEAR 
; parameter 1: 8 + ebp
; parameter 2: 12 + ebp
; parameter 3: 16 + ebp
.B2.1:                          ; Preds .B2.0
        push      ebp                                           ;224.1
        mov       ebp, esp                                      ;224.1
        and       esp, -16                                      ;224.1
        push      esi                                           ;224.1
        push      edi                                           ;224.1
        push      ebx                                           ;224.1
        sub       esp, 212                                      ;224.1
        mov       eax, DWORD PTR [12+ebp]                       ;223.6
        mov       edx, DWORD PTR [16+ebp]                       ;223.6
        movdqu    xmm1, XMMWORD PTR [_2il0floatpacket.4]        ;236.5
        mov       ecx, DWORD PTR [eax]                          ;230.3
        mov       DWORD PTR [edx], ecx                          ;230.3
        mov       DWORD PTR [176+esp], ecx                      ;230.3
        mov       ecx, DWORD PTR [4+eax]                        ;230.3
        mov       DWORD PTR [4+edx], ecx                        ;230.3
        mov       DWORD PTR [156+esp], ecx                      ;230.3
        mov       ecx, DWORD PTR [8+eax]                        ;230.3
        mov       DWORD PTR [8+edx], ecx                        ;230.3
        mov       eax, DWORD PTR [12+eax]                       ;230.3
        mov       DWORD PTR [148+esp], eax                      ;230.3
        mov       DWORD PTR [12+edx], eax                       ;230.3
        xor       eax, eax                                      ;232.3
        mov       DWORD PTR [152+esp], ecx                      ;230.3
        mov       DWORD PTR [144+esp], eax                      ;236.5
        mov       ebx, DWORD PTR [148+esp]                      ;236.5
        mov       edx, ecx                                      ;236.5
        mov       ecx, DWORD PTR [156+esp]                      ;236.5
        mov       eax, DWORD PTR [176+esp]                      ;236.5
                                ; LOE eax edx ecx ebx xmm1
.B2.2:                          ; Preds .B2.10 .B2.1
        mov       esi, DWORD PTR [144+esp]                      ;234.26
        shl       esi, 4                                        ;234.26
        mov       DWORD PTR [148+esp], ebx                      ;
        mov       ebx, DWORD PTR [8+ebp]                        ;234.5
        mov       edi, DWORD PTR [16+ebp]                       ;
        xor       eax, DWORD PTR [esi+ebx]                      ;234.5
        mov       DWORD PTR [edi], eax                          ;234.5
        xor       ecx, DWORD PTR [4+esi+ebx]                    ;234.5
        mov       DWORD PTR [4+edi], ecx                        ;234.5
        xor       edx, DWORD PTR [8+esi+ebx]                    ;234.5
        mov       DWORD PTR [8+edi], edx                        ;234.5
        mov       edi, DWORD PTR [8+ebp]                        ;234.5
        mov       ebx, DWORD PTR [148+esp]                      ;234.5
        mov       DWORD PTR [152+esp], edx                      ;234.5
        xor       ebx, DWORD PTR [12+esi+edi]                   ;234.5
        mov       esi, DWORD PTR [16+ebp]                       ;234.5
        mov       edi, DWORD PTR [144+esp]                      ;236.5
        and       edi, 7                                        ;236.5
        mov       DWORD PTR [12+esi], ebx                       ;234.5
        xor       esi, esi                                      ;236.5
        mov       DWORD PTR [160+esp], esi                      ;236.5
        mov       DWORD PTR [164+esp], esi                      ;236.5
        movzx     edx, BYTE PTR [_sbox+edi*8]                   ;236.5
        mov       DWORD PTR [16+esp], edx                       ;236.5
        shr       edx, 4                                        ;236.5
        mov       BYTE PTR [esp], dl                            ;236.5
        mov       edx, DWORD PTR [16+esp]                       ;236.5
        and       edx, 15                                       ;236.5
        mov       BYTE PTR [1+esp], dl                          ;236.5
        movzx     edx, BYTE PTR [_sbox+1+edi*8]                 ;236.5
        mov       DWORD PTR [20+esp], edx                       ;236.5
        shr       edx, 4                                        ;236.5
        mov       BYTE PTR [2+esp], dl                          ;236.5
        mov       edx, DWORD PTR [20+esp]                       ;236.5
        and       edx, 15                                       ;236.5
        mov       BYTE PTR [3+esp], dl                          ;236.5
        movzx     edx, BYTE PTR [_sbox+2+edi*8]                 ;236.5
        mov       DWORD PTR [24+esp], edx                       ;236.5
        shr       edx, 4                                        ;236.5
        mov       BYTE PTR [4+esp], dl                          ;236.5
        mov       edx, DWORD PTR [24+esp]                       ;236.5
        and       edx, 15                                       ;236.5
        mov       BYTE PTR [5+esp], dl                          ;236.5
        movzx     edx, BYTE PTR [_sbox+3+edi*8]                 ;236.5
        mov       DWORD PTR [28+esp], edx                       ;236.5
        shr       edx, 4                                        ;236.5
        mov       BYTE PTR [6+esp], dl                          ;236.5
        mov       edx, DWORD PTR [28+esp]                       ;236.5
        and       edx, 15                                       ;236.5
        mov       BYTE PTR [7+esp], dl                          ;236.5
        movzx     edx, BYTE PTR [_sbox+4+edi*8]                 ;236.5
        mov       DWORD PTR [32+esp], edx                       ;236.5
        shr       edx, 4                                        ;236.5
        mov       BYTE PTR [8+esp], dl                          ;236.5
        mov       edx, DWORD PTR [32+esp]                       ;236.5
        and       edx, 15                                       ;236.5
        mov       BYTE PTR [9+esp], dl                          ;236.5
        movzx     edx, BYTE PTR [_sbox+5+edi*8]                 ;236.5
        mov       DWORD PTR [36+esp], edx                       ;236.5
        shr       edx, 4                                        ;236.5
        mov       BYTE PTR [10+esp], dl                         ;236.5
        mov       edx, DWORD PTR [36+esp]                       ;236.5
        and       edx, 15                                       ;236.5
        mov       BYTE PTR [11+esp], dl                         ;236.5
        movzx     edx, BYTE PTR [_sbox+6+edi*8]                 ;236.5
        mov       DWORD PTR [40+esp], edx                       ;236.5
        shr       edx, 4                                        ;236.5
        mov       BYTE PTR [12+esp], dl                         ;236.5
        mov       edx, DWORD PTR [40+esp]                       ;236.5
        and       edx, 15                                       ;236.5
        mov       BYTE PTR [13+esp], dl                         ;236.5
        movzx     edx, BYTE PTR [_sbox+7+edi*8]                 ;236.5
        mov       DWORD PTR [44+esp], edx                       ;236.5
        shr       edx, 4                                        ;236.5
        mov       BYTE PTR [14+esp], dl                         ;236.5
        mov       edx, DWORD PTR [44+esp]                       ;236.5
        and       edx, 15                                       ;236.5
        mov       BYTE PTR [15+esp], dl                         ;236.5
        mov       DWORD PTR [168+esp], esi                      ;236.5
        mov       DWORD PTR [172+esp], esi                      ;236.5
        mov       DWORD PTR [148+esp], ebx                      ;236.5
        mov       DWORD PTR [156+esp], ecx                      ;236.5
                                ; LOE eax esi xmm1
.B2.3:                          ; Preds .B2.3 .B2.2
        mov       ecx, eax                                      ;236.5
        mov       edi, eax                                      ;236.5
        and       ecx, 1                                        ;236.5
        mov       ebx, DWORD PTR [156+esp]                      ;236.5
        mov       edx, ebx                                      ;236.5
        mov       DWORD PTR [180+esp], esi                      ;
        and       edx, 1                                        ;236.5
        movzx     esi, BYTE PTR [160+esp+esi]                   ;236.5
        shl       ecx, 7                                        ;236.5
        shr       esi, 1                                        ;236.5
        mov       DWORD PTR [188+esp], edx                      ;236.5
        or        ecx, esi                                      ;236.5
        mov       edx, DWORD PTR [152+esp]                      ;236.5
        mov       esi, ebx                                      ;236.5
        mov       DWORD PTR [184+esp], ecx                      ;236.5
        mov       ecx, edx                                      ;236.5
        and       ecx, 1                                        ;236.5
        mov       DWORD PTR [192+esp], ecx                      ;236.5
        shr       edx, 1                                        ;236.5
        mov       ecx, DWORD PTR [148+esp]                      ;236.5
        mov       DWORD PTR [196+esp], edx                      ;236.5
        mov       edx, ecx                                      ;236.5
        and       edx, 1                                        ;236.5
        mov       DWORD PTR [200+esp], edx                      ;236.5
        mov       edx, ecx                                      ;236.5
        shr       edx, 1                                        ;236.5
        and       edx, 1                                        ;236.5
        shr       ebx, 2                                        ;236.5
        shl       edx, 7                                        ;236.5
        mov       DWORD PTR [156+esp], ebx                      ;236.5
        mov       DWORD PTR [204+esp], edx                      ;236.5
        mov       edx, DWORD PTR [188+esp]                      ;236.5
        mov       ebx, DWORD PTR [184+esp]                      ;236.5
        shl       edx, 7                                        ;236.5
        shr       ebx, 1                                        ;236.5
        or        edx, ebx                                      ;236.5
        shr       ecx, 2                                        ;236.5
        mov       DWORD PTR [148+esp], ecx                      ;236.5
        mov       ecx, DWORD PTR [192+esp]                      ;236.5
        shl       ecx, 7                                        ;236.5
        shr       edx, 1                                        ;236.5
        shr       eax, 2                                        ;236.5
        or        ecx, edx                                      ;236.5
        mov       DWORD PTR [176+esp], eax                      ;236.5
        mov       eax, DWORD PTR [196+esp]                      ;236.5
        and       eax, 1                                        ;236.5
        movzx     ecx, cl                                       ;236.5
        shl       eax, 7                                        ;236.5
        mov       DWORD PTR [196+esp], eax                      ;236.5
        mov       eax, DWORD PTR [200+esp]                      ;236.5
        shr       edi, 1                                        ;236.5
        shl       eax, 7                                        ;236.5
        and       edi, 1                                        ;236.5
        shr       ecx, 1                                        ;236.5
        or        eax, ecx                                      ;236.5
        shr       esi, 1                                        ;236.5
        shl       edi, 7                                        ;236.5
        and       esi, 1                                        ;236.5
        shr       eax, 1                                        ;236.5
        or        edi, eax                                      ;236.5
        shl       esi, 7                                        ;236.5
        shr       edi, 1                                        ;236.5
        or        esi, edi                                      ;236.5
        and       esi, 255                                      ;236.5
        shr       esi, 1                                        ;236.5
        mov       edi, DWORD PTR [196+esp]                      ;236.5
        or        edi, esi                                      ;236.5
        mov       esi, DWORD PTR [180+esp]                      ;236.5
        shr       edi, 1                                        ;236.5
        mov       eax, DWORD PTR [204+esp]                      ;236.5
        or        eax, edi                                      ;236.5
        DB        144                                           ;236.5
        mov       BYTE PTR [160+esp+esi], al                    ;236.5
        inc       esi                                           ;236.5
        shr       DWORD PTR [152+esp], 2                        ;236.5
        mov       eax, DWORD PTR [176+esp]                      ;236.5
        cmp       esi, 16                                       ;236.5
        jb        .B2.3         ; Prob 91%                      ;236.5
                                ; LOE eax esi xmm1
.B2.4:                          ; Preds .B2.3
        movdqu    xmm0, XMMWORD PTR [160+esp]                   ;236.5
        pxor      xmm6, xmm6                                    ;236.5
        pmovzxbw  xmm6, xmm0                                    ;236.5
        pxor      xmm7, xmm7                                    ;236.5
        psraw     xmm6, 4                                       ;236.5
        movdqa    xmm2, xmm0                                    ;236.5
        pmovsxwd  xmm7, xmm6                                    ;236.5
        pxor      xmm4, xmm4                                    ;236.5
        movd      edx, xmm7                                     ;236.5
        pxor      xmm5, xmm5                                    ;236.5
        psrldq    xmm6, 8                                       ;236.5
        psrldq    xmm2, 8                                       ;236.5
        pmovsxwd  xmm6, xmm6                                    ;236.5
        pshufd    xmm3, xmm7, 57                                ;236.5
        pmovzxbw  xmm4, xmm2                                    ;236.5
        movsx     ecx, BYTE PTR [esp+edx]                       ;236.5
        psraw     xmm4, 4                                       ;236.5
        pshufd    xmm7, xmm3, 57                                ;236.5
        movd      edx, xmm6                                     ;236.5
        pshufd    xmm6, xmm6, 57                                ;236.5
        movd      DWORD PTR [48+esp], xmm6                      ;236.5
        movd      edi, xmm3                                     ;236.5
        pshufd    xmm3, xmm7, 57                                ;236.5
        movd      esi, xmm7                                     ;236.5
        pshufd    xmm7, xmm6, 57                                ;236.5
        movd      DWORD PTR [52+esp], xmm7                      ;236.5
        pmovsxwd  xmm5, xmm4                                    ;236.5
        movd      ebx, xmm3                                     ;236.5
        pshufd    xmm3, xmm7, 57                                ;236.5
        movd      DWORD PTR [56+esp], xmm3                      ;236.5
        pshufd    xmm3, xmm5, 57                                ;236.5
        psrldq    xmm4, 8                                       ;236.5
        movd      DWORD PTR [60+esp], xmm5                      ;236.5
        pshufd    xmm5, xmm3, 57                                ;236.5
        pmovsxwd  xmm4, xmm4                                    ;236.5
        movd      DWORD PTR [68+esp], xmm5                      ;236.5
        pshufd    xmm6, xmm5, 57                                ;236.5
        pxor      xmm5, xmm5                                    ;236.5
        pshufd    xmm7, xmm4, 57                                ;236.5
        pmovzxbd  xmm5, xmm0                                    ;236.5
        movd      DWORD PTR [64+esp], xmm3                      ;236.5
        pand      xmm5, xmm1                                    ;236.5
        pshufd    xmm3, xmm7, 57                                ;236.5
        movd      DWORD PTR [72+esp], xmm6                      ;236.5
        movd      DWORD PTR [76+esp], xmm4                      ;236.5
        pshufd    xmm4, xmm3, 57                                ;236.5
        pshufd    xmm6, xmm5, 57                                ;236.5
        movd      DWORD PTR [88+esp], xmm4                      ;236.5
        pshufd    xmm4, xmm6, 57                                ;236.5
        mov       eax, DWORD PTR [16+ebp]                       ;
        movd      eax, xmm5                                     ;236.5
        pshufd    xmm5, xmm4, 57                                ;236.5
        movd      DWORD PTR [104+esp], xmm5                     ;236.5
        movd      xmm5, ecx                                     ;236.5
        pinsrb    xmm5, BYTE PTR [esp+edi], 1                   ;236.5
        movd      DWORD PTR [84+esp], xmm3                      ;236.5
        movdqa    xmm3, xmm0                                    ;236.5
        psrldq    xmm3, 4                                       ;236.5
        movd      DWORD PTR [80+esp], xmm7                      ;236.5
        movd      DWORD PTR [96+esp], xmm6                      ;236.5
        movd      DWORD PTR [100+esp], xmm4                     ;236.5
        psrldq    xmm0, 12                                      ;236.5
        pinsrb    xmm5, BYTE PTR [esp+esi], 2                   ;236.5
        pinsrb    xmm5, BYTE PTR [esp+ebx], 3                   ;236.5
        pinsrb    xmm5, BYTE PTR [esp+edx], 4                   ;236.5
        mov       ecx, DWORD PTR [48+esp]                       ;236.5
        mov       ebx, DWORD PTR [52+esp]                       ;236.5
        mov       esi, DWORD PTR [56+esp]                       ;236.5
        pinsrb    xmm5, BYTE PTR [esp+ecx], 5                   ;236.5
        pinsrb    xmm5, BYTE PTR [esp+ebx], 6                   ;236.5
        pinsrb    xmm5, BYTE PTR [esp+esi], 7                   ;236.5
        mov       edi, DWORD PTR [60+esp]                       ;236.5
        mov       edx, DWORD PTR [64+esp]                       ;236.5
        mov       ecx, DWORD PTR [68+esp]                       ;236.5
        pinsrb    xmm5, BYTE PTR [esp+edi], 8                   ;236.5
        pinsrb    xmm5, BYTE PTR [esp+edx], 9                   ;236.5
        pinsrb    xmm5, BYTE PTR [esp+ecx], 10                  ;236.5
        pmovzxbd  xmm3, xmm3                                    ;236.5
        pmovzxbd  xmm2, xmm2                                    ;236.5
        pand      xmm3, xmm1                                    ;236.5
        mov       ebx, DWORD PTR [72+esp]                       ;236.5
        pand      xmm2, xmm1                                    ;236.5
        pshufd    xmm7, xmm3, 57                                ;236.5
        movd      DWORD PTR [108+esp], xmm3                     ;236.5
        pshufd    xmm3, xmm7, 57                                ;236.5
        movd      DWORD PTR [124+esp], xmm2                     ;236.5
        pshufd    xmm2, xmm2, 57                                ;236.5
        movd      DWORD PTR [116+esp], xmm3                     ;236.5
        pshufd    xmm4, xmm3, 57                                ;236.5
        pshufd    xmm3, xmm2, 57                                ;236.5
        movsx     eax, BYTE PTR [esp+eax]                       ;236.5
        pinsrb    xmm5, BYTE PTR [esp+ebx], 11                  ;236.5
        movd      DWORD PTR [120+esp], xmm4                     ;236.5
        pshufd    xmm4, xmm3, 57                                ;236.5
        movd      DWORD PTR [136+esp], xmm4                     ;236.5
        movd      DWORD PTR [112+esp], xmm7                     ;236.5
        movd      DWORD PTR [128+esp], xmm2                     ;236.5
        movd      DWORD PTR [132+esp], xmm3                     ;236.5
        mov       ebx, DWORD PTR [96+esp]                       ;236.5
        mov       DWORD PTR [92+esp], eax                       ;236.5
        movd      xmm4, DWORD PTR [92+esp]                      ;236.5
        pinsrb    xmm4, BYTE PTR [esp+ebx], 1                   ;236.5
        mov       esi, DWORD PTR [76+esp]                       ;236.5
        mov       edi, DWORD PTR [80+esp]                       ;236.5
        mov       edx, DWORD PTR [84+esp]                       ;236.5
        pinsrb    xmm5, BYTE PTR [esp+esi], 12                  ;236.5
        mov       esi, DWORD PTR [100+esp]                      ;236.5
        pinsrb    xmm5, BYTE PTR [esp+edi], 13                  ;236.5
        pinsrb    xmm4, BYTE PTR [esp+esi], 2                   ;236.5
        pinsrb    xmm5, BYTE PTR [esp+edx], 14                  ;236.5
        mov       edi, DWORD PTR [104+esp]                      ;236.5
        mov       edx, DWORD PTR [108+esp]                      ;236.5
        mov       ecx, DWORD PTR [88+esp]                       ;236.5
        pinsrb    xmm4, BYTE PTR [esp+edi], 3                   ;236.5
        pinsrb    xmm5, BYTE PTR [esp+ecx], 15                  ;236.5
        pinsrb    xmm4, BYTE PTR [esp+edx], 4                   ;236.5
        psllw     xmm5, 4                                       ;236.5
        pand      xmm5, XMMWORD PTR [_2il0floatpacket.5]        ;236.5
        mov       ecx, DWORD PTR [112+esp]                      ;236.5
        mov       ebx, DWORD PTR [116+esp]                      ;236.5
        mov       esi, DWORD PTR [120+esp]                      ;236.5
        pinsrb    xmm4, BYTE PTR [esp+ecx], 5                   ;236.5
        pinsrb    xmm4, BYTE PTR [esp+ebx], 6                   ;236.5
        pinsrb    xmm4, BYTE PTR [esp+esi], 7                   ;236.5
        mov       edi, DWORD PTR [124+esp]                      ;236.5
        mov       edx, DWORD PTR [128+esp]                      ;236.5
        mov       ebx, DWORD PTR [136+esp]                      ;236.5
        pinsrb    xmm4, BYTE PTR [esp+edi], 8                   ;236.5
        pinsrb    xmm4, BYTE PTR [esp+edx], 9                   ;236.5
        mov       ecx, DWORD PTR [132+esp]                      ;236.5
        pmovzxbd  xmm0, xmm0                                    ;236.5
        pand      xmm0, xmm1                                    ;236.5
        pinsrb    xmm4, BYTE PTR [esp+ecx], 10                  ;236.5
        movd      DWORD PTR [140+esp], xmm0                     ;236.5
        pshufd    xmm0, xmm0, 57                                ;236.5
        pshufd    xmm2, xmm0, 57                                ;236.5
        pshufd    xmm3, xmm2, 57                                ;236.5
        movd      eax, xmm0                                     ;236.5
        pinsrb    xmm4, BYTE PTR [esp+ebx], 11                  ;236.5
        mov       esi, DWORD PTR [140+esp]                      ;236.5
        xor       ebx, ebx                                      ;236.5
        mov       edx, DWORD PTR [16+ebp]                       ;236.5
        pinsrb    xmm4, BYTE PTR [esp+esi], 12                  ;236.5
        xor       esi, esi                                      ;236.5
        pinsrb    xmm4, BYTE PTR [esp+eax], 13                  ;236.5
        movd      eax, xmm2                                     ;236.5
        mov       DWORD PTR [edx], ebx                          ;236.5
        pinsrb    xmm4, BYTE PTR [esp+eax], 14                  ;236.5
        movd      eax, xmm3                                     ;236.5
        mov       DWORD PTR [4+edx], ebx                        ;236.5
        pinsrb    xmm4, BYTE PTR [esp+eax], 15                  ;236.5
        por       xmm5, xmm4                                    ;236.5
        movdqu    XMMWORD PTR [160+esp], xmm5                   ;236.5
        mov       DWORD PTR [8+edx], ebx                        ;236.5
        mov       DWORD PTR [12+edx], ebx                       ;236.5
                                ; LOE edx ebx esi xmm1
.B2.5:                          ; Preds .B2.7 .B2.4
        mov       ecx, DWORD PTR [160+esp+ebx*4]                ;236.5
        mov       eax, esi                                      ;236.5
        mov       DWORD PTR [208+esp], ebx                      ;236.5
                                ; LOE eax edx ecx xmm1
.B2.6:                          ; Preds .B2.6 .B2.5
        mov       edi, eax                                      ;236.5
        mov       esi, ecx                                      ;236.5
        and       edi, 3                                        ;236.5
        and       esi, 1                                        ;236.5
        shl       esi, 31                                       ;236.5
        inc       eax                                           ;236.5
        shr       ecx, 1                                        ;236.5
        mov       ebx, DWORD PTR [edx+edi*4]                    ;236.5
        shr       ebx, 1                                        ;236.5
        or        esi, ebx                                      ;236.5
        mov       DWORD PTR [edx+edi*4], esi                    ;236.5
        cmp       eax, 32                                       ;236.5
        jb        .B2.6         ; Prob 82%                      ;236.5
                                ; LOE eax edx ecx xmm1
.B2.7:                          ; Preds .B2.6
        mov       ebx, DWORD PTR [208+esp]                      ;
        xor       esi, esi                                      ;
        mov       DWORD PTR [160+esp+ebx*4], ecx                ;236.5
        inc       ebx                                           ;236.5
        cmp       ebx, 4                                        ;236.5
        jb        .B2.5         ; Prob 91%                      ;236.5
                                ; LOE edx ebx esi xmm1
.B2.8:                          ; Preds .B2.7
        cmp       DWORD PTR [144+esp], 31                       ;238.12
        je        .B2.12        ; Prob 16%                      ;238.12
                                ; LOE xmm1
.B2.9:                          ; Preds .B2.8
        mov       esi, DWORD PTR [16+ebp]                       ;242.7
        mov       eax, DWORD PTR [esi]                          ;242.7
        rol       eax, 13                                       ;242.7
        mov       edx, DWORD PTR [8+esi]                        ;242.7
        mov       ecx, eax                                      ;242.7
        rol       edx, 3                                        ;242.7
        xor       ecx, edx                                      ;242.7
        xor       ecx, DWORD PTR [4+esi]                        ;242.7
        lea       ebx, DWORD PTR [eax*8]                        ;242.7
        xor       ebx, edx                                      ;242.7
        xor       ebx, DWORD PTR [12+esi]                       ;242.7
        rol       ecx, 1                                        ;242.7
        rol       ebx, 7                                        ;242.7
        mov       edi, ecx                                      ;242.7
        xor       edi, ebx                                      ;242.7
        xor       eax, edi                                      ;242.7
        mov       edi, ecx                                      ;242.7
        shl       edi, 7                                        ;242.7
        xor       edi, ebx                                      ;242.7
        xor       edx, edi                                      ;242.7
        rol       eax, 5                                        ;242.7
        rol       edx, 22                                       ;242.7
        mov       DWORD PTR [esi], eax                          ;242.7
        mov       DWORD PTR [4+esi], ecx                        ;242.7
        mov       DWORD PTR [8+esi], edx                        ;242.7
                                ; LOE eax edx ecx ebx xmm1
.B2.10:                         ; Preds .B2.12 .B2.9
        mov       esi, DWORD PTR [16+ebp]                       ;239.7
        mov       edi, DWORD PTR [144+esp]                      ;232.3
        inc       edi                                           ;232.3
        mov       DWORD PTR [12+esi], ebx                       ;239.7
        mov       DWORD PTR [144+esp], edi                      ;232.3
        cmp       edi, 32                                       ;232.3
        jb        .B2.2         ; Prob 82%                      ;232.3
                                ; LOE eax edx ecx ebx xmm1
.B2.11:                         ; Preds .B2.10
        add       esp, 212                                      ;245.1
        pop       ebx                                           ;245.1
        pop       edi                                           ;245.1
        pop       esi                                           ;245.1
        mov       esp, ebp                                      ;245.1
        pop       ebp                                           ;245.1
        ret                                                     ;245.1
                                ; LOE
.B2.12:                         ; Preds .B2.8                   ; Infreq
        mov       ebx, DWORD PTR [16+ebp]                       ;239.7
        mov       esi, DWORD PTR [8+ebp]                        ;239.7
        mov       eax, DWORD PTR [ebx]                          ;239.7
        xor       eax, DWORD PTR [512+esi]                      ;239.7
        mov       DWORD PTR [ebx], eax                          ;239.7
        mov       ecx, DWORD PTR [4+ebx]                        ;239.7
        xor       ecx, DWORD PTR [516+esi]                      ;239.7
        mov       DWORD PTR [4+ebx], ecx                        ;239.7
        mov       edx, DWORD PTR [8+ebx]                        ;239.7
        xor       edx, DWORD PTR [520+esi]                      ;239.7
        mov       DWORD PTR [8+ebx], edx                        ;239.7
        mov       ebx, DWORD PTR [12+ebx]                       ;239.7
        xor       ebx, DWORD PTR [524+esi]                      ;239.7
        jmp       .B2.10        ; Prob 100%                     ;239.7
        ALIGN     16
                                ; LOE eax edx ecx ebx xmm1
; mark_end;
_serpent_enc ENDP
;_serpent_enc	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _serpent_enc
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _serpent_setkey
TXTST2:
; -- Begin  _serpent_setkey
;_serpent_setkey	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _serpent_setkey
; mark_begin;
       ALIGN     16
	PUBLIC _serpent_setkey
_serpent_setkey	PROC NEAR 
; parameter 1: 8 + ebp
; parameter 2: 12 + ebp
; parameter 3: 16 + ebp
.B3.1:                          ; Preds .B3.0
        push      ebp                                           ;177.1
        mov       ebp, esp                                      ;177.1
        and       esp, -16                                      ;177.1
        push      esi                                           ;177.1
        push      edi                                           ;177.1
        sub       esp, 200                                      ;177.1
        mov       ecx, 32                                       ;191.3
        mov       eax, DWORD PTR [16+ebp]                       ;176.6
        cmp       eax, 32                                       ;191.3
        mov       esi, DWORD PTR [12+ebp]                       ;191.3
        lea       edi, DWORD PTR [esp]                          ;191.3
        cmovbe    ecx, eax                                      ;191.3
        pxor      xmm0, xmm0                                    ;186.5
        movzx     ecx, cl                                       ;191.3
        movdqu    XMMWORD PTR [edi], xmm0                       ;186.5
        movdqu    XMMWORD PTR [16+edi], xmm0                    ;186.5
        rep                                                     ;191.3
        movsb                                                   ;191.3
                                ; LOE eax ebx
.B3.2:                          ; Preds .B3.1
        cmp       eax, 32                                       ;201.15
        jae       .B3.4         ; Prob 50%                      ;201.15
                                ; LOE eax ebx
.B3.3:                          ; Preds .B3.2
        or        BYTE PTR [esp+eax], 1                         ;202.5
                                ; LOE ebx
.B3.4:                          ; Preds .B3.2 .B3.3
        xor       edx, edx                                      ;205.3
        mov       eax, DWORD PTR [8+ebp]                        ;176.6
        mov       ecx, DWORD PTR [28+esp]                       ;207.26
        mov       DWORD PTR [32+esp], edx                       ;207.26
        mov       DWORD PTR [120+esp], ebx                      ;207.26
        jmp       .B3.5         ; Prob 100%                     ;207.26
                                ; LOE eax ecx
.B3.10:                         ; Preds .B3.9
        mov       DWORD PTR [28+esp], ecx                       ;215.7
                                ; LOE eax ecx
.B3.5:                          ; Preds .B3.10 .B3.4
        mov       esi, DWORD PTR [esp]                          ;207.26
        lea       edi, DWORD PTR [esp]                          ;213.7
        xor       esi, DWORD PTR [12+edi]                       ;207.26
        movzx     edx, BYTE PTR [32+edi]                        ;207.48
        xor       esi, DWORD PTR [20+edi]                       ;207.26
        xor       esi, ecx                                      ;207.26
        mov       ecx, 7                                        ;213.7
        xor       esi, -1640531527                              ;207.26
        lea       ebx, DWORD PTR [edx*4]                        ;207.50
        xor       esi, ebx                                      ;207.26
        mov       ebx, edx                                      ;207.14
        shl       ebx, 4                                        ;207.14
        rol       esi, 11                                       ;207.26
        mov       DWORD PTR [eax+ebx], esi                      ;207.7
        lea       esi, DWORD PTR [4+esp]                        ;213.7
        rep                                                     ;213.7
        movs                                                    ;213.7
                                ; LOE eax edx ebx
.B3.6:                          ; Preds .B3.5
        mov       esi, DWORD PTR [esp]                          ;207.26
        lea       edi, DWORD PTR [esp]                          ;213.7
        xor       esi, DWORD PTR [12+edi]                       ;207.26
        xor       esi, DWORD PTR [20+edi]                       ;207.26
        mov       ecx, DWORD PTR [eax+ebx]                      ;215.18
        xor       esi, ecx                                      ;207.26
        mov       DWORD PTR [28+edi], ecx                       ;215.7
        xor       esi, -1640531527                              ;207.26
        lea       ecx, DWORD PTR [1+edx*4]                      ;207.52
        xor       esi, ecx                                      ;207.26
        mov       ecx, 7                                        ;213.7
        rol       esi, 11                                       ;207.26
        mov       DWORD PTR [4+eax+ebx], esi                    ;207.7
        lea       esi, DWORD PTR [4+esp]                        ;213.7
        rep                                                     ;213.7
        movs                                                    ;213.7
                                ; LOE eax edx ebx
.B3.7:                          ; Preds .B3.6
        mov       esi, DWORD PTR [esp]                          ;207.26
        lea       edi, DWORD PTR [esp]                          ;213.7
        xor       esi, DWORD PTR [12+edi]                       ;207.26
        xor       esi, DWORD PTR [20+edi]                       ;207.26
        mov       ecx, DWORD PTR [4+eax+ebx]                    ;215.18
        xor       esi, ecx                                      ;207.26
        mov       DWORD PTR [28+edi], ecx                       ;215.7
        xor       esi, -1640531527                              ;207.26
        lea       ecx, DWORD PTR [2+edx*4]                      ;207.52
        xor       esi, ecx                                      ;207.26
        mov       ecx, 7                                        ;213.7
        rol       esi, 11                                       ;207.26
        mov       DWORD PTR [8+eax+ebx], esi                    ;207.7
        lea       esi, DWORD PTR [4+esp]                        ;213.7
        rep                                                     ;213.7
        movs                                                    ;213.7
                                ; LOE eax edx ebx
.B3.8:                          ; Preds .B3.7
        mov       esi, DWORD PTR [esp]                          ;207.26
        lea       edx, DWORD PTR [3+edx*4]                      ;207.52
        xor       esi, DWORD PTR [12+esp]                       ;207.26
        lea       edi, DWORD PTR [esp]                          ;213.7
        xor       esi, DWORD PTR [20+edi]                       ;207.26
        mov       ecx, DWORD PTR [8+eax+ebx]                    ;215.18
        xor       esi, ecx                                      ;207.26
        xor       esi, -1640531527                              ;207.26
        xor       esi, edx                                      ;207.26
        rol       esi, 11                                       ;207.26
        mov       DWORD PTR [28+edi], ecx                       ;215.7
        mov       ecx, 7                                        ;213.7
        mov       DWORD PTR [12+eax+ebx], esi                   ;207.7
        lea       esi, DWORD PTR [4+esp]                        ;213.7
        rep                                                     ;213.7
        movs                                                    ;213.7
                                ; LOE eax ebx
.B3.9:                          ; Preds .B3.8
        mov       edx, DWORD PTR [32+esp]                       ;205.3
        inc       edx                                           ;205.3
        mov       ecx, DWORD PTR [12+eax+ebx]                   ;215.18
        mov       DWORD PTR [32+esp], edx                       ;205.3
        cmp       edx, 33                                       ;205.3
        jb        .B3.10        ; Prob 91%                      ;205.3
                                ; LOE eax ecx
.B3.11:                         ; Preds .B3.9                   ; Infreq
        xor       esi, esi                                      ;
        mov       edx, esi                                      ;218.3
        movdqu    xmm1, XMMWORD PTR [_2il0floatpacket.4]        ;219.5
                                ; LOE edx xmm1
.B3.12:                         ; Preds .B3.18 .B3.11           ; Infreq
        mov       eax, edx                                      ;219.26
        mov       ecx, edx                                      ;219.22
        neg       eax                                           ;219.26
        add       eax, 3                                        ;219.26
        shl       ecx, 4                                        ;219.22
        and       eax, 7                                        ;219.5
        mov       esi, DWORD PTR [8+ebp]                        ;219.15
        mov       DWORD PTR [20+esp], ecx                       ;219.22
        mov       DWORD PTR [124+esp], edx                      ;219.5
        lea       ebx, DWORD PTR [esi+ecx]                      ;219.15
        mov       DWORD PTR [16+esp], ebx                       ;219.15
        xor       esi, esi                                      ;219.5
        movzx     ebx, BYTE PTR [_sbox+eax*8]                   ;219.5
        mov       ecx, ebx                                      ;219.5
        and       ebx, 15                                       ;219.5
        mov       BYTE PTR [1+esp], bl                          ;219.5
        shr       ecx, 4                                        ;219.5
        movzx     ebx, BYTE PTR [_sbox+1+eax*8]                 ;219.5
        mov       BYTE PTR [esp], cl                            ;219.5
        mov       ecx, ebx                                      ;219.5
        and       ebx, 15                                       ;219.5
        mov       BYTE PTR [3+esp], bl                          ;219.5
        shr       ecx, 4                                        ;219.5
        movzx     ebx, BYTE PTR [_sbox+2+eax*8]                 ;219.5
        mov       BYTE PTR [2+esp], cl                          ;219.5
        mov       ecx, ebx                                      ;219.5
        and       ebx, 15                                       ;219.5
        mov       BYTE PTR [5+esp], bl                          ;219.5
        shr       ecx, 4                                        ;219.5
        movzx     ebx, BYTE PTR [_sbox+3+eax*8]                 ;219.5
        mov       BYTE PTR [4+esp], cl                          ;219.5
        mov       ecx, ebx                                      ;219.5
        and       ebx, 15                                       ;219.5
        mov       BYTE PTR [7+esp], bl                          ;219.5
        shr       ecx, 4                                        ;219.5
        movzx     ebx, BYTE PTR [_sbox+4+eax*8]                 ;219.5
        mov       BYTE PTR [6+esp], cl                          ;219.5
        mov       ecx, ebx                                      ;219.5
        and       ebx, 15                                       ;219.5
        mov       BYTE PTR [9+esp], bl                          ;219.5
        shr       ecx, 4                                        ;219.5
        movzx     ebx, BYTE PTR [_sbox+5+eax*8]                 ;219.5
        mov       BYTE PTR [8+esp], cl                          ;219.5
        mov       ecx, ebx                                      ;219.5
        and       ebx, 15                                       ;219.5
        mov       BYTE PTR [11+esp], bl                         ;219.5
        shr       ecx, 4                                        ;219.5
        movzx     ebx, BYTE PTR [_sbox+6+eax*8]                 ;219.5
        mov       BYTE PTR [10+esp], cl                         ;219.5
        mov       ecx, ebx                                      ;219.5
        mov       edi, DWORD PTR [16+esp]                       ;219.5
        and       ebx, 15                                       ;219.5
        shr       ecx, 4                                        ;219.5
        mov       BYTE PTR [12+esp], cl                         ;219.5
        movzx     ecx, BYTE PTR [_sbox+7+eax*8]                 ;219.5
        mov       eax, ecx                                      ;219.5
        shr       eax, 4                                        ;219.5
        and       ecx, 15                                       ;219.5
        mov       BYTE PTR [13+esp], bl                         ;219.5
        mov       BYTE PTR [14+esp], al                         ;219.5
        mov       BYTE PTR [15+esp], cl                         ;219.5
        mov       ecx, DWORD PTR [edi]                          ;219.5
        mov       eax, DWORD PTR [4+edi]                        ;219.5
        mov       ebx, DWORD PTR [8+edi]                        ;219.5
        mov       edi, DWORD PTR [12+edi]                       ;219.5
        mov       DWORD PTR [128+esp], esi                      ;219.5
        mov       DWORD PTR [132+esp], esi                      ;219.5
        mov       DWORD PTR [136+esp], esi                      ;219.5
        mov       DWORD PTR [140+esp], esi                      ;219.5
        mov       DWORD PTR [144+esp], edi                      ;219.5
        mov       DWORD PTR [148+esp], ebx                      ;219.5
        mov       DWORD PTR [152+esp], eax                      ;219.5
                                ; LOE ecx esi xmm1
.B3.13:                         ; Preds .B3.13 .B3.12           ; Infreq
        mov       edx, ecx                                      ;219.5
        mov       edi, ecx                                      ;219.5
        and       edx, 1                                        ;219.5
        mov       ebx, DWORD PTR [152+esp]                      ;219.5
        mov       eax, ebx                                      ;219.5
        mov       DWORD PTR [156+esp], esi                      ;
        and       eax, 1                                        ;219.5
        movzx     esi, BYTE PTR [128+esp+esi]                   ;219.5
        shl       edx, 7                                        ;219.5
        shr       esi, 1                                        ;219.5
        mov       DWORD PTR [164+esp], eax                      ;219.5
        or        edx, esi                                      ;219.5
        mov       eax, DWORD PTR [148+esp]                      ;219.5
        mov       esi, ebx                                      ;219.5
        mov       DWORD PTR [160+esp], edx                      ;219.5
        mov       edx, eax                                      ;219.5
        and       edx, 1                                        ;219.5
        mov       DWORD PTR [168+esp], edx                      ;219.5
        shr       eax, 1                                        ;219.5
        mov       edx, DWORD PTR [144+esp]                      ;219.5
        mov       DWORD PTR [172+esp], eax                      ;219.5
        mov       eax, edx                                      ;219.5
        and       eax, 1                                        ;219.5
        mov       DWORD PTR [176+esp], eax                      ;219.5
        mov       eax, edx                                      ;219.5
        shr       eax, 1                                        ;219.5
        and       eax, 1                                        ;219.5
        shr       ebx, 2                                        ;219.5
        shl       eax, 7                                        ;219.5
        mov       DWORD PTR [152+esp], ebx                      ;219.5
        mov       DWORD PTR [184+esp], eax                      ;219.5
        mov       eax, DWORD PTR [164+esp]                      ;219.5
        mov       ebx, DWORD PTR [160+esp]                      ;219.5
        shl       eax, 7                                        ;219.5
        shr       ebx, 1                                        ;219.5
        or        eax, ebx                                      ;219.5
        shr       edx, 2                                        ;219.5
        mov       DWORD PTR [144+esp], edx                      ;219.5
        mov       edx, DWORD PTR [168+esp]                      ;219.5
        shl       edx, 7                                        ;219.5
        shr       eax, 1                                        ;219.5
        shr       ecx, 2                                        ;219.5
        or        edx, eax                                      ;219.5
        mov       DWORD PTR [180+esp], ecx                      ;219.5
        mov       ecx, DWORD PTR [172+esp]                      ;219.5
        and       ecx, 1                                        ;219.5
        movzx     edx, dl                                       ;219.5
        shl       ecx, 7                                        ;219.5
        mov       DWORD PTR [172+esp], ecx                      ;219.5
        mov       ecx, DWORD PTR [176+esp]                      ;219.5
        shr       edi, 1                                        ;219.5
        shl       ecx, 7                                        ;219.5
        and       edi, 1                                        ;219.5
        shr       edx, 1                                        ;219.5
        or        ecx, edx                                      ;219.5
        shr       esi, 1                                        ;219.5
        shl       edi, 7                                        ;219.5
        and       esi, 1                                        ;219.5
        shr       ecx, 1                                        ;219.5
        or        edi, ecx                                      ;219.5
        shl       esi, 7                                        ;219.5
        shr       edi, 1                                        ;219.5
        or        esi, edi                                      ;219.5
        and       esi, 255                                      ;219.5
        shr       esi, 1                                        ;219.5
        mov       edi, DWORD PTR [172+esp]                      ;219.5
        or        edi, esi                                      ;219.5
        mov       esi, DWORD PTR [156+esp]                      ;219.5
        shr       edi, 1                                        ;219.5
        mov       eax, DWORD PTR [184+esp]                      ;219.5
        or        eax, edi                                      ;219.5
        DB        144                                           ;219.5
        mov       BYTE PTR [128+esp+esi], al                    ;219.5
        inc       esi                                           ;219.5
        shr       DWORD PTR [148+esp], 2                        ;219.5
        mov       ecx, DWORD PTR [180+esp]                      ;219.5
        cmp       esi, 16                                       ;219.5
        jb        .B3.13        ; Prob 91%                      ;219.5
                                ; LOE ecx esi xmm1
.B3.14:                         ; Preds .B3.13                  ; Infreq
        movdqu    xmm0, XMMWORD PTR [128+esp]                   ;219.5
        pxor      xmm6, xmm6                                    ;219.5
        pmovzxbw  xmm6, xmm0                                    ;219.5
        pxor      xmm7, xmm7                                    ;219.5
        psraw     xmm6, 4                                       ;219.5
        movdqa    xmm2, xmm0                                    ;219.5
        pmovsxwd  xmm7, xmm6                                    ;219.5
        pxor      xmm4, xmm4                                    ;219.5
        psrldq    xmm6, 8                                       ;219.5
        pxor      xmm5, xmm5                                    ;219.5
        psrldq    xmm2, 8                                       ;219.5
        pmovsxwd  xmm6, xmm6                                    ;219.5
        pshufd    xmm3, xmm7, 57                                ;219.5
        pmovzxbw  xmm4, xmm2                                    ;219.5
        movd      eax, xmm7                                     ;219.5
        psraw     xmm4, 4                                       ;219.5
        pshufd    xmm7, xmm3, 57                                ;219.5
        movd      edx, xmm6                                     ;219.5
        pshufd    xmm6, xmm6, 57                                ;219.5
        movd      DWORD PTR [24+esp], xmm6                      ;219.5
        movd      edi, xmm3                                     ;219.5
        pshufd    xmm3, xmm7, 57                                ;219.5
        movd      esi, xmm7                                     ;219.5
        pshufd    xmm7, xmm6, 57                                ;219.5
        movd      DWORD PTR [28+esp], xmm7                      ;219.5
        pmovsxwd  xmm5, xmm4                                    ;219.5
        movd      ebx, xmm3                                     ;219.5
        pshufd    xmm3, xmm7, 57                                ;219.5
        movd      DWORD PTR [32+esp], xmm3                      ;219.5
        pshufd    xmm3, xmm5, 57                                ;219.5
        psrldq    xmm4, 8                                       ;219.5
        movd      DWORD PTR [36+esp], xmm5                      ;219.5
        pshufd    xmm5, xmm3, 57                                ;219.5
        pmovsxwd  xmm4, xmm4                                    ;219.5
        movd      DWORD PTR [44+esp], xmm5                      ;219.5
        pshufd    xmm6, xmm5, 57                                ;219.5
        pxor      xmm5, xmm5                                    ;219.5
        pshufd    xmm7, xmm4, 57                                ;219.5
        pmovzxbd  xmm5, xmm0                                    ;219.5
        movd      DWORD PTR [40+esp], xmm3                      ;219.5
        pand      xmm5, xmm1                                    ;219.5
        pshufd    xmm3, xmm7, 57                                ;219.5
        movd      DWORD PTR [48+esp], xmm6                      ;219.5
        movd      DWORD PTR [52+esp], xmm4                      ;219.5
        pshufd    xmm4, xmm3, 57                                ;219.5
        pshufd    xmm6, xmm5, 57                                ;219.5
        movsx     ecx, BYTE PTR [esp+eax]                       ;219.5
        movd      DWORD PTR [64+esp], xmm4                      ;219.5
        pshufd    xmm4, xmm6, 57                                ;219.5
        movd      eax, xmm5                                     ;219.5
        pshufd    xmm5, xmm4, 57                                ;219.5
        movd      DWORD PTR [80+esp], xmm5                      ;219.5
        movd      xmm5, ecx                                     ;219.5
        pinsrb    xmm5, BYTE PTR [esp+edi], 1                   ;219.5
        movd      DWORD PTR [60+esp], xmm3                      ;219.5
        movdqa    xmm3, xmm0                                    ;219.5
        psrldq    xmm3, 4                                       ;219.5
        movd      DWORD PTR [56+esp], xmm7                      ;219.5
        movd      DWORD PTR [72+esp], xmm6                      ;219.5
        movd      DWORD PTR [76+esp], xmm4                      ;219.5
        psrldq    xmm0, 12                                      ;219.5
        pinsrb    xmm5, BYTE PTR [esp+esi], 2                   ;219.5
        pinsrb    xmm5, BYTE PTR [esp+ebx], 3                   ;219.5
        pinsrb    xmm5, BYTE PTR [esp+edx], 4                   ;219.5
        mov       edx, DWORD PTR [24+esp]                       ;219.5
        mov       ecx, DWORD PTR [28+esp]                       ;219.5
        mov       ebx, DWORD PTR [32+esp]                       ;219.5
        pinsrb    xmm5, BYTE PTR [esp+edx], 5                   ;219.5
        pinsrb    xmm5, BYTE PTR [esp+ecx], 6                   ;219.5
        pinsrb    xmm5, BYTE PTR [esp+ebx], 7                   ;219.5
        mov       esi, DWORD PTR [36+esp]                       ;219.5
        mov       edi, DWORD PTR [40+esp]                       ;219.5
        mov       edx, DWORD PTR [44+esp]                       ;219.5
        pinsrb    xmm5, BYTE PTR [esp+esi], 8                   ;219.5
        pinsrb    xmm5, BYTE PTR [esp+edi], 9                   ;219.5
        pinsrb    xmm5, BYTE PTR [esp+edx], 10                  ;219.5
        pmovzxbd  xmm3, xmm3                                    ;219.5
        pmovzxbd  xmm2, xmm2                                    ;219.5
        pand      xmm3, xmm1                                    ;219.5
        mov       ecx, DWORD PTR [48+esp]                       ;219.5
        pand      xmm2, xmm1                                    ;219.5
        pshufd    xmm7, xmm3, 57                                ;219.5
        movd      DWORD PTR [84+esp], xmm3                      ;219.5
        pshufd    xmm3, xmm7, 57                                ;219.5
        movd      DWORD PTR [100+esp], xmm2                     ;219.5
        pshufd    xmm2, xmm2, 57                                ;219.5
        movd      DWORD PTR [92+esp], xmm3                      ;219.5
        pshufd    xmm4, xmm3, 57                                ;219.5
        pshufd    xmm3, xmm2, 57                                ;219.5
        movsx     eax, BYTE PTR [esp+eax]                       ;219.5
        pinsrb    xmm5, BYTE PTR [esp+ecx], 11                  ;219.5
        movd      DWORD PTR [96+esp], xmm4                      ;219.5
        pshufd    xmm4, xmm3, 57                                ;219.5
        movd      DWORD PTR [112+esp], xmm4                     ;219.5
        movd      DWORD PTR [88+esp], xmm7                      ;219.5
        movd      DWORD PTR [104+esp], xmm2                     ;219.5
        movd      DWORD PTR [108+esp], xmm3                     ;219.5
        mov       ecx, DWORD PTR [72+esp]                       ;219.5
        mov       DWORD PTR [68+esp], eax                       ;219.5
        movd      xmm4, DWORD PTR [68+esp]                      ;219.5
        pinsrb    xmm4, BYTE PTR [esp+ecx], 1                   ;219.5
        mov       ebx, DWORD PTR [52+esp]                       ;219.5
        mov       esi, DWORD PTR [56+esp]                       ;219.5
        mov       edi, DWORD PTR [60+esp]                       ;219.5
        pinsrb    xmm5, BYTE PTR [esp+ebx], 12                  ;219.5
        mov       ebx, DWORD PTR [76+esp]                       ;219.5
        pinsrb    xmm5, BYTE PTR [esp+esi], 13                  ;219.5
        pinsrb    xmm4, BYTE PTR [esp+ebx], 2                   ;219.5
        pinsrb    xmm5, BYTE PTR [esp+edi], 14                  ;219.5
        mov       esi, DWORD PTR [80+esp]                       ;219.5
        mov       edi, DWORD PTR [84+esp]                       ;219.5
        mov       edx, DWORD PTR [64+esp]                       ;219.5
        pinsrb    xmm4, BYTE PTR [esp+esi], 3                   ;219.5
        pinsrb    xmm5, BYTE PTR [esp+edx], 15                  ;219.5
        pinsrb    xmm4, BYTE PTR [esp+edi], 4                   ;219.5
        psllw     xmm5, 4                                       ;219.5
        pand      xmm5, XMMWORD PTR [_2il0floatpacket.5]        ;219.5
        mov       edx, DWORD PTR [88+esp]                       ;219.5
        mov       ecx, DWORD PTR [92+esp]                       ;219.5
        mov       ebx, DWORD PTR [96+esp]                       ;219.5
        pinsrb    xmm4, BYTE PTR [esp+edx], 5                   ;219.5
        pinsrb    xmm4, BYTE PTR [esp+ecx], 6                   ;219.5
        pinsrb    xmm4, BYTE PTR [esp+ebx], 7                   ;219.5
        mov       esi, DWORD PTR [100+esp]                      ;219.5
        mov       edi, DWORD PTR [104+esp]                      ;219.5
        mov       edx, DWORD PTR [108+esp]                      ;219.5
        mov       ecx, DWORD PTR [112+esp]                      ;219.5
        pinsrb    xmm4, BYTE PTR [esp+esi], 8                   ;219.5
        pinsrb    xmm4, BYTE PTR [esp+edi], 9                   ;219.5
        pinsrb    xmm4, BYTE PTR [esp+edx], 10                  ;219.5
        pinsrb    xmm4, BYTE PTR [esp+ecx], 11                  ;219.5
        pmovzxbd  xmm0, xmm0                                    ;219.5
        pand      xmm0, xmm1                                    ;219.5
        movd      DWORD PTR [116+esp], xmm0                     ;219.5
        mov       ebx, DWORD PTR [116+esp]                      ;219.5
        pshufd    xmm0, xmm0, 57                                ;219.5
        movd      eax, xmm0                                     ;219.5
        pshufd    xmm2, xmm0, 57                                ;219.5
        pshufd    xmm3, xmm2, 57                                ;219.5
        pinsrb    xmm4, BYTE PTR [esp+ebx], 12                  ;219.5
        xor       ebx, ebx                                      ;219.5
        pinsrb    xmm4, BYTE PTR [esp+eax], 13                  ;219.5
        movd      eax, xmm2                                     ;219.5
        mov       ecx, DWORD PTR [8+ebp]                        ;219.5
        mov       edx, DWORD PTR [20+esp]                       ;219.5
        mov       esi, DWORD PTR [16+esp]                       ;219.5
        pinsrb    xmm4, BYTE PTR [esp+eax], 14                  ;219.5
        movd      eax, xmm3                                     ;219.5
        mov       DWORD PTR [edx+ecx], ebx                      ;219.5
        pinsrb    xmm4, BYTE PTR [esp+eax], 15                  ;219.5
        por       xmm5, xmm4                                    ;219.5
        movdqu    XMMWORD PTR [128+esp], xmm5                   ;219.5
        mov       edx, esi                                      ;219.5
        mov       DWORD PTR [4+esi], ebx                        ;219.5
        mov       DWORD PTR [8+esi], ebx                        ;219.5
        mov       DWORD PTR [12+esi], ebx                       ;219.5
        xor       esi, esi                                      ;219.5
                                ; LOE edx ebx esi xmm1
.B3.15:                         ; Preds .B3.17 .B3.14           ; Infreq
        mov       ecx, DWORD PTR [128+esp+ebx*4]                ;219.5
        mov       eax, esi                                      ;219.5
        mov       DWORD PTR [188+esp], ebx                      ;219.5
                                ; LOE eax edx ecx xmm1
.B3.16:                         ; Preds .B3.16 .B3.15           ; Infreq
        mov       edi, eax                                      ;219.5
        mov       esi, ecx                                      ;219.5
        and       edi, 3                                        ;219.5
        and       esi, 1                                        ;219.5
        shl       esi, 31                                       ;219.5
        inc       eax                                           ;219.5
        shr       ecx, 1                                        ;219.5
        mov       ebx, DWORD PTR [edx+edi*4]                    ;219.5
        shr       ebx, 1                                        ;219.5
        or        esi, ebx                                      ;219.5
        mov       DWORD PTR [edx+edi*4], esi                    ;219.5
        cmp       eax, 32                                       ;219.5
        jb        .B3.16        ; Prob 82%                      ;219.5
                                ; LOE eax edx ecx xmm1
.B3.17:                         ; Preds .B3.16                  ; Infreq
        mov       ebx, DWORD PTR [188+esp]                      ;
        xor       esi, esi                                      ;
        mov       DWORD PTR [128+esp+ebx*4], ecx                ;219.5
        inc       ebx                                           ;219.5
        cmp       ebx, 4                                        ;219.5
        jb        .B3.15        ; Prob 91%                      ;219.5
                                ; LOE edx ebx esi xmm1
.B3.18:                         ; Preds .B3.17                  ; Infreq
        mov       edx, DWORD PTR [124+esp]                      ;
        inc       edx                                           ;218.3
        cmp       edx, 33                                       ;218.3
        jb        .B3.12        ; Prob 91%                      ;218.3
                                ; LOE edx xmm1
.B3.19:                         ; Preds .B3.18                  ; Infreq
        mov       ebx, DWORD PTR [120+esp]                      ;
        add       esp, 200                                      ;221.1
        pop       edi                                           ;221.1
        pop       esi                                           ;221.1
        mov       esp, ebp                                      ;221.1
        pop       ebp                                           ;221.1
        ret                                                     ;221.1
        ALIGN     16
                                ; LOE
; mark_end;
_serpent_setkey ENDP
;_serpent_setkey	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _serpent_setkey
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _sbox128
TXTST3:
; -- Begin  _sbox128
;_sbox128	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _sbox128
; mark_begin;
       ALIGN     16
	PUBLIC _sbox128
_sbox128	PROC NEAR 
; parameter 1: 8 + ebp
; parameter 2: 12 + ebp
; parameter 3: 16 + ebp
.B4.1:                          ; Preds .B4.0
        push      ebp                                           ;148.1
        mov       ebp, esp                                      ;148.1
        and       esp, -16                                      ;148.1
        push      esi                                           ;148.1
        push      edi                                           ;148.1
        push      ebx                                           ;148.1
        sub       esp, 132                                      ;148.1
        pxor      xmm0, xmm0                                    ;163.20
        movzx     eax, BYTE PTR [12+ebp]                        ;147.6
        and       eax, 7                                        ;153.3
        pxor      xmm2, xmm2                                    ;163.5
        cmp       DWORD PTR [16+ebp], 0                         ;162.9
        mov       edx, DWORD PTR [8+ebp]                        ;147.6
        movdqu    XMMWORD PTR [112+esp], xmm2                   ;167.3
        lea       ecx, DWORD PTR [_sbox+eax*8]                  ;156.20
        lea       eax, DWORD PTR [_sbox_inv+eax*8]              ;162.9
        cmove     eax, ecx                                      ;162.9
        xor       ecx, ecx                                      ;167.3
        movq      xmm1, QWORD PTR [eax]                         ;162.9
        pmovzxbw  xmm0, xmm1                                    ;163.20
        psraw     xmm0, 4                                       ;163.20
        pand      xmm0, XMMWORD PTR [_2il0floatpacket.12]       ;163.20
        packuswb  xmm0, xmm2                                    ;163.20
        pand      xmm1, XMMWORD PTR [_2il0floatpacket.13]       ;164.20
        pextrb    BYTE PTR [esp], xmm0, 0                       ;163.5
        pextrb    BYTE PTR [2+esp], xmm0, 1                     ;163.5
        pextrb    BYTE PTR [4+esp], xmm0, 2                     ;163.5
        pextrb    BYTE PTR [6+esp], xmm0, 3                     ;163.5
        pextrb    BYTE PTR [8+esp], xmm0, 4                     ;163.5
        pextrb    BYTE PTR [10+esp], xmm0, 5                    ;163.5
        pextrb    BYTE PTR [12+esp], xmm0, 6                    ;163.5
        pextrb    BYTE PTR [14+esp], xmm0, 7                    ;163.5
        pextrb    BYTE PTR [1+esp], xmm1, 0                     ;164.5
        pextrb    BYTE PTR [3+esp], xmm1, 1                     ;164.5
        pextrb    BYTE PTR [5+esp], xmm1, 2                     ;164.5
        pextrb    BYTE PTR [7+esp], xmm1, 3                     ;164.5
        pextrb    BYTE PTR [9+esp], xmm1, 4                     ;164.5
        pextrb    BYTE PTR [11+esp], xmm1, 5                    ;164.5
        pextrb    BYTE PTR [13+esp], xmm1, 6                    ;164.5
        pextrb    BYTE PTR [15+esp], xmm1, 7                    ;164.5
        mov       eax, DWORD PTR [edx]                          ;167.3
        mov       esi, DWORD PTR [4+edx]                        ;167.3
        mov       ebx, DWORD PTR [8+edx]                        ;167.3
        mov       edx, DWORD PTR [12+edx]                       ;167.3
        mov       DWORD PTR [16+esp], edx                       ;167.3
        mov       DWORD PTR [20+esp], ebx                       ;167.3
        mov       DWORD PTR [24+esp], esi                       ;167.3
                                ; LOE eax ecx
.B4.2:                          ; Preds .B4.2 .B4.1
        mov       edx, eax                                      ;167.3
        mov       edi, eax                                      ;167.3
        and       edx, 1                                        ;167.3
        movzx     esi, BYTE PTR [112+esp+ecx]                   ;167.3
        shl       edx, 7                                        ;167.3
        shr       esi, 1                                        ;167.3
        or        edx, esi                                      ;167.3
        mov       DWORD PTR [32+esp], edx                       ;167.3
        mov       edx, DWORD PTR [20+esp]                       ;167.3
        mov       ebx, edx                                      ;167.3
        and       ebx, 1                                        ;167.3
        mov       DWORD PTR [40+esp], ebx                       ;167.3
        shr       edx, 1                                        ;167.3
        mov       ebx, DWORD PTR [16+esp]                       ;167.3
        mov       DWORD PTR [44+esp], edx                       ;167.3
        mov       edx, ebx                                      ;167.3
        and       edx, 1                                        ;167.3
        mov       DWORD PTR [48+esp], edx                       ;167.3
        mov       edx, ebx                                      ;167.3
        mov       DWORD PTR [28+esp], ecx                       ;
        mov       ecx, DWORD PTR [24+esp]                       ;167.3
        mov       esi, ecx                                      ;167.3
        shr       edx, 1                                        ;167.3
        and       esi, 1                                        ;167.3
        and       edx, 1                                        ;167.3
        mov       DWORD PTR [36+esp], esi                       ;167.3
        mov       esi, ecx                                      ;167.3
        shr       ebx, 2                                        ;167.3
        shl       edx, 7                                        ;167.3
        mov       DWORD PTR [16+esp], ebx                       ;167.3
        mov       DWORD PTR [56+esp], edx                       ;167.3
        shr       eax, 2                                        ;167.3
        mov       ebx, DWORD PTR [36+esp]                       ;167.3
        mov       edx, DWORD PTR [32+esp]                       ;167.3
        mov       DWORD PTR [52+esp], eax                       ;167.3
        shl       ebx, 7                                        ;167.3
        shr       edx, 1                                        ;167.3
        mov       eax, DWORD PTR [44+esp]                       ;167.3
        or        ebx, edx                                      ;167.3
        and       eax, 1                                        ;167.3
        shl       eax, 7                                        ;167.3
        mov       DWORD PTR [44+esp], eax                       ;167.3
        mov       eax, DWORD PTR [40+esp]                       ;167.3
        shl       eax, 7                                        ;167.3
        shr       ebx, 1                                        ;167.3
        or        eax, ebx                                      ;167.3
        movzx     eax, al                                       ;167.3
        shr       ecx, 2                                        ;167.3
        mov       DWORD PTR [24+esp], ecx                       ;167.3
        mov       ecx, DWORD PTR [48+esp]                       ;167.3
        shr       edi, 1                                        ;167.3
        shl       ecx, 7                                        ;167.3
        and       edi, 1                                        ;167.3
        shr       eax, 1                                        ;167.3
        or        ecx, eax                                      ;167.3
        shr       esi, 1                                        ;167.3
        shl       edi, 7                                        ;167.3
        and       esi, 1                                        ;167.3
        shr       ecx, 1                                        ;167.3
        or        edi, ecx                                      ;167.3
        shl       esi, 7                                        ;167.3
        shr       edi, 1                                        ;167.3
        or        esi, edi                                      ;167.3
        and       esi, 255                                      ;167.3
        shr       esi, 1                                        ;167.3
        mov       ecx, DWORD PTR [44+esp]                       ;167.3
        or        ecx, esi                                      ;167.3
        shr       ecx, 1                                        ;167.3
        mov       edx, DWORD PTR [56+esp]                       ;167.3
        or        edx, ecx                                      ;167.3
        mov       ecx, DWORD PTR [28+esp]                       ;167.3
        shr       DWORD PTR [20+esp], 2                         ;167.3
        mov       eax, DWORD PTR [52+esp]                       ;167.3
        mov       BYTE PTR [112+esp+ecx], dl                    ;167.3
        inc       ecx                                           ;167.3
        cmp       ecx, 16                                       ;167.3
        jb        .B4.2         ; Prob 91%                      ;167.3
                                ; LOE eax ecx
.B4.3:                          ; Preds .B4.2
        movdqu    xmm0, XMMWORD PTR [112+esp]                   ;170.9
        pxor      xmm4, xmm4                                    ;171.28
        pmovzxbw  xmm4, xmm0                                    ;171.28
        pxor      xmm6, xmm6                                    ;171.28
        psraw     xmm4, 4                                       ;171.28
        movdqa    xmm1, xmm0                                    ;171.28
        pmovsxwd  xmm6, xmm4                                    ;171.28
        pxor      xmm3, xmm3                                    ;171.28
        psrldq    xmm4, 8                                       ;171.28
        pxor      xmm5, xmm5                                    ;171.28
        psrldq    xmm1, 8                                       ;171.28
        pmovsxwd  xmm4, xmm4                                    ;171.28
        pmovzxbw  xmm3, xmm1                                    ;171.28
        pshufd    xmm7, xmm6, 57                                ;171.22
        psraw     xmm3, 4                                       ;171.28
        movd      esi, xmm4                                     ;171.28
        pshufd    xmm4, xmm4, 57                                ;171.28
        pshufd    xmm2, xmm7, 57                                ;171.22
        movd      edx, xmm7                                     ;171.22
        pshufd    xmm7, xmm4, 57                                ;171.28
        movd      DWORD PTR [16+esp], xmm4                      ;171.28
        pmovsxwd  xmm5, xmm3                                    ;171.28
        movd      eax, xmm6                                     ;171.22
        pshufd    xmm6, xmm2, 57                                ;171.22
        movd      DWORD PTR [28+esp], xmm5                      ;171.28
        movd      ecx, xmm2                                     ;171.22
        pshufd    xmm2, xmm7, 57                                ;171.28
        movd      DWORD PTR [24+esp], xmm2                      ;171.28
        pshufd    xmm2, xmm5, 57                                ;171.28
        pshufd    xmm4, xmm2, 57                                ;171.28
        pshufd    xmm5, xmm4, 57                                ;171.28
        psrldq    xmm3, 8                                       ;171.28
        movd      ebx, xmm6                                     ;171.22
        pxor      xmm6, xmm6                                    ;171.56
        movd      DWORD PTR [40+esp], xmm5                      ;171.28
        movdqu    xmm5, XMMWORD PTR [_2il0floatpacket.4]        ;171.56
        pmovsxwd  xmm3, xmm3                                    ;171.28
        pmovzxbd  xmm6, xmm0                                    ;171.56
        movd      DWORD PTR [32+esp], xmm2                      ;171.28
        pand      xmm6, xmm5                                    ;171.56
        pshufd    xmm2, xmm3, 57                                ;171.28
        movd      DWORD PTR [20+esp], xmm7                      ;171.28
        movd      DWORD PTR [44+esp], xmm3                      ;171.28
        pshufd    xmm3, xmm2, 57                                ;171.28
        pshufd    xmm7, xmm6, 57                                ;171.50
        movsx     edi, BYTE PTR [esp+eax]                       ;171.22
        movd      DWORD PTR [36+esp], xmm4                      ;171.28
        movd      DWORD PTR [52+esp], xmm3                      ;171.28
        pshufd    xmm4, xmm3, 57                                ;171.28
        pshufd    xmm3, xmm7, 57                                ;171.50
        movd      DWORD PTR [56+esp], xmm4                      ;171.28
        pshufd    xmm4, xmm3, 57                                ;171.50
        movd      DWORD PTR [72+esp], xmm4                      ;171.50
        movd      xmm4, edi                                     ;171.22
        pinsrb    xmm4, BYTE PTR [esp+edx], 1                   ;171.22
        movd      DWORD PTR [48+esp], xmm2                      ;171.28
        movdqa    xmm2, xmm0                                    ;171.56
        psrldq    xmm2, 4                                       ;171.56
        psrldq    xmm0, 12                                      ;171.56
        movd      DWORD PTR [64+esp], xmm7                      ;171.50
        movd      DWORD PTR [68+esp], xmm3                      ;171.50
        movd      eax, xmm6                                     ;171.50
        pinsrb    xmm4, BYTE PTR [esp+ecx], 2                   ;171.22
        pinsrb    xmm4, BYTE PTR [esp+ebx], 3                   ;171.22
        pinsrb    xmm4, BYTE PTR [esp+esi], 4                   ;171.22
        mov       edx, DWORD PTR [16+esp]                       ;171.22
        mov       ecx, DWORD PTR [20+esp]                       ;171.22
        mov       ebx, DWORD PTR [24+esp]                       ;171.22
        pinsrb    xmm4, BYTE PTR [esp+edx], 5                   ;171.22
        pinsrb    xmm4, BYTE PTR [esp+ecx], 6                   ;171.22
        pinsrb    xmm4, BYTE PTR [esp+ebx], 7                   ;171.22
        mov       esi, DWORD PTR [28+esp]                       ;171.22
        mov       edi, DWORD PTR [32+esp]                       ;171.22
        mov       edx, DWORD PTR [36+esp]                       ;171.22
        pinsrb    xmm4, BYTE PTR [esp+esi], 8                   ;171.22
        pinsrb    xmm4, BYTE PTR [esp+edi], 9                   ;171.22
        pinsrb    xmm4, BYTE PTR [esp+edx], 10                  ;171.22
        pmovzxbd  xmm2, xmm2                                    ;171.56
        pmovzxbd  xmm1, xmm1                                    ;171.56
        pand      xmm2, xmm5                                    ;171.56
        pmovzxbd  xmm0, xmm0                                    ;171.56
        pand      xmm1, xmm5                                    ;171.56
        pand      xmm0, xmm5                                    ;171.56
        pshufd    xmm5, xmm2, 57                                ;171.56
        mov       ecx, DWORD PTR [40+esp]                       ;171.22
        pshufd    xmm6, xmm5, 57                                ;171.56
        movd      DWORD PTR [76+esp], xmm2                      ;171.56
        pshufd    xmm2, xmm6, 57                                ;171.56
        movd      DWORD PTR [92+esp], xmm1                      ;171.56
        pshufd    xmm1, xmm1, 57                                ;171.56
        movd      DWORD PTR [88+esp], xmm2                      ;171.56
        pshufd    xmm2, xmm1, 57                                ;171.56
        movsx     eax, BYTE PTR [esp+eax]                       ;171.50
        pinsrb    xmm4, BYTE PTR [esp+ecx], 11                  ;171.22
        pshufd    xmm3, xmm2, 57                                ;171.56
        movd      DWORD PTR [104+esp], xmm3                     ;171.56
        movd      DWORD PTR [80+esp], xmm5                      ;171.56
        movd      DWORD PTR [84+esp], xmm6                      ;171.56
        movd      DWORD PTR [96+esp], xmm1                      ;171.56
        movd      DWORD PTR [100+esp], xmm2                     ;171.56
        movd      DWORD PTR [108+esp], xmm0                     ;171.56
        mov       ecx, DWORD PTR [64+esp]                       ;171.50
        mov       DWORD PTR [60+esp], eax                       ;171.50
        movd      xmm3, DWORD PTR [60+esp]                      ;171.50
        pinsrb    xmm3, BYTE PTR [esp+ecx], 1                   ;171.50
        pshufd    xmm0, xmm0, 57                                ;171.56
        pshufd    xmm1, xmm0, 57                                ;171.56
        pshufd    xmm2, xmm1, 57                                ;171.56
        movd      eax, xmm0                                     ;171.56
        mov       ebx, DWORD PTR [44+esp]                       ;171.22
        mov       esi, DWORD PTR [48+esp]                       ;171.22
        mov       edi, DWORD PTR [52+esp]                       ;171.22
        pinsrb    xmm4, BYTE PTR [esp+ebx], 12                  ;171.22
        mov       ebx, DWORD PTR [68+esp]                       ;171.50
        pinsrb    xmm4, BYTE PTR [esp+esi], 13                  ;171.22
        pinsrb    xmm3, BYTE PTR [esp+ebx], 2                   ;171.50
        pinsrb    xmm4, BYTE PTR [esp+edi], 14                  ;171.22
        mov       esi, DWORD PTR [72+esp]                       ;171.50
        mov       edi, DWORD PTR [76+esp]                       ;171.50
        mov       edx, DWORD PTR [56+esp]                       ;171.22
        pinsrb    xmm3, BYTE PTR [esp+esi], 3                   ;171.50
        pinsrb    xmm4, BYTE PTR [esp+edx], 15                  ;171.22
        pinsrb    xmm3, BYTE PTR [esp+edi], 4                   ;171.50
        psllw     xmm4, 4                                       ;171.45
        pand      xmm4, XMMWORD PTR [_2il0floatpacket.5]        ;171.45
        mov       edx, DWORD PTR [80+esp]                       ;171.50
        mov       ecx, DWORD PTR [84+esp]                       ;171.50
        mov       ebx, DWORD PTR [88+esp]                       ;171.50
        pinsrb    xmm3, BYTE PTR [esp+edx], 5                   ;171.50
        pinsrb    xmm3, BYTE PTR [esp+ecx], 6                   ;171.50
        pinsrb    xmm3, BYTE PTR [esp+ebx], 7                   ;171.50
        mov       esi, DWORD PTR [92+esp]                       ;171.50
        mov       edi, DWORD PTR [96+esp]                       ;171.50
        mov       edx, DWORD PTR [100+esp]                      ;171.50
        mov       ebx, DWORD PTR [108+esp]                      ;171.50
        pinsrb    xmm3, BYTE PTR [esp+esi], 8                   ;171.50
        pinsrb    xmm3, BYTE PTR [esp+edi], 9                   ;171.50
        pinsrb    xmm3, BYTE PTR [esp+edx], 10                  ;171.50
        mov       ecx, DWORD PTR [104+esp]                      ;171.50
        mov       edx, DWORD PTR [8+ebp]                        ;173.3
        pinsrb    xmm3, BYTE PTR [esp+ecx], 11                  ;171.50
        pinsrb    xmm3, BYTE PTR [esp+ebx], 12                  ;171.50
        xor       ebx, ebx                                      ;173.3
        pinsrb    xmm3, BYTE PTR [esp+eax], 13                  ;171.50
        xor       esi, esi                                      ;173.3
        movd      eax, xmm1                                     ;171.56
        mov       DWORD PTR [edx], ebx                          ;173.3
        pinsrb    xmm3, BYTE PTR [esp+eax], 14                  ;171.50
        movd      eax, xmm2                                     ;171.56
        mov       DWORD PTR [4+edx], ebx                        ;173.3
        pinsrb    xmm3, BYTE PTR [esp+eax], 15                  ;171.50
        por       xmm4, xmm3                                    ;171.50
        movdqu    XMMWORD PTR [112+esp], xmm4                   ;171.5
        mov       DWORD PTR [8+edx], ebx                        ;173.3
        mov       DWORD PTR [12+edx], ebx                       ;173.3
                                ; LOE edx ebx esi
.B4.4:                          ; Preds .B4.6 .B4.3
        mov       ecx, DWORD PTR [112+esp+ebx*4]                ;173.3
        mov       eax, esi                                      ;173.3
        mov       DWORD PTR [esp], ebx                          ;173.3
                                ; LOE eax edx ecx
.B4.5:                          ; Preds .B4.5 .B4.4
        mov       edi, eax                                      ;173.3
        mov       esi, ecx                                      ;173.3
        and       edi, 3                                        ;173.3
        and       esi, 1                                        ;173.3
        shl       esi, 31                                       ;173.3
        inc       eax                                           ;173.3
        shr       ecx, 1                                        ;173.3
        mov       ebx, DWORD PTR [edx+edi*4]                    ;173.3
        shr       ebx, 1                                        ;173.3
        or        esi, ebx                                      ;173.3
        mov       DWORD PTR [edx+edi*4], esi                    ;173.3
        cmp       eax, 32                                       ;173.3
        jb        .B4.5         ; Prob 82%                      ;173.3
                                ; LOE eax edx ecx
.B4.6:                          ; Preds .B4.5
        mov       ebx, DWORD PTR [esp]                          ;
        xor       esi, esi                                      ;
        mov       DWORD PTR [112+esp+ebx*4], ecx                ;173.3
        inc       ebx                                           ;173.3
        cmp       ebx, 4                                        ;173.3
        jb        .B4.4         ; Prob 91%                      ;173.3
                                ; LOE edx ebx esi
.B4.7:                          ; Preds .B4.6
        add       esp, 132                                      ;174.1
        pop       ebx                                           ;174.1
        pop       edi                                           ;174.1
        pop       esi                                           ;174.1
        mov       esp, ebp                                      ;174.1
        pop       ebp                                           ;174.1
        ret                                                     ;174.1
        ALIGN     16
                                ; LOE
; mark_end;
_sbox128 ENDP
;_sbox128	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _sbox128
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _serpent_gen_w
TXTST4:
; -- Begin  _serpent_gen_w
;_serpent_gen_w	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _serpent_gen_w
; mark_begin;
       ALIGN     16
	PUBLIC _serpent_gen_w
_serpent_gen_w	PROC NEAR 
; parameter 1: 4 + esp
; parameter 2: 8 + esp
.B5.1:                          ; Preds .B5.0
        mov       edx, DWORD PTR [4+esp]                        ;141.10
        mov       eax, DWORD PTR [edx]                          ;143.9
        xor       eax, DWORD PTR [12+edx]                       ;143.16
        xor       eax, DWORD PTR [20+edx]                       ;143.23
        xor       eax, DWORD PTR [28+edx]                       ;143.30
        xor       eax, -1640531527                              ;143.37
        xor       eax, DWORD PTR [8+esp]                        ;143.52
        rol       eax, 11                                       ;144.10
        ret                                                     ;144.10
        ALIGN     16
                                ; LOE
; mark_end;
_serpent_gen_w ENDP
;_serpent_gen_w	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _serpent_gen_w
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _serpent_lt
TXTST5:
; -- Begin  _serpent_lt
;_serpent_lt	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _serpent_lt
; mark_begin;
       ALIGN     16
	PUBLIC _serpent_lt
_serpent_lt	PROC NEAR 
; parameter 1: 16 + esp
; parameter 2: 20 + esp
.B6.1:                          ; Preds .B6.0
        push      esi                                           ;99.1
        push      edi                                           ;99.1
        push      ebp                                           ;99.1
        mov       esi, DWORD PTR [16+esp]                       ;98.6
        cmp       DWORD PTR [20+esp], 0                         ;108.13
        mov       edx, DWORD PTR [esi]                          ;103.6
        mov       ebp, DWORD PTR [4+esi]                        ;104.6
        mov       ecx, DWORD PTR [8+esi]                        ;105.6
        mov       eax, DWORD PTR [12+esi]                       ;106.6
        jne       .B6.3         ; Prob 50%                      ;108.13
                                ; LOE eax edx ecx ebx ebp esi
.B6.2:                          ; Preds .B6.1
        rol       edx, 13                                       ;109.10
        rol       ecx, 3                                        ;110.10
        mov       edi, edx                                      ;111.16
        xor       edi, ecx                                      ;111.16
        xor       ebp, edi                                      ;111.5
        rol       ebp, 1                                        ;113.10
        lea       edi, DWORD PTR [edx*8]                        ;112.23
        xor       edi, ecx                                      ;112.23
        xor       eax, edi                                      ;112.5
        mov       edi, ebp                                      ;115.16
        rol       eax, 7                                        ;114.10
        xor       edi, eax                                      ;115.16
        xor       edx, edi                                      ;115.5
        mov       edi, ebp                                      ;116.23
        shl       edi, 7                                        ;116.23
        xor       edi, eax                                      ;116.23
        xor       ecx, edi                                      ;116.5
        rol       edx, 5                                        ;117.10
        rol       ecx, 22                                       ;118.10
        jmp       .B6.4         ; Prob 100%                     ;118.10
                                ; LOE eax edx ecx ebx ebp esi
.B6.3:                          ; Preds .B6.1
        mov       edi, ebp                                      ;122.23
        shl       edi, 7                                        ;122.23
        rol       ecx, 10                                       ;120.10
        xor       edi, eax                                      ;122.23
        xor       ecx, edi                                      ;122.5
        mov       edi, ebp                                      ;123.16
        rol       edx, 27                                       ;121.10
        xor       edi, eax                                      ;123.16
        xor       edx, edi                                      ;123.5
        rol       eax, 25                                       ;124.10
        rol       ebp, 31                                       ;125.10
        lea       edi, DWORD PTR [edx*8]                        ;126.23
        xor       edi, ecx                                      ;126.23
        xor       eax, edi                                      ;126.5
        mov       edi, edx                                      ;127.16
        xor       edi, ecx                                      ;127.16
        rol       ecx, 29                                       ;128.10
        xor       ebp, edi                                      ;127.5
        rol       edx, 19                                       ;129.10
                                ; LOE eax edx ecx ebx ebp esi
.B6.4:                          ; Preds .B6.2 .B6.3
        mov       DWORD PTR [esi], edx                          ;132.3
        mov       DWORD PTR [4+esi], ebp                        ;133.3
        mov       DWORD PTR [8+esi], ecx                        ;134.3
        mov       DWORD PTR [12+esi], eax                       ;135.3
        pop       ebp                                           ;136.1
        pop       edi                                           ;136.1
        pop       esi                                           ;136.1
        ret                                                     ;136.1
        ALIGN     16
                                ; LOE
; mark_end;
_serpent_lt ENDP
;_serpent_lt	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _serpent_lt
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _serpent_fp
TXTST6:
; -- Begin  _serpent_fp
;_serpent_fp	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _serpent_fp
; mark_begin;
       ALIGN     16
	PUBLIC _serpent_fp
_serpent_fp	PROC NEAR 
; parameter 1: 20 + esp
; parameter 2: 24 + esp
.B7.1:                          ; Preds .B7.0
        push      esi                                           ;82.1
        push      edi                                           ;82.1
        push      ebx                                           ;82.1
        push      ebp                                           ;82.1
        xor       eax, eax                                      ;86.3
        mov       ecx, DWORD PTR [24+esp]                       ;81.6
        xor       edx, edx                                      ;88.3
        mov       ebx, DWORD PTR [20+esp]                       ;88.3
        mov       DWORD PTR [ecx], eax                          ;86.3
        mov       DWORD PTR [4+ecx], eax                        ;86.3
        mov       DWORD PTR [8+ecx], eax                        ;86.3
        mov       DWORD PTR [12+ecx], eax                       ;86.3
                                ; LOE eax edx ecx ebx
.B7.2:                          ; Preds .B7.4 .B7.1
        mov       ebp, eax                                      ;89.5
                                ; LOE edx ecx ebx ebp
.B7.3:                          ; Preds .B7.3 .B7.2
        mov       eax, DWORD PTR [ebx+edx*4]                    ;90.7
        mov       esi, eax                                      ;90.7
        shr       esi, 1                                        ;90.7
        and       eax, 1                                        ;90.7
        mov       DWORD PTR [ebx+edx*4], esi                    ;90.7
        mov       esi, ebp                                      ;91.7
        and       esi, 3                                        ;91.7
        inc       ebp                                           ;89.5
        shl       eax, 31                                       ;91.7
        mov       edi, DWORD PTR [ecx+esi*4]                    ;91.7
        shr       edi, 1                                        ;91.7
        or        eax, edi                                      ;91.7
        mov       DWORD PTR [ecx+esi*4], eax                    ;91.7
        cmp       ebp, 32                                       ;89.5
        jb        .B7.3         ; Prob 82%                      ;89.5
                                ; LOE edx ecx ebx ebp
.B7.4:                          ; Preds .B7.3
        inc       edx                                           ;88.3
        xor       eax, eax                                      ;
        cmp       edx, 4                                        ;88.3
        jb        .B7.2         ; Prob 91%                      ;88.3
                                ; LOE eax edx ecx ebx
.B7.5:                          ; Preds .B7.4
        pop       ebp                                           ;94.1
        pop       ebx                                           ;94.1
        pop       edi                                           ;94.1
        pop       esi                                           ;94.1
        ret                                                     ;94.1
        ALIGN     16
                                ; LOE
; mark_end;
_serpent_fp ENDP
;_serpent_fp	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _serpent_fp
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _serpent_ip
TXTST7:
; -- Begin  _serpent_ip
;_serpent_ip	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _serpent_ip
; mark_begin;
       ALIGN     16
	PUBLIC _serpent_ip
_serpent_ip	PROC NEAR 
; parameter 1: 16 + esp
; parameter 2: 20 + esp
.B8.1:                          ; Preds .B8.0
        push      esi                                           ;64.1
        push      edi                                           ;64.1
        push      ebx                                           ;64.1
        xor       eax, eax                                      ;68.3
        mov       edx, DWORD PTR [20+esp]                       ;63.6
        mov       ecx, DWORD PTR [16+esp]                       ;63.6
        mov       DWORD PTR [edx], eax                          ;68.3
        mov       DWORD PTR [4+edx], eax                        ;68.3
        mov       DWORD PTR [8+edx], eax                        ;68.3
        mov       DWORD PTR [12+edx], eax                       ;68.3
                                ; LOE eax edx ecx ebp
.B8.2:                          ; Preds .B8.2 .B8.1
        mov       ebx, DWORD PTR [ecx]                          ;72.7
        mov       esi, ebx                                      ;72.7
        shr       esi, 1                                        ;72.7
        and       ebx, 1                                        ;72.7
        mov       DWORD PTR [ecx], esi                          ;72.7
        movzx     edi, BYTE PTR [eax+edx]                       ;73.7
        shl       ebx, 7                                        ;73.7
        shr       edi, 1                                        ;73.7
        or        ebx, edi                                      ;73.7
        mov       BYTE PTR [eax+edx], bl                        ;73.7
        mov       ebx, DWORD PTR [4+ecx]                        ;72.7
        mov       esi, ebx                                      ;72.7
        shr       esi, 1                                        ;72.7
        and       ebx, 1                                        ;72.7
        mov       DWORD PTR [4+ecx], esi                        ;72.7
        movzx     edi, BYTE PTR [eax+edx]                       ;73.7
        shl       ebx, 7                                        ;73.7
        shr       edi, 1                                        ;73.7
        or        ebx, edi                                      ;73.7
        mov       BYTE PTR [eax+edx], bl                        ;73.7
        mov       ebx, DWORD PTR [8+ecx]                        ;72.7
        mov       esi, ebx                                      ;72.7
        shr       esi, 1                                        ;72.7
        and       ebx, 1                                        ;72.7
        mov       DWORD PTR [8+ecx], esi                        ;72.7
        movzx     edi, BYTE PTR [eax+edx]                       ;73.7
        shl       ebx, 7                                        ;73.7
        shr       edi, 1                                        ;73.7
        or        ebx, edi                                      ;73.7
        mov       BYTE PTR [eax+edx], bl                        ;73.7
        mov       ebx, DWORD PTR [12+ecx]                       ;72.7
        mov       esi, ebx                                      ;72.7
        shr       esi, 1                                        ;72.7
        and       ebx, 1                                        ;72.7
        mov       DWORD PTR [12+ecx], esi                       ;72.7
        movzx     edi, BYTE PTR [eax+edx]                       ;73.7
        shl       ebx, 7                                        ;73.7
        shr       edi, 1                                        ;73.7
        or        ebx, edi                                      ;73.7
        mov       BYTE PTR [eax+edx], bl                        ;73.7
        mov       ebx, DWORD PTR [ecx]                          ;72.7
        mov       esi, ebx                                      ;72.7
        shr       esi, 1                                        ;72.7
        and       ebx, 1                                        ;72.7
        mov       DWORD PTR [ecx], esi                          ;72.7
        movzx     edi, BYTE PTR [eax+edx]                       ;73.7
        shl       ebx, 7                                        ;73.7
        shr       edi, 1                                        ;73.7
        or        ebx, edi                                      ;73.7
        mov       BYTE PTR [eax+edx], bl                        ;73.7
        mov       ebx, DWORD PTR [4+ecx]                        ;72.7
        mov       esi, ebx                                      ;72.7
        shr       esi, 1                                        ;72.7
        and       ebx, 1                                        ;72.7
        mov       DWORD PTR [4+ecx], esi                        ;72.7
        movzx     edi, BYTE PTR [eax+edx]                       ;73.7
        shl       ebx, 7                                        ;73.7
        shr       edi, 1                                        ;73.7
        or        ebx, edi                                      ;73.7
        mov       BYTE PTR [eax+edx], bl                        ;73.7
        mov       ebx, DWORD PTR [8+ecx]                        ;72.7
        mov       esi, ebx                                      ;72.7
        shr       esi, 1                                        ;72.7
        and       ebx, 1                                        ;72.7
        mov       DWORD PTR [8+ecx], esi                        ;72.7
        movzx     edi, BYTE PTR [eax+edx]                       ;73.7
        shl       ebx, 7                                        ;73.7
        shr       edi, 1                                        ;73.7
        or        ebx, edi                                      ;73.7
        mov       BYTE PTR [eax+edx], bl                        ;73.7
        mov       ebx, DWORD PTR [12+ecx]                       ;72.7
        mov       esi, ebx                                      ;72.7
        shr       esi, 1                                        ;72.7
        and       ebx, 1                                        ;72.7
        mov       DWORD PTR [12+ecx], esi                       ;72.7
        movzx     edi, BYTE PTR [eax+edx]                       ;73.7
        shl       ebx, 7                                        ;73.7
        shr       edi, 1                                        ;73.7
        or        ebx, edi                                      ;73.7
        mov       BYTE PTR [eax+edx], bl                        ;73.7
        inc       eax                                           ;70.3
        cmp       eax, 16                                       ;70.3
        jb        .B8.2         ; Prob 91%                      ;70.3
                                ; LOE eax edx ecx ebp
.B8.3:                          ; Preds .B8.2
        pop       ebx                                           ;76.1
        pop       edi                                           ;76.1
        pop       esi                                           ;76.1
        ret                                                     ;76.1
        ALIGN     16
                                ; LOE
; mark_end;
_serpent_ip ENDP
;_serpent_ip	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _serpent_ip
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _blkclr
TXTST8:
; -- Begin  _blkclr
;_blkclr	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _blkclr
; mark_begin;
       ALIGN     16
	PUBLIC _blkclr
_blkclr	PROC NEAR 
; parameter 1: 4 + esp
.B9.1:                          ; Preds .B9.0
        xor       eax, eax                                      ;34.5
        mov       edx, DWORD PTR [4+esp]                        ;30.6
        mov       DWORD PTR [edx], eax                          ;34.5
        mov       DWORD PTR [4+edx], eax                        ;34.5
        mov       DWORD PTR [8+edx], eax                        ;34.5
        mov       DWORD PTR [12+edx], eax                       ;34.5
        ret                                                     ;36.1
        ALIGN     16
                                ; LOE
; mark_end;
_blkclr ENDP
;_blkclr	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _blkclr
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _blkcpy
TXTST9:
; -- Begin  _blkcpy
;_blkcpy	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _blkcpy
; mark_begin;
       ALIGN     16
	PUBLIC _blkcpy
_blkcpy	PROC NEAR 
; parameter 1: 4 + esp
; parameter 2: 8 + esp
.B10.1:                         ; Preds .B10.0
        mov       eax, DWORD PTR [8+esp]                        ;21.6
        mov       edx, DWORD PTR [4+esp]                        ;21.6
        mov       ecx, DWORD PTR [eax]                          ;25.19
        mov       DWORD PTR [edx], ecx                          ;25.5
        mov       ecx, DWORD PTR [4+eax]                        ;25.19
        mov       DWORD PTR [4+edx], ecx                        ;25.5
        mov       ecx, DWORD PTR [8+eax]                        ;25.19
        mov       DWORD PTR [8+edx], ecx                        ;25.5
        mov       eax, DWORD PTR [12+eax]                       ;25.19
        mov       DWORD PTR [12+edx], eax                       ;25.5
        ret                                                     ;27.1
        ALIGN     16
                                ; LOE
; mark_end;
_blkcpy ENDP
;_blkcpy	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _blkcpy
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _blkxor
TXTST10:
; -- Begin  _blkxor
;_blkxor	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  PARA PUBLIC FLAT  'CODE'
;	COMDAT _blkxor
; mark_begin;
       ALIGN     16
	PUBLIC _blkxor
_blkxor	PROC NEAR 
; parameter 1: 4 + esp
; parameter 2: 8 + esp
.B11.1:                         ; Preds .B11.0
        mov       eax, DWORD PTR [8+esp]                        ;12.6
        mov       edx, DWORD PTR [4+esp]                        ;12.6
        mov       ecx, DWORD PTR [eax]                          ;16.20
        xor       DWORD PTR [edx], ecx                          ;16.5
        mov       ecx, DWORD PTR [4+eax]                        ;16.20
        xor       DWORD PTR [4+edx], ecx                        ;16.5
        mov       ecx, DWORD PTR [8+eax]                        ;16.20
        xor       DWORD PTR [8+edx], ecx                        ;16.5
        mov       eax, DWORD PTR [12+eax]                       ;16.20
        xor       DWORD PTR [12+edx], eax                       ;16.5
        ret                                                     ;18.1
        ALIGN     16
                                ; LOE
; mark_end;
_blkxor ENDP
;_blkxor	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  _blkxor
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
	PUBLIC _sbox
_sbox	DB	56
	DB	241
	DB	166
	DB	91
	DB	237
	DB	66
	DB	112
	DB	156
	DB	252
	DB	39
	DB	144
	DB	90
	DB	27
	DB	232
	DB	109
	DB	52
	DB	134
	DB	121
	DB	60
	DB	175
	DB	209
	DB	228
	DB	11
	DB	82
	DB	15
	DB	184
	DB	201
	DB	99
	DB	209
	DB	36
	DB	167
	DB	94
	DB	31
	DB	131
	DB	192
	DB	182
	DB	37
	DB	74
	DB	158
	DB	125
	DB	245
	DB	43
	DB	74
	DB	156
	DB	3
	DB	232
	DB	214
	DB	113
	DB	114
	DB	197
	DB	132
	DB	107
	DB	233
	DB	31
	DB	211
	DB	160
	DB	29
	DB	240
	DB	232
	DB	43
	DB	116
	DB	202
	DB	147
	DB	86
	PUBLIC _sbox_inv
_sbox_inv	DB	211
	DB	176
	DB	166
	DB	92
	DB	30
	DB	71
	DB	249
	DB	130
	DB	88
	DB	46
	DB	246
	DB	195
	DB	180
	DB	121
	DB	29
	DB	160
	DB	201
	DB	244
	DB	190
	DB	18
	DB	3
	DB	109
	DB	88
	DB	167
	DB	9
	DB	167
	DB	190
	DB	109
	DB	53
	DB	194
	DB	72
	DB	241
	DB	80
	DB	131
	DB	169
	DB	126
	DB	44
	DB	182
	DB	79
	DB	209
	DB	143
	DB	41
	DB	65
	DB	222
	DB	182
	DB	83
	DB	124
	DB	160
	DB	250
	DB	29
	DB	83
	DB	96
	DB	73
	DB	231
	DB	44
	DB	139
	DB	48
	DB	109
	DB	158
	DB	248
	DB	92
	DB	183
	DB	161
	DB	66
_DATA	ENDS
_RDATA	SEGMENT  DWORD PUBLIC FLAT READ  'DATA'
_2il0floatpacket.4	DD	00000000fH,00000000fH,00000000fH,00000000fH
_2il0floatpacket.5	DD	0f0f0f0f0H,0f0f0f0f0H,0f0f0f0f0H,0f0f0f0f0H
_2il0floatpacket.12	DD	000ff00ffH,000ff00ffH,000ff00ffH,000ff00ffH
_2il0floatpacket.13	DD	00f0f0f0fH,00f0f0f0fH,00f0f0f0fH,00f0f0f0fH
_RDATA	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
	INCLUDELIB <libdecimal>
	END
