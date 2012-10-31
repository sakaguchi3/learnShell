#!/bin/sh -x

# =====================================================
# Copyright (C) 2021 sakaguchi3(https://github.com/sakaguchi3/learnShell)
# License: Apache License, Version 2.0
# 
# version: 1.0 
# =====================================================


# -----------------------------------------------
# variables
# -----------------------------------------------

SHELL="/home/work/scripts/lock"
LOCK_FILE="${SHELL}/lockfile.lock"

# -----------------------------------------------
# func
# -----------------------------------------------


lock() {
	exec 9>${LOCK_FILE}
	flock -n 9 

	if [ $? -ne 0 ]; then
		# fail
		echo "[ERROR]already lock"
		exit 1
	fi
	
	# success 

	what_you_want_to_do
}

what_you_want_to_do(){
	echo "[INFO]wait"
	sleep 10s
	echo "[INFO]success" 
}




# -----------------------------------------------
# run prog
# ----------------------------------------------- 

lock


DATETIME=`date --date="now +1hours" "+%Y-%m-%d %H:%M:%S"`
echo "[${DATETIME}] stop prog -------------------------------------------------"
