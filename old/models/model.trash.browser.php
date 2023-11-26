<?php
class TrashBrowser {

  function __construct($path) {
   $this->setItemsArray($path);
  }

  function setItemsArray($path,$sort=0) {
    $items_array = scandir($path, $sort);
    $this->items_array = $items_array;
  }

  function getItemsArray() {
    return $this->items_array;
  }

  function buildItemsArray($items_array) {
      foreach ($items_array as $files) {
        if(($files != '.') && ($files != '..')) {
          $trashed_files_r[] .= $files;
        }
      }
    return $trashed_files_r;
  }

  function countItems() {
     $items = count($this->getItemsArray());
    return $items-2;// 2 files are . and ..
  }

  function eraseFile($file_to_be_erased,$location='') {
    try {
      if(unlink($file_to_be_erased)) {
        if(isset($location)) {
          header("location: ".$location);	
        }
      }
      else {
        throw new myExceptions('The file <em>'.$file_to_be_erased.'</em> couldn\'t be erased.');
      }
    }
    catch(myExceptions $e) {
        print $e->getError();			
      }
  }
}
?>