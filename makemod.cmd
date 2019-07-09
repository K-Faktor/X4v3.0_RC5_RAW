@echo off

rem ******************************************************************
rem MAKEMOD.CMD
rem Versatile COD4 Mod Compilation Batch -- revision 1.6
rem Created by (eXtreme+ Support Crew)
rem
rem 1. Install the mod tools and any update available.
rem    Default and most convenient place is where COD4 is installed (alongside
rem    the "main" folder), but any other place is fine as long as you copy the
rem    "main" folder from COD4 into the mod tools root.
rem 2. All executables should be in the "bin" folder of the mod tools. This
rem    includes 7za.exe. If it does not exist, the script will try to copy it
rem    from the current folder (where you started the script from).
rem 3. Create an empty folder for your raw files (any place, any name).
rem    We will call it the "base folder".
rem 4. Inside this base folder, create a folder "ff" and a folder "iwd".
rem    "ff" will hold the folder structure and raw files for the mod´s fastfile.
rem    "iwd" will hold the folder structure and raw files for the mod´s iwd.
rem 5. Copy this script into the base folder.
rem 6. Copy the fastfile directives file (CSV) into the "ff" folder.
rem    If you set XNAME_FF to "mod", the file must be named "mod.csv".
rem 7. Set the environment variables below. Most important is XDIR_TOOLS.
rem 8. When set and saved, execute this script.
rem ******************************************************************

rem ------------------------------------------------------------------
rem Set root of mod tools (where bin, main and raw folders are).
rem Typically C:\Program Files\Activision\Call of Duty 4 - Modern Warfare
rem Do NOT include a trailing backslash!
set XDIR_TOOLS=C:\Program Files\Activision\Call of Duty 4 - Modern Warfare
rem ------------------------------------------------------------------
rem Set the name of the FF file. Do NOT include the extension ".ff"
rem If set to e.g. "mod", the "ff" folder must hold a file named "mod.csv".
set XNAME_FF=mod
rem ------------------------------------------------------------------
rem Set the name of the IWD file. Include the ".iwd" extension.
set XNAME_IWD=z_x4v3.iwd
rem ------------------------------------------------------------------
rem Enable (1) or disable (0) verbose mode.
rem Command line parameter /v will override this.
set XVERBOSE=1
rem ------------------------------------------------------------------
rem Enable (1) or disable (0) pausing after exec.
rem Command line parameter /p will override this.
set XPAUSE=1

rem ******************************************************************
rem DO NOT CHANGE ANYTHING BELOW THIS LINE
rem ******************************************************************
verify other 2>nul
setlocal enableextensions
if errorlevel 1 goto ERREXT

echo MAKEMOD.CMD -- revision 1.6
echo Created by PatmanSan (eXtreme+ Support Crew)
echo Please visit www.mycallofduty.com for updates and support.
echo.
echo Setting up environment ...
set XDIR_CUR=%~dp0%
set XDIR_FF=%XDIR_CUR%ff
set XDIR_IWD=%XDIR_CUR%iwd
set XNAME_FFL=%XNAME_FF%.ff
set XNAME_CSV=%XNAME_FF%.csv

:ARG
if "%1" == "" goto START
if "%1" == "/?" goto ARG_SYNTAX
if /I "%1" == "/v" goto ARG_VERBOSE_ON
if /I "%1" == "/v+" goto ARG_VERBOSE_ON
if /I "%1" == "/v-" goto ARG_VERBOSE_OFF
if /I "%1" == "/p" goto ARG_PAUSE_ON
if /I "%1" == "/p+" goto ARG_PAUSE_ON
if /I "%1" == "/p-" goto ARG_PAUSE_OFF
:ARG_NEXT
shift
goto ARG
:ARG_VERBOSE_ON
echo ... Verbose: ON
set XVERBOSE=1
goto ARG_NEXT
:ARG_VERBOSE_OFF
echo ... Verbose: OFF
set XVERBOSE=0
goto ARG_NEXT
:ARG_PAUSE_ON
echo ... Pause: ON
set XPAUSE=1
goto ARG_NEXT
:ARG_PAUSE_OFF
echo ... Pause: OFF
set XPAUSE=0
goto ARG_NEXT
:ARG_SYNTAX
echo.
echo Syntax: makemod.cmd [ /? /v[+/-] /p[+/-] ]
echo   /v or /v+ : verbose ON.
echo         /v- : verbose OFF (default).
echo   /p or /p+ : pause ON (default).
echo         /p- : pause OFF.
goto THEEND

:START
if %XVERBOSE%!==1! (
	set XLINK_ARG=-verbose -compress -cleanup
) else (
	set XLINK_ARG=-compress -cleanup
)	

:CHECK
echo Checking files and folders ...
if not exist ff\NUL goto ERRMOD
if not exist iwd\NUL goto ERRMOD
if not exist "%XDIR_TOOLS%\bin" goto ERRTLS
if not exist "%XDIR_TOOLS%\raw" goto ERRTLS
if not exist "%XDIR_TOOLS%\main" goto ERRMAIN
if not exist "%XDIR_TOOLS%\bin\linker_pc.exe" goto ERRLNK
if not exist "%XDIR_FF%\%XNAME_CSV%" goto ERRCSV
if exist "%XDIR_TOOLS%\bin\7za.exe" goto PREP
if not exist "%XDIR_CUR%7za.exe" goto ERR7ZA
copy /Y "%XDIR_CUR%7za.exe" "%XDIR_TOOLS%\bin" >NUL

