REM 
@ECHO OFF
cls 
color 4e 
ECHO.
ECHO.
ECHO.
ECHO %~dp0Files
for /f %%f in ('dir /b .\*.vsix') do code --install-extension %%f 

exit /b 0





