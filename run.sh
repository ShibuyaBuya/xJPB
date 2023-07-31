#!/bin/bash
# check if wget is installed
source ./bin/log.sh
source ./dev/def
source ./dev/usr.sh
echo "----begin of script----"
log_begin "run"
# check if folder dev exists
if [ -d  "dev" ]; then
    log_info "Skip. $EXISTS"
else
    log_error "dev folder does not exist, so creating dev"
    mkdir dev
fi

echo "You can see the log in cache/log.txt"
log_end "run"
echo "----end of script----"