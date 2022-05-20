#! /bin/sh

function gestionnaire_QUIT
{
	echo "Signal SIGQUIT reçu"
}

trap gestionnaire_QUIT QUIT

echo "Mon PID est $$"

for i in $(seq 1 10) ; do
	echo "$i"
	sleep 3 &
	wait
done


