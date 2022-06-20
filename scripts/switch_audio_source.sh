#!/usr/bin/env bash

if [[ $(SwitchAudioSource -c) == "HDMI" ]]; then
  SwitchAudioSource -s "Scarlett Solo USB"
else
  SwitchAudioSource -s "HDMI"
fi
