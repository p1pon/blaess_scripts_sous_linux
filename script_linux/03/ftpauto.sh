#! /bin/sh

# Param�trage du transfert d�sir�

MACHINE=${1:?Pas de machine indiqu�e}
CHEMIN=${2:?Pas de chemin indiqu�}
FICHIERS=${3:?Pas de fichiers indiqu�s}

LOGIN=${4:-anonymous}
PASSWORD=${5:-$USER@$HOSTNAME}

# D'abord sauver l'�ventuel fichier ~/.netrc

if [ -f ~/.netrc ] ; then
	mv ~/.netrc ~/.netrc.back
fi

# Cr�er un nouveau ~/.netrc avec les infos concernant 
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

# Effacer .netrc et r�cup�rer l'ancien

rm -f ~/.netrc
if [ -f ~/.netrc.back ] ; then
	mv ~/.netrc.back ~/.netrc
fi

