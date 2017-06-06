#!/bin/bash
# wait for the dock state to change
sleep 1
hdmi_laptop=$(cat /sys/class/drm/card0-HDMI-A-1/status)
dp1=$(cat /sys/class/drm/card0-DP-4/status)
dp2=$(cat /sys/class/drm/card0-DP-5/status)

if [ $dp1 = 'disconnected' ] && [ $dp2 = 'disconnected' ]; then
       xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-3 --off --output HDMI-2 --off --output HDMI-1 --off --output DP-3-1 --off --output DP-3-3 --off --output DP-3-2 --off --output DP-3 --off --output DP-2 --off --output DP-1 --off > /dev/null 2>&1
      elif [ $dp1 = 'connected' ] && [ $dp2 = 'connected' ]; then
	    if [ $hdmi_laptop = 'connected' ]; then
	    xrandr --output eDP-1 --off --output HDMI-3 --off --output HDMI-2 --off --output HDMI-1 --mode 1920x1080 --pos 3840x0 --rotate normal --output DP-3-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-3-3 --off --output DP-3-2 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-3 --off --output DP-2 --off --output DP-1 --off > /dev/null 2>&1
        else
            xrandr --output eDP-1 --off --output HDMI-3 --off --output HDMI-2 --off --output HDMI-1 --off --output DP-3-1 --primarya--mode 1920x1080 --pos 0x0 --rotate normal --output DP-3-3 --off --output DP-3-2 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-3 --off --output DP-2 --off --output DP-1 --off > /dev/null 2>&1
        fi
    fi
exit 0;
