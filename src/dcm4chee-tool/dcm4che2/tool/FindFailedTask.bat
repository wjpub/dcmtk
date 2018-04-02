@echo off&setlocal enabledelayedexpansion
rem ----------------------------
rem 原来要下载的文件名称
rem 取出下载目录下的所有文件夹名称，保存到临时文件comparefile.txt中
rem 将两个文件夹做比较，将没有下载下来的文件夹名称放到新的txt中，对比完成后，删除临时文件
rem ----------------------------


for /f "skip=1 tokens=1,3" %%i in (download.cfg) do (
if "%%i"=="outputpath" set filepath=%%j
)

rem 将下载目录下的文件夹名放到 临时文件 tmp.txt 中

for /f "delims=" %%j in ('dir /b/ad %filepath%') do ( 

echo %%j>>tmp.txt

)

rem 比较临时文件和name.txt文件内容，缺少的放到filemissing.txt中

if exist tmp.txt ( findstr /ivg:tmp.txt name.txt>filemissing.txt 

del tmp.txt

) else (

type name.txt>>filemissing.txt

)

rem 比较完成后删除临时文件

echo  比较结果放到filemissing.txt中！

pause>nul