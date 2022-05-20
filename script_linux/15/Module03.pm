package Module03;

	use strict;
	use Exporter;
	use vars qw(@ISA @EXPORT @EXPORT_OK);

	# Ajouter les �ventuelles classes de base.
	@ISA       = ('Exporter');

	# Liste des symboles export�s automatiquement.
	@EXPORT    = qw( &fct_exportee   $var_exportee   @tab_exportee );
	# Liste des symboles export�s � la demande uniquement.
	@EXPORT_OK = qw( &fct_exportable $var_exportable @tab_exportable );

$Module03::var_exportee   = "Cette variable est export�e";
@Module03::tab_exportee   = ("Cette", "table", "est", "exportee");

$Module03::var_exportable = "Cette variable est exportable";
@Module03::tab_exportable = ("Cette", "table", "est", "exportable");

$Module03::var_privee     = "Cette variable est priv�e !";
@Module03::tab_privee     = ("Cette", "table", "est", "priv�e !");

sub fct_exportee
{
	print "Cette fonction est exportee par d�faut\n";
}

sub fct_exportable
{
	print "Cette fonction n'est export�e qu'� la demande\n";
}

sub fct_privee
{
	print "Cette fonction n'est pas export�e\n";
}

	return 1;
