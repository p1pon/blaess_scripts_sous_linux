#! /bin/sed -f

# Sauvegarder la ligne lue dans la m�moire secondaire
h

# "D�saccentuer" les caract�res fran�ais de la m�moire principale
y/��������������/aceeeeiioouuuy/
y/�������������/ACEEEEIIOOUUU/
# Convertir la m�moire principale en majuscule
y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/

# Effacer les lignes ne contenant pas le motif
/CARACTERE/!d

# R�cup�rer la ligne originale pour l'afficher
g

