	#include <stdio.h>

	int
main (void)
{
	FILE * fp;
	fp = fdopen (3, "w");
	if (fp == NULL) {
		fprintf (stderr, "Pas de descripteur 3\n");
		exit (1);
	}
	fprintf (fp, "Ce message est �crit avec fprintf() sur le flux\n");
	fprintf (fp, "obtenu autour du descripteur num�ro 3\n");
	return (0);
}
