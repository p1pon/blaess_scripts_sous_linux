#! /usr/bin/python

def premier (n) :
	i = n - 1
	while (i > 1) :
		if ((n % i) == 0) :
			return (0)
		i = i - 1
	return (1)


j = 1
while (j < 500) :
	if (premier (j)) :
		print j,
	j = j + 1

