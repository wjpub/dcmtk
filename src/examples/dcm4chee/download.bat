@echo off
rem ----------------------------
rem download file
rem ----------------------------
rem set command=..\bin\dcmqr  -L dwtest:10001  DCM4CHEE@127.0.0.1:11112  -q00080050=1703070018 -cmove dwtest -cstore CT  -cstoredest D:\Download
rem %command%

set JAVA_HOME=.\lib\jre6
set PATH=%PATH%;%JAVA_HOME%\bin  
set CLASSPATH=.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar
ping /n 1 127.1 >nul

for /f "tokens=1,3" %%i in (download.cfg) do (
    if "%%i"=="download_path" set download_path=%%j
    if "%%i"=="pause_time" set pause_time=%%j
    if "%%i"=="pacs_aetitle" set pacs_aetitle=%%j
    if "%%i"=="pacs_ip" set pacs_ip=%%j
    if "%%i"=="pacs_port" set pacs_port=%%j
    if "%%i"=="local_aetitle" set local_aetitle=%%j
    if "%%i"=="local_ip" set local_ip=%%j
    if "%%i"=="local_port" set local_port=%%j
    if "%%i"=="search_tag" set search_tag=%%j
)

For /F %%i in (searchlist.txt) do (
    dir /a /b %download_path%\%%i | findstr . >nul && (@echo ????????ڣ???????????%%i) || (
        md "%download_path%\%%i"
        @echo ??ʹ?GET?????? %%i ...
	@echo .\lib\dcm4che2\bin\dcmqr  -L %local_aetitle% %pacs_aetitle%@%pacs_ip%:%pacs_port%  -q%search_tag%=%%i -cget -cstore CT CR MR US NM PET SC XA XRF DX MG PR KO SR IVRLE LE BE DEFL JPLL JPLY MPEG2 NOPX NOPXD  -cstoredest %download_path%\%%i>output\log.log 2>&1
        .\lib\dcm4che2\bin\dcmqr  -L %local_aetitle% %pacs_aetitle%@%pacs_ip%:%pacs_port%  -q%search_tag%=%%i -cget -cstore CT CR MR US NM PET SC XA XRF DX MG PR KO SR IVRLE LE BE DEFL JPLL JPLY MPEG2 NOPX NOPXD  -cstoredest %download_path%\%%i>output\log.log 2>&1
        ping /n 10 127.1 >nul

        dir /a /b %download_path%\%%i | findstr . >nul && (@echo off) || (
            @echo ??ʹ?MOVE?????? %%i...
            .\lib\dcm4che2\bin\dcmqr  -L %local_aetitle%@%local_ip%:%local_port% %pacs_aetitle%@%pacs_ip%:%pacs_port%  -q%search_tag%=%%i -cmove %local_aetitle% -cstore CT CR MR US NM PET SC XA XRF DX MG PR KO SR IVRLE LE BE DEFL JPLL JPLY MPEG2 NOPX NOPXD  -cstoredest %download_path%\%%i>output\log.log 2>&1
        )
        ping /n %time% 127.1 >nul
    )
)  

echo/ 
echo/ 
echo/ 
echo/ 
@echo ִ???ϣ???????????...

pause>nul






