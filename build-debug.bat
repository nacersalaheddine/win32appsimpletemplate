@ECHO OFF 
CLS 
ECHO ------------------------compile and run DEBUG MODE------------------------------
SET binName=main.exe
SET objName=main.o
g++ -Wall -O2  -std=c++11 -c main.cpp -o OBJ/Debug/%objName%
windres.exe   -J rc -O coff -i resource.rc -o obj/Debug/resource.res
g++  -o BIN/Debug/%binName% obj/Debug/%objName%  obj/Debug/resource.res -s  -lgdi32 -luser32 -lkernel32 -lcomctl32
IF %ERRORLEVEL% NEQ 0 (
ECHO COMPILE ERROR
) ELSE (
START ./BIN/Debug/%binName%
REM EXIT
)
rem PAUSE  