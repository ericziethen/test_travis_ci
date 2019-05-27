#!/bin/bash

MODULE_NAME=eric
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_MAIN_DIR=$SCRIPT_PATH/..
PACKAGE_PATH=$PROJ_MAIN_DIR/$MODULE_NAME

echo SCRIPT_PATH: $SCRIPT_PATH
echo PROJ_MAIN_DIR: $PROJ_MAIN_DIR
echo MODULE_NAME: $MODULE_NAME
echo PACKAGE_PATH: $PACKAGE_PATH

export PYTHONPATH=$PYTHONPATH:$PACKAGE_PATH

# Can use to overwrite pytest.ini
# set PYTEST_ADDOPTS=""

echo PYTHONPATH: "$PYTHONPATH"

# Test directories are specified in Pytest.ini
pytest --cov-report term --cov=$PACKAGE_PATH
return_code=$?

if [[ $return_code -eq  0 ]];
then
    echo "*** No Issues Found"
else
    echo "*** Some Issues Found"
fi

exit $return_code
