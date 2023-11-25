<?php
    function checkPageTitle($arg) {
      switch ($arg) {
        case 'accueil':
			$title = 'Accueil & Présentation du site';
			break;
			case 'association':
				$title = 'Présentation de l\'Association';
				break; 
		 		case 'chronologie':
					$title = 'Chronologie';
					break; 
					case 'premiere-edition-des-oeuvres-completes':
						$title = 'Première édition critique des Œuvres Complètes';
						break; 
                         						case 'cingria-dans-la-litterature-romande':
								$title = 'Cingria dans la littérature romande';
								break;
			  			 case 'les-livres':
								$title = 'Les Livres';
								break;  		
					  			case 'les-petites-feuilles':
										$title = 'Les Petites Feuilles';
										break;  
				      					case 'les-fonds':
												$title = 'Les Fonds';
												break;  

		   default:
		   $title = 'Accueil & Présentation du site';
			break;
      }
 return $title;

}
?>