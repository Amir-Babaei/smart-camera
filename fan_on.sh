#!/bin/bash

#sudo su
echo 398 > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio398/direction
echo 0 > /sys/class/gpio/gpio398/value
