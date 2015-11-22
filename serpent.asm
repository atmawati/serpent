; mark_description "Intel(R) C++ Compiler XE for applications running on IA-32, Version 15.0.0.108 Build 20140726";
; mark_description "-O1 -Os -Fa -c -Oy -Gr";
	.686P
 	.387
	OPTION DOTNAME
	ASSUME	CS:FLAT,DS:FLAT,SS:FLAT
;ident "-defaultlib:libcpmt"
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @blkxor@8
TXTST0:
; -- Begin  @blkxor@8
;@blkxor@8	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @blkxor@8
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

	PUBLIC @blkxor@8
@blkxor@8	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
.B1.1:                          ; Preds .B1.0
        push      esi                                           ;13.50
        mov       esi, ecx                                      ;13.50
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
@blkxor@8 ENDP
;@blkxor@8	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @blkxor@8
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @blkcpy@8
TXTST1:
; -- Begin  @blkcpy@8
;@blkcpy@8	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @blkcpy@8
; mark_begin;

	PUBLIC @blkcpy@8
@blkcpy@8	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
.B2.1:                          ; Preds .B2.0
        push      esi                                           ;22.50
        mov       esi, ecx                                      ;22.50
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
@blkcpy@8 ENDP
;@blkcpy@8	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @blkcpy@8
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @blkclr@4
TXTST2:
; -- Begin  @blkclr@4
;@blkclr@4	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @blkclr@4
; mark_begin;

	PUBLIC @blkclr@4
@blkclr@4	PROC NEAR 
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
@blkclr@4 ENDP
;@blkclr@4	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @blkclr@4
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_ip@8
TXTST3:
; -- Begin  @serpent_ip@8
;@serpent_ip@8	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_ip@8
; mark_begin;

	PUBLIC @serpent_ip@8
@serpent_ip@8	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
.B4.1:                          ; Preds .B4.0
        push      esi                                           ;62.1
        push      edi                                           ;62.1
        push      ebx                                           ;62.1
        push      ebp                                           ;62.1
        mov       ebp, edx                                      ;62.1
        mov       ebx, ecx                                      ;62.1
        mov       ecx, ebp                                      ;66.3
        call      @blkclr@4                                     ;66.3
                                ; LOE ebx ebp
.B4.2:                          ; Preds .B4.1
        xor       esi, esi                                      ;68.8
                                ; LOE ebx ebp esi
.B4.3:                          ; Preds .B4.5 .B4.2
        xor       edx, edx                                      ;69.10
                                ; LOE edx ebx ebp esi
.B4.4:                          ; Preds .B4.4 .B4.3
        mov       ecx, edx                                      ;71.22
        inc       edx                                           ;69.20
        and       ecx, 3                                        ;71.22
        movzx     edx, dl                                       ;69.20
        mov       eax, DWORD PTR [ebx+ecx*4]                    ;71.12
        mov       edi, eax                                      ;72.7
        shr       edi, 1                                        ;72.7
        and       eax, 1                                        ;71.27
        mov       DWORD PTR [ebx+ecx*4], edi                    ;72.7
        movzx     edi, BYTE PTR [esi+ebp]                       ;74.42
        shl       eax, 7                                        ;74.7
        shr       edi, 1                                        ;74.56
        or        eax, edi                                      ;74.56
        mov       BYTE PTR [esi+ebp], al                        ;74.7
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
        pop       ebp                                           ;77.1
        pop       ebx                                           ;77.1
        pop       edi                                           ;77.1
        pop       esi                                           ;77.1
        ret                                                     ;77.1
                                ; LOE
; mark_end;
@serpent_ip@8 ENDP
;@serpent_ip@8	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @serpent_ip@8
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_fp@8
TXTST4:
; -- Begin  @serpent_fp@8
;@serpent_fp@8	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_fp@8
; mark_begin;

	PUBLIC @serpent_fp@8
@serpent_fp@8	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
.B5.1:                          ; Preds .B5.0
        push      esi                                           ;80.1
        push      edi                                           ;80.1
        push      ebx                                           ;80.1
        push      ebp                                           ;80.1
        mov       ebp, edx                                      ;80.1
        mov       ebx, ecx                                      ;80.1
        mov       ecx, ebp                                      ;84.3
        call      @blkclr@4                                     ;84.3
                                ; LOE ebx ebp
