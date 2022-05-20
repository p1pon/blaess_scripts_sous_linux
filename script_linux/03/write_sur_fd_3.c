	#include <unistd.h>
	#include <string.h>

	int
main (void)
{
	char * buffer = "Ce message est écrit avec write() dans "
			"le descripteur de fichier numéro 3.\n";
	write (3, buffer, strlen (buffer));
	return (0);
}
