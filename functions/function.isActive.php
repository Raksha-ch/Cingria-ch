<?php

function isActive( $button_value, $parameter ) {

  $active = ( $button_value == $parameter ) ? 'class = "active" ' : '' ;
  print $active;

}


?>