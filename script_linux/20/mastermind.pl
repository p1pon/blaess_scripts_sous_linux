#! /usr/bin/perl -w

	use strict;
	use Tk;
	use Tk::Dialog;
	use Tk::Font;

	my $nom_programme = "Master Mind";

	my ($nb_cases, $nb_couleurs) = (4,7);
	my (@solution);
	my (@proposition);
	my ($numero_proposition) = 0;
	my ($jeu_en_cours) = (0);

	my @nom_couleur = (
		'lightgrey', 'black', 'white', 'blue',
		'yellow', 'red', 'green', 'brown',
		'magenta', 'cyan', 'darkgrey', 'orange',
		'darkgreen',
	);

	my (%table_i18n);
	my (%table_i18n_fr) = (
		'~Game'			=>	'~Jeu',
		'~New'			=>	'~Nouveau',
		'~Solution...'		=>	'~Solution...',
		'~Preferences...'	=>	'~Préférences...',
		'~Quit'			=>	'~Quitter',
		'~Help'			=>	'~Aide',
		'~Play...'		=>	'~Jouer...',
		'~About...'		=>	'~A propos...',
		'New game'		=>	'Nouvelle partie',
		'Solution'		=>	'Solution',
		'Preferences'		=>	'Préférences',
		'No'			=>	'Non',
		'Yes'			=>	'Oui',
		'Cancel current play?'	=>	'Arrêter la partie en cours ?',
		'Number of colours'	=>	'Nombre de couleurs',
		'Number of holes'	=>	'Nombre de trous',
		'Quit'			=>	'Quitter',
		'About'			=>	'A propos',
		'Help'			=>	'Aide',		
	);

	my $message_aide = 'Help text to be written...';
	my $message_aide_fr = "Le but du jeu est de découvrir la combinaison de couleurs choisie par l\'ordinateur "
			. "en un nombre de tentatives le plus faible possible.\n\n"
			. "Pour cela, cliquez sur les cases avec les boutons gauche ou droit de la souris "
			. "afin de choisir une combinaison puis cliquez sur Ok.\n\n"
			. "L\'ordinateur vous affiche alors une série d\'aiguilles. Une aiguille noire indique la présence "
			. "d\'une bonne couleur bien placée et une aiguille blanche, une bonne couleur mal placée.\n\n"
			. "Si la combinaison n'est pas la bonne, une nouvelle tentative vous est proposée, "
			. "en repartant des mêmes couleurs.\n\n"
			. "Vous pouvez configurer le nombre de couleurs disponibles, et le nombre de cases à remplir.";
	
sub initialiser_messages ()
{
	if (((exists ($ENV{'LANG'})) && ($ENV{'LANG'} =~ /^fr_/))
	 || ((exists ($ENV{'LC_ALL'})) && ($ENV{'LC_ALL'} =~ /^fr_/))) {
		%table_i18n = %table_i18n_fr;
		$message_aide = $message_aide_fr;
	}
}

sub i18n ($)
{
	my ($chaine) = @_;
	return ($table_i18n{$chaine}) if (exists ($table_i18n{$chaine}));
	return ($chaine);
}

sub creer_interface ()
{
	my ($fenetre, $barre, $mnu);
	$fenetre = MainWindow -> new ();
	$fenetre -> title ($nom_programme);
	$fenetre -> geometry ("+50+50");
	$barre = $fenetre -> Menu (
			-borderwidth => 1,
			-type => 'menubar');
	$fenetre -> configure (	
			-menu => $barre);

	$mnu = $barre -> cascade (
			-label => i18n('~Game'),
			-tearoff => 0);
	$mnu -> command(-label => i18n('~New'),
			-command => [\&jeu_nouveau, $fenetre]);
	$mnu -> command(-label => i18n('~Solution...'),
			-command => [\&jeu_reponse, $fenetre]);
	$mnu -> separator ();
	$mnu -> command(-label => i18n('~Preferences...'),
			-command => [\&jeu_configurer, $fenetre]);
	$mnu -> separator ();
	$mnu -> command(-label => i18n('~Quit'),
			-command => [\&jeu_quitter, $fenetre]);
	
	$barre -> separator () =>	$mnu = $barre -> cascade (
			-label => i18n('~Help'),
			-tearoff	=> 0);
	$mnu -> command(-label => i18n('~About...'),
			-command => [\&a_propos, $fenetre]);
	$mnu -> separator ();
	$mnu -> command(-label => i18n('~Play...'),
			-command => [\&aide_jeu, $fenetre]);
	jeu_nouveau ($fenetre);
}


	my $frame_couleurs = undef;
	my $frame_essais = undef;

