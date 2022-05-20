#! /bin/sed -f

# Lire toutes les instructions et ajouter un saut de ligne final.
: lecture
N
$ ! b lecture
G

# Effacer les commentaires commençant par '#'.
s/#[^\n]*//g
s/#.*$//g

# Utiliser un deux-points pour séparer les instructions.
s/\n/:/g

# A-t-on une bande initiale ?
/|/ s/\(.*\)|\([^:]\)\([^:]*\):\(.*\)/|\2|\3:\1\4/

# sinon en fournir une vierge.
/|/ ! s/\(.*\)/| |:\1/

# Réserver l'espace de stockage au début de la mémoire
# tampon, et initialiser l'état de la machine à zéro.
s/\(.*\)/0x\1/

# Démarrer la machine !
: boucle
	# N'afficher que la bande et l'état de la machine.
	h
	# (commenter les deux lignes suivantes pour voir les
	#  données internes durant le débogage d'un script TM)
	s/:.*//
	s/^\(.\)./(\1) /
	p
	g

	# Vérifier le contenu de la cellule actuelle
	/|[^:||]|/ ! {
		s/.*/Erreur interne dans la machine de Turing/
		q
	}
	# Stocker le symbole lu en seconde place de
	# la mémoire-tampon pour en disposer facilement plus tard.
	s/^\(.\).\(.*\)|\(.\)|\(.*\)/\1\3\2|\3|\4/

	# Avons-nous atteint un état final stable ?
	/^\(.\).*:\1/ ! {
		s/\(.\).*/Etat final \1 atteint... fin du traitement/
		q
	}

	# Existe-t-il une instruction applicable à l'état et à la case ?
	/^\(..\).*:\1/ ! {
		s/^\(.\)\(.\).*/Pas d'instruction pour l'état \1, cellule \2/
		q
	}
		
	# Rechercher le nouveau symbole à écrire sur la bande
	/^\(..\).*:\1[^:||]/ ! {
		s/.*/Impossible d'écrire ce symbole sur la bande !/
		q
	}
	s/^\(..\)\(.*\)|.|\(.*\):\1\(.\)/\1\2|\4|\3:\1\4/
			
	# Vérifier la direction du déplacement de la tête
	/^\(..\).*:\1.[ GgDd]/ ! {
		s/.*/Les déplacements doivent être 'G', 'D' ou espace/
		q
	}
	# Effacer le drapeau de substitution que nous utiliserons plus bas
	t nop
	: nop
	/^\(..\).*:\1. / {
		# Direction = ' ' -> Ne pas bouger
		b fin_mvmt
	}
	/^\(..\).*:\1.[Gg]/ {
		# Déplacer la tête à gauche si la bande est assez longue
		s/^\(..\)\(.*\)\(.\)|\(.\)|/\1\2|\3|\4/
		t fin_mvmt
		# sinon étendre la bande avec une cellule vide
		s/|\(.\)|/| |\1/
		b fin_mvmt
	}

	# Déplacer la tête à droite si la bande est assez longue
	s/|\(.\)|\([^:]\)/\1|\2|/
	t fin_mvmt
	# sinon étendre la bande avec une cellule vide
	s/|\(.\)|/\1| |/

	: fin_mvmt

	# Vérifier le nouvel état de la machine
	/^\(..\).*:\1..[^:||]/ ! {
		s/.*/Impossible d'utiliser ce symbole comme état/
		q
	}
	# Basculer l'état de la machine
	s/^\(.\)\(.\)\(.*\):\1\2\(..\)\(.\)/\5\2\3:\1\2\4\5/
	
	b boucle
