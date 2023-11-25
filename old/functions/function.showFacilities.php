<?php

function showMainFacility($facility_name, $facility_value) {
 	
 	$facility = ($facility_value != 0) ? '<li><strong>'.$facility_value.'</strong> '.$facility_name.'</li>' : '' ;
 	print $facility;
 	
}
 
 function showYesNoFacility($facility_name, $facility_value) {
 	
 	$facility = ($facility_value != 0) ? '<li>'.$facility_name.'</li>' : '' ;
 	print $facility;
 	
}
 
function showExtraInfoFacility($facility_name, $facility_value, $extra_info) {
 
 	$facility = ($facility_value != 0) ? '<li>'.$facility_name.' '.$facility_value.' '.$extra_info.'</li>' : '' ;
 	print $facility;
 	
}
 
function showBewareFacility($facility_name, $facility_value) {
 
 	$facility = ($facility_value == 0) ? '<li><strong>'.$facility_name.' </strong></li>' : '' ;
 	print $facility;
 	
}
 
?>
