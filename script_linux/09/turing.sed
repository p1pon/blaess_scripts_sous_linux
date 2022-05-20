#! /bin/sed -f

# Lire toutes les instructions et ajouter un saut de ligne final.
: lecture
N
$ ! b lecture
G

# Effacer les commentaires commen�ant par '#'.
s/#[^\n]*//g
s/#.*$//g

# Utiliser un deux-points pour s�parer les instructions.
s/\n/:/g

# A-t-on une bande initiale ?
/|/ s/\(.*\)|\([^:]\)\([^:]*\):\(.*\)/|\2|\3:\1\4/

# sinon en fournir une vierge.
/|/ ! s/\(.*\)/| |:\1/

# R�server l'espace de stockage au d�but de la m�moire
# tampon, et initialiser l'�tat de la machine � z�ro.
s/\(.*\)/0x\1/

# D�marrer la machine !
: boucle
	# N'afficher que la bande et l'�tat de la machine.
	h
	# (commenter les deux lignes suivantes pour voir les
	#  donn�es internes durant le d�bogage d'un script TM)
	s/:.*//
	s/^\(.\)./(\1) /
	p
	g

	# V�rifier le contenu de la cellule actuelle
	/|[^:||]|/ ! {
		s/.*/Erreur interne dans la machine de Turing/
		q
	}
	# Stocker le symbole lu en seconde place de
	# la m�moire-tampon pour en disposer facilement plus tard.
	s/^\(.\).\(.*\)|\(.\)|\(.*\)/\1\3\2|\3|\4/

	# Avons-nous atteint un �tat final stable ?
	/^\(.\).*:\1/ ! {
		s/\(.\).*/Etat final \1 atteint... fin du traitement/
		q
	}

	# Existe-t-il une instruction applicable � l'�tat et � la case ?
	/^\(..\).*:\1/ ! {
		s/^\(.\)\(.\).*/Pas d'instruction pour l'�tat \1, cellule \2/
		q
	}
		
	# Rechercher le nouveau symbole � �crire sur la bande
	/^\(..\).*:\1[^:||]/ ! {
		s/.*/Impossible d'�crire ce symbole sur la bande !/
		q
	}
	s/^\(..\)\(.*\)|.|\(.*\):\1\(.\)/\1\2|\4|\3:\1\4/
			
	# V�rifier la direction du d�placement de la t�te
	/^\(..\).*:\1.[ GgDd]/ ! {
		s/.*/Les d�placements doivent �tre 'G', 'D' ou espace/
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
		# D�placer la t�te � gauche si la bande est assez longue
		s/^\(..\)\(.*\)\(.\)|\(.\)|/\1\2|\3|\4/
		t fin_mvmt
		# sinon �tendre la bande avec une cellule vide
		s/|\(.\)|/| |\1/
		b fin_mvmt
	}

	# D�placer la t�te � droite si la bande est assez longue
	s/|\(.\)|\([^:]\)/\1|\2|/
	t fin_mvmt
	# sinon �tendre la bande avec une cellule vide
	s/|\(.\)|/\1| |/

	: fin_mvmt

	# V�rifier le nouvel �tat de la machine
	/^\(..\).*:\1..[^:||]/ ! {
		s/.*/Impossible d'utiliser ce symbole comme �tat/
		q
	}
	# Basculer l'�tat de la machine
	s/^\(.\)\(.\)\(.*\):\1\2\(..\)\(.\)/\5\2\3:\1\2\4\5/
	
	b boucle
