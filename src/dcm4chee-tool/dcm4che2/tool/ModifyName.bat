@echo off&setlocal enabledelayedexpansion
rem ----------------------------
rem modify file name and suffix
rem ----------------------------

rem ��ȡ����Ŀ¼
set downloadpath=%cd%

for /f "delims=" %%i in ('dir /ad/b "%downloadpath%"') do (

set /a count = 0

for /f "delims=" %%j in ('dir /b/a-d/oN %downloadpath%\%%i') do ( 

set /a count += 1

ren %downloadpath%\%%i\%%j %%i-!count!.dcm

)

)


echo  �޸���ɣ�
echo  3����Զ��˳�

ping /n 3 127.1 >nul

exit