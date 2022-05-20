	#include <stdio.h>

	int
main (int argc, char * argv [])
{
	int i;
	for (i = 1; i < argc; i ++)
		fprintf (stderr, "%s ", argv [i]);
	fprintf (stderr, "\n");
	return (0);
}

