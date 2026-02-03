@echo off
setlocal

REM %1 = XML full path
REM %2 = XSLT full path
REM %3 = HTML full path

set "JAVA=C:\e-CANIAS2016\HAUSASLOG\tools\jre\bin\java.exe"
set "SAXON=C:\e-CANIAS2016\HAUSASLOG\tools\saxon-he-10.8.jar"

set "IN_XML=%~1"
set "IN_XSL=%~2"
set "OUT_HTML=%~3"

set "OUTLOG=C:\e-CANIAS2016\HAUSASLOG\saxon_out.txt"
set "ERRLOG=C:\e-CANIAS2016\HAUSASLOG\saxon_err.txt"

"%JAVA%" -jar "%SAXON%" -s:"%IN_XML%" -xsl:"%IN_XSL%" -o:"%OUT_HTML%" 1>"%OUTLOG%" 2>"%ERRLOG%"
exit /b %errorlevel%
