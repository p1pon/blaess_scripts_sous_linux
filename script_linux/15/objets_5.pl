#! /usr/bin/perl -w

package Point;

sub new ($;$$$)
{
	my $pkg = shift;
	my $pt = {	"x" => 0,
			"y" => 0,
			"z" => 0
		};
	bless $pt, $pkg;
	return ($pt) if (! defined ($_[0]));
	if (ref ($_[0]) eq $pkg) {
		%{$pt} = %{$_[0]};
		return ($pt);
	}
	$pt -> {"x"} = shift;
	$pt -> {"y"} = shift if (defined ($_[0]));
	$pt -> {"z"} = shift if (defined ($_[0]));
	return ($pt);
}

sub x ($;$)
{
	my $pt = shift;
	return ($pt -> {"x"}) if (! defined($_[0]));
	$pt -> {"x"} = shift;
}

sub y ($;$)
{
	my $pt = shift;
	return ($pt -> {"y"}) if (! defined($_[0]));
	$pt -> {"y"} = shift;
}

sub z ($;$)
{
	my $pt = shift;
	return ($pt -> {"z"}) if (! defined($_[0]));
	$pt -> {"z"} = shift;
}

sub translate ($$$$)
{
	my $pt = shift;
	$pt -> x ($pt -> x() + shift);
	$pt -> y ($pt -> y() + shift);
	$pt -> z ($pt -> z() + shift);
}

sub affiche ($)
{
	my $pt = shift;
	print "("   . $pt -> x() . ", "
		    . $pt -> y() . ", "
		    . $pt -> z() . ")\n";
}

package Cercle;

@ISA = ("Point");

sub new ($;$$$$)
{
	my $pkg = shift;
	my $cercle = $pkg -> SUPER::new();
	$cercle -> {"r"} = 0;
	bless $cercle, $pkg;
	return ($cercle) if (! defined ($_[0]));
	if (ref($_[0]) eq $pkg) {
		%{$cercle} = %{$_[0]};
		return ($cercle);
	}
	$cercle -> {"r"} = shift;
	$cercle -> x(shift) if (defined ($_[0]));
	$cercle -> y(shift) if (defined ($_[0]));
	$cercle -> z(shift) if (defined ($_[0]));
	return ($cercle);
}

sub r ($$)
{
	my $cercle = shift;
	return ($cercle -> {"r"}) if (! defined ($_[0]));
	$cercle -> {"r"} = $_[0];
}

sub affiche ($)
{
	my $cercle = shift;
	print "Centre : ";
	$cercle -> SUPER::affiche ();
	print "Rayon : " . $cercle -> r() . "\n";
}


package main;

my $c1 = new Cercle 1,10,20,30;
my $c2 = new Cercle $c1;
$c2 -> translate (5, 5, 5);
$c1 -> affiche();
$c2 -> affiche();
