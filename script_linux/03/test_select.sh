#! /bin/sh

select fichier in *
do
	echo "Num�ro : $REPLY"
	./test_fichier.sh $fichier
done
