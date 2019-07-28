#!/bin/bash

TOUCHPADID=`xinput list --name-only | grep -i synaptics` #change this name based on your device
iconEnabled='input-touchpad-symbolic'
iconDisabled='touchpad-disabled-symbolic'

SYNSTATE=$(xinput list-props "$TOUCHPADID" | grep "Device Enabled" | grep -Eo '.$')
if [ $SYNSTATE = 0 ]; then 
	notify-send --icon=$iconEnabled "Touchpad [ON]" "Your touchpad is now enabled"
	xinput set-prop "$TOUCHPADID" "Device Enabled" 1
else
	notify-send --icon=$iconDisabled "Touchpad [OFF]" "Your touchpad is now disabled"
	xinput set-prop "$TOUCHPADID" "Device Enabled" 0
fi

#im using synaptic here
#so if you using other touchpad driver change that synaptic to your driver
