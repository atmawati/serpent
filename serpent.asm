; mark_description "Intel(R) C++ Compiler XE for applications running on IA-32, Version 15.0.0.108 Build 20140726";
; mark_description "-O1 -Os -Oy -Gr -c -Fa";
	.686P
 	.387
	OPTION DOTNAME
	ASSUME	CS:FLAT,DS:FLAT,SS:FLAT
;ident "-defaultlib:libcpmt"
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @blkxorx@8
TXTST0:
; -- Begin  @blkxorx@8
;@blkxorx@8	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @blkxorx@8
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

	PUBLIC @blkxorx@8
@blkxorx@8	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
.B1.1:                          ; Preds .B1.0
        push      esi                                           ;13.51
        mov       esi, ecx                                      ;13.51
        xor       ecx, ecx                                      ;16.8
                                ; LOE edx ecx ebx ebp esi edi
.B1.2:                          ; Preds .B1.2 .B1.1
        mov       eax, DWORD PTR [edx+ecx*4]                    ;17.20
        xor       DWORD PTR [esi+ecx*4], eax                    ;17.5
        inc       ecx                                           ;16.34
        movzx     ecx, cl                                       ;16.34
        cmp       ecx, 4                                        ;16.15
        jl        .B1.2         ; Prob 82%                      ;16.15
                                ; LOE edx ecx ebx ebp esi edi
.B1.3:                          ; Preds .B1.2
        pop       esi                                           ;19.1
        ret                                                     ;19.1
                                ; LOE
; mark_end;
@blkxorx@8 ENDP
;@blkxorx@8	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @blkxorx@8
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @blkcpyx@8
TXTST1:
; -- Begin  @blkcpyx@8
;@blkcpyx@8	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @blkcpyx@8
; mark_begin;

	PUBLIC @blkcpyx@8
@blkcpyx@8	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
.B2.1:                          ; Preds .B2.0
        push      esi                                           ;22.51
        mov       esi, ecx                                      ;22.51
        xor       ecx, ecx                                      ;25.8
                                ; LOE edx ecx ebx ebp esi edi
.B2.2:                          ; Preds .B2.2 .B2.1
        mov       eax, DWORD PTR [edx+ecx*4]                    ;26.19
        mov       DWORD PTR [esi+ecx*4], eax                    ;26.5
        inc       ecx                                           ;25.34
        movzx     ecx, cl                                       ;25.34
        cmp       ecx, 4                                        ;25.15
        jl        .B2.2         ; Prob 82%                      ;25.15
                                ; LOE edx ecx ebx ebp esi edi
.B2.3:                          ; Preds .B2.2
        pop       esi                                           ;28.1
        ret                                                     ;28.1
                                ; LOE
; mark_end;
@blkcpyx@8 ENDP
;@blkcpyx@8	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @blkcpyx@8
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @blkclrx@4
TXTST2:
; -- Begin  @blkclrx@4
;@blkclrx@4	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @blkclrx@4
; mark_begin;

	PUBLIC @blkclrx@4
@blkclrx@4	PROC NEAR 
; parameter 1: ecx
.B3.1:                          ; Preds .B3.0
        xor       eax, eax                                      ;34.8
                                ; LOE eax ecx ebx ebp esi edi
.B3.2:                          ; Preds .B3.2 .B3.1
        mov       DWORD PTR [ecx+eax*4], 0                      ;35.5
        inc       eax                                           ;34.34
        movzx     eax, al                                       ;34.34
        cmp       eax, 4                                        ;34.15
        jl        .B3.2         ; Prob 82%                      ;34.15
                                ; LOE eax ecx ebx ebp esi edi
.B3.3:                          ; Preds .B3.2
        ret                                                     ;37.1
                                ; LOE
; mark_end;
@blkclrx@4 ENDP
;@blkclrx@4	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @blkclrx@4
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_ipx@8
TXTST3:
; -- Begin  @serpent_ipx@8
;@serpent_ipx@8	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_ipx@8
; mark_begin;

	PUBLIC @serpent_ipx@8
