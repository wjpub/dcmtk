@echo off&setlocal enabledelayedexpansion
rem ----------------------------
rem download file
rem ----------------------------
rem set command=..\bin\dcmqr  -L dwtest:10001  DCM4CHEE@127.0.0.1:11112  -q00080050=1703070018 -cmove dwtest -cstore CT  -cstoredest D:\Download
rem %command%

for /f "skip=1 tokens=1,3" %%i in (download.cfg) do (
 if "%%i"=="javahome" set javahome=%%j
)

for /f "skip=1 tokens=1,3" %%i in (download.cfg) do (
 if "%%i"=="outputpath" set downloadpath=%%j
)

for /f "skip=1 tokens=1,3" %%i in (download.cfg) do (
 if "%%i"=="pausetime" set time=%%j
)

set JAVA_HOME=%javahome%
set PATH=%JAVA_HOME%/bin;%JAVA_HOME%/jre/bin  
set CLASSPATH=.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar; 


for /f "delims=" %%i in (name.txt) do (

md "%downloadpath%\%%i"

..\bin\dcmqr  -L dwtest:10001 med_imFIR@192.168.231.18:104  -q00080050=%%i -cmove dwtest -cstore CT  -cstoredest %downloadpath%\%%i>log.log 2>&1

findstr /c "error"  log.log  && echo %%i>>error.txt || echo error not exist 


ping /n %time% 127.1 >nul

)  

pause>nul






