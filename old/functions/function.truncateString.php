<?php
function truncateString($string,$length) {
	if(strlen($string) > $length) {
		 $str = substr($string, 0,$length);
		return $str.'...';
	} else {
		return $string;
	}
}


function invertTruncateString($string,$length) {
	if(strlen($string) > $length) {
		 $str = substr($string,-$length);
		return '...'.$str;
	} else {
		return $string;
	}
}
?>