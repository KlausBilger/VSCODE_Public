@ECHO Off
color 4e
cls 
ECHO.
ECHO.
ECHO ================================================
ECHO  **** PS und VS Code Default Konfiguration ****
ECHO ================================================
ECHO  1.) VS Code useful extensions
ECHO  2.) PowerShell Profil
ECHO  3.) VS Code Default Settings 
ECHO  4.) VS Code Global Snippets
ECHO ================================================
ECHO  **** to start the installation press space ***
ECHO  ****      for cancel press CTRL + C        ***
ECHO ================================================
pause >NUL
REM
REM
ECHO  starting the code extension installation.
ECHO  this may take a few seconds... please wait...
ECHO ================================================
for /f %%f in ('dir /b .\Files\CodeExtensions\*.vsix') do (call code --install-extension .\Files\CodeExtensions\%%f >NUL) 
REM 
REM
ECHO  starting to copy the PS and VS profil settings
ECHO  this may take a few seconds... 
ECHO ================================================
robocopy .\Files\PSConfig  %USERPROFILE%\Documents\WindowsPowerShell *.*  /E /R:5 /W:5 /NP /NJH /NJS /NS /NC /NFL /NDL  >nul
robocopy .\Files\VSCodeConfig %USERPROFILE%\AppData\Roaming\Code\User *.*  /E /R:5 /W:5 /NP /NJH /NJS /NS /NC /NFL /NDL >nul
ECHO  starting to copy the mssql tool.
ECHO  this may take a few seconds... 
ECHO ================================================
robocopy .\Files\mssql1.9.0 %USERPROFILE%\.vscode\extensions\ms-mssql.mssql-1.9.0\sqltoolsservice\1.9.0 *.*   /E /R:5 /W:5 /NJS /NS /NC /NFL /NDL >nul
REM
ECHO ================================================
ECHO ================================================
ECHO  **** PS und VS Code Default Konfiguration ****
ECHO  ****         Restart VS Code now.         ****
ECHO ================================================
ECHO ================================================
REM
pause
exit 0
