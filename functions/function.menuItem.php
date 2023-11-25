<?php
function menu_item( $root, $id, $title, $current ) {
	$state = ( $current == $id ) ? ' class="active" ' : '' ;                                                          
    print '<a href="'.$root.$id.'" '.$state.'>'.$title.'</a>'; 
}; 

?>