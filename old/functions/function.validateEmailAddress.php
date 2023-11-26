<?php
function validate_email($email_address) {
  if (ereg('^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$', $email_address)) {
    return true;
  }
  else
  {
    return false;
    }
}
?>