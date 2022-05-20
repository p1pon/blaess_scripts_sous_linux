	#include <stdio.h>

	int
main (void)
{
	FILE * fp;
	char ligne [4096];
	int nb_lignes = 0;

	if ((fp = fdopen (5, "r+")) != NULL) {
		while (fgets (ligne, 4096, fp) != NULL)
			nb_lignes ++;
		fprintf (fp, "%d lignes\n", nb_lignes);
		fclose (fp);
	}
	return (0);
}