@serpent_ipx@8	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
.B4.1:                          ; Preds .B4.0
        push      esi                                           ;62.1
        push      edi                                           ;62.1
        push      ebx                                           ;62.1
        push      ebp                                           ;62.1
        mov       ebp, edx                                      ;62.1
        mov       ebx, ecx                                      ;62.1
        call      @blkclr@4                                     ;66.3
                                ; LOE ebx ebp
.B4.2:                          ; Preds .B4.1
        xor       esi, esi                                      ;68.8
                                ; LOE ebx ebp esi
.B4.3:                          ; Preds .B4.5 .B4.2
        xor       edx, edx                                      ;69.10
                                ; LOE edx ebx ebp esi
.B4.4:                          ; Preds .B4.4 .B4.3
        mov       ecx, edx                                      ;70.22
        inc       edx                                           ;69.20
        and       ecx, 3                                        ;70.22
        movzx     edx, dl                                       ;69.20
        mov       eax, DWORD PTR [ebp+ecx*4]                    ;70.12
        mov       edi, eax                                      ;71.7
        shr       edi, 1                                        ;71.7
        mov       DWORD PTR [ebp+ecx*4], edi                    ;71.7
        movzx     edi, BYTE PTR [esi+ebx]                       ;72.33
        shl       eax, 7                                        ;72.27
        shr       edi, 1                                        ;72.47
        or        eax, edi                                      ;72.47
        mov       BYTE PTR [esi+ebx], al                        ;72.7
        cmp       edx, 8                                        ;69.17
        jl        .B4.4         ; Prob 82%                      ;69.17
                                ; LOE edx ebx ebp esi
.B4.5:                          ; Preds .B4.4
        inc       esi                                           ;68.19
        and       esi, 255                                      ;68.19
        cmp       esi, 16                                       ;68.15
        jl        .B4.3         ; Prob 82%                      ;68.15
                                ; LOE ebx ebp esi
.B4.6:                          ; Preds .B4.5
        pop       ebp                                           ;75.1
        pop       ebx                                           ;75.1
        pop       edi                                           ;75.1
        pop       esi                                           ;75.1
        ret                                                     ;75.1
                                ; LOE
; mark_end;
@serpent_ipx@8 ENDP
;@serpent_ipx@8	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @serpent_ipx@8
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_fpx@8
TXTST4:
; -- Begin  @serpent_fpx@8
;@serpent_fpx@8	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_fpx@8
; mark_begin;

	PUBLIC @serpent_fpx@8
@serpent_fpx@8	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
.B5.1:                          ; Preds .B5.0
        push      esi                                           ;78.1
        push      edi                                           ;78.1
        push      ebx                                           ;78.1
        push      ebp                                           ;78.1
        mov       ebp, edx                                      ;78.1
        mov       ebx, ecx                                      ;78.1
        call      @blkclr@4                                     ;82.3
                                ; LOE ebx ebp
.B5.2:                          ; Preds .B5.1
        xor       edx, edx                                      ;84.8
                                ; LOE edx ebx ebp
.B5.3:                          ; Preds .B5.5 .B5.2
        xor       eax, eax                                      ;85.10
                                ; LOE eax edx ebx ebp
.B5.4:                          ; Preds .B5.4 .B5.3
        mov       ecx, eax                                      ;88.48
        inc       eax                                           ;85.21
        and       ecx, 3                                        ;88.48
        mov       esi, DWORD PTR [ebp+edx*4]                    ;86.12
        mov       edi, esi                                      ;87.7
        shr       edi, 1                                        ;87.7
        mov       DWORD PTR [ebp+edx*4], edi                    ;87.7
        mov       edi, DWORD PTR [ebx+ecx*4]                    ;88.37
        shl       esi, 31                                       ;88.30
        shr       edi, 1                                        ;88.54
        movzx     eax, al                                       ;85.21
        or        esi, edi                                      ;88.54
        mov       DWORD PTR [ebx+ecx*4], esi                    ;88.7
        cmp       eax, 32                                       ;85.17
        jl        .B5.4         ; Prob 82%                      ;85.17
                                ; LOE eax edx ebx ebp
.B5.5:                          ; Preds .B5.4
        inc       edx                                           ;84.18
        movzx     edx, dl                                       ;84.18
        cmp       edx, 4                                        ;84.15
        jl        .B5.3         ; Prob 82%                      ;84.15
                                ; LOE edx ebx ebp
