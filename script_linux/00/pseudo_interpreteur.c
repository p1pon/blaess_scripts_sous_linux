	#include <stdio.h>

	int
main (int argc, char * argv [])
{
	char chaine [256];
	FILE * fp;
	if (argc != 2)
		exit (1);
	if ((fp = fopen (argv [1], "r")) == NULL)
		exit (2);
	fprintf (stdout, "--- Début --- \n");
	while (fgets (chaine, 256, fp) != NULL)
		fputs (chaine, stdout);
	fclose (fp);
	fprintf (stdout, "--- Fin --- \n");
	exit (0);
}

