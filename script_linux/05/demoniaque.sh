#! /bin/sh

if [ "$MON_PID" != "$PPID" ] ; then
	export MON_PID=$$
	MON_LISTING=$(cat $0)
	cd /
	setsid /bin/bash -c "$MON_LISTING" "$0" "$@" 0<&- 1>&- 2>&- &
	logger -t $(basename $0) "Le PID du demon est $!"
	echo "Le PID du d�mon est $!" >& 2
	exit 0
fi

# D�but du d�mon proprement dit

	sleep 30

