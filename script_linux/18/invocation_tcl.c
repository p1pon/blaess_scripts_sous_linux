	#include <tcl.h>

	double	var;

char * script = "
proc factorielle { n } {
	if { $n <= 1 } {
		return 1
	}
	return [expr $n * [factorielle [expr $n - 1]]]
}";

	int
main (int argc, char ** argv)
{
	Tcl_Interp * interpreteur;
	int i;
	fprintf (stdout, "Voici le d�but de notre programme en C\n");

	if ((interpreteur = Tcl_CreateInterp()) == NULL) {
		fprintf (stderr, "Impossible de cr�er un interpr�teur Tcl\n");
		exit (1);
	}
	fprintf (stdout, "Nous avons cr�� un interpr�teur TCL\n");
	if (Tcl_LinkVar (interpreteur, "var", (char *) & var, TCL_LINK_DOUBLE)
			!= TCL_OK) {
		fprintf (stderr, "Tcl_LinkVar : %s\n", interpreteur -> result);
		exit (1);
	}
	fprintf (stdout, "La variable var est partag�e.\n");
	var = 10;

	if (Tcl_Eval (interpreteur, script) != TCL_OK) {
		exit (1);
	}
	fprintf (stdout, "Nous avons ex�cut� le script\n");

	fprintf (stdout, "(C) var = %f\n", var);
	for (i = 1; i < argc; i ++) {
		fprintf (stdout, "Evaluation de : %s\n", argv [i]);
		if (Tcl_Eval (interpreteur, argv[i]) != TCL_OK) {
			fprintf (stderr, "%s\n", interpreteur -> result);
		}
		fprintf (stdout, "(C) var = %f\n", var);
	}
	Tcl_DeleteInterp (interpreteur);
	fprintf (stdout, "Fin de notre programme C\n");
	return (0);
}
