<?php
function normalizeUrl ($string) {
	if(strtotime($string)) { return $string; } else { // if string is a date, then no normalizing!
		$string = strtolower(trim($string));
		$string = htmlentities($string, ENT_NOQUOTES, 'iso-8859-1');
		$string = preg_replace('#&([A-za-z])(?:acute|cedil|circ|grave|orn|ring|slash|th|tilde|uml);#', '\1', $string);
		//$string = preg_replace('#&([A-za-z]{2})(?:lig);#', '\1', $str); // pour les ligatures e.g. '&oelig;'
		//$string = preg_replace('#&[^;]+;#', '', $str); // supprime les autres caractères
		
	    $strstr = array(
			'á'	=>'a',	'é'	=>'e',	'í'	=>'i',	'ó'	=>'o',	'ú'	=>'u',
			'à'	=>'a',	'è'	=>'e',	'ì'	=>'i',	'ò'	=>'o',	'ù'	=>'u',
			'ä'	=>'a',	'ë'	=>'e',	'ï'	=>'i',	'ö'	=>'o',	'ü'	=>'u',
			'â'	=>'a',	'â'	=>'e',	'î'	=>'i',	'ô'	=>'o',	'û'	=>'u',
			'ç'	=>'c',

			'\''		=>'-',

			'&ndash;'	=>'-',	'&mdash;'	=>'-',	'-'			=>'-',	'–'			=>'-',

			' '			=>'-',	','			=>'-',	';'			=>'-',	':'			=>'-',	'/'			=>'-',

			'?'			=>'-',	'!'			=>'-',  '&amp;'			=> '-plus-'	
			);
	    return strtr($string, $strstr);	
	}

}
?>