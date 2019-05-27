#!/bin/bash

#########################################
##### START OF FUNCTION DEFINITIONS #####
#########################################
run_linter () {
    local linter_name=$1
    local linter_script=$2

    echo "### LINTER START - '$linter_script' ###"
    $linter_script
    local return_code=$?

    if [[ $return_code -eq  0 ]];
    then
        echo "   No Issues"
    else
        echo "   Issues Found"
        ERROR_FOUND=true
        ERROR_LIST+=" $linter_name"
    fi
    echo "### LINTER END - '$linter_script' ###"
}
#######################################
##### END OF FUNCTION DEFINITIONS #####
#######################################

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
LINTER_DIR=$SCRIPT_PATH/Linting

echo SCRIPT_PATH: $SCRIPT_PATH
echo LINTER_DIR: $LINTER_DIR

ERROR_FOUND=false
ERROR_LIST=''

echo "### Start Linting ###"
run_linter "Bandit"        "%LINTER_DIR%\RunBandit.bat"
run_linter "MyPy"          "%LINTER_DIR%\RunMyPy.bat"
run_linter "Pycodestyle"   "%LINTER_DIR%\RunPycodestyle.bat"
run_linter "Pydocstyle"    "%LINTER_DIR%\RunPydocstyle.bat"
run_linter "Pylint"        "%LINTER_DIR%\RunPylint.bat"
echo "### Linting finished ###"

if [ "$ERROR_FOUND" = true ];
then
    echo "!!! NO LINTING ISSUE FOUND"
    exit 0
else
    echo "!!! CHECK OUTPUT, SOME LINTING ISSUE FOUND WITH"
    for value in $ERROR_LIST
    do
        echo "  - %%value"
    done
    exit 1
fi
