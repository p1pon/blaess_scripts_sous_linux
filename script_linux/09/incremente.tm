# Ce script pour Machine de Turing permet d'incr�menter un nombre binaire

# Le nombre sur la bande :
| 10010111

# Etat 0 : rechercher le nombre vers la droite, si on le trouve -> �tat 1
0  D0
011D1
000D1

# Etat 1 : rechercher la fin du nombre, revenir sur le dernier chiffre
1  G2
100D1
111D1

# Etat 2 : Incr�menter :
2 1D3
201D3
210G2

# Etat 3 : D�placer la t�te jusqu'� la fin du nombre
3  DF
300D3
311D3
