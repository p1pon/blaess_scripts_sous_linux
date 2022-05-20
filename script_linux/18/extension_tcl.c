	#include <tcl.h>

	#include <errno.h> 	/* pour errno */
	#include <string.h>	/* pour strerror() */
	#include <unistd.h>	/* pour rmdir() */

	int
fonction_rmdir (void * inutile, Tcl_Interp * interp,
		int argc, char ** argv)
{
	int i;
	for (i = 1; i < argc; i ++) {
		if (rmdir (argv [i]) != 0) {
			Tcl_AppendResult (interp, argv[0], " ",
				argv [i], " : ",
				strerror (errno), NULL);
			return (TCL_ERROR);
		}
	}
	return (TCL_OK);
}

	int
fonction_moyenne (void * inutile, Tcl_Interp * interp, 
		int argc, char ** argv)
{
	double somme = 0;
	double reel;
	char resultat [TCL_DOUBLE_SPACE];
	int n;

	if (argc < 2) {
		Tcl_AppendResult (interp, "Mauvais nombre d'arguments : ", 
			argv [0], " nombre [nombre...]", NULL);
		return (TCL_ERROR);
	}
	for (n = 1; n < argc; n ++) {
		/* Obtenir la valeur du nième argument */
		if (Tcl_GetDouble (interp, argv [n], & reel) != TCL_OK)
			return (TCL_ERROR);
		somme += reel;
	}
	Tcl_PrintDouble (interp, somme / (argc - 1), resultat);
	Tcl_SetResult (interp, resultat, TCL_VOLATILE);
	return (TCL_OK);
}

	int
Tcl_AppInit (Tcl_Interp * interp)
{
	struct {
		char *		nom;
		Tcl_CmdProc *	fonction;

	} commandes [] = {

		{ "rmdir",	fonction_rmdir },
		{ "moyenne",	fonction_moyenne },
		{ NULL,		NULL },

	};
	
	int	i;
	for (i = 0; commandes [i] . nom != NULL; i ++) {
		if (Tcl_CreateCommand (interp,
				commandes[i] . nom,
				commandes[i] . fonction,
				NULL, NULL) == NULL) 
			return (TCL_ERROR);
		else
			fprintf (stderr, "Commande %s ajoutée\n", 
				commandes[i] . nom);
	}
	return (TCL_OK);
}

	int
main (int argc, char ** argv)
{
	Tcl_Main (argc, argv, Tcl_AppInit);
	return (0);
}
