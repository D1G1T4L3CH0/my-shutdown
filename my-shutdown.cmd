@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
title My Shutdown

:: Test if the script is running as admin. Inform the use to run it as admin if it's not already.
:: Running as admin may not be required by all software, but for most system tools like defrag and
:: registry cleaners, it is.
NET SESSION >nul 2>&1
if %ERRORLEVEL% NEQ 0 goto notadmin

:: Set the working dir.
pushd "%~dp0"

:: Setup the script variable and make sure the file exists.
if "%*" EQU "" goto usage

:: interactive mode
if /i "%*" EQU "-i" (
	call :interactive
) else (
	set script=scripts\%*
)

if /i "%script:~-4%" NEQ ".txt" set script=%script%.txt
if not exist "%script%" goto usage

:: Identify the file as a script. If not, abort.
findstr /c:"#SCRIPT START#" "%script%">nul || goto wrongfile

:: Read the script and execute the lines. You could easily add in your own custom commands here.
for /f "usebackq tokens=1-3 delims=	" %%a in ("%script%") do (
	if /i "%%a" EQU "message"	echo %%b
	if /i "%%a" EQU "wait"		call :wait "%%~b"
	if /i "%%a" EQU "run" (
		:: Expand variables within the %%~b variable. This allows the use of variables in the user script.
		call set exe=%%~b
		start "" "!exe!" %%~c
		set exe=
		:: Give a little time for the process to start. If not a wait command may get executed before the process is actually running and finish immediately. This would cause the next command to execute before the last one closes.
		timeout /t 1 >nul
	)
	if /i "%%a" EQU "shutdown"	shutdown /p
	if /i "%%a" EQU "hshutdown"	shutdown /p /hybrid
	if /i "%%a" EQU "hibernate"	shutdown /h
	if /i "%%a" EQU "close"		taskkill /im "%%b">nul 2>nul
	if /i "%%a" EQU "killhung"	taskkill /f /fi "status eq not responding">nul 2>nul
)
popd
goto :EOF

:wait
	title My Shutdown (waiting: %~1)
	tasklist | find "%~1"  >nul
	if %ERRORLEVEL% EQU 0 (
		timeout /t 1 >nul
		goto wait
	)
	title My Shutdown
goto :EOF

:wrongfile
	echo The file you chose is not a script file.
	pause
goto :EOF

:usage
	echo Usage: %~nx0 ^<scriptfile[.txt]^>
	pause
goto :EOF

:notadmin
	echo Please run this script as administrator.
	pause
goto :EOF

:interactive
	echo Please choose a script. Type the filename and press enter.
	for %%x in (scripts\*.txt) do echo %%~nx
	set /p script=Filename: 
	set script=scripts\%script%
goto :EOF