.B5.2:                          ; Preds .B5.1
        xor       edx, edx                                      ;86.8
                                ; LOE edx ebx ebp
.B5.3:                          ; Preds .B5.5 .B5.2
        xor       eax, eax                                      ;87.10
                                ; LOE eax edx ebx ebp
.B5.4:                          ; Preds .B5.4 .B5.3
        mov       ecx, eax                                      ;90.64
        inc       eax                                           ;87.21
        and       ecx, 3                                        ;90.64
        mov       esi, DWORD PTR [ebx+edx*4]                    ;88.12
        mov       edi, esi                                      ;89.7
        shr       edi, 1                                        ;89.7
        and       esi, 1                                        ;88.25
        mov       DWORD PTR [ebx+edx*4], edi                    ;89.7
        mov       edi, DWORD PTR [ebp+ecx*4]                    ;90.53
        shl       esi, 31                                       ;90.7
        shr       edi, 1                                        ;90.70
        movzx     eax, al                                       ;87.21
        or        esi, edi                                      ;90.70
        mov       DWORD PTR [ebp+ecx*4], esi                    ;90.7
        cmp       eax, 32                                       ;87.17
        jl        .B5.4         ; Prob 82%                      ;87.17
                                ; LOE eax edx ebx ebp
.B5.5:                          ; Preds .B5.4
        inc       edx                                           ;86.18
        movzx     edx, dl                                       ;86.18
        cmp       edx, 4                                        ;86.15
        jl        .B5.3         ; Prob 82%                      ;86.15
                                ; LOE edx ebx ebp
.B5.6:                          ; Preds .B5.5
        pop       ebp                                           ;93.1
        pop       ebx                                           ;93.1
        pop       edi                                           ;93.1
        pop       esi                                           ;93.1
        ret                                                     ;93.1
                                ; LOE
; mark_end;
@serpent_fp@8 ENDP
;@serpent_fp@8	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @serpent_fp@8
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_lt@8
TXTST5:
; -- Begin  @serpent_lt@8
;@serpent_lt@8	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_lt@8
; mark_begin;

	PUBLIC @serpent_lt@8
@serpent_lt@8	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
.B6.1:                          ; Preds .B6.0
        push      esi                                           ;98.1
        push      ebx                                           ;98.1
        push      ebp                                           ;98.1
        mov       esi, ecx                                      ;98.1
        test      edx, edx                                      ;107.13
        mov       ecx, DWORD PTR [esi]                          ;102.6
        mov       eax, DWORD PTR [4+esi]                        ;103.6
        mov       ebx, DWORD PTR [8+esi]                        ;104.6
        mov       ebp, DWORD PTR [12+esi]                       ;105.6
        jne       .B6.3         ; Prob 50%                      ;107.13
                                ; LOE eax ecx ebx ebp esi edi
.B6.2:                          ; Preds .B6.1
        rol       ecx, 13                                       ;108.10
        rol       ebx, 3                                        ;109.10
        mov       edx, ecx                                      ;110.16
        xor       edx, ebx                                      ;110.16
        xor       eax, edx                                      ;110.5
        rol       eax, 1                                        ;112.10
        lea       edx, DWORD PTR [ecx*8]                        ;111.23
        xor       edx, ebx                                      ;111.23
        xor       ebp, edx                                      ;111.5
        mov       edx, eax                                      ;114.16
        rol       ebp, 7                                        ;113.10
        xor       edx, ebp                                      ;114.16
        xor       ecx, edx                                      ;114.5
        mov       edx, eax                                      ;115.23
        shl       edx, 7                                        ;115.23
        xor       edx, ebp                                      ;115.23
        xor       ebx, edx                                      ;115.5
        rol       ecx, 5                                        ;116.10
        rol       ebx, 22                                       ;117.10
        jmp       .B6.4         ; Prob 100%                     ;117.10
                                ; LOE eax ecx ebx ebp esi edi
