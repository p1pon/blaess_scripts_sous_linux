#! /bin/sed -f

# Sauvegarder la ligne lue dans la mémoire secondaire
h

# "Désaccentuer" les caractères français de la mémoire principale
y/àçéèëêïîöôùüûÿ/aceeeeiioouuuy/
y/ÀÇÉÈËÊÏÎÖÔÙÜÛ/ACEEEEIIOOUUU/
# Convertir la mémoire principale en majuscule
y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/

# Effacer les lignes ne contenant pas le motif
/CARACTERE/!d

# Récupérer la ligne originale pour l'afficher
g

