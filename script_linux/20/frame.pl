#! /usr/bin/perl -w

	use strict;
	use Tk;
	
	my $fenetre = MainWindow -> new();

	$fenetre->title("Exemple Frames");

	my @reliefs= ("raised", "sunken", "ridge", "groove", "solid", "flat");
	for (my $x = 0; $x < @reliefs; $x ++) {
		for (my $y= 1; $y <= 3; $y ++) {
			my $frame = $fenetre->Frame(
				'-relief'		=>	"$reliefs[$x]",
				'-borderwidth'	=>	"$y");
			$frame->grid(
				-row			=> "$y",
				-column			=> "$x",
				-padx			=> 5,
				-pady			=> 5);
			$frame->Label(
				-text 			=> "$reliefs[$x] : $y",
				)->grid();
		}	
	}

	exit (MainLoop());
