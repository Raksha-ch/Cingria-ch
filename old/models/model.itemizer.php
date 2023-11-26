<?php
class Itemizer {

  function createItem() {

    try {

      if ($this->crud->insert( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) ) ) {

        $this->setErrorFlag(0);
        $serialized_info = serialize( $this->returnPropertyInfo() );	
        header( "location: " . $this->getRedir() . '&info_box=created&serialized_info=' . $serialized_info );

      }

      else {

        $this->setErrorFlag(1);
          throw new myExceptions('The new property couldn\'t be created</em>.');

      }

    }

    catch(myExceptions $e) {

      print $e->getError();			

    }	

  }

    function editProperty() {

      try {

        if ( $this->crud->update( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) , 'property_id' , $_POST['property_id'] ) ) {

          $serialized_info = serialize( $this->returnPropertyInfo() );	
          header( "location: " . $this->getRedir() . '&info_box=edited&serialized_info=' . $serialized_info );

        }

        else {	

            $this->setErrorFlag( 1 );
          throw new myExceptions( 'The property couldn\'t be edited.' );

        }

      }

      catch( myExceptions $e ) {

        print $e->getError();	

      }

    }


  function addPropertyDescription() {

    try {

      if ($this->crud->insert( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) ) ) {

        $this->setErrorFlag(0);

      }

      else {

        $this->setErrorFlag(1);
          throw new myExceptions('The new property description couldn\'t be created.');

      }

    }

    catch(myExceptions $e) {

      print $e->getError();			

    }	

  }



    function editPropertyDescription() {

      try {

        if ( $this->crud->update( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) , 'property_description_id' , $_POST['property_description_id'] ) ) {

          $serialized_info = serialize( $this->returnPropertyInfo() );	
          header( "location: " . $this->getRedir() . '&info_box=edited&serialized_info=' . $serialized_info );

        }

        else {	

            $this->setErrorFlag( 1 );
          throw new myExceptions( 'The property description couldn\'t be edited.' );

        }

      }

      catch( myExceptions $e ) {

        print $e->getError();	

      }

    }


  function addPropertyFacilities() {

    try {

      if ($this->crud->insert( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) ) ) {

        $this->setErrorFlag(0);
        $serialized_info = serialize( $this->returnEditedPropertyInfo() );
        header( "location: " . $this->getRedir() . '&info_box=edited&serialized_info=' . $serialized_info );
      }

      else {

        $this->setErrorFlag(1);
          throw new myExceptions('The new property facilities couldn\'t be created.');

      }

    }

    catch ( myExceptions $e ) {

      print $e->getError();			

    }

  }


  function updatePropertyFacilities() {

    try {

      if ( $this->crud->update( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) , 'property_facilities_id' , $_POST['property_facilities_id'] ) ) {

        $serialized_info = serialize( $this->returnEditedPropertyInfo() );	
        header( "location: " . $this->getRedir() . '&info_box=edited&serialized_info=' . $serialized_info );

      }

      else {	

        $this->setErrorFlag( 1 );
        throw new myExceptions( 'The property facilities description couldn\'t be edited.' );

      }

    }

    catch( myExceptions $e ) {

      print $e->getError();	

    }

  }


  function addInfoToItem($table, array $fields) {

    $whereKey   = $table.'_id';

    if ( $this->crud->insert( $table , $this->crud->getMatchingFields( $table ) ) ) {

      $whereValue = $this->crud->getLastInsertedId();

    }

    $this->crud->update($table, $fields, $whereKey,$whereValue);

  }



   function setCrud($crud) {
    $this->crud = $crud;
    }

   function setDictionary($dic) {
    $this->dic = $dic;
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

  function setPropertyName($_property_name) {
    $this->_property_name = $_property_name;
  }

  function getPropertyName() {
      return $this->_property_name;
    }


   function setErrorFlag($_error_flag) {
      $this->_error_flag = $_error_flag;
    }

    function getErrorFlag() {
      return $this->_error_flag;
    }

  function checkPropertyExistence( $property ) {

      try {

        if ( $property == 0 )  {

          $this->_error_flag = 1;
          throw new myExceptions('Please select a property in the list.');

        }

      }

      catch( myExceptions $e ) {

        return $e->getError();

      }



  }


  //  ******************************************************************************************************************************************
  //  6) INFO
  //  ******************************************************************************************************************************************

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	6.2) Profile Info
  //  ------------------------------------------------------------------------------------------------------------------------------------------

      function returnPropertyInfo() {

      $property_info = array( 'name'	=> $this->getPropertyName() );

      return $property_info;

      }

    function returnEditedPropertyInfo() {

      $property_info = array( 'name'	=> $this->getPropertyName() );

      return $property_info;

      }



  //  ------------------------------------------------------------------------------------------------------------------------------------------

}
?>