sub jeu_nouveau ($)
{
	my ($fenetre) = @_;
	if ($jeu_en_cours) {
		if ($fenetre -> Dialog (
			-title		=> i18n('New game'),
			-text		=> i18n('Cancel current play?'),
			-default_button	=> i18n('No'),
			-buttons 	=> [i18n('Yes'), i18n('No')]) -> Show() ne i18n('Yes')) {
			return;
		}
	}
	$jeu_en_cours = 1;
	for (my $i = 0; $i < $nb_cases; $i++) {
		$solution[$i] = int (rand ($nb_couleurs));
		$proposition[$i] = 0;
	}
	$numero_proposition = 0;

	# Frame contenant les couleurs en exemple
	$frame_couleurs -> destroy () if (defined ($frame_couleurs));
	$frame_couleurs = $fenetre -> Frame (
			-borderwidth => 1,
			-relief	=> 'raised');
	$frame_couleurs -> pack (
			-side	=> 'top',
			-pady	=> 1);
	my $canvas = $frame_couleurs -> Canvas (
			-height	=> 16,
			-width	=> 16 * $nb_couleurs);
	$canvas -> pack (-padx => 0, -pady => 0);
	for (my $i = 0; $i < $nb_couleurs; $i ++) {
		$canvas -> createRectangle (1+16* $i, 1, 16 * ($i+1), 16,
					-fill	=> $nom_couleur[$i],
					-outline => 'black');
	}

	# Frame contenant les essais du joueurs
	$frame_essais -> destroy () if (defined ($frame_essais));
	$frame_essais = $fenetre -> Frame (
					-borderwidth => 0,
					-relief	=> 'sunken');
	$frame_essais -> pack (		-side	=> 'top',
					-fill	=> 'x',
					-pady	=> 0);
	ajouter_ligne ($frame_essais);
}


sub jeu_reponse ($)
{
	my ($parent) = @_;
	if ($jeu_en_cours) {
		if ($parent -> Dialog (
			-title		=> i18n('Solution'),
			-text		=> i18n('Cancel current play?'),
			-default_button	=> i18n('No'),
			-buttons 	=> [i18n('Yes'), i18n('No')]) -> Show() ne i18n('Yes')) {
			return;
		}
	}
	$jeu_en_cours = 0;
	my $fenetre = $parent -> Toplevel ();
	$fenetre -> title (i18n('Solution'));
	$fenetre ->  transient ($parent);
	my $frame = $fenetre -> Frame (
			-borderwidth => 1,
			-relief	=> 'raised');
	$frame -> pack (-side	=> 'top',
			-pady	=> 1);
	my $canvas = $frame -> Canvas (
			-background => $nom_couleur[0],
			-width	=> ($nb_cases * 20),
			-height => 20);
	$canvas -> pack (-side	=> 'top');
	for (my $i = 0; $i < $nb_cases; $i ++) {
		$canvas -> createOval (
			$i * 20 + 2, 2,	$i * 20 + 17, 19,
			-fill	=> $nom_couleur[$solution[$i]],
			-outline=> 'black');
	}
	$frame -> Button (
			-text => 'Ok',
			-command => sub {
				$fenetre -> destroy ();
				jeu_nouveau ($parent);
			})
		-> pack (-side => 'top');
}

