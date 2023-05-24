#!/usr/bin/env bash

headphones_output_name="Scarlett Solo USB"
if test -f "$HOME/.is_personal_computer"; then
  speakers_output_name="HDMI"
else
  speakers_output_name="DELL U2715H"
fi

if [[ $(SwitchAudioSource -c) == "$speakers_output_name" ]]; then
  SwitchAudioSource -s "$headphones_output_name"
else
  SwitchAudioSource -s "$speakers_output_name"
fi
