#!/bin/bash

BASEDIR=$(dirname "$0")
PROJ_MAIN_DIR=$BASEDIR/..

pushd $PROJ_MAIN_DIR

PACKAGE_ROOT=eric

export PYTHONPATH=${PYTHONPATH:+${PYTHONPATH}:}$PACKAGE_ROOT

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
