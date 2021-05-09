#!/bin/bash

if [ "$1" == post ]; then
	backlight=$(brightnessctl get);
	if [ "$backlight" -lt "10" ]; then
		brightnessctl set 10
	fi
fi
