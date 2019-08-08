@ECHO OFF 
CLS 
ECHO ------------------------compile and run RELEASE MODE------------------------------
SET binName=main.exe
SET objName=main.o
g++ -Wall -O2  -std=c++11 -c main.cpp -o OBJ/Release/%objName%
windres.exe -J rc -O coff -i resource.rc -o obj/Release/resource.res
g++  -o BIN/Release/%binName% obj/Release/%objName%  obj\Release\resource.res -s  -lgdi32 -luser32 -lkernel32 -lcomctl32 -mwindows

IF %ERRORLEVEL% NEQ 0 (
ECHO COMPILE ERROR
) ELSE (
START ./BIN/Release/%binName%
REM EXIT
)
rem PAUSE  