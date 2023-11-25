<?php
function convertFromBytes($bytes,$to=NULL)
{
  $float = floatval( $bytes );
  switch($to)
  {
    case 'Kb' :            // Kilobit
      $float = ( $float*8 ) / 1024;
      break;
    case 'b' :             // bit
      $float *= 8;
      break;
    case 'GB' :            // Gigabyte
      $float /= 1024;
    case 'MB' :            // Megabyte
      $float /= 1024;
    case 'KB' :            // Kilobyte
      $float /= 1024;
    default :              // byte
  }
  unset($bytes,$to);
  $float = explode('.',$float);
  return($float[0]);
}
?>