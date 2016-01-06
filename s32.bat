@echo off
yasm -fwin32 s86.asm -os86.obj
yasm -fbin -DBIN s86.asm -os86.bin
cl s_test.c /DUSE_ASM s86.obj
del *.err *.obj