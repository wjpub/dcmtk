@echo off&setlocal enabledelayedexpansion
rem ----------------------------
rem ԭ��Ҫ���ص��ļ�����
rem ȡ������Ŀ¼�µ������ļ������ƣ����浽��ʱ�ļ�comparefile.txt��
rem �������ļ������Ƚϣ���û�������������ļ������Ʒŵ��µ�txt�У��Ա���ɺ�ɾ����ʱ�ļ�
rem ----------------------------


for /f "skip=1 tokens=1,3" %%i in (download.cfg) do (
if "%%i"=="outputpath" set filepath=%%j
)

rem ������Ŀ¼�µ��ļ������ŵ� ��ʱ�ļ� tmp.txt ��

for /f "delims=" %%j in ('dir /b/ad %filepath%') do ( 

echo %%j>>tmp.txt

)

rem �Ƚ���ʱ�ļ���name.txt�ļ����ݣ�ȱ�ٵķŵ�filemissing.txt��

if exist tmp.txt ( findstr /ivg:tmp.txt name.txt>filemissing.txt 

del tmp.txt

) else (

type name.txt>>filemissing.txt

)

rem �Ƚ���ɺ�ɾ����ʱ�ļ�

echo  �ȽϽ���ŵ�filemissing.txt�У�

pause>nul