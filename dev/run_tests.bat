@echo off

setlocal

set PROJ_MAIN_DIR=%~dp0..
set PACKAGE_ROOT=eric

set PYTHONPATH=%PYTHONPATH%;%PACKAGE_ROOT%

rem To see how to loop through multiple Command Line Arguments: https://www.robvanderwoude.com/parameters.php

rem Disable Unwanted tests when run from Travis
if "%1"=="travis-ci" (
    set PYTEST_ADDOPTS=-m "(not requests_html)"
)

pytest --rootdir="%PROJ_MAIN_DIR%" --cov="%PACKAGE_ROOT%"
set return_code=%errorlevel%
if %return_code% equ 0 (
    echo *** No Issues Found
    goto exit_ok
) else (
    echo *** Some Issues Found
    goto exit_error
)

rem Some pytest resources
rem https://hackingthelibrary.org/posts/2018-02-09-code-coverage/
rem https://code.activestate.com/pypm/pytest-cov/
rem https://docs.pytest.org/en/latest/usage.html
rem http://blog.thedigitalcatonline.com/blog/2018/07/05/useful-pytest-command-line-options/
rem https://www.patricksoftwareblog.com/python-unit-testing-structuring-your-project/

:exit_error
endlocal
echo exit /B 1
exit /B 1

:exit_ok
endlocal
echo exit /B 0
exit /B 0
