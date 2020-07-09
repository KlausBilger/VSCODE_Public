@ECHO Off
color 4e
cls 
ECHO.
ECHO.
ECHO ================================================
ECHO  ***       VS Code and Git Installation     ***
ECHO ================================================
ECHO  1.) VS Code installation 
ECHO  2.) GIT 
ECHO  3.) Git Extension for Windows 
ECHO ================================================
ECHO  **** to start the installation press space ***
ECHO  ****      for cancel press CTRL + C        ***
ECHO ================================================
ECHO.
ECHO.
Pause >NUL
REM
REM
ECHO launching the installation, source Dir = %~dp0
REM
start /wait %~dp0Files\Source\VSCodeSetupx64.exe /VERYSILENT /NORESTART /mergetasks=!runcode /CLOSEAPPLICATIONS
REM 
start /wait %~dp0Files\Source\Git64.exe /VERYSILENT /NORESTART /NOCANCEL /CLOSEAPPLICATIONS /LOADINF=git.inf
REM
msiexec /i %~dp0Files\Source\GitExtensions.msi /Qb!
REM
ECHO.
ECHO.
ECHO ================================================
ECHO ================================================
ECHO  **** PS und VS Code Default Konfiguration ****
ECHO  ****     please restart the machine now.  ****
ECHO ================================================
REM
exit 0

