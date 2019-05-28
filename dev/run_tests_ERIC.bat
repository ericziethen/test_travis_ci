@echo off

setlocal

set PROJ_MAIN_DIR=%~dp0..

rem pushd %PROJ_MAIN_DIR%

set PACKAGE_ROOT=eric

set PYTHONPATH=%PYTHONPATH%;%PACKAGE_ROOT%

rem Can use to overwrite pytest.ini
rem set PYTEST_ADDOPTS=""

pytest --cov-report term --cov=%PACKAGE_ROOT%
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
exit /B 1

:exit_ok
endlocal
exit /B 0
