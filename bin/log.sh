#!/bin/bash
LOG_FILE="cache/log.txt"
if [ ! -d "cache" ]; then
    mkdir cache
fi


function log_begin(){
    if [ -f $LOG_FILE ]; then
        rm $LOG_FILE
    fi
    touch $LOG_FILE
    echo "----begin of $1----" >> $LOG_FILE
}
function log_info(){
    output="INFO: $1"
    echo $output >> $LOG_FILE
    echo $output
}
function log_error() {
    output="ERROR: $1"
    echo $output >> $LOG_FILE
    echo $output
}
function log_end() {
    echo "----end of $1----" >> $LOG_FILE
}