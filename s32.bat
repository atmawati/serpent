@echo off
yasm -fwin32 serpx86.asm -oserpx86.obj
yasm -fbin -DBIN serpx86.asm -oserpx86.bin
cl s_test.c serpx86.obj