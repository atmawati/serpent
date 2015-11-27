@echo off
yasm -fwin32 -DTC serpx86.asm -oserpx86.obj
cl s_test.c serpent.c serpx86.obj