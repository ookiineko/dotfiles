@ECHO off
GOTO start
:find_dp0
SET dp0=C:\msys64\mingw64\lib
EXIT /b
:start
SETLOCAL
CALL :find_dp0

IF EXIST "%dp0%\..\bin\node.exe" (
  SET "_prog=%dp0%\..\bin\node.exe"
) ELSE (
  SET "_prog=node"
  SET PATHEXT=%PATHEXT:;.JS;=;%
)

endLocal & goto #_undefined_# 2>NUL || title %COMSPEC% & "%_prog%"  "%dp0%\node_modules\typescript-language-server\lib\cli.mjs" %*
