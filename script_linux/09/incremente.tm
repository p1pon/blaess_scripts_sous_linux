# Ce script pour Machine de Turing permet d'incrémenter un nombre binaire

# Le nombre sur la bande :
| 10010111

# Etat 0 : rechercher le nombre vers la droite, si on le trouve -> état 1
0  D0
011D1
000D1

# Etat 1 : rechercher la fin du nombre, revenir sur le dernier chiffre
1  G2
100D1
111D1

# Etat 2 : Incrémenter :
2 1D3
201D3
210G2

# Etat 3 : Déplacer la tête jusqu'à la fin du nombre
3  DF
300D3
311D3
