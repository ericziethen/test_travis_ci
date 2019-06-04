@echo off

setlocal

rem DON'T CHANGE, ALSO USED FOR KILLING
set SERVER_WINDOW_NAME=python_test_server

tasklist /FI "WindowTitle eq %SERVER_WINDOW_NAME%"

echo Command: 'taskkill /F /FI "WindowTitle eq %SERVER_WINDOW_NAME%"'
taskkill /F /FI "WindowTitle eq %SERVER_WINDOW_NAME%"

:end
endlocal
