@echo off
setlocal enabledelayedexpansion

:: Đường dẫn file danh sách packages
set "packageFile=a3.txt"
set count = 0
:: check devices connect
::adb get-state >nul 2>&1
::if errorlevel 1 (
::    echo not found devices adb ADB.
 ::   pause
::    exit /b
::)

for /f "tokens=* delims=" %%p in (%packageFile%) do (
    set /a count+=1
    echo !count!/ processing: %%p 

    adb shell am force-stop %%p
    adb shell pm clear %%p
    adb shell pm disable-user --user 0 %%p

    echo disabled apps: %%p
    echo -------------------------------
    
    echo uninstalled apps: %%p
    echo -------------------------------
    adb shell pm uninstall --user 0 %%p
)

echo done processing.
pause
