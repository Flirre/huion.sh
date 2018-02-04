#!/bin/bash
# huion.sh
# Binds the Huion Tablet to my primary monitor. If no tablet is found, nothing is shown.

monitors=`xrandr | grep primary`
primaryMonitor=`echo $monitors | grep -o '^\S*'`

penLine=`xinput list | grep "Pen Pen"`
idLocation=`expr index "$penLine" id`
id=`echo ${penLine:idLocation+2:2}`

if [ "$id" != "" ]
then `xinput map-to-output $id $primaryMonitor`
fi
