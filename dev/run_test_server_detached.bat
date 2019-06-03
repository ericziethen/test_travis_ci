@echo off

setlocal

set PROJ_MAIN_DIR=%~dp0..
set TEST_SERVER_DIR=%PROJ_MAIN_DIR%\tests\TestServerContent

pushd "%TEST_SERVER_DIR%"
rem  --directory only available since Python 3.7
rem python -m http.server --directory "$TEST_SERVER_DIR" --bind localhost 8000
start "python_test_server" python -m http.server --bind localhost 8000
popd
