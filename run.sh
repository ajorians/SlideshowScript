#!/bin/bash

MEDIAPATH=/mnt/photos/*

TIME=$(date +%H%M)
if [ $TIME -eq 0300 ]; then
   echo "Killing pqiv to start fresh"
   killall pqiv
   sleep 10
fi

for pid in $(pidof -x pqiv); do
    if [ $pid != $$ ]; then
        echo "[$(date)] : pqiv : Process is already running with PID $pid"
        exit 1
    fi
done

pqiv --slideshow-interval=10 --slideshow --display=:0 --fullscreen --hide-info-box $MEDIAPATH & 

#qiv --display :0 --slide --delay 5 --fullscreen --scale_down --no_statusbar $MEDIAPATH 

#viewnior --slideshow --fullscreen --display=:0 $MEDIAPATH 