sub jeu_configurer ($)
{
	my ($parent) = @_;

	if ($jeu_en_cours) {
		if ($parent -> Dialog (
			-title		=> i18n('Preferences'),
			-text		=> i18n('Cancel current play?'),
			-default_button	=> i18n('No'),
			-buttons 	=> [i18n('Yes'), i18n('No')]) -> Show() ne i18n('Yes')) {
			return;
		}
		$jeu_en_cours = 0;
	}

	my $fenetre = $parent -> Toplevel ();
	$fenetre -> title (i18n('Preferences'));
	$fenetre ->  transient ($parent);
	my $frame = $fenetre -> Frame (
			-borderwidth => 1,
			-relief	=> 'raised');
	$frame -> pack (-side	=> 'top',
			-pady	=> 1);
	$frame -> Scale(-digits	=> 0,
			-from	=> 5,
			-label	=> i18n('Number of colours'),
			-orient	=> 'horizontal',
			-resolution => 1,
			-showvalue => 1,
			-sliderrelief => 'sunken',
			-to	=> @nom_couleur + 0,
			-variable => \$nb_couleurs)
		-> pack(-side => 'top', -fill => 'x');
	$frame -> Scale(-digits	=> 0,
			-from	=> 4,
			-label	=> i18n('Number of holes'),
			-orient	=> 'horizontal',
			-resolution => 1,
			-showvalue => 1,
			-sliderrelief => 'sunken',
			-to	=> 10,
			-variable => \$nb_cases)
		-> pack (-side => 'top', -fill => 'x');
	$frame -> Button(-text => 'Ok',
			-command => sub {
				$fenetre -> destroy ();
				jeu_nouveau ($parent); })
		-> pack(-side => 'top');
}

sub jeu_quitter ($)
{
	my ($fenetre) = @_;
	exit (0) if (! $jeu_en_cours);
	exit (0) if ($fenetre -> Dialog (
			-title		=> i18n('Quit'),
			-text		=> i18n('Cancel current play?'),
			-default_button	=> i18n('No'),
			-buttons 	=> [i18n('Yes'), i18n('No')]) -> Show() eq i18n('Yes'));
}


sub a_propos ($)
{
	my ($fenetre) = @_;
	$fenetre -> Dialog (
			-title		=> i18n('About'),
			-bitmap		=> 'info',
			-default_button	=> 'Ok',
			-buttons	=> ['Ok'],
			-text		=> "$nom_programme\nChristophe Blaess 2003",
			) -> Show ();
}

	my $fonte_systeme = undef;

sub aide_jeu ($)
{
	my ($parent) = @_;
	$fonte_systeme = $parent->Font ('system') if (! defined ($fonte_systeme));
	$parent -> Dialog (
			-title		=> i18n('Help'),
			-default_button	=> 'Ok',
			-buttons	=> ['Ok'],
			-text		=> $message_aide,
			-font		=> $fonte_systeme,
			) -> Show ();
}

	my (@id_cases);

sub ajouter_ligne ($)
{
	my ($frame) = @_;
	my ($ligne);
	$numero_proposition ++;
	
	$ligne = $frame -> Frame (
			-borderwidth => 2,
			-relief	=> 'groove');
	$ligne -> pack (-side	=> 'top',
			-fill	=> 'x',
			-pady	=> 0,
			-padx	=> 1);
	$ligne -> Label(-width => 3,
			-text => $numero_proposition)
		-> pack(-side => 'left');
	my ($frm);
	$frm = $ligne -> Frame (
			-relief => 'sunken',
			-borderwidth => 1);
	$frm -> pack (	-side => 'left',
			-padx	=> 2,
			-pady 	=> 2);
	my $canvas = $frm -> Canvas (
			-background => $nom_couleur[0],
			-width	=> ($nb_cases * 20),
			-height => 20)
		-> pack(-side => 'left');
	for (my $i = 0; $i < $nb_cases; $i ++) {
#		$proposition[$i] = 0;
		$id_cases[$i] = $canvas -> createOval (
			$i * 20 + 2, 2,	$i * 20 + 17, 19,
			-fill	=> $nom_couleur[$proposition[$i]],
			-outline=> 'black');
		$canvas -> bind ($id_cases [$i], '<Button-1>', [\&clic_case, $canvas, $i, 0]);
		$canvas -> bind ($id_cases [$i], '<Button-2>', [\&clic_case, $canvas, $i, 1]);
		$canvas -> bind ($id_cases [$i], '<Button-3>', [\&clic_case, $canvas, $i, 1]);
	}

	$frm= $ligne -> Frame (
			-relief => 'sunken',
			-borderwidth => 1);
	$frm -> pack (	-side => 'left',
			-pady => 1);
	my $bt = $frm -> Button (-text => "Ok");
	$bt -> configure(-command => [\&clic_ok, $bt, $frm, $frame, $canvas]);
	$bt -> pack (-pady => 0);

}


