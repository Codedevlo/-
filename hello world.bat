    @echo off >nul
    title Batch Arithmetic Communicator
    :check
    timeout /t 1 >nul /nobreak
    echo %t% >>wait.rsm
    SET /A t=%RANDOM% * 10 / 32768 + 1
    goto cont

    :cont
    timeout /t 1 >nul
    if exist pack.rsm goto cont2
    if NOT exist pack.rsm goto cont

    :cont2
    set /p data=<pack.rsm
    del pack.rsm
    if %data% LSS 5 goto move
    if %data% GTR 5 goto check

The receiver of the numbers


@echo off
:a
timeout /t 1 >nul
if exist wait.rsm goto b
if NOT exist wait.rsm goto a

:b
set /p d=<wait.rsm
if %d% GTR 5 goto a
if %d% LSS 5 goto w

:w
echo 3>>pack.rsm
goto a
