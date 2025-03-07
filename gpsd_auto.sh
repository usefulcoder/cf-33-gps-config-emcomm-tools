#!/bin/bash

CMDTTY=/dev/ttyUSB0

case $1 in
start)
   echo "Starting GPS on $CMDTTY"
   printf 'AT!GPSTRACK=1,255,30,1000,1\r' > $CMDTTY
   ;;
restart)
   echo "Restarting GPS on $CMDTTY"
   printf 'AT!GPSEND=0\r' > $CMDTTY
   sleep 1
   printf 'AT!GPSTRACK=1,255,30,1000,1\r' > $CMDTTY
   ;;
stop)
   echo "Stopping GPS on $CMDTTY"
   printf 'AT!GPSEND=0\r' > $CMDTTY
   ;;
-h)
   echo "Program to control a Sierra Wireless MC5725's GPS module."
   echo "Usage: sgpsc (start|restart|stop)"
   ;;
*)
   echo "Incorrect syntax. Usage: sgpsc (start|restart|stop) or sgpsc -h"
   ;;
esac
