#!/usr/bin/env bash

zoom_call_link="$1"
osascript ~/.scripts/close_notifications.scpt &>/dev/null
open -a zoom.us "$zoom_call_link"
