#! /bin/ksh

FIFO_SRV=~/noms_ident.fifo
FIFO_CLT=~/fifo_$$.fifo

if [ -z "$1" ] ; then
	echo "Syntaxe : $0 identifiant" >&2
	exit 1
fi

if [ ! -p $FIFO_SRV ] ; then
	echo "Le serveur n'est pas accessible"
	exit 1
fi

mkfifo -m 0622 $FIFO_CLT
if [ ! -p $FIFO_SRV ] ; then
	echo "Impossible de créer la file ~/fifo_$$.fifo"
	exit 1
fi

echo "$1 $FIFO_CLT" > $FIFO_SRV
cat < $FIFO_CLT
rm -f $FIFO_CLT
