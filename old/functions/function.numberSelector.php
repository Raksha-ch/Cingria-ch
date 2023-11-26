<?php

  function buildNumberSelector( $post_value, $min_range, $max_range ) {

    for ( $min_range ; $min_range < $max_range+1 ; $min_range++ ) {

      $selected = ($min_range == $post_value) ? 'selected="selected"' : '' ;
      print '<option value="'.$min_range.'" '.$selected.'>'.$min_range.'</option>';

    }

  }

?>