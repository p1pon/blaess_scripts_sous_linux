#! /bin/sh

select fichier in *
do
	echo "Numéro : $REPLY"
	./test_fichier.sh $fichier
done
