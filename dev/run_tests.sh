#!/bin/bash

BASEDIR=$(dirname "$0")
PROJ_MAIN_DIR=$BASEDIR/..

echo Dir before Push: "$PWD"

pushd $PROJ_MAIN_DIR

echo Dir after Push: "$PWD"

PACKAGE_ROOT=eric

export PYTHONPATH=${PYTHONPATH:+${PYTHONPATH}:}$PACKAGE_ROOT

echo PYTHONPATH: "$PYTHONPATH"

# Test directories are specified in Pytest.ini
pytest --cov-report term --cov=$PACKAGE_ROOT
pytest_rcode=$?
if [[ $pytest_rcode -eq  0 ]];
then
    echo "*** No Issues Found"
else
    echo "*** Some Issues Found"

fi

popd

exit $pytest_rcode