.B6.3:                          ; Preds .B6.1
        mov       edx, eax                                      ;121.23
        shl       edx, 7                                        ;121.23
        rol       ebx, 10                                       ;119.10
        xor       edx, ebp                                      ;121.23
        xor       ebx, edx                                      ;121.5
        mov       edx, eax                                      ;122.16
        rol       ecx, 27                                       ;120.10
        xor       edx, ebp                                      ;122.16
        xor       ecx, edx                                      ;122.5
        rol       ebp, 25                                       ;123.10
        rol       eax, 31                                       ;124.10
        lea       edx, DWORD PTR [ecx*8]                        ;125.23
        xor       edx, ebx                                      ;125.23
        xor       ebp, edx                                      ;125.5
        mov       edx, ecx                                      ;126.16
        xor       edx, ebx                                      ;126.16
        rol       ebx, 29                                       ;127.10
        xor       eax, edx                                      ;126.5
        rol       ecx, 19                                       ;128.10
                                ; LOE eax ecx ebx ebp esi edi
.B6.4:                          ; Preds .B6.2 .B6.3
        mov       DWORD PTR [esi], ecx                          ;131.3
        mov       DWORD PTR [4+esi], eax                        ;132.3
        mov       DWORD PTR [8+esi], ebx                        ;133.3
        mov       DWORD PTR [12+esi], ebp                       ;134.3
                                ; LOE
.B6.7:                          ; Preds .B6.4
        pop       ebp                                           ;135.1
        pop       ebx                                           ;135.1
        pop       esi                                           ;135.1
        ret                                                     ;135.1
                                ; LOE
; mark_end;
@serpent_lt@8 ENDP
;@serpent_lt@8	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @serpent_lt@8
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_gen_w@8
TXTST6:
; -- Begin  @serpent_gen_w@8
;@serpent_gen_w@8	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_gen_w@8
; mark_begin;

	PUBLIC @serpent_gen_w@8
@serpent_gen_w@8	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
.B7.1:                          ; Preds .B7.0
        mov       eax, DWORD PTR [ecx]                          ;142.9
        xor       eax, DWORD PTR [12+ecx]                       ;142.16
        xor       eax, DWORD PTR [20+ecx]                       ;142.23
        xor       eax, DWORD PTR [28+ecx]                       ;142.30
        xor       eax, -1640531527                              ;142.37
        xor       eax, edx                                      ;142.52
        rol       eax, 11                                       ;143.10
                                ; LOE
.B7.4:                          ; Preds .B7.1
        ret                                                     ;143.10
                                ; LOE
; mark_end;
@serpent_gen_w@8 ENDP
;@serpent_gen_w@8	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @serpent_gen_w@8
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
        push      esi                                           ;147.1
        push      ebx                                           ;147.1
        sub       esp, 32                                       ;147.1
        and       edx, 7                                        ;152.3
        cmp       DWORD PTR [44+esp], 0                         ;157.5
        mov       ebx, ecx                                      ;147.1
        lea       ecx, DWORD PTR [_sbox+edx*8]                  ;155.20
        lea       eax, DWORD PTR [_sbox_inv+edx*8]              ;157.20
        je        L9            ; Prob 50%                      ;157.5
        mov       ecx, eax                                      ;157.5
L9:                                                             ;
        xor       esi, esi                                      ;157.5
                                ; LOE ecx ebx ebp esi edi
.B8.2:                          ; Preds .B8.2 .B8.1
        mov       dl, BYTE PTR [ecx+esi]                        ;161.9
        mov       al, dl                                        ;162.20
        shr       al, 4                                         ;162.20
        and       dl, 15                                        ;163.20
        mov       BYTE PTR [esp+esi*2], al                      ;162.5
        mov       BYTE PTR [1+esp+esi*2], dl                    ;163.5
        inc       esi                                           ;160.18
        and       esi, 255                                      ;160.18
        cmp       esi, 8                                        ;160.15
        jl        .B8.2         ; Prob 82%                      ;160.15
                                ; LOE ecx ebx ebp esi edi
.B8.3:                          ; Preds .B8.2
        mov       ecx, ebx                                      ;166.3
        lea       edx, DWORD PTR [16+esp]                       ;166.3
        call      @serpent_ip@8                                 ;166.3
                                ; LOE ebx ebp edi
.B8.4:                          ; Preds .B8.3
        xor       ecx, ecx                                      ;168.8
                                ; LOE ecx ebx ebp edi
