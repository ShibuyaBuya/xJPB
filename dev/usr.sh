#!/bin/bash
source ./dev/def
function usr(){
    user=$1
    password=$2
    if [ -z "$user"]; then
        echo "usr: error: $REQUIRED is $REQUIRED_EMPTY"
        return $REQUIRED_EMPTY
    fi
}