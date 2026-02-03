@echo off
setlocal EnableExtensions

REM --------------------------------------------------
REM %1 = XML full path
REM %2 = XSLT full path
REM %3 = HTML full path
REM --------------------------------------------------

REM Parametre kontrolü
if "%~3"=="" (
    echo Kullanım:
    echo   run_saxon.bat input.xml transform.xslt output.html
    exit /b 1
)

set "JAVA=C:\e-CANIAS2016\HAUSASLOG\tools\jre\bin\java.exe"
set "SAXON=C:\e-CANIAS2016\HAUSASLOG\tools\saxon-he-10.8.jar"

set "IN_XML=%~1"
set "IN_XSL=%~2"
set "OUT_HTML=%~3"

set "LOG_DIR=C:\e-CANIAS2016\HAUSASLOG"
set "OUTLOG=%LOG_DIR%\saxon_out.txt"
set "ERRLOG=%LOG_DIR%\saxon_err.txt"

REM Log klasörü yoksa oluştur
if not exist "%LOG_DIR%" (
    mkdir "%LOG_DIR%"
)

REM Saxon çalıştır
"%JAVA%" -jar "%SAXON%" ^
 -s:"%IN_XML%" ^
 -xsl:"%IN_XSL%" ^
 -o:"%OUT_HTML%" ^
 1>"%OUTLOG%" 2>"%ERRLOG%"

set EXITCODE=%ERRORLEVEL%

REM Sonuç bilgisi
if %EXITCODE% NEQ 0 (
    echo HATA: Saxon calismadi. Detay icin %ERRLOG% dosyasina bak.
) else (
    echo OK: HTML basariyla olusturuldu.
)

endlocal
exit /b %EXITCODE%
