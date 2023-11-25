<?php
class myExceptions extends Exception {
    
    // Constructeur de la classe.
    // Il faut bien penser à rapeller le constructeur de la classe Exception.
    public function __construct($msg) {
        parent :: __construct($msg);
    }

    
    // Méthode retournant un message d'erreur complet et formaté.
    public function getError() {

        // On retourne un message d'erreur complet pour nos besoins.
        $return  = '<div style="float:right;clear:both;"><fieldset class="info"><legend>ERROR INFO</legend>';
        $return .= '<strong>'.$this->getMessage().'</strong><br/></fieldset></div>';
        return $return;
    }


}
?>