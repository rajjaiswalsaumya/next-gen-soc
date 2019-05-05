@echo off
SETLOCAL

CALL :Main
CALL :Exit

:Exit
    EXIT /B %ERRORLEVEL%

:Main
    CALL :ShowMenu
    EXIT /B 0

:Build
    echo "Building All Modules"
    cd /d %~dp0
    dir
    Call mvnw.cmd clean install -Dclean-all-ui=true -Dinstall-ui-pluguns=true -Dbuild-ui=true
    Call :Exit

:Run
    echo "Running"
    EXIT /B 0

:ShowMenu
    echo Choose execution option:
    echo 1: Build
    echo 2: Run
    echo 3: Exit
    set INPUT=
    set /P INPUT=Execution type: %=%
    If /I "%INPUT%"=="1" goto :Build
    If /I "%INPUT%"=="2" goto :Run
    If /I "%INPUT%"=="3" goto :Exit
    echo Incorrect input
    EXIT /B 0