.B5.6:                          ; Preds .B5.5
        pop       ebp                                           ;91.1
        pop       ebx                                           ;91.1
        pop       edi                                           ;91.1
        pop       esi                                           ;91.1
        ret                                                     ;91.1
                                ; LOE
; mark_end;
@serpent_fpx@8 ENDP
;@serpent_fpx@8	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @serpent_fpx@8
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_ltx@8
TXTST5:
; -- Begin  @serpent_ltx@8
;@serpent_ltx@8	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_ltx@8
; mark_begin;

	PUBLIC @serpent_ltx@8
@serpent_ltx@8	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
.B6.1:                          ; Preds .B6.0
        push      esi                                           ;96.1
        push      ebx                                           ;96.1
        push      ebp                                           ;96.1
        mov       esi, ecx                                      ;96.1
        test      edx, edx                                      ;105.13
        mov       ecx, DWORD PTR [esi]                          ;100.6
        mov       eax, DWORD PTR [4+esi]                        ;101.6
        mov       ebx, DWORD PTR [8+esi]                        ;102.6
        mov       ebp, DWORD PTR [12+esi]                       ;103.6
        jne       .B6.3         ; Prob 50%                      ;105.13
                                ; LOE eax ecx ebx ebp esi edi
.B6.2:                          ; Preds .B6.1
        rol       ecx, 13                                       ;106.10
        rol       ebx, 3                                        ;107.10
        mov       edx, ecx                                      ;108.16
        xor       edx, ebx                                      ;108.16
        xor       eax, edx                                      ;108.5
        rol       eax, 1                                        ;110.10
        lea       edx, DWORD PTR [ecx*8]                        ;109.23
        xor       edx, ebx                                      ;109.23
        xor       ebp, edx                                      ;109.5
        mov       edx, eax                                      ;112.16
        rol       ebp, 7                                        ;111.10
        xor       edx, ebp                                      ;112.16
        xor       ecx, edx                                      ;112.5
        mov       edx, eax                                      ;113.23
        shl       edx, 7                                        ;113.23
        xor       edx, ebp                                      ;113.23
        xor       ebx, edx                                      ;113.5
        rol       ecx, 5                                        ;114.10
        rol       ebx, 22                                       ;115.10
        jmp       .B6.4         ; Prob 100%                     ;115.10
                                ; LOE eax ecx ebx ebp esi edi
.B6.3:                          ; Preds .B6.1
        mov       edx, eax                                      ;119.23
        shl       edx, 7                                        ;119.23
        rol       ebx, 10                                       ;117.10
        xor       edx, ebp                                      ;119.23
        xor       ebx, edx                                      ;119.5
        mov       edx, eax                                      ;120.16
        rol       ecx, 27                                       ;118.10
        xor       edx, ebp                                      ;120.16
        xor       ecx, edx                                      ;120.5
        rol       ebp, 25                                       ;121.10
        rol       eax, 31                                       ;122.10
        lea       edx, DWORD PTR [ecx*8]                        ;123.23
        xor       edx, ebx                                      ;123.23
        xor       ebp, edx                                      ;123.5
        mov       edx, ecx                                      ;124.16
        xor       edx, ebx                                      ;124.16
        rol       ebx, 29                                       ;125.10
        xor       eax, edx                                      ;124.5
        rol       ecx, 19                                       ;126.10
                                ; LOE eax ecx ebx ebp esi edi
.B6.4:                          ; Preds .B6.2 .B6.3
        mov       DWORD PTR [esi], ecx                          ;129.3
        mov       DWORD PTR [4+esi], eax                        ;130.3
        mov       DWORD PTR [8+esi], ebx                        ;131.3
        mov       DWORD PTR [12+esi], ebp                       ;132.3
                                ; LOE
.B6.7:                          ; Preds .B6.4
        pop       ebp                                           ;133.1
        pop       ebx                                           ;133.1
        pop       esi                                           ;133.1
        ret                                                     ;133.1
                                ; LOE
