#! /bin/ksh

select fichier in *
do
	echo "Num�ro : $REPLY"
	./test_fichier.ksh $fichier
done
