<?php
function normalize ($string) {
  if(strtotime($string)) { return $string; } else { // if string is a date, then no normalizing!
    $string = htmlentities(strtolower(trim($string)));
      $strstr = array(
      '&aacute;'	=>'a',	'&eacute;'	=>'e',	'&iacute;'	=>'i',	'&oacute;'	=>'o',	'&uacute;'	=>'u',
      '&agrave;'	=>'a',	'&egrave;'	=>'e',	'&igrave;'	=>'i',	'&ograve;'	=>'o',	'&ugrave;'	=>'u',
      '&auml;'	=>'a',	'&euml;'	=>'e',	'&iuml;'	=>'i',	'&ouml;'	=>'o',	'&uuml;'	=>'u',
      '&acirc;'	=>'a',	'&ecirc;'	=>'e',	'&icirc;'	=>'i',	'&ocirc;'	=>'o',	'&ucirc;'	=>'u',
      '&ccedil;'	=>'c',

      '&rsquo;'	=>'_',	'&rsquo;'	=>'_',	'&ldquo;'	=>'_',	'&rdquo;'	=>'_',	'\''		=>'_',

      '&ndash;'	=>'_',	'&mdash;'	=>'_',	'-'			=>'_',	'–'			=>'_',

      ' '			=>'_',	','			=>'_',	';'			=>'_',	':'			=>'_',	'/'			=>'_',

      '?'			=>'_',	'!'			=>'_',  '&amp;'			=> '_plus_'	
      );
      return strtr($string, $strstr);	
  }

}
?>