; mark_end;
@serpent_ltx@8 ENDP
;@serpent_ltx@8	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @serpent_ltx@8
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_gen_wx@8
TXTST6:
; -- Begin  @serpent_gen_wx@8
;@serpent_gen_wx@8	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_gen_wx@8
; mark_begin;

	PUBLIC @serpent_gen_wx@8
@serpent_gen_wx@8	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
.B7.1:                          ; Preds .B7.0
        mov       eax, DWORD PTR [ecx]                          ;140.9
        xor       eax, DWORD PTR [12+ecx]                       ;140.16
        xor       eax, DWORD PTR [20+ecx]                       ;140.23
        xor       eax, DWORD PTR [28+ecx]                       ;140.30
        xor       eax, -1640531527                              ;140.37
        xor       eax, edx                                      ;140.52
        rol       eax, 11                                       ;141.10
                                ; LOE
.B7.4:                          ; Preds .B7.1
        ret                                                     ;141.10
                                ; LOE
; mark_end;
@serpent_gen_wx@8 ENDP
;@serpent_gen_wx@8	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @serpent_gen_wx@8
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @sbox128@12
TXTST7:
; -- Begin  @sbox128@12
;@sbox128@12	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @sbox128@12
; mark_begin;

	PUBLIC @sbox128@12
@sbox128@12	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
; parameter 3: 44 + esp
.B8.1:                          ; Preds .B8.0
        push      edi                                           ;145.1
        push      ebx                                           ;145.1
        sub       esp, 32                                       ;145.1
        and       edx, 7                                        ;150.3
        cmp       DWORD PTR [44+esp], 0                         ;155.5
        mov       ebx, ecx                                      ;145.1
        lea       ecx, DWORD PTR [_sbox+edx*8]                  ;153.20
        lea       eax, DWORD PTR [_sbox_inv+edx*8]              ;155.20
        je        L9            ; Prob 50%                      ;155.5
        mov       ecx, eax                                      ;155.5
L9:                                                             ;
        xor       edi, edi                                      ;155.5
                                ; LOE ecx ebx ebp esi edi
.B8.2:                          ; Preds .B8.2 .B8.1
        mov       eax, edi                                      ;159.15
        shr       eax, 1                                        ;159.15
        mov       dl, BYTE PTR [ecx+eax]                        ;159.9
        mov       al, dl                                        ;160.18
        shr       al, 4                                         ;160.18
        and       dl, 15                                        ;161.18
        mov       BYTE PTR [esp+edi], al                        ;160.5
        mov       BYTE PTR [1+esp+edi], dl                      ;161.5
        add       edi, 2                                        ;158.19
        and       edi, 255                                      ;158.19
        cmp       edi, 16                                       ;158.15
        jl        .B8.2         ; Prob 82%                      ;158.15
                                ; LOE ecx ebx ebp esi edi
.B8.3:                          ; Preds .B8.2
        mov       edx, ebx                                      ;164.3
        lea       ecx, DWORD PTR [16+esp]                       ;164.3
        call      @serpent_ip@8                                 ;164.3
                                ; LOE ebx ebp esi
.B8.4:                          ; Preds .B8.3
        xor       ecx, ecx                                      ;166.8
                                ; LOE ecx ebx ebp esi
.B8.5:                          ; Preds .B8.5 .B8.4
        movzx     eax, BYTE PTR [16+esp+ecx]                    ;167.9
        mov       edi, eax                                      ;168.28
        shr       edi, 4                                        ;168.28
        and       eax, 15                                       ;168.56
        mov       dl, BYTE PTR [esp+edi]                        ;168.22
        shl       dl, 4                                         ;168.45
        or        dl, BYTE PTR [esp+eax]                        ;168.50
        mov       BYTE PTR [16+esp+ecx], dl                     ;168.5
        inc       ecx                                           ;166.32
        movzx     ecx, cl                                       ;166.32
        cmp       ecx, 16                                       ;166.15
        jl        .B8.5         ; Prob 82%                      ;166.15
                                ; LOE ecx ebx ebp esi
.B8.6:                          ; Preds .B8.5
        mov       ecx, ebx                                      ;170.3
        lea       edx, DWORD PTR [16+esp]                       ;170.3
        call      @serpent_fp@8                                 ;170.3
                                ; LOE ebp esi
