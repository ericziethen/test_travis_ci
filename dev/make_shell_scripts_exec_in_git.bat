@echo off

setlocal

set SCRIPT_DIR=%~dp0

pushd %SCRIPT_DIR%

for /R %%I in ("*.sh") do (
    echo # Current Permissions for "%%I"
    git ls-files --stage "%%I"
    git update-index --chmod=+x "%%I"
    echo # New Permissions for "%%I"
    git ls-files --stage "%%I"
    echo ########################################################################
    echo[
)

popd

endlocal

