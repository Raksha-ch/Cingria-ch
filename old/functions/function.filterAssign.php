<?php
function filterAssign($array, $debug = false) {
	$filtered_array = array_filter($array); // filter empty values
	foreach ($filtered_array as $k => $v) { $GLOBALS[$k] = $v; } // assign dynvar
	if($debug == true) { print_r($filtered_array) ; }
}
?>