.B8.7:                          ; Preds .B8.6
        add       esp, 32                                       ;171.1
        pop       ebx                                           ;171.1
        pop       edi                                           ;171.1
        ret       4                                             ;171.1
                                ; LOE
; mark_end;
@sbox128@12 ENDP
;@sbox128@12	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @sbox128@12
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_setkey@12
TXTST8:
; -- Begin  @serpent_setkey@12
;@serpent_setkey@12	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_setkey@12
; mark_begin;

	PUBLIC @serpent_setkey@12
@serpent_setkey@12	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
; parameter 3: 60 + esp
.B9.1:                          ; Preds .B9.0
        push      esi                                           ;174.1
        push      edi                                           ;174.1
        push      ebx                                           ;174.1
        push      ebp                                           ;174.1
        sub       esp, 40                                       ;174.1
        xor       eax, eax                                      ;182.8
        mov       DWORD PTR [36+esp], ecx                       ;174.1
                                ; LOE eax edx
.B9.2:                          ; Preds .B9.2 .B9.1
        mov       BYTE PTR [esp+eax], 0                         ;183.5
        inc       eax                                           ;182.29
        movzx     eax, al                                       ;182.29
        cmp       eax, 32                                       ;182.15
        jb        .B9.2         ; Prob 82%                      ;182.15
                                ; LOE eax edx
.B9.3:                          ; Preds .B9.2
        mov       ebx, DWORD PTR [60+esp]                       ;173.6
        push      32                                            ;188.3
        pop       eax                                           ;188.3
        cmp       ebx, 32                                       ;188.3
        lea       ecx, DWORD PTR [esp]                          ;188.3
        cmovbe    eax, ebx                                      ;188.3
        movzx     eax, al                                       ;188.3
        push      eax                                           ;188.3
        push      edx                                           ;188.3
        push      ecx                                           ;188.3
        call      _memcpy                                       ;188.3
                                ; LOE ebx
.B9.17:                         ; Preds .B9.3
        add       esp, 12                                       ;188.3
                                ; LOE ebx
.B9.4:                          ; Preds .B9.17
        cmp       ebx, 32                                       ;190.15
        jae       .B9.6         ; Prob 50%                      ;190.15
                                ; LOE ebx
.B9.5:                          ; Preds .B9.4
        or        BYTE PTR [esp+ebx], 1                         ;191.5
                                ; LOE
.B9.6:                          ; Preds .B9.4 .B9.5
        mov       DWORD PTR [32+esp], 0                         ;194.8
                                ; LOE
.B9.7:                          ; Preds .B9.10 .B9.6
        mov       ebx, DWORD PTR [32+esp]                       ;196.14
        xor       ebp, ebp                                      ;195.10
        shl       ebx, 4                                        ;196.14
        add       ebx, DWORD PTR [36+esp]                       ;196.7
                                ; LOE ebx ebp
.B9.8:                          ; Preds .B9.9 .B9.7
        mov       eax, DWORD PTR [32+esp]                       ;196.26
        lea       ecx, DWORD PTR [esp]                          ;196.26
        lea       edx, DWORD PTR [ebp+eax*4]                    ;196.26
        call      @serpent_gen_wx@8                             ;196.26
                                ; LOE eax ebx ebp
.B9.18:                         ; Preds .B9.8
        push      7                                             ;197.7
        pop       ecx                                           ;197.7
        lea       edi, DWORD PTR [esp]                          ;197.7
        mov       DWORD PTR [ebx+ebp*4], eax                    ;196.7
        lea       esi, DWORD PTR [4+edi]                        ;197.7
        rep                                                     ;197.7
        movs                                                    ;197.7
                                ; LOE ebx ebp
.B9.9:                          ; Preds .B9.18
        mov       eax, DWORD PTR [ebx+ebp*4]                    ;198.21
        inc       ebp                                           ;195.20
        and       ebp, 255                                      ;195.20
        mov       DWORD PTR [28+esp], eax                       ;198.7
        cmp       ebp, 4                                        ;195.17
        jl        .B9.8         ; Prob 82%                      ;195.17
                                ; LOE ebx ebp
