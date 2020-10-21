#!/bin/bash
#
# Run locust load test
#
#####################################################################
ARGS="$@"
HOST="${1}"
SCRIPT_NAME=`basename "$0"`
RATE_USERS=1
TARGET_HOST="$HOST"
CLIENTS=2
TIME_OUT=20


do_check() {

  # check hostname is not empty
  if [ "${TARGET_HOST}x" == "x" ]; then
    echo "TARGET_HOST is not set; use '-h hostname:port'"
    exit 1
  fi

  # check for locust
  if [ ! `command -v locust` ]; then
    echo "Python 'locust' package is not found!"
    exit 1
  fi

  # check locust file is present
  if [ -n "${LOCUST_FILE:+1}" ]; then
  	echo "Locust file: $LOCUST_FILE"
  else
  	LOCUST_FILE="locustfile.py" 
  	echo "Default Locust file: $LOCUST_FILE" 
  fi
}

do_exec() {
  sleep $INITIAL_DELAY

  # check if host is running
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" ${TARGET_HOST}) 
  if [ $STATUS -ne 200 ]; then
      echo "${TARGET_HOST} is not accessible"
      exit 1
  fi

  echo "Will run $LOCUST_FILE against $TARGET_HOST. Spawning $CLIENTS clients and the timeout is $TIME_OUT."
  locust -H http://$TARGET_HOST -r $RATE_USERS -f $LOCUST_FILE -u $CLIENTS --hatch-rate=5 -t $TIME_OUT --only-summary --headless
  echo "done"
}

do_usage() {
    cat >&2 <<EOF
Usage:
  ${SCRIPT_NAME} [ hostname ] OPTIONS

Options:
  -r  the rate per second for users respown
  -H  Target host url, e.g. http://localhost/
  -u  users (default 2)
  -t  timeout period (default 20)

Description:
  Runs a Locust load simulation against specified host.

EOF
  exit 1
}



while getopts ":r:H:u:t:" o; do
  case "${o}" in
    r)
        RATE_USERS=${OPTARG}
        #echo $RATE_USERS
        ;;
    H)
        TARGET_HOST=${OPTARG}
        #echo $TARGET_HOST
        ;;
    u)
        CLIENTS=${OPTARG:-2}
        #echo $CLIENTS
        ;;
    t)
        TIME_OUT=${OPTARG:-20}
        #echo $TIME_OUT
        ;;
    *)
        do_usage
        ;;
  esac
done


do_check
do_exec
