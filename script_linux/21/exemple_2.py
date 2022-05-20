#! /usr/bin/python

def premier (n) :
	i = n - 1
	n_premier = 0
	while i > 1 :
		if ((n % i) == 0) : break;
		i = i - 1
	else : n_premier = 1
	return (n_premier)

j = 1
while (j < 500) :
	if (premier (j)) :
		print j,
	j = j + 1

