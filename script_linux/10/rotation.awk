#! /usr/bin/awk -f

function multiplication (vecteur, matrice, n, result,    i, j)
{
	for (i = 0; i < n; i ++)
		result [i] = 0
	for (i = 0; i < n; i ++)
		for (j = 0; j < n; j ++)
			result [i] += vecteur [j] * matrice [i, j]
}

BEGIN {
	angle = -3.14159264 / 4
	rot [0, 0] = cos(angle)
	rot [0, 1] = sin(angle)
	rot [1, 0] = -sin(angle)
	rot [1, 1] = cos(angle)
}

(NF == 2) {
	v [0] = $1 + 0
	v [1] = $2 + 0
	multiplication(v, rot, 2, r)
	print "(" r[0] ", " r[1] ")"
}
