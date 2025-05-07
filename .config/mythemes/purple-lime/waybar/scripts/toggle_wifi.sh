#!/bin/bash

wifi_status="$(nmcli radio wifi)"

if [[ $wifi_status == "enabled" ]]; then
    nmcli radio wifi off
fi

if [[ $wifi_status == "disabled" ]]; then
    nmcli radio wifi on
fi
