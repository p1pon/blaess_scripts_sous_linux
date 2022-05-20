#! /usr/bin/awk -f

function premier (n)
{
	for (i = 2; i <= sqrt(n); i ++)
		if (n % i == 0)
			return (0)
	return (1)
}

{
	n = $0 + 0
	for (i = 1; i <= n; i ++)
		if (premier(i))
			print "Premier : " i
}
