#! /usr/bin/perl -w

	use strict;
	use Tk;
	use Tk::Dialog;
	
	my $program_name = "Exemple";
	my $version_number = "0.1.1";

sub file_new   {print "Vous avez invoque le menu Fichier->Nouveau\n";}
sub file_open  {print "Vous avez invoque le menu Fichier->Ouvrir\n";}
sub file_close {print "Vous avez invoque le menu Fichier->Fermer\n";}

sub file_quit {
	exit(0);
}

sub help_about {
	my ($parent) = @_;
	$parent->Dialog(
				-title		=> "A propos...",
				-bitmap		=> 'info',
				-buttons	=> ['Ok'],
				-text		=> "$program_name\nv.$version_number"
				) -> Show();
}

sub button_1 { print "Vous avez presse le bouton 1\n"; }
sub button_2 { print "Vous avez presse le bouton 2\n"; }

sub clic_canvas {
	my ($x, $y) = @_;
	print "Vous avez clique sur le dessin en ($x, $y)\n";
}


	my $fenetre = MainWindow->new();
	$fenetre->title($program_name . " - " . $version_number);

	my $barre = $fenetre->Menu(-type => 'menubar');
	$fenetre->configure(-menu => $barre);
	
	my $file_menu = $barre->cascade(-label =>'~Fichier', -tearoff=>0);
	my $file_new = $file_menu->command(-label => '~Nouveau',
				-command => [\&file_new]);
	my $file_open = $file_menu->command(-label => '~Ouvrir',
				-command => [\&file_open]);
	my $file_close = $file_menu->command(-label => '~Fermer'
				-command => [\&file_close]);
	$file_menu->separator ();
	my $file_quit = $file_menu->command(-label => '~Quitter',
				-command => [\&file_quit]);
	my $help_menu = $barre->cascade (-label =>'~Help', -tearoff=>0);
	$help_menu->configure(-label => 'Aide');
	my $help_about = $help_menu->command(-label =>'A ~propos',
				-command => [\&help_about, $fenetre]);


	my $frame = $fenetre->Frame()->pack(
					-side 		=> 'top',
					-fill 		=> 'x'
					);
	$frame->Button (
					-text		=> 'Bouton 1',
					-command	=> [\&button_1]
					) -> pack (
					-side		=> 'left'
					);
	$frame->Button (
					-text		=> 'Bouton 2',
					-command	=> [\&button_2],
					) -> pack (
					-side		=> 'left'
					);

					
	my $canvas = $fenetre->Canvas(
					-height		=> 300,
					-width		=> 300,
					) -> pack (
					-side		=> 'top'
					);

	for (my $i = 0; $i < 30; $i ++) {
		$canvas -> createOval(
			150 - 5 * $i, 150 - 5 * $i,
			150 + 5 * $i, 150 + 5 * $i
			);
	}
	$canvas->Tk::bind ('<ButtonPress>' => [sub{
			clic_canvas($Tk::event->x, $Tk::event->y)}]);

	exit (MainLoop ());