.B9.10:                         ; Preds .B9.9
        mov       eax, DWORD PTR [32+esp]                       ;194.32
        inc       eax                                           ;194.32
        movzx     eax, al                                       ;194.32
        mov       DWORD PTR [32+esp], eax                       ;194.32
        cmp       eax, 32                                       ;194.16
        jle       .B9.7         ; Prob 82%                      ;194.16
                                ; LOE
.B9.11:                         ; Preds .B9.10
        xor       ebx, ebx                                      ;201.8
                                ; LOE ebx
.B9.12:                         ; Preds .B9.13 .B9.11
        mov       ecx, ebx                                      ;202.5
        mov       edx, ebx                                      ;202.5
        shl       ecx, 4                                        ;202.5
        neg       edx                                           ;202.5
        add       ecx, DWORD PTR [36+esp]                       ;202.5
        add       edx, 3                                        ;202.5
        push      0                                             ;202.5
        call      @sbox128@12                                   ;202.5
                                ; LOE ebx
.B9.13:                         ; Preds .B9.12
        inc       ebx                                           ;201.32
        movzx     ebx, bl                                       ;201.32
        cmp       ebx, 32                                       ;201.16
        jle       .B9.12        ; Prob 82%                      ;201.16
                                ; LOE ebx
.B9.14:                         ; Preds .B9.13
        add       esp, 40                                       ;204.1
        pop       ebp                                           ;204.1
        pop       ebx                                           ;204.1
        pop       edi                                           ;204.1
        pop       esi                                           ;204.1
        ret       4                                             ;204.1
                                ; LOE
; mark_end;
@serpent_setkey@12 ENDP
;@serpent_setkey@12	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @serpent_setkey@12
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_encx@12
TXTST9:
; -- Begin  @serpent_encx@12
;@serpent_encx@12	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_encx@12
; mark_begin;

	PUBLIC @serpent_encx@12
@serpent_encx@12	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
; parameter 3: 20 + esp
.B10.1:                         ; Preds .B10.0
        push      esi                                           ;207.1
        push      edi                                           ;207.1
        push      ebx                                           ;207.1
        push      ebp                                           ;207.1
        mov       edi, ecx                                      ;207.1
        call      @blkcpy@8                                     ;213.3
                                ; LOE edi
.B10.2:                         ; Preds .B10.1
        mov       esi, DWORD PTR [20+esp]                       ;206.6
        xor       ebp, ebp                                      ;215.8
        lea       ebx, DWORD PTR [512+esi]                      ;223.21
                                ; LOE ebx ebp esi edi
.B10.3:                         ; Preds .B10.8 .B10.2
        mov       edx, ebp                                      ;217.5
        mov       ecx, edi                                      ;217.5
        shl       edx, 4                                        ;217.5
        add       edx, esi                                      ;217.5
        call      @blkxor@8                                     ;217.5
                                ; LOE ebx ebp esi edi
.B10.4:                         ; Preds .B10.3
        mov       ecx, edi                                      ;220.5
        mov       edx, ebp                                      ;220.5
        push      0                                             ;220.5
        call      @sbox128@12                                   ;220.5
                                ; LOE ebx ebp esi edi
.B10.5:                         ; Preds .B10.4
        cmp       ebp, 31                                       ;222.12
        jne       .B10.7        ; Prob 84%                      ;222.12
                                ; LOE ebx ebp esi edi
.B10.6:                         ; Preds .B10.5
        mov       ecx, edi                                      ;223.7
        mov       edx, ebx                                      ;223.7
        call      @blkxor@8                                     ;223.7
        jmp       .B10.8        ; Prob 100%                     ;223.7
                                ; LOE ebx ebp esi edi
.B10.7:                         ; Preds .B10.5
        mov       ecx, edi                                      ;226.7
        xor       edx, edx                                      ;226.7
        call      @serpent_lt@8                                 ;226.7
                                ; LOE ebx ebp esi edi
.B10.8:                         ; Preds .B10.7 .B10.6
        inc       ebp                                           ;215.32
        and       ebp, 255                                      ;215.32
        cmp       ebp, 32                                       ;215.16
        jle       .B10.3        ; Prob 82%                      ;215.16
                                ; LOE ebx ebp esi edi
