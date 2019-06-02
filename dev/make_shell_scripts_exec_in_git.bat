@echo off

setlocal

set SCRIPT_DIR=%~dp0
set FILE_ARG=%1

pushd %SCRIPT_DIR%

if ["%FILE_ARG%"]==[] (
    goto set_all_files
) else (
    goto set_one_file
)

:set_all_files
for /R %%I in ("*.sh") do (
    call:set_file_permission %%I"
)
goto end

:set_one_file
call:set_file_permission "%FILE_PATH%"
goto end

:set_file_permission
set FILE_PATH=%1
echo # Current Permissions for "%FILE_PATH%"
git ls-files --stage "%FILE_PATH%"
git update-index --chmod=+x "%FILE_PATH%"
echo # New Permissions for "%FILE_PATH%"
git ls-files --stage "%FILE_PATH%"
echo ########################################################################
echo[
goto:eof

:end
popd
endlocal