sub clic_case ($$$)
{
	my ($widget, $canvas, $i, $sens) = @_;
	return if (! $jeu_en_cours);
	if ($sens) {
		$proposition [$i] ++;
		$proposition [$i] = 0 if ($proposition [$i] >= $nb_couleurs);
	} else {
		$proposition [$i] --;
		$proposition [$i] = ($nb_couleurs - 1) if ($proposition [$i] < 0 );
	}
	$canvas -> itemconfigure ($id_cases[$i], -fill => $nom_couleur[$proposition[$i]]);
}


sub clic_ok ($)
{
	my ($widget, $frame_reponse, $frm_essais, $canvas) = @_;
	return if (! $jeu_en_cours);
	for (my $i = 0; $i < $nb_cases; $i ++) {
		$canvas -> bind ($id_cases[$i], '<Button-1>', "");
		$canvas -> bind ($id_cases[$i], '<Button-2>', "");
		$canvas -> bind ($id_cases[$i], '<Button-3>', "");
	}

	$widget -> destroy ();

	my ($nb_bien, $nb_mal) = verifie_proposition ();
	my $canvas_reponse = $frame_reponse -> Canvas (
				-height => 10,
				-width 	=> 10 * $nb_cases
				);
	$canvas_reponse -> pack (-side => 'left');
	my $n = 0;
	for (my $i = 0; $i < $nb_bien; $i ++) {
		$canvas_reponse -> createOval ($n * 10 +1, 1, $n * 10 + 9, 9,
						-fill => 'black',
						-outline => 'black');
		$n ++;
	}						
	for (my $i = 0; $i < $nb_mal; $i ++) {
		$canvas_reponse -> createOval ($n * 10 +1, 1, $n * 10 + 9, 9,
						-fill => 'white',
						-outline => 'black');
		$n ++;
	}						
	while ($n < $nb_cases) {
		$canvas_reponse -> createOval ($n * 10 +1, 1, $n * 10 + 9, 9,
						-fill => 'lightgrey',
						-outline => 'darkgrey');
		$n ++;
	}						
	if ($nb_bien == $nb_cases){
		$jeu_en_cours = 0;
		return;
	}
	ajouter_ligne ($frm_essais);
}

sub verifie_proposition ()
{	# Méthode lue lors d'une discussion sur fr.comp.algorithmes
	
	my ($nb_bien_places, $nb_mal_places) = (0, 0);
	my (@nb_pions_proposition, @nb_pions_solution);
	for (my $couleur = 0; $couleur < $nb_couleurs; $couleur ++) {
		$nb_pions_proposition[$couleur] = 0;
		$nb_pions_solution[$couleur] = 0;
	}
	for (my $case = 0; $case < $nb_cases; $case ++) {
		if ($proposition[$case] == $solution [$case]) {
			$nb_bien_places ++;
		} else {
			$nb_pions_proposition[$proposition[$case]] ++;
			$nb_pions_solution[$solution[$case]] ++;
		}
	}
	for (my $couleur = 0; $couleur < $nb_couleurs; $couleur ++) {
		$nb_mal_places += minimum ($nb_pions_proposition[$couleur], $nb_pions_solution[$couleur]);
	}
	return ($nb_bien_places, $nb_mal_places);
}

sub minimum ($$)
{
	my ($a, $b) = @_;
	return ($a) if ($a <= $b);
	return ($b);
}

	initialiser_messages ();
	creer_interface ();
	exit (MainLoop ());
