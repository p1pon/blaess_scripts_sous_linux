#! /usr/bin/awk -f

BEGIN {
	premiere_famille = ""
}

/^[[:blank:]]*0.*INDI/ {
	# Enregistrement d'individu
	individu = $2
	famille = ""
}

/^[[:blank:]]*1[[:blank:]]*NAME/ {
	if (individu == "")
		next
	match ($0, "^[[:blank:]]*1[[:blank:]]*NAME[[:blank:]]*")
	nom [individu] = substr ($0, RSTART + RLENGTH)
}

/^[[:blank:]]*0.*FAM/ {
	# Enregistrement de famille
	famille = $2
	if (premiere_famille == "")
		premiere_famille = famille
	individu = ""
	epoux[famille] = -1
	epouse[famille] = -1
	nb_enfants[famille] = 0
}

/^[[:blank:]]*1[[:blank:]]*HUSB/ {
	if (famille == "")
		next
	epoux[famille] = $3
}

/^[[:blank:]]*1[[:blank:]]*WIFE/ {
	if (famille == "")
		next
	epouse[famille] = $3
}

/^[[:blank:]]*1[[:blank:]]*CHIL/ {
	if (famille == "")
		next
	nb_enfants[famille] ++;
	enfants[famille, nb_enfants[famille]] = $3
}

END {
	famille = premiere_famille
	saisie = ""
	do {
		trouve = 0
		if (tolower (substr (saisie, 1, 1)) == "p") {
			for (i in nb_enfants) {
				for (j = 1; j <= nb_enfants [i]; j ++)
					if (enfants[i, j] == epoux[famille]) {
						famille = i
						trouve = 1
						break
					}
				if (trouve)
					break
			}
		}
		else if (tolower (substr (saisie, 1, 1)) == "m") {
			for (i in nb_enfants) {
				for (j = 1; j <= nb_enfants [i]; j ++)
					if (enfants[i, j] == epouse[famille]) {
						famille = i
						trouve = 1
						break;
					}
				if (trouve)
					break
			}
		}
		else if ((saisie + 0 >= 1) && (saisie + 0 <= nb_enfants[famille])) {
			for (i in epoux)
				if (epoux[i] == enfants[famille, saisie + 0]) {
					famille = i
					trouve = 1
					break
				}
			if (! trouve)
				for (i in epouse) {
					if (epouse[i] == enfants[famille, saisie + 0]) {
						famille = i
					trouve = 1
						break;
					}
				}
		} else if (tolower (substr (saisie, 1, 1)) == "q") {
			break
		} else {
			printf "commandes :  P  -> déplacement vers le père\n"
			printf "             M  -> déplacement vers la mère\n"
			printf "            <n> -> déplacement vers l'enfant <n>\n"
			printf "             Q  -> quitter\n\n"
		}
		if (! trouve)
			printf "\a\a"
		affiche_famille(famille)
	} while ((getline saisie < "/dev/tty") > 0)
}

function affiche_famille (famille,     i)
{
	if (epoux[famille] != -1)
		printf nom[epoux[famille]]
	else
		printf "?"
	printf "  X  "
	if (epouse [famille] != -1)
		printf nom [epouse[famille]]
	else
		printf "?"
	printf "\n"
	for (i = 1; i <= nb_enfants [famille]; i ++)
		printf "  %d : %s\n", i, nom[enfants[famille, i]]
	printf "\n"
}
