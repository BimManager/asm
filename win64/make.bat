@echo off

if "%SRC%"=="" goto error
if "%1"=="clean" goto clean
if "%1"=="fclean" goto fclean

ml64 %SRC% /Zi /link /subsystem:windows /defaultlib:kernel32.lib /defaultlib:user32.lib /entry:Start /out:a.exe
goto :eof

:error
echo set environment variable SRC
goto :eof

:clean
del *.obj *.pdb *~ *.ilk *.lnk
goto :eof

:fclean
del *.exe
goto clean