:PREP
echo Preparing for launch ...
if exist "%XNAME_IWD%" del "%XNAME_IWD%"
if exist "%XNAME_FFL%" del "%XNAME_FFL%"
if exist "%XDIR_TOOLS%\main\xtemp.iwd" del "%XDIR_TOOLS%\main\xtemp.iwd"
if exist "%XDIR_TOOLS%\zone\english\%XNAME_FFL%" del "%XDIR_TOOLS%\zone\english\%XNAME_FFL%"

:MAKEIWD
echo Creating IWD file ...
for /D %%i in ("%XDIR_IWD%\*.*") do call :ADDTOIWD %%~ni
if not exist "%XDIR_CUR%%XNAME_IWD%" goto ERRIWD
copy /Y "%XDIR_CUR%%XNAME_IWD%" "%XDIR_TOOLS%\main\xtemp.iwd" >NUL

:MAKEFF
echo Copying raw files for fastfile ...
for /D %%i in ("%XDIR_FF%\*.*") do call :ADDTORAW %%~ni
copy /Y "%XDIR_FF%\%XNAME_CSV%" "%XDIR_TOOLS%\zone_source\" >NUL

echo Creating FF file ...
cd /D %XDIR_TOOLS%\bin
"%XDIR_TOOLS%\bin\linker_pc.exe" -language english %XLINK_ARG% %XNAME_FF%
cd /D %XDIR_CUR%
copy /Y "%XDIR_TOOLS%\zone\english\%XNAME_FFL%" "%XDIR_CUR%" >NUL

:CLEAN
echo Cleaning up ...
if exist "%XDIR_TOOLS%\main\xtemp.iwd" del "%XDIR_TOOLS%\main\xtemp.iwd"
set XDIR_TOOLS=
set XDIR_CUR=
set XDIR_FF=
set XDIR_IWD=
set XNAME_FF=
set XNAME_IWD=
set XNAME_FFL=
set XNAME_CSV=
set XVERBOSE=
endlocal
goto THEEND

:ADDTOIWD
if %XVERBOSE%!==1! (
	"%XDIR_TOOLS%\bin\7za" a -r -tzip %XNAME_IWD% "%XDIR_CUR%iwd\%1"
) else (
	"%XDIR_TOOLS%\bin\7za" a -r -tzip %XNAME_IWD% "%XDIR_CUR%iwd\%1" >NUL
)
goto :EOF

:ADDTORAW
if %XVERBOSE%!==1! (
	xcopy "%XDIR_CUR%ff\%1" "%XDIR_TOOLS%\raw\%1" /ISY
) else (
	xcopy "%XDIR_CUR%ff\%1" "%XDIR_TOOLS%\raw\%1" /ISY >NUL
)
goto :EOF

:ERREXT
echo.
echo ERROR: Unable to activate Script Command Extensions.
goto FORCEPAUSE

:ERRMOD
echo.
echo ERROR: Could not find "ff" and/or "iwd" folder
echo Please create a proper source structure prior to executing this script.
goto FORCEPAUSE

:ERRTLS
echo.
echo ERROR: Missing important folders in %XDIR_TOOLS%\
echo Please install or reinstall the mod tools prior to executing this script.
echo If the indicated path is wrong, edit the variable XDIR_TOOLS in this script.
goto FORCEPAUSE

:ERRMAIN
echo.
echo ERROR: Could not find "main" folder in %XDIR_TOOLS%\
echo Either install the mod tools in the COD4 installation folder, or
echo copy the "main" folder to %XDIR_TOOLS%.
echo If the indicated path is wrong, edit the variable XDIR_TOOLS in this script.
goto FORCEPAUSE

:ERRLNK
echo.
echo ERROR: Could not find linker_pc.exe in %XDIR_TOOLS%\bin\
echo Please install the mod tools prior to executing this script.
echo If the indicated path is wrong, edit the variable XDIR_TOOLS in this script.
goto FORCEPAUSE

:ERR7ZA
echo.
echo ERROR: Could not find 7za.exe in %XDIR_CUR%\bin\
echo or %XDIR_TOOLS%\bin\
echo Please copy it to one of these folders for general use.
echo If the indicated path is wrong, edit the variable XDIR_TOOLS in this script.
goto FORCEPAUSE

:ERRCSV
echo.
echo ERROR: Could not copy %XNAME_CSV% to %XDIR_TOOLS%\zone_source\
echo %XDIR_FF%\%XNAME_CSV% does not exist!
goto FORCEPAUSE

:ERRIWD
echo.
echo ERROR: Could not copy %XNAME_IWD% to %XDIR_TOOLS%\main\
echo %XDIR_CUR%%XNAME_IWD% does not exist!
goto FORCEPAUSE

:FORCEPAUSE
pause
goto :EOF

:THEEND
echo.
if %XPAUSE%!==1! pause
