<?php

class Cruder {
		
		
		
		function setInfoArray($info_array) {
			$this->_info_array = $info_array;
	  	}
	
		function getInfoArray() {
			return $this->_info_array;
	  	}
		
	 	function setCrud($crud) {
			$this->crud = $crud;
	  	}
	
	  	function setTable($_tbl) {
	  		$this->_tbl = $_tbl;
	  	}
	
	  	function getTable() {
	  		return $this->_tbl;
	  	}
		
		function setRedir($_redir) {
			$this->_redir = $_redir;
		}
		
		function getRedir() {
	  		return $this->_redir;
	  	}
	
	 	function setErrorFlag($_error_flag) {
	  		$this->_error_flag = $_error_flag;
	  	}

	  	function getErrorFlag() {
	  		return $this->_error_flag;
	  	}
	
		
	function add() {
		
		try {
			
			if ( $this->crud->insert( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) ) ) {
			
				$this->setErrorFlag(0);
				$serialized_info = serialize( $this->getInfoArray() );	
				header( "location: " . $this->getRedir() . '&info_box=created&serialized_info=' . $serialized_info );
				
			}
			
			else {
	  		
				$this->setErrorFlag(1);
  				throw new myExceptions('The new item couldn\'t be created</em>.');
			
			}
		
		}
		
		catch(myExceptions $e) {
  		
			print $e->getError();			
  		
		}	
					
	}
	
	
	function addAndGetLastInsertedId() {

		try {

			if ( $this->crud->insert( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) ) ) {


				return $this->crud->getLastInsertedId();

			}

			else {

				$this->setErrorFlag(1);
				throw new myExceptions('The new item couldn\'t be created</em>.');

			}

		}

		catch(myExceptions $e) {

			print $e->getError();			

		}	

	}
	
	
	
	function edit($field, $value) {
		
		try {
				
			if ( $this->crud->update( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) , $field , $value ) ) {
				
				$serialized_info = serialize( $this->getInfoArray() );	
				header( "location: " . $this->getRedir() . '&info_box=edited&serialized_info=' . $serialized_info );
				
			}
			
			else {	
				
  				$this->setErrorFlag( 1 );
				throw new myExceptions( 'The item couldn\'t be edited.' );
				
			}
				
		}
		
		catch( myExceptions $e ) {
			
			print $e->getError();	
					
		}
				
 	}


	
	function delete($field, $value) {
		
		try {
				
			if ( $this->crud->delete( $this->getTable() , $field, ' = ', $value) ) {
				
				header( "location: " . $this->getRedir()  );
				
			}
			
			else {	
				
  				$this->setErrorFlag( 1 );
				throw new myExceptions( 'The item couldn\'t be deleted.' );
				
			}
				
		}
		
		catch( myExceptions $e ) {
			
			print $e->getError();	
					
		}
				
 	}	
	
		
		
		
 	//  ------------------------------------------------------------------------------------------------------------------------------------------

}
?>