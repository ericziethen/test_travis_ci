@echo off

setlocal

set PROJ_MAIN_DIR=%~dp0..
set TEST_SERVER_DIR=%PROJ_MAIN_DIR%\tests\TestServerContent

python -m http.server --directory "%TEST_SERVER_DIR%" --bind localhost 8000
