::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFAhXXBPRAE+1EbsQ5+n//NbT9BsfUrJmK42Di+bWdLZKuxe2LcQp0ntbnMleCEkAf1yibQBU
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFAhXXBPRAE+/Fb4I5/jH3f+Utm4VUeMrW4fe2b+yA+gW4UD2NZQ0llxdkIUJFB44
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title Options Menu
color 1F
mode con: cols=60 lines=22

:: Определяем имя пользователя
set "USERNAME=%USERNAME%"

:: Получаем внешний IP-адрес с помощью сайта http://api.ipify.org/
for /f "tokens=*" %%A in ('powershell -Command "(Invoke-WebRequest -Uri 'http://api.ipify.org').Content"') do set "IP=%%A"

:: Функция для центрирования текста
setlocal enabledelayedexpansion
set "text=IP: %IP%"
call :center_text "!text!" 60
set "IP_CENTERED=!CENTERED_TEXT!"

set "text=Profile: %USERNAME%"
call :center_text "!text!" 60
set "PROFILE_CENTERED=!CENTERED_TEXT!"

:: Меню
:menu
cls
echo =============================================
echo               OPTIONS MENU                  
echo =============================================
echo !IP_CENTERED!                
echo !PROFILE_CENTERED!             
echo =============================================
echo   [1]  Open AppData Folder                
echo   [2]  Open Temp Folder                   
echo   [3]  Open Recent Folder                
echo ---------------------------------------------
echo   [4]  Open Everything                    
echo   [5]  Open Process Hacker                
echo   [6]  Open BrowserDownloadsView         
echo   [7]  Open LastActivityView             
echo   [8]  Open Shellbag Analyzer          
echo   [9]  Open USBDeview                     
echo ---------------------------------------------
echo   [10] Exit                              
echo =============================================
set /p choice=» Select an option: 

if "%choice%"=="1" (
    start "" "%APPDATA%" || call :error_handler "Failed to open AppData folder"
)
if "%choice%"=="2" (
    start "" "%TEMP%" || call :error_handler "Failed to open Temp folder"
)
if "%choice%"=="3" (
    start "" "%USERPROFILE%\Recent" || call :error_handler "Failed to open Recent folder"
)
if "%choice%"=="4" (
    start "" "%USERPROFILE%\Desktop\RustCheatCheck\Programs\SOFT RUST\Everything_x86.exe" || call :error_handler "Failed to open Everything"
)
if "%choice%"=="5" (
    start "" "C:\Users\%USERNAME%\Desktop\RustCheatCheck\Programs\SOFT RUST\Hacker 2\ProcessHacker.exe" || call :error_handler "Failed to open Process Hacker"
)
if "%choice%"=="6" (
    start "" "%USERPROFILE%\Desktop\RustCheatCheck\Programs\SOFT RUST\BrowserDownloadsView\BrowserDownloadsView.exe" || call :error_handler "Failed to open BrowserDownloadsView"
)
if "%choice%"=="7" (
    start "" "%USERPROFILE%\Desktop\RustCheatCheck\Programs\SOFT RUST\LastActivityView\LastActivityView.exe" || call :error_handler "Failed to open LastActivityView"
)
if "%choice%"=="8" (
    start "" "%USERPROFILE%\Desktop\RustCheatCheck\Programs\SOFT RUST\shellbag_analyzer_cleaner\shellbag_analyzer_cleaner.exe" || call :error_handler "Failed to open Shellbag Analyzer"
)
if "%choice%"=="9" (
    start "" "C:\Users\%USERNAME%\Desktop\RustCheatCheck\Programs\SOFT RUST\USBDeview_x86\USBDeview_x86.exe" || call :error_handler "Failed to open USBDeview"
)
if "%choice%"=="10" exit
goto menu

:: Обработчик ошибок
:error_handler
cls
echo Error: %1
echo.  
echo A critical error occurred. The system will restart the program.
echo Please check the command and try again.
pause
start cmd.exe /k "%~f0"
exit /b

:: Функция для центрирования текста
:center_text
setlocal
set "TEXT=%~1"
set "WIDTH=%~2"

:: Вычисляем количество пробелов для центрирования
set "PADDING=                                                                "
set "TEXT_LENGTH=0"
for /l %%i in (0,1,255) do (
    if "!TEXT:~%%i,1!"=="" goto :break
    set /a TEXT_LENGTH+=1
)
:break

:: Вычисляем количество пробелов для левого отступа
set /a PADDING_LENGTH=(%WIDTH%-!TEXT_LENGTH!)/2
set "CENTERED_TEXT=!PADDING:~0,%PADDING_LENGTH%!%TEXT%"
endlocal & set "CENTERED_TEXT=%CENTERED_TEXT%"
goto :eof
