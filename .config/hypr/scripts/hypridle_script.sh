#!/bin/bash

CHASSIS=$(hostnamectl chassis)

if [ "$CHASSIS" == "laptop" ] ; then
    hypridle -c $HOME/.config/hypr/hypridle_laptop.conf
else
    hypridle
fi