.B8.5:                          ; Preds .B8.5 .B8.4
        movzx     eax, BYTE PTR [16+esp+ecx]                    ;169.9
        mov       esi, eax                                      ;170.28
        shr       esi, 4                                        ;170.28
        and       eax, 15                                       ;170.56
        mov       dl, BYTE PTR [esp+esi]                        ;170.22
        shl       dl, 4                                         ;170.45
        or        dl, BYTE PTR [esp+eax]                        ;170.50
        mov       BYTE PTR [16+esp+ecx], dl                     ;170.5
        inc       ecx                                           ;168.32
        movzx     ecx, cl                                       ;168.32
        cmp       ecx, 16                                       ;168.15
        jl        .B8.5         ; Prob 82%                      ;168.15
                                ; LOE ecx ebx ebp edi
.B8.6:                          ; Preds .B8.5
        mov       edx, ebx                                      ;172.3
        lea       ecx, DWORD PTR [16+esp]                       ;172.3
        call      @serpent_fp@8                                 ;172.3
                                ; LOE ebp edi
.B8.7:                          ; Preds .B8.6
        add       esp, 32                                       ;173.1
        pop       ebx                                           ;173.1
        pop       esi                                           ;173.1
        ret       4                                             ;173.1
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
        push      esi                                           ;176.1
        push      edi                                           ;176.1
        push      ebx                                           ;176.1
        push      ebp                                           ;176.1
        sub       esp, 40                                       ;176.1
        xor       eax, eax                                      ;184.8
        mov       DWORD PTR [36+esp], ecx                       ;176.1
                                ; LOE eax edx
.B9.2:                          ; Preds .B9.2 .B9.1
        mov       DWORD PTR [esp+eax*4], 0                      ;185.5
        inc       eax                                           ;184.28
        movzx     eax, al                                       ;184.28
        cmp       eax, 8                                        ;184.15
        jb        .B9.2         ; Prob 82%                      ;184.15
                                ; LOE eax edx
.B9.3:                          ; Preds .B9.2
        mov       eax, DWORD PTR [60+esp]                       ;175.6
        push      32                                            ;190.3
        pop       ecx                                           ;190.3
        cmp       eax, 32                                       ;190.3
        lea       edi, DWORD PTR [esp]                          ;190.3
        cmovbe    ecx, eax                                      ;190.3
        mov       esi, edx                                      ;190.3
        movzx     ecx, cl                                       ;190.3
        rep                                                     ;190.3
        movsb                                                   ;190.3
                                ; LOE eax
.B9.4:                          ; Preds .B9.3
        cmp       eax, 32                                       ;200.15
        jae       .B9.6         ; Prob 50%                      ;200.15
                                ; LOE eax
.B9.5:                          ; Preds .B9.4
        or        BYTE PTR [esp+eax], 1                         ;201.5
                                ; LOE
.B9.6:                          ; Preds .B9.4 .B9.5
        mov       DWORD PTR [32+esp], 0                         ;204.8
                                ; LOE
.B9.7:                          ; Preds .B9.10 .B9.6
        mov       ebx, DWORD PTR [32+esp]                       ;206.14
        xor       ebp, ebp                                      ;205.10
        shl       ebx, 4                                        ;206.14
        add       ebx, DWORD PTR [36+esp]                       ;206.7
                                ; LOE ebx ebp
.B9.8:                          ; Preds .B9.9 .B9.7
        mov       eax, DWORD PTR [32+esp]                       ;206.26
        lea       ecx, DWORD PTR [esp]                          ;206.26
        lea       edx, DWORD PTR [ebp+eax*4]                    ;206.26
        call      @serpent_gen_w@8                              ;206.26
                                ; LOE eax ebx ebp
.B9.17:                         ; Preds .B9.8
        push      7                                             ;212.7
        pop       ecx                                           ;212.7
        lea       edi, DWORD PTR [esp]                          ;212.7
        mov       DWORD PTR [ebx+ebp*4], eax                    ;206.7
        lea       esi, DWORD PTR [4+edi]                        ;212.7
        rep                                                     ;212.7
        movs                                                    ;212.7
                                ; LOE ebx ebp
.B9.9:                          ; Preds .B9.17
        mov       eax, DWORD PTR [ebx+ebp*4]                    ;214.18
        inc       ebp                                           ;205.20
        and       ebp, 255                                      ;205.20
        mov       DWORD PTR [28+esp], eax                       ;214.7
        cmp       ebp, 4                                        ;205.17
        jl        .B9.8         ; Prob 82%                      ;205.17
                                ; LOE ebx ebp
