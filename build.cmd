@echo off

cd /d "%~dp0src"

set CGO_ENABLED=1
set CC=x86_64-w64-mingw32-gcc
set GOOS=windows
set GOARCH=amd64

echo Building Windows AMD64...

go build -ldflags="-s -w" -o windows-amd64.exe .

if %ERRORLEVEL% NEQ 0 (
    echo Build failed!
    exit /b %ERRORLEVEL%
)

echo Build completed successfully.
echo Output: %CD%\windows-amd64.exe