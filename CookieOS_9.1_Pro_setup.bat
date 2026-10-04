@echo off
title CookieOS 9.1 INSTALLER V865.55.36
color 1F

:: ---- AUTOMATIC ADMIN ELEVATION ----
NET FILE >nul 2>&1
if '%errorlevel%' == '0' ( goto menu ) else ( goto getAdmin )

:getAdmin
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /b
:: -----------------------------------

:loading_screen
echo pleas wait...
echo loading setup files...
timeout /t 3

:loading_screen_2
echo 1%
echo 2%
echo 3%
echo 4%
echo 5%
echo 6%
echo 7%
echo 8%
echo 9%
echo 10%
echo 21%
echo 
echo 24%
echo 26%
echo 28%
echo 30%
echo 32%
echo 38%
timeout /t 2
cls

:lodaing_screen_3
echo 48%
echo 50%
timeout /t 1
cls

:loding_screen_4
echo 68%
echo 90%
echo 99%
echo 100%
echo finished loading setup files...

:menu
cls
echo ==============================================================
echo  COOKIEOS 9.1 SELECTION MENU
echo ==============================================================
echo  [H] Run Help Setup
echo  [I] Proceed to Installer
echo ==============================================================
set /p "opt=Select an option (H/I): "
if /I "%opt%"=="H" goto help_setup
if /I "%opt%"=="I" goto warning
goto menu

:help_setup
cls
%USERPROFILE%\Desktop\CookieOs-Pro-9.1\help\file\help.html
pause
goto menu

:warning
cls
echo The progress section has been synchronized and fixed.
set /p "agree=Do you wish to continue(Y/N): "
if /I not "%agree%"=="Y" exit

:: --- TESTING HEADER ---
echo ==============================================================
echo  WE ARE TESTING CHANGES FOR AUTOMATIC ADMIN START: TESTING FOR AUTO ADMIN DONE
echo  NOW RUNNING DEPLOYMENT CODE...
echo ==============================================================
echo.
set /p "agree=Do you wish to continue the setup as normal (Y/N): "
if /I not "%agree%"=="Y" exit

:: Getting the system ready for installation
set /p "agree=Do you want to continue (Y/N):"
if /I not "%agree%"=="Y" exit

:: --- CENTERED NUMBER RANDOM SPEED LOADING BAR ---
cls
echo.
echo  Initializing installation package...
echo.
setlocal enabledelayedexpansion

:: Create reference strings for slicing (20 slots each side)
set "hashes=####################"
set "dots=...................."

:: Loop from 1 to 100 perfectly
for /L %%P in (1,10,100) do (
    
    :: --- LEFT SIDE CALCULATIONS (0% to 50%) ---
    set /a "leftH=%%P / 5"
    if !leftH! gtr 20 set "leftH=20"
    set /a "leftD=20 - leftH"
    
    :: Slice out the hashes and dots for the left side
    set "leftPart="
    if !leftH! gtr 0 for /f "delims=" %%A in ("!leftH!") do set "leftPart=!hashes:~0,%%A!"
    if !leftD! gtr 0 for /f "delims=" %%A in ("!leftD!") do set "leftPart=!leftPart!!dots:~0,%%A!"

    :: --- CENTER NUMBER FORMATTING ---
    set "dispNum=%%P%%"
    if %%P lss 100 set "dispNum= %%P%%"
    if %%P lss 10 set "dispNum=  %%P%%"

    :: --- RIGHT SIDE CALCULATIONS (51% to 100%) ---
    set /a "rightH=(%%P - 50) / 5"
    if !rightH! lss 0 set "rightH=0"
    if !rightH! gtr 20 set "rightH=20"
    set /a "rightD=20 - rightH"
    
    :: Slice out the hashes and dots for the right side
    set "rightPart="
    if !rightH! gtr 0 for /f "delims=" %%A in ("!rightH!") do set "rightPart=!hashes:~0,%%A!"
    if !rightD! gtr 0 for /f "delims=" %%A in ("!rightD!") do set "rightPart=!rightPart!!dots:~0,%%A!"

    :: --- PRINT THE SOLID FRAME ---
    cls
    echo.
    echo  Initializing installation package...
    echo.
    echo  [!leftPart! !dispNum! !rightPart!]
    
    :: Fixed the delay code so it works perfectly
    set /a "randDelay=(!random! %% 20) + 5"
    pathping 127.0.0.1 -n -q 1 -p !randDelay! >nul 2>&1
)
cls
echo.
echo  Initializing installation package...
echo.
echo  [#################### 100%% ####################]
timeout /t 1 >nul
cls

:LICENSE_SCAN
cls
echo ==========================================================================================
echo  COOKIEOS 9.1 - STAGE 1: LICENSE AND AGREEMENT
echo ==========================================================================================
echo.
echo  - CookieOS may write or change your system settings.
echo  - CookieOS 9.1 is an OS that could start automatically.
echo  - Your system may still work after installation(As always your os wont break unless you edited the code in notepad to delete your sytem/brike it.).
echo  - Please do not delete important CookieOS files unless you are a developer.
echo  - Help is located at "C:\ProgramData\CookieOS\help.bat"
echo.
set /p "agree=Proceed to Stage 1 and begin extraction? (Y/N): "
if /I not "%agree%"=="Y" exit

:SYSTEM_SCAN
echo.
echo  [ SCANNING SYSTEM SECTORS... ]
for /f "tokens=2*" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuild 2^>nul') do set "BUILD_NUM=%%B"
for /f "tokens=3"  %%A in ('reg query "HKLM\SOFTWARE\Microsoft\" /v CurrentBuild 2^>nul') do set "BUILD_NUM=%%B"

:coppying_file
echo coppying files
set /p "agree=Proceed to coppy files (Y/N): "
if /I not "%agree%"=="Y" exit
cd C:\Program Files\
mkdir Cookie os && cd Cookie os 
mkdir Help && mkdir files
xcoppy %USERPROFILE%\Desktop\CookieOs-Pro-9.1\help\file\help.html C:\Program Files\Cookie os\Help

set "OS_NAME=Windows 10"
if !BUILD_NUM! gtr 22000 set "OS_NAME=Windows 11"

for /L %%i in (1,1,400) do (
    echo [!time!] SCANNING SECTOR

pause


