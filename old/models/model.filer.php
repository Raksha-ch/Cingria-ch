<?php
class Filer {
	
	function __construct() {
	}
	
	function setFolder($folder) {
		$this->folder = $folder;
		$this->setItemsArray($folder);
	}

	function getFolder() {
		return $this->folder;
	}
	
	function setItemsArray($folder,$sort=0) {
		$items_array = scandir($folder, $sort);
		$this->items_array = $items_array;
	}

	function getItemsArray() {
		return $this->items_array;
	}
	
	function buildItemsArray() {
			foreach ($this->getItemsArray() as $files) {
				if(($files != '.') && ($files != '..')) {
					$folder_r[] .= $files;
				}
			}
		return $folder_r;
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