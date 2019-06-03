#!/bin/bash

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_MAIN_DIR=$SCRIPT_PATH/..
TEST_SERVER_DIR=$PROJ_MAIN_DIR/tests/TestServerContent

pushd "$TEST_SERVER_DIR"
# --directory only available since Python 3.7
#python -m http.server --directory "$TEST_SERVER_DIR" --bind localhost 8000
python -m http.server --bind localhost 8000 &
popd