.B10.9:                         ; Preds .B10.8
        pop       ebp                                           ;229.1
        pop       ebx                                           ;229.1
        pop       edi                                           ;229.1
        pop       esi                                           ;229.1
        ret       4                                             ;229.1
                                ; LOE
; mark_end;
@serpent_encx@12 ENDP
;@serpent_encx@12	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @serpent_encx@12
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_decx@12
TXTST10:
; -- Begin  @serpent_decx@12
;@serpent_decx@12	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_decx@12
; mark_begin;

	PUBLIC @serpent_decx@12
@serpent_decx@12	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
; parameter 3: 20 + esp
.B11.1:                         ; Preds .B11.0
        push      esi                                           ;232.1
        push      edi                                           ;232.1
        push      ebx                                           ;232.1
        push      ebp                                           ;232.1
        mov       ebx, ecx                                      ;232.1
        call      @blkcpy@8                                     ;238.3
                                ; LOE ebx
.B11.2:                         ; Preds .B11.1
        mov       edi, DWORD PTR [20+esp]                       ;231.6
        push      32                                            ;240.8
        pop       esi                                           ;240.8
                                ; LOE ebx esi edi
.B11.3:                         ; Preds .B11.9 .B11.2
        cmp       esi, 32                                       ;241.12
        jne       .B11.5        ; Prob 84%                      ;241.12
                                ; LOE ebx esi edi
.B11.4:                         ; Preds .B11.3
        mov       ebp, esi                                      ;243.28
        mov       ecx, ebx                                      ;243.7
        shl       ebp, 4                                        ;243.28
        add       ebp, edi                                      ;243.21
        mov       edx, ebp                                      ;243.7
        call      @blkxor@8                                     ;243.7
        jmp       .B11.7        ; Prob 100%                     ;243.7
                                ; LOE ebx ebp esi edi
.B11.5:                         ; Preds .B11.3
        mov       ecx, ebx                                      ;245.7
        push      1                                             ;245.7
        pop       edx                                           ;245.7
        call      @serpent_lt@8                                 ;245.7
                                ; LOE ebx esi edi
.B11.6:                         ; Preds .B11.5
        mov       ebp, esi                                      ;250.28
        shl       ebp, 4                                        ;250.28
        add       ebp, edi                                      ;250.19
                                ; LOE ebx ebp esi edi
.B11.7:                         ; Preds .B11.4 .B11.6
        dec       esi                                           ;248.21
        mov       ecx, ebx                                      ;248.5
        mov       edx, esi                                      ;248.5
        push      1                                             ;248.5
        call      @sbox128@12                                   ;248.5
                                ; LOE ebx ebp esi edi
.B11.8:                         ; Preds .B11.7
        add       ebp, -16                                      ;250.5
        mov       ecx, ebx                                      ;250.5
        mov       edx, ebp                                      ;250.5
        call      @blkxor@8                                     ;250.5
                                ; LOE ebx esi edi
.B11.9:                         ; Preds .B11.8
        test      esi, esi                                      ;240.28
        jg        .B11.3        ; Prob 82%                      ;240.28
                                ; LOE ebx esi edi
.B11.10:                        ; Preds .B11.9
        pop       ebp                                           ;252.1
        pop       ebx                                           ;252.1
        pop       edi                                           ;252.1
        pop       esi                                           ;252.1
        ret       4                                             ;252.1
                                ; LOE
; mark_end;
@serpent_decx@12 ENDP
;@serpent_decx@12	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @serpent_decx@12
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
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
EXTRN	@serpent_lt@8:PROC
EXTRN	@blkxor@8:PROC
EXTRN	@blkcpy@8:PROC
EXTRN	@serpent_fp@8:PROC
EXTRN	@serpent_ip@8:PROC
EXTRN	@blkclr@4:PROC
EXTRN	_memcpy:PROC
	INCLUDELIB <libmmt>
	INCLUDELIB <LIBCMT>
	INCLUDELIB <libirc>
	INCLUDELIB <svml_dispmt>
	INCLUDELIB <OLDNAMES>
	INCLUDELIB <libdecimal>
	END
