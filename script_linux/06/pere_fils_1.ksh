#! /bin/ksh

if [ "$MON_PID" != "$PPID" ] ; then
	# Processus P�re
	export MON_PID=$$
	echo "PERE : mon PID est $$"
	echo "PERE : je lance un fils"
	$0 &
	sleep 1
	echo "PERE : le PID de mon fils est $!"
	echo "PERE : je me termine"
else
	# Processus FILS
	echo "FILS : mon PID est $$, celui de mon p�re est $PPID"
	sleep 1
	echo "FILS : je me termine"
fi
