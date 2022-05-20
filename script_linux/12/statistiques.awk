#! /usr/bin/awk -f

BEGIN {	for (i = 1; i <= 31; i ++)
		evt_par_jour_mois [i] = 0
	for (i = 1; i <= 7; i ++)
		evt_par_jour_semaine [i] = 0
	for (i = 0; i <= 23; i ++)
		evt_par_heure [i] = 0;
}

NF == 0 { next }

{	chaine_date_heure = strftime ("%e %u %k", $1)
	split (chaine_date_heure, table_date_heure)
	evt_par_jour_mois	[table_date_heure [1]] ++
	evt_par_jour_semaine	[table_date_heure [2]] ++
	evt_par_heure		[table_date_heure [3]] ++
}

END {	printf "Nombre d'évènements par jour du mois :\n"
	affiche_repartition(evt_par_jour_mois, 1, 31, 10)
	printf "Nombre d'évènements par jour de semaine :\n"
	affiche_repartition(evt_par_jour_semaine, 1, 7, 10)
	printf "Nombre d'évènements par heure :\n"
	affiche_repartition(evt_par_heure, 0, 23, 10)
}

function affiche_repartition (tableau, debut, fin, nb_lignes,
	max, i, j, quotient)
{
	max = 0
	for (i = debut; i <= fin; i ++)
		if (tableau [i] > max)
			max = tableau [i]
	quotient = max / nb_lignes
	for (j = nb_lignes; j > 0; j --) {
		printf "%6d ", j * quotient
		for (i = debut; i <= fin; i ++)	
			if (j * quotient <= tableau [i])
				printf "##"
			else
				printf "  "
		printf "\n"
	}
	printf "       " 
	for (i = debut; i <= fin; i ++)
		if ((i - debut) % 2 == 0)
			printf "%02d  ", i
	printf "\n\n"
}
