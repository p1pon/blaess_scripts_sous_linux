	#include <unistd.h>
	#include <string.h>

	int
main (void)
{
	char * buffer = "Ce message est �crit avec write() dans "
			"le descripteur de fichier num�ro 3.\n";
	write (3, buffer, strlen (buffer));
	return (0);
}
