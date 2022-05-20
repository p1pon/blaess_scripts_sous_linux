#! /bin/sh

# Paramétrage du transfert désiré

MACHINE=${1:?Pas de machine indiquée}
CHEMIN=${2:?Pas de chemin indiqué}
FICHIERS=${3:?Pas de fichiers indiqués}

LOGIN=${4:-anonymous}
PASSWORD=${5:-$USER@$HOSTNAME}

# D'abord sauver l'éventuel fichier ~/.netrc

if [ -f ~/.netrc ] ; then
	mv ~/.netrc ~/.netrc.back
fi

# Créer un nouveau ~/.netrc avec les infos concernant 
# uniquement la connexion voulue

echo machine $MACHINE > ~/.netrc
echo login $LOGIN >> ~/.netrc
echo password $PASSWORD >> ~/.netrc

chmod 600 ~/.netrc

# Lancer la connexion

ftp <<- FIN
	open $MACHINE
	bin
	prompt
	cd $CHEMIN
	mget $FICHIERS
	quit
FIN

# Effacer .netrc et récupérer l'ancien

rm -f ~/.netrc
if [ -f ~/.netrc.back ] ; then
	mv ~/.netrc.back ~/.netrc
fi

