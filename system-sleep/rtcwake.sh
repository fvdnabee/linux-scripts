#!/bin/sh
# This script will wake the computer from suspend at a pre-defined time.
# The script relies on the DE (gnome) to suspend the system again.
# Alternatively, this scipt can suspend the system after one hour if the system
# was awoken by rtcwake, see notes below.
WAKETIME="11:58:00"

case $1/$2 in
  pre/*)
    # echo "Going to $2..."

		# Disable any alarm set previously:
		rtcwake -m disable

		# Set wake_time to two minutes before when clients will initiate backups:
		echo "Setting wake up from suspend at $WAKETIME before going to $2"
    rtcwake --date $WAKETIME
    ;;
  post/*)
    # echo "Waking up from $2..."

		# If we woke from rtcwake, then suspend again after one hour.
		# Note gnome will also suspend my system after one hour of being idle.
		rtcwake_output="$(rtcwake -m show)"

		if [[ $rtcwake_output == "alarm: off"* ]] ;
		# True if $rtcwake_output starts with a "alarm: off"
		# -> system awoken by rtcwake
		then
			:
			# sleep 1h && systemctl suspend
			## Note: while sleep is waiting the system can not be suspended.
			## TODO: is this true?
		fi
    ;;
esac
