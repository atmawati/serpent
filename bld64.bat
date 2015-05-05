@echo off
ml64 /coff /Cp /c /nologo src\x64\serpent.asm
cl /nologo /O1 serp_test.c serpent.obj
move serp_test.exe bin\x64\
del *.obj *.err