@echo off&setlocal enabledelayedexpansion
rem ----------------------------
rem modify file name and suffix
rem ----------------------------

rem 获取下载目录
set downloadpath=%cd%

for /f "delims=" %%i in ('dir /ad/b "%downloadpath%"') do (

set /a count = 0

for /f "delims=" %%j in ('dir /b/a-d/oN %downloadpath%\%%i') do ( 

set /a count += 1

ren %downloadpath%\%%i\%%j %%i-!count!.dcm

)

)


echo  修改完成！
echo  3秒后自动退出

ping /n 3 127.1 >nul

exit