.B9.10:                         ; Preds .B9.9
        mov       eax, DWORD PTR [32+esp]                       ;204.32
        inc       eax                                           ;204.32
        movzx     eax, al                                       ;204.32
        mov       DWORD PTR [32+esp], eax                       ;204.32
        cmp       eax, 32                                       ;204.16
        jle       .B9.7         ; Prob 82%                      ;204.16
                                ; LOE
.B9.11:                         ; Preds .B9.10
        xor       ebx, ebx                                      ;217.8
                                ; LOE ebx
.B9.12:                         ; Preds .B9.13 .B9.11
        mov       ecx, ebx                                      ;218.5
        mov       edx, ebx                                      ;218.5
        shl       ecx, 4                                        ;218.5
        neg       edx                                           ;218.5
        add       ecx, DWORD PTR [36+esp]                       ;218.5
        add       edx, 3                                        ;218.5
        push      0                                             ;218.5
        call      @sbox128@12                                   ;218.5
                                ; LOE ebx
.B9.13:                         ; Preds .B9.12
        inc       ebx                                           ;217.32
        movzx     ebx, bl                                       ;217.32
        cmp       ebx, 32                                       ;217.16
        jle       .B9.12        ; Prob 82%                      ;217.16
                                ; LOE ebx
.B9.14:                         ; Preds .B9.13
        add       esp, 40                                       ;220.1
        pop       ebp                                           ;220.1
        pop       ebx                                           ;220.1
        pop       edi                                           ;220.1
        pop       esi                                           ;220.1
        ret       4                                             ;220.1
                                ; LOE
; mark_end;
@serpent_setkey@12 ENDP
;@serpent_setkey@12	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @serpent_setkey@12
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_enc@12
TXTST9:
; -- Begin  @serpent_enc@12
;@serpent_enc@12	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_enc@12
; mark_begin;

	PUBLIC @serpent_enc@12
@serpent_enc@12	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
; parameter 3: 20 + esp
.B10.1:                         ; Preds .B10.0
        push      esi                                           ;223.1
        push      edi                                           ;223.1
        push      ebx                                           ;223.1
        push      ebp                                           ;223.1
        mov       esi, ecx                                      ;223.1
        mov       edi, DWORD PTR [20+esp]                       ;222.6
        mov       ecx, edi                                      ;229.3
        call      @blkcpy@8                                     ;229.3
                                ; LOE esi edi
.B10.2:                         ; Preds .B10.1
        xor       ebp, ebp                                      ;231.8
        lea       ebx, DWORD PTR [512+esi]                      ;238.21
                                ; LOE ebx ebp esi edi
.B10.3:                         ; Preds .B10.8 .B10.2
        mov       edx, ebp                                      ;233.5
        mov       ecx, edi                                      ;233.5
        shl       edx, 4                                        ;233.5
        add       edx, esi                                      ;233.5
        call      @blkxor@8                                     ;233.5
                                ; LOE ebx ebp esi edi
.B10.4:                         ; Preds .B10.3
        mov       ecx, edi                                      ;235.5
        mov       edx, ebp                                      ;235.5
        push      0                                             ;235.5
        call      @sbox128@12                                   ;235.5
                                ; LOE ebx ebp esi edi
.B10.5:                         ; Preds .B10.4
        cmp       ebp, 31                                       ;237.12
        jne       .B10.7        ; Prob 84%                      ;237.12
                                ; LOE ebx ebp esi edi
.B10.6:                         ; Preds .B10.5
        mov       ecx, edi                                      ;238.7
        mov       edx, ebx                                      ;238.7
        call      @blkxor@8                                     ;238.7
        jmp       .B10.8        ; Prob 100%                     ;238.7
                                ; LOE ebx ebp esi edi
.B10.7:                         ; Preds .B10.5
        mov       ecx, edi                                      ;241.7
        xor       edx, edx                                      ;241.7
        call      @serpent_lt@8                                 ;241.7
                                ; LOE ebx ebp esi edi
.B10.8:                         ; Preds .B10.7 .B10.6
        inc       ebp                                           ;231.31
        and       ebp, 255                                      ;231.31
        cmp       ebp, 32                                       ;231.15
        jl        .B10.3        ; Prob 82%                      ;231.15
                                ; LOE ebx ebp esi edi
