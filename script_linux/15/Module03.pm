package Module03;

	use strict;
	use Exporter;
	use vars qw(@ISA @EXPORT @EXPORT_OK);

	# Ajouter les éventuelles classes de base.
	@ISA       = ('Exporter');

	# Liste des symboles exportés automatiquement.
	@EXPORT    = qw( &fct_exportee   $var_exportee   @tab_exportee );
	# Liste des symboles exportés à la demande uniquement.
	@EXPORT_OK = qw( &fct_exportable $var_exportable @tab_exportable );

$Module03::var_exportee   = "Cette variable est exportée";
@Module03::tab_exportee   = ("Cette", "table", "est", "exportee");

$Module03::var_exportable = "Cette variable est exportable";
@Module03::tab_exportable = ("Cette", "table", "est", "exportable");

$Module03::var_privee     = "Cette variable est privée !";
@Module03::tab_privee     = ("Cette", "table", "est", "privée !");

sub fct_exportee
{
	print "Cette fonction est exportee par défaut\n";
}

sub fct_exportable
{
	print "Cette fonction n'est exportée qu'à la demande\n";
}

sub fct_privee
{
	print "Cette fonction n'est pas exportée\n";
}

	return 1;
