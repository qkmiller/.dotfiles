#!/bin/bash

ison="$(pacmd list-modules | grep 'name: <module-tunnel-sink-new>')"
if [ "$1" == on ]
then
  if [ "$ison" != "" ]
  then
    echo "Audio streaming already enabled"
  else
    pacmd "load-module module-tunnel-sink-new sink_name=livingroom format=float32le rate=44100 server=$PASERVER"
    pacmd 'set-default-sink livingroom'
  fi
elif [ "$1" == off ]
then
  if [ "$ison" == "" ]
  then
    echo "Audio streaming already disabled"
  else
    pacmd 'unload-module module-tunnel-sink-new'
  fi
else
  echo "Stream all sound to a PulseAudio server on your network."
  echo "Example:"
  echo "streamaudio [on/off]"
  echo "To change the server address, export \$PASERVER in your bash/zshrc."
  echo "Example:"
  echo "export PASERVER=193.168.0.57"
fi
