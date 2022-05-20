#! /bin/sh

# Cette fonction re�oit en argument le nom d'un fichier, et
# propose les diff�rents actions possibles.

function action_fichier ()
{
	local reponse
	local saisie

	echo "*********************************************"
	PS3="
Action sur $1 : "

	select reponse in Informations Copier D�placer D�truire Retour
	do
		case $reponse in
			Informations )
				echo
				ls -l $1
				echo 
				;;
			Copier )
				echo -n "Copier $1 vers ? "
				if ! read saisie ; then continue ; fi
				cp $1 $saisie
				;;
			D�placer )
				echo -n "Nouvel emplacement pour $1 ? "
				if ! read saisie ; then continue ; fi
				mv $1 $saisie
				break
				;;
			D�truire )
				if rm -i $1 ; then break; fi 
				;;
			Retour )
				break
				;;
			* )	if [ "$REPLY" = "0" ] ; then break ; fi
				echo "$REPLY n'est pas une r�ponse valide"
				echo
				;;
		esac
	done
}

# Cette routine affiche la liste des fichiers pr�sents dans
# le r�pertoire, et invoque la fonction action_fichier si la
# saisie est correcte. Elle se termine quand on s�lectionne "0"
function liste_fichiers ()
{
	echo "*********************************************"
	PS3="Fichier � traiter : "
	select fichier in *
	do
		if [ ! -z "$fichier" ] ; then
			action_fichier $fichier
			return 0
		fi
		if [ "$REPLY" = "0" ] ; then
			return 1
		fi
		echo "==> Entrez 0 pour Quitter"	
		echo
	done
}

# Exemple de boucle tant qu'une fonction r�ussit.
# Le deux-points dans le corps de la boucle signifie "ne rien faire"

while liste_fichiers ; do : ; done

