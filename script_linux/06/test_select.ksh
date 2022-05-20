#! /bin/ksh

select fichier in *
do
	echo "Numéro : $REPLY"
	./test_fichier.ksh $fichier
done
