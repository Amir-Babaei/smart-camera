#!/bin/bash
 
temp=$(cat /sys/devices/virtual/thermal/thermal_zone0/temp)
maxtemp=40
mintemp=35
timed=$(date +"%T")
 
#set the debug to 1 to populate fanlog.txt (in Home directory)
debug=0;
 
 
 
 
 
 
if [ ! -f "/sys/class/gpio/gpio398/value" ]
then
    echo 398 > /sys/class/gpio/export
    echo "out" > /sys/class/gpio/gpio398/direction
    echo 0 > /sys/class/gpio/gpio398/value   
fi
 
val=$(cat /sys/class/gpio/gpio398/value)
 
if [ $val -eq 0 ]
then
    if [ $debug -eq 1 ]
    then
        echo "$timed fan is: on     temp: $((temp / 1000)) "  >> /home/nvidia/fanlog.txt
    fi
    logger "fan is on"
elif [ $val -eq 1 ]
then
    if [ $debug -eq 1 ]
    then
        echo "$timed fan is: off     temp: $((temp / 1000)) "  >> /home/nvidia/fanlog.txt
    fi
    logger "fan is off"
fi
 
 
if [ $((temp / 1000)) -gt $maxtemp ] 
then
    echo 0 > /sys/class/gpio/gpio398/value
    logger "fan is turned on"
elif [ $((temp / 1000)) -lt $mintemp ]
then
    echo 1 > /sys/class/gpio/gpio398/value
    logger "fan turned off"
fi

