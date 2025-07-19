@echo off
setlocal enabledelayedexpansion

:: Đường dẫn file danh sách packages
set "packageFile=a.txt"

:: check devices connect
::adb get-state >nul 2>&1
::if errorlevel 1 (
::    echo not found devices adb ADB.
 ::   pause
::    exit /b
::)

for /f "tokens=* delims=" %%p in (%packageFile%) do (
    echo processing: %%p

    echo installed apps: %%p
    echo -------------------------------
    adb shell cmd package install-existing %%p
)

echo done processing.
pause