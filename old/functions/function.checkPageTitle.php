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
          case 'oeuvres_completes':
            $title = 'Les Nouvelles Œuvres Complètes';
            break;

               case 'les_livres':
                $title = 'Les Livres';
                break;  		
                  case 'les_petites_feuilles':
                    $title = 'Les Petites Feuilles';
                    break;
                        case 'fonds_et_archives':
                        $title = 'Fonds & Archives';
                        break;

       default:
       $title = 'Accueil & Présentation du site';
      break;
      }
 return $title;

}
?>