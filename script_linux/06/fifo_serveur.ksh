#! /bin/ksh

# Passage en mode démon
if [ "$MON_PID" != "$PPID" ] ; then
	export MON_PID=$$
	MON_LISTING=$(cat $0)
	cd /
	setsid /bin/bash -c "$MON_LISTING" "$0" "$@" 0<&- 1>&- 2>&- &
	logger -t $(basename $0) "Le PID du demon est $!"
	echo "Le PID du démon est $!" >& 2
	exit 0
fi

FIFO_SRV=~/noms_ident.fifo

function gestionnaire_signaux
{	
	rm -f $FIFO_SRV
	exit 0;
}
trap gestionnaire_signaux EXIT QUIT INT HUP

if [ -e $FIFO_SRV ] ; then
	echo "FIN" > $FIFO_SRV &
	exit 0;
fi

mkfifo -m 0622 $FIFO_SRV
if  [ ! -p $FIFO_SRV ] ; then
	echo "Impossible de créer la file FIFO $FIFO_SRV"
	exit 1
fi

FIN=""
while [ ! $FIN ] ; do
	read IDENT FIFO_CLT < $FIFO_SRV

	TROUVE=""
	exec < /etc/passwd
	ANCIEN_IFS="$IFS"
	IFS=":"
	while read ident passe uid gid nom reste ; do
		if [ "$IDENT" == "$ident" ] ; then
			TROUVE="Oui"
			break
		fi
	done
	IFS=$ANCIEN_IFS
	
	if [ "$IDENT" == "FIN" ] ; then
		FIN="Oui"
		TROUVE="Oui"
		nom="Fin du serveur"
	fi
	if [ $TROUVE ] ; then
		echo "$nom" > $FIFO_CLT
	else
		echo "Non trouvé"  > $FIFO_CLT
	fi
done

