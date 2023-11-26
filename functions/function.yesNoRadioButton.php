<?php

  function buildYesNoRadioButton( $input_name, $post_value='', $default='no' ) {

    if ( $post_value == '' ) {

      $default_yes_check 	= ( $default == 'yes' ) ? ' checked="checked"' : '' ;
      $default_no_check 	= ( $default == 'no'  ) ? ' checked="checked"' : '' ;

    }

    else {

      $yes_check 		= ( $post_value == '1' ) ? ' checked="checked"' : '' ;
      $no_check  		= ( $post_value == '0' ) ? ' checked="checked"' : '' ;

    }







    print <<<EOD
    <input type="radio" name="$input_name"  value="1" $default_yes_check  $yes_check /> Yes
    <input type="radio" name="$input_name"  value="0" $default_no_check  $no_check /> No
EOD;

  }
?>