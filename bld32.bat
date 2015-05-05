@echo off
ml /coff /Cp /c /nologo src\x86\serpent.asm
cl /nologo /O1 serp_test.c serpent.obj
move serp_test.exe bin\x86\
del *.obj *.err