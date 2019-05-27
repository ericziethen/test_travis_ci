#!/bin/bash

BASEPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASEDIR=$(dirname "$0")
PROJ_MAIN_DIR=$BASEPATH/..
PACKAGE_ROOT=eric
PACKAGE_PATH=$PROJ_MAIN_DIR/$PACKAGE_ROOT

echo BASEPATH: $BASEPATH
echo BASEDIR: $BASEDIR
echo PROJ_MAIN_DIR: $PROJ_MAIN_DIR

echo Dir before Push: "$PWD"

pushd "$PROJ_MAIN_DIR"
echo EC: $?

echo Dir after Push: "$PWD"


export PYTHONPATH=${PYTHONPATH:+${PYTHONPATH}:}$PACKAGE_PATH

echo PYTHONPATH: "$PYTHONPATH"

# Test directories are specified in Pytest.ini
pytest --cov-report term --cov=$PACKAGE_PATH
pytest_rcode=$?

if [[ $pytest_rcode -eq  0 ]];
then
    echo "*** No Issues Found"
else
    echo "*** Some Issues Found"

fi

popd

exit $pytest_rcode