.B10.9:                         ; Preds .B10.8
        pop       ebp                                           ;244.1
        pop       ebx                                           ;244.1
        pop       edi                                           ;244.1
        pop       esi                                           ;244.1
        ret       4                                             ;244.1
                                ; LOE
; mark_end;
@serpent_enc@12 ENDP
;@serpent_enc@12	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @serpent_enc@12
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_dec@12
TXTST10:
; -- Begin  @serpent_dec@12
;@serpent_dec@12	ENDS
_TEXT	ENDS
_TEXT	SEGMENT  DWORD PUBLIC FLAT  'CODE'
;	COMDAT @serpent_dec@12
; mark_begin;

	PUBLIC @serpent_dec@12
@serpent_dec@12	PROC NEAR 
; parameter 1: ecx
; parameter 2: edx
; parameter 3: 20 + esp
.B11.1:                         ; Preds .B11.0
        push      esi                                           ;247.1
        push      edi                                           ;247.1
        push      ebx                                           ;247.1
        push      ebp                                           ;247.1
        mov       ebp, ecx                                      ;247.1
        mov       ebx, DWORD PTR [20+esp]                       ;246.6
        mov       ecx, ebx                                      ;253.3
        call      @blkcpy@8                                     ;253.3
                                ; LOE ebx ebp
.B11.2:                         ; Preds .B11.1
        push      32                                            ;255.8
        pop       edi                                           ;255.8
                                ; LOE ebx ebp edi
.B11.3:                         ; Preds .B11.9 .B11.2
        cmp       edi, 32                                       ;256.12
        jne       .B11.5        ; Prob 84%                      ;256.12
                                ; LOE ebx ebp edi
.B11.4:                         ; Preds .B11.3
        mov       esi, edi                                      ;258.28
        mov       ecx, ebx                                      ;258.7
        shl       esi, 4                                        ;258.28
        add       esi, ebp                                      ;258.21
        mov       edx, esi                                      ;258.7
        call      @blkxor@8                                     ;258.7
        jmp       .B11.7        ; Prob 100%                     ;258.7
                                ; LOE ebx ebp esi edi
.B11.5:                         ; Preds .B11.3
        mov       ecx, ebx                                      ;260.7
        push      1                                             ;260.7
        pop       edx                                           ;260.7
        call      @serpent_lt@8                                 ;260.7
                                ; LOE ebx ebp edi
.B11.6:                         ; Preds .B11.5
        mov       esi, edi                                      ;265.28
        shl       esi, 4                                        ;265.28
        add       esi, ebp                                      ;265.19
                                ; LOE ebx ebp esi edi
.B11.7:                         ; Preds .B11.4 .B11.6
        dec       edi                                           ;263.21
        mov       ecx, ebx                                      ;263.5
        mov       edx, edi                                      ;263.5
        push      1                                             ;263.5
        call      @sbox128@12                                   ;263.5
                                ; LOE ebx ebp esi edi
.B11.8:                         ; Preds .B11.7
        add       esi, -16                                      ;265.5
        mov       ecx, ebx                                      ;265.5
        mov       edx, esi                                      ;265.5
        call      @blkxor@8                                     ;265.5
                                ; LOE ebx ebp edi
.B11.9:                         ; Preds .B11.8
        test      edi, edi                                      ;255.28
        jg        .B11.3        ; Prob 82%                      ;255.28
                                ; LOE ebx ebp edi
.B11.10:                        ; Preds .B11.9
        pop       ebp                                           ;267.1
        pop       ebx                                           ;267.1
        pop       edi                                           ;267.1
        pop       esi                                           ;267.1
        ret       4                                             ;267.1
                                ; LOE
; mark_end;
@serpent_dec@12 ENDP
;@serpent_dec@12	ENDS
_TEXT	ENDS
_DATA	SEGMENT  DWORD PUBLIC FLAT  'DATA'
_DATA	ENDS
; -- End  @serpent_dec@12
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
	INCLUDELIB <libmmt>
	INCLUDELIB <LIBCMT>
	INCLUDELIB <libirc>
	INCLUDELIB <svml_dispmt>
	INCLUDELIB <OLDNAMES>
	INCLUDELIB <libdecimal>
	END
