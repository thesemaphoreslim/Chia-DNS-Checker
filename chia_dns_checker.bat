@ECHO OFF
ECHO CHECKING CONNECTIVITY TO DNS-INTRODUCER.CHIA.NET...
ECHO THIS MAY TAKE A MOMENT...
timeout /T 3 > nul
nslookup dns-introducer.chia.net > %TEMP%\chia_dns.txt
cls
for /f "tokens=2 delims=: " %%i in ('type %TEMP%\chia_dns.txt ^| find /I "Server:"') do SET CURSERVER=%%i
for /f "tokens=2 delims=: " %%i in ('type %TEMP%\chia_dns.txt ^| find /I "Address:"') do SET CURADDR=%%i
for /f %%i in ('type %TEMP%\chia_dns.txt ^| find /I /C "Name:"') do SET DNSOK=%%i

for /f "tokens=*" %%i in ('date /t') do SET MYDATE=%%i
for /f "tokens=*" %%i in ('time /t') do SET MYTIME=%%i
ECHO.
ECHO.
if %DNSOK%==1 ( ECHO DNS IS OK && goto GETOUT )
if %DNSOK%==0 ECHO *** UNABLE TO REACH CHIA DNS ***
ECHO.
ECHO YOUR CURRENT DNS SERVER IS %CURSERVER%
ECHO YOUR CURRENT DNS ADDRESS IS %CURADDR%
REM for /f "tokens=4 delims= " %%i in ('netsh interface show interface ^| find "Connected"') do (
REM runas /user:Administrator "netsh interface ipv4 add dnsserver ^"%%i^" address=8.8.4.4 index=1"
REM runas /user:Administrator "netsh interface ipv4 add dnsserver ^"%%i^" address=1.0.0.1 index=2"
REM )

:GETOUT
ECHO.
ECHO YOUR CURRENT SYSTEM DATE/TIME IS %MYDATE%%MYTIME%
ECHO.
ECHO Please notify Chia support if your system date/time is incorrect
ECHO.
del %TEMP%\chia_dns.txt
pause

REM KNOWN DNS SERVERS WITH PROBLEMS CONNECTING TO DNS-INTRODUCER.CHIA.NET
REM 85.175.46.122
REM 159.69.114.157
REM 91.205.3.65
REM 85.175.46.130
REM 91.205.144.27
REM 194.190.174.17
REM 92.242.70.219
REM 81.30.212.189
REM 92.55.56.232
REM 188.128.110.67
REM 87.249.10.110
REM 87.249.10.108
REM 109.124.72.180
REM 77.244.76.153

