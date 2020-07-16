@ECHO Off
color 4e
cls 
ECHO.
ECHO.
ECHO ================================================
ECHO  ****      PS und VS Code CleanUP           ****
ECHO  ****   Caution - you are cleaning up       ****
ECHO ================================================
ECHO  1.) VS Code useful extensions
ECHO  2.) PowerShell Profil
ECHO  3.) VS Code Default Settings 
ECHO  4.) VS Code Global Snippets
ECHO ================================================
ECHO  ****   to start the cleanup press space   ****
ECHO  ****      for cancel press CTRL + C       ****
ECHO ================================================
pause >NUL
REM
REM
ECHO  starting the code extension installation.
ECHO  this may take a few seconds... please wait...
RD %USERPROFILE%\Documents\WindowsPowerShell /S /Q  2>nul
RD %USERPROFILE%\AppData\Roaming\Code  /S /Q  2>nul
RD %USERPROFILE%\.vscode /S /Q 2>nul

REM
REM
REM
Exit 0 



