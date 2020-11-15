#!/bin/bash

# Use xinput by itself to get the devices.
# Use xinput list-props to get the device properties.
# The first two numbers following set-prop are the device ID
#   and the property ID.
# Set the last float in the Coordinate Transformation Matrix
#   higher to have lower sens and lower to have higher sens.
xinput set-prop 13 149 1 0 0 0 1 0 0 0 1.6

# 293 claims to be the accel amount 
#   but acts as a second sensitivity setting.
xinput set-prop 13 293 0
