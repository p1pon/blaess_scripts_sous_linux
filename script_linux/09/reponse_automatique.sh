#! /bin/sh

TMP=/tmp/FIC_$$

for FICHIER in "$@" ; do
	echo "Traitement fichier $FICHIER"

	# Extraire la ligne Reply-To du message
	REPONSE=$(sed -e '/^Reply-To:/q; /^From:/h; /./d;g;q' < $FICHIER)

	# Extraire l'adresse mail correcte
	ADRESSE=$(echo $REPONSE | sed -e 's/ *(.*)//; s/>.*//; s/.*[:<] *//')

	if [ -z "$ADRESSE" ] ; then
		echo "  Pas de correspondant indiqué"
		continue
	else
		echo "  Envoi d'un mail à $ADRESSE"
	fi
	
	./reponse_automatique.sed < $FICHIER > $TMP

	echo "-- " >> $TMP
	cat ~/.signature >> $TMP

	if false ; then
		mail $ADRESSE < $TMP
	else
		echo "  Contenu du message :"
		echo ""
		cat $TMP
	fi
	echo "---------------------------"	
done

rm -f $TMP
