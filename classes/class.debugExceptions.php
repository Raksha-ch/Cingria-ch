<?php
class myExceptions extends Exception {

    // Constructeur de la classe.
    // Il faut bien penser à rapeller le constructeur de la classe Exception.
    public function __construct($msg) {
        parent :: __construct($msg);
    }

    // Pour le fun, on ajoute une méthode qui récupère l'heure de l'erreur.
    public function getTime() {
        return date('Y-m-d H:i:s');
    }

    // Méthode retournant un message d'erreur complet et formaté.
    public function getError() {
  $message = $this->getMessage();
  $line 	 = $this->getLine();
  $file	 = substr(strrchr($this->getFile(),'/'),1);
  $time	 = $this->getTime();

  return <<<EOD
  <div class="toggle_info">
    <div class="error_info_bar">ERROR INFO</div>
    <div class="info_box">
      <fieldset class="catch_error">
        <strong>$message</strong><br/><br/>
        <strong>Line</strong> : $line<br/>
        <strong>File</strong> : $file<br/>
        <strong>Time</strong> : $time<br/>
      </fieldset>
    </div>
  </div>
EOD;
}


}
?>
