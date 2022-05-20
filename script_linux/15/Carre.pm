################################################
# Carre.pm - Implémentation de la classe Carre #
################################################

package Carre;

use Point;

sub new ($;$$$$)
{
	my $pkg = shift;
	my $carre = [];
	bless $carre, $pkg;
	if (ref ($_[0]) eq $pkg) {
		# Il faut réaliser une *copie* du point, donc invoquer
		# new() sinon on aurait deux références sur le même point.
		for (my $i = 0; $i < 4; $i ++) {
			$carre -> [$i] = new Point ($_[0] -> [$i]);
		}
		return ($carre);
	}
	$carre -> [0] = new Point (shift);
	$carre -> [1] = new Point (shift);
	$carre -> [2] = new Point (shift);
	$carre -> [3] = new Point (shift);
	return ($carre);
}

sub affiche ($;)
{
	my $carre = shift;
	for (my $i = 0; $i < 4; $i ++) {
		print "P$i : ";
		$carre -> [$i] -> affiche();
		print "\n";
	}
}

sub translate ($$$$)
{
	my $carre = shift;
	my ($u, $v, $w) = @_;
	for (my $i = 0; $i < 4; $i ++) {
		$carre -> [$i] -> translate ($u, $v, $w);
	}
}
	return 1;
