<?php
  class Session {

    public  $session_vars = '';
    private $session;
    static  $sessionInstances = 0;

    function __construct() {
      if(session::$sessionInstances == 0) {
        session_start();
        session::$sessionInstances = 1;
      }
      else {
        $msg = '<img src="img/icon/attention.gif"> Session is already started.';
          die($msg);
      }
    }

    function setSessionVar($name, $value) {
      $_SESSION[$name] = $value;
    }

    function getSessionVar($name) {
      if (isset($_SESSION[$name])) {
        return $_SESSION[$name];
      } else {
      return false;
      }
    }


    function setSessionArray($array_name, $value) {
      $_SESSION[$array_name] = array($value);
    }

    function unsetSessionArray($array_name) {
      unset($_SESSION[$array_name]);
    }


    function addToSessionArray($array_name, $key , $value) {
      $_SESSION[$array_name][$key] = $value;	
    }


    function removeFromSessionArray($array_name, $key) {
      unset($_SESSION[$array_name][$key]);
    }


    function getSessionArray($array_name) {
      if (isset($_SESSION[$array_name])) {
        return $_SESSION[$array_name];
      } else {
      return false;
      }
    }





    function buildSessionVarsArray() {
      foreach($_SESSION as $key => $value) {
      $session_vars[] = $key."=".$value;
      }
      if(!empty($session_vars)) {
        return $session_vars;
      }
    }

    function iterateThroughSessionVarsArray() {
      if($this->buildSessionVarsArray()) {
        $iterated_session_vars = '<strong>Session Vars</strong><br/>';
        $iterated_session_vars .= '<table>';
        foreach($this->buildSessionVarsArray() as $session_vars) {
          $session_vars_r = explode('=',$session_vars);
          $iterated_session_vars .= '<tr><td>'.$session_vars_r[0].' : </td><td>'.$session_vars_r[1].'</td></tr>';
        }
        $iterated_session_vars .= '</table>';
      return $iterated_session_vars;
      }
    }

    function getSessionID() {
      return session_id();
      }

      function getSessionName() {
      return session_name();
      }

      function sessionDestroy() {
          session_unset();
          session_destroy();
      }

    function getSessionInfo() {
      print '<div class="info_box"><fieldset class="info"><legend>SESSION INFO</legend>';
      print '<strong>'.$this->getSessionName().'</strong><br/>'.$this->getSessionID();
      print '<br/><br/>'.$this->iterateThroughSessionVarsArray();
      print '</fieldset></div>';
    }	

  }
?>
