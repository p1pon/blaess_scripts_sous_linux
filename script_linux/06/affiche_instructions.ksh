#! /bin/ksh

function gestionnaire_DEBUG
{
	echo "Ligne ex�cut�e : $LINENO"
}

trap gestionnaire_DEBUG DEBUG

	echo 1
	sleep 1
	echo 2
	sleep 1
	echo 3
	sleep 1
	echo 4
	sleep 1
	echo 5
	sleep 1
