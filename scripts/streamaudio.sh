#!/bin/bash

ison="$(pacmd list-modules | grep 'name: <module-tunnel-sink-new>')"
if [ "$1" == on ]
then
  if [ "$ison" != "" ]
  then
    echo "Audio streaming already enabled"
  else
    pacmd "load-module module-tunnel-sink-new sink_name=livingroom format=s16 rate=44100 server=$PASERVER"
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
  echo "Stream your system's audio to a remote PulseAudio server."
  echo "Usage:  streamaudio [on | off]"
  echo "    e.g., you@yourhost\$ streamaudio on"
  echo "          you@yourhost\$ streamaudio off"
  echo "To change the server address, add 'export \$PASERVER={address}' to your .bashrc/.zshrc."
  echo "    e.g., you@yourhost\$ echo 'export PASERVER=193.168.0.57' >> ~/.bashrc"
  echo "On the remote server, use pacmd to load the tcp module and authorize a single"
  echo "IP address, a range of IP addresses, or all IP adresses."
  echo "    e.g., you@yourhost\$ pacmd load-module module-native-protocol-tcp auth-ip-acl=172.225.0.95"
  echo "    e.g., you@yourhost\$ pacmd load-module module-native-protocol-tcp auth-anonymous=true"
fi
