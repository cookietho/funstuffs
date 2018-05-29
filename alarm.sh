#!/bin/bash

function force_volume() {
	while [ true ]; do
		osascript -e "set Volume 10"
		sleep 0.5
	done
}

function shame() {
	force_volume &
	while [ true ]; do
		say -v Kyoko "You left your computer unlocked. 恥ずかしい. 恥ずかしい. 恥ずかしい. 恥ずかしい. 恥ずかしい. 恥ずかしい. 恥ずかしい. 恥ずかしい."
	done
}

function activate() {
	while [ true ]; do
		IDLE_TIME=$(ioreg -c IOHIDSystem | awk '/HIDIdleTime/ {print $NF/1000000000; exit}')
		SHOULD_EXIT=$(echo "$IDLE_TIME < 2" | bc -l)
		if [ $SHOULD_EXIT -eq 1 ]; then
			break
		fi
		sleep 1
	done
	sleep 120
	shame
}

sleep 5
echo "Activate"
activate & >/dev/null 2>&1
