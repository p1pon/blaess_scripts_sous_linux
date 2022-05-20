##################################################
# Cercle.pm - Implémentation de la classe Cercle #
##################################################

package Cercle;

use Point;

@ISA = ("Point");

sub new ($;$$$$)
{
	my $pkg = shift;
	my $cercle = $pkg -> SUPER::new ();
	$cercle -> {"r"} = 0;
	bless $cercle, $pkg;
	return ($cercle) if (! defined ($_[0]));
	if (ref($_[0]) eq $pkg) {
		%{$cercle} = %{$_[0]};
		return ($cercle);
	}
	$cercle -> {"r"} = shift;
	$cercle -> x (shift) if (defined ($_[0]));
	$cercle -> y (shift) if (defined ($_[0]));
	$cercle -> z (shift) if (defined ($_[0]));
	return ($cercle);
}

sub r ($;$)
{
	my $cercle = shift;
	return ($cercle -> {"r"}) if (! defined ($_[0]));
	$cercle -> {"r"} = shift;
}

sub affiche ($;)
{
	my $cercle = shift;
	print "Centre : ";
	$cercle -> SUPER::affiche ();
	print " Rayon : " . $cercle -> r();
}

	return 1;

sub AUTOLOAD
{
	print "Dans quel fichier se trouve $AUTOLOAD ? ";
	chomp ($_ = <>);
	die "Impossible de trouver $AUTOLOAD\n" if (! defined ($_));
	require $_;
	goto &$AUTOLOAD;
}

sub DESTROY { }
