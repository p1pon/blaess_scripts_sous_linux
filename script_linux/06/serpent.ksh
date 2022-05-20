#! /bin/ksh

	set -o nounset

function serpent {
	initialisation_jeu
	boucle_jeu
	fin_jeu
}


function initialisation_jeu {

	nb_oeufs=0
	nb_mouvements=0

	if ! tput init ; then
		echo "Impossible d'initialiser le terminal"
		exit 1
	fi
	nb_colonnes=$(tput cols)
	nb_lignes=$(tput lines)
	nb_lignes=$(($nb_lignes - 1)) # on utilisera la dernière ligne pour le score
	if  [ $nb_lignes -lt 5 -o $nb_colonnes -lt 5 ] ; then
		echo "Le terminal est trop petit"
		exit 1
	fi
	tput clear	# Effacement de l'écran
	tput civis	# Curseur invisible

	# Lecture des caractères sans retour-chariot
	stty -icanon -echo time 1 min 0
	HAUT=$(echo -e "\033[A\n")
	BAS=$(echo -e "\033[B\n")
	GAUCHE=$(echo -e "\033[D\n")
	DROITE=$(echo -e "\033[C\n")

	# On crée un serpent avec déjà 3 points
	x=$(($nb_colonnes / 2))
	y=$(($nb_lignes / 2))
	x_serpent[0]=$x; 	  y_serpent[0]=$y
	x_serpent[1]=$(($x + 1)); y_serpent[1]=$y
	x_serpent[2]=$(($x + 2)); y_serpent[2]=$y

	# Déplacement horizontal vers la gauche	
	dx=-1 ; dy=0
	ajoute_oeuf
}


function boucle_jeu {
	while true ; do
		# Dessiner la tête
		tput cup $y_serpent[0] $x_serpent[0]
		echo -n "@"
	
		read
		case $REPLY in
			$HAUT   | u) dx=0;  dy=-1 ;;
			$BAS    | n) dx=0;  dy=1  ;;
			$GAUCHE | h) dx=-1; dy=0  ;;
			$DROITE | j) dx=1;  dy=0  ;;
			q) return ;;
			*) ;;
		esac
		# Remplacer l'ancienne tête par un élément du corps
		tput cup $y_serpent[0] $x_serpent[0]
		echo -n "#"
		
		nb_points=${#x_serpent[*]}
		i=$(($nb_points - 1))
		x_queue=${x_serpent[$i]}
		y_queue=${y_serpent[$i]}
		# Faire glisser le corps
		while [ $i -gt 0 ] ; do
			x_serpent[$i]=${x_serpent[$(($i - 1))]}
			y_serpent[$i]=${y_serpent[$(($i - 1))]}
			i=$(($i - 1))
		done
		# Le serpent se mange-t-il ?
		x_tete=$((${x_serpent[0]} + $dx))
		y_tete=$((${y_serpent[0]} + $dy))
		if dans_serpent $x_tete $y_tete ; then
			return
		fi
		# Heurte-t-on un mur ?
		if [ $x_tete -ge $nb_colonnes ] || [ $x_tete -lt 0 ] ; then
			return
		fi
		if [ $y_tete -ge $nb_lignes ] || [ $y_tete -lt 0 ] ; then
			return
		fi
		# La nouvelle position de la tête est correcte
		x_serpent[0]=$x_tete
		y_serpent[0]=$y_tete
		nb_mouvements=$(($nb_mouvements + 1))
		# Le serpent mange-t-il l'oeuf ?
		if [ $x_tete -eq $xoeuf ] && [ $y_tete -eq $yoeuf ] ;  then
			nb_oeufs=$(($nb_oeufs + 1))
			ajoute_oeuf
			# On allonge le serpent
			x_serpent[$nb_points]=$x_queue
			y_serpent[$nb_points]=$y_queue
		else
			# Sinon on efface l'ancienne queue
			tput cup $y_queue $x_queue
			echo -n " "
		fi
		tput cup $nb_lignes 1
		echo -n "Mouvements : " $nb_mouvements ", Oeufs avalés : " $nb_oeufs ". "
	done
}


function fin_jeu {
	tput reset	# Réinitialisation écran
	stty sane	# Réinitialisation clavier
	clear		# Effacement écran
	echo "Mouvements : " $nb_mouvements ", Oeufs avalés : " $nb_oeufs ". "
}


function ajoute_oeuf {
	# Cette routine ajoute un oeuf à une position aléatoire,
	# en vérifiant qu'il ne soit pas sur le corps du serpent.
	xoeuf=$(($RANDOM / (32767 / $nb_colonnes)))
	yoeuf=$(($RANDOM / (32767 / $nb_lignes)))
	while dans_serpent $xoeuf $yoeuf ; do
		xoeuf=$(($RANDOM / (32767 / $nb_colonnes)))
		yoeuf=$(($RANDOM / (32767 / $nb_lignes)))
	done	
	tput cup $yoeuf $xoeuf
	echo -n "o"
}


function dans_serpent {
	# Cette fonction vérifie si les coordonnées X / Y
	# transmises en argument sont sur le corps du serpent.
	local i
	i=$((${#x_serpent[*]} - 1))
	while [ $i -ge 0 ] ; do
		if [ $1 -eq ${x_serpent[$i]} ] && [ $2 -eq ${y_serpent[$i]} ] ; then
			return 0
		fi
		i=$(($i - 1))
	done
	return 1
}

	serpent
