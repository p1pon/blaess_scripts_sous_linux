#! /usr/bin/perl -w

package Point;

sub new ($;$$$)
{
	# Valeurs par défaut.
	my $r_pt = {	"x" => 0,
			"y" => 0,
			"z" => 0
		};
	my $pkg = shift;
	bless $r_pt, $pkg;
	return ($r_pt) if (! defined ($_[0]));

	if (ref ($_[0]) eq $pkg) {
		# Copie directe des hachages !
		%{$r_pt} = %{$_[0]};
		return ($r_pt);
	}
	# Initialisation des membres
	$r_pt -> {"x"} = shift;
	$r_pt -> {"y"} = shift if (defined ($_[0]));
	$r_pt -> {"z"} = shift if (defined ($_[0]));
	return ($r_pt);
}

sub affiche
{
	my $r_pt = shift;
	print "(" . $r_pt -> {"x"} . ", " .
		    $r_pt -> {"y"} . ", " .
		    $r_pt -> {"z"} . ")\n";
}


package main;

$pt_1 = new Point (1, 2, 3);
$pt_2 = new Point ($pt_1);
$pt_2 -> affiche;

