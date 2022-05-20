#! /bin/ksh

if [ "$MON_PID" = "$PPID" ] ; then
	# Processus FILS
	echo "FILS : mon PID est $$, celui de mon père est $PPID"
	echo "FILS : je me termine avec le code 14"
	exit 14
else
	# Processus Père
	export MON_PID=$$
	echo "PERE : mon PID est $$"
	echo "PERE : je lance un fils"
	$0 &
	echo "PERE : mon fils a le PID $!"
	echo "PERE : j'attend la fin de mon fils"
	wait $!
	echo "PERE : mon fils s'est terminé avec le code $?"
fi
