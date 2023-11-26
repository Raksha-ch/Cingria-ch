<?php

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //   																																	
  //   	SCRIPT SUMMARY (2010.03.21)  (n.b.: this file is included by all controllers)                                                                                                       	
  //   																																	
  //   	**************************************************************************************************************************************
  //   																																	
  //   	0) INITIALIZE VARS
  //		1) CONSTRUCTOR
  //		2) CRUD
  //		   		2.1) C-reate 	  insert( $tbl , array $fields )
  //		   		2.2) R-etrieve 	  select( $fetch_type = 'assoc' , $tbl , $fields = '*' , $join = '' , $where = '' , $orderBy = '' , $groupBy = '' , $limit = '' , $offset = '' )
  //		   		2.3) U-pdate	  update( $tbl , array $fields , $whereKey , $whereValue )
  //		   		2.4) D-elete	  delete( $tbl , $fieldName , $operator = ' = ', $fieldValue , $secondFieldName = '' , $secondOperator = ' = ' , $secondFieldValue = '' )
  //		   		2.5) Replace into replaceInto( $tbl , array $fields , $whereKey , $whereValue )
  //		   		2.6) Replace	  replace( $tbl , $fieldName , $operator = ' = ', $fieldValue , $secondFieldName = '' , $secondOperator = ' = ' , $secondFieldValue = '' )
  //		3) HELPERS
  //		   		3.1) Count records			countRecords( $tbl )
  //		   		3.2) Count records where	countRecordsWhere( $tbl , $where)
  //		   		3.3) Get last inserted id	getLastInsertedId()
  // 				3.4) Get matching fields	getMatchingFields( $tbl )
  //		4) DEBUG
  //		   		4.1) Print all records		printAllRecords( $tbl , array $rows )
  //		   		4.2) Print debug info 		printDebugInfo( $db , $tbl )
  //
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


  class Crud extends Connection
  {


  //  ******************************************************************************************************************************************
  //  0) INITIALIZE VARS
  //  ******************************************************************************************************************************************	

    private $_tbl = '';

  //  ------------------------------------------------------------------------------------------------------------------------------------------




  //  ******************************************************************************************************************************************
  //  1) CONSTRUCTOR
  //  ******************************************************************************************************************************************	

    function __construct() {

      parent::__construct();

    }

  //  ------------------------------------------------------------------------------------------------------------------------------------------




  //  ******************************************************************************************************************************************
  //  2) GETTERS & SETTERS
  //  ******************************************************************************************************************************************

    function setTable($tbl) 	{ $this->tbl = $tbl; }
    function getTable() 		{ return $this->tbl; }

  //  ------------------------------------------------------------------------------------------------------------------------------------------




  //  ******************************************************************************************************************************************
  //  2) CRUD
  //  ******************************************************************************************************************************************

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	2.1) Create (Insert)
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    public function insert( $tbl , array $fields )
    {

        $keys = array_keys( $fields );
        $keys = implode( "," , $keys );

        $placeholders = substr( str_repeat( '?,' , sizeof( $fields ) ), 0 , -1 );

        $query = " INSERT INTO $tbl ( $keys ) VALUES ( $placeholders ) ";

        $stmt  = $this->_dbc->prepare( $query );

        $i = 1;
        foreach ( $fields as $k => $v ) {

            $stmt->bindValue( $i++ , $v );

        }

        if ( !$stmt->execute() ) {

            return false;

        }

        else {

          return true;

        }

    }	

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	2.2) Retrieve (Select)
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    public function select( $fetch_type = 'assoc' , $tbl , $fields = '*' , $join = '' , $where = '' , $orderBy = '' , $groupBy = '' , $limit = '' , $offset = '' )
    {
        $query = ' SELECT ' . $fields . ' FROM ' . $tbl;

      if ( $join ) {

        $query .= ' ' . $join;

      }


        if ( $where ) {

            $query .= ' WHERE ' . $where;

      }


        if ( $orderBy ) {

            $query .= ' ORDER BY ' . $orderBy;

        }

        if ( $groupBy ) {

            $query .= ' GROUP BY ' . $groupBy;

        }

        if ( $limit ) {

            $query .= ' LIMIT ' . $limit;

        }

      if ( $offset ) {

            $query .= ' OFFSET ' . $offset;

      }

      // print $query;			

      $stmt = $this->_dbc->prepare( $query ) ;

        if ( !$stmt->execute() ) {

            return false ;

      }

      switch ( $fetch_type ) {

        case 'assoc':

          return $stmt->fetchAll( PDO::FETCH_ASSOC );

        break;

        case 'num':

          return $stmt->fetchAll( PDO::FETCH_NUM );

        break;

        case 'both':

          return $stmt->fetchAll( PDO::FETCH_BOTH );

        break;

        default:

          return $stmt->fetchAll( PDO::FETCH_ASSOC );

        break;
      }

    }

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	2.3) Update
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    public function update( $tbl , array $fields , $whereKey , $whereValue , $whereSecondKey = '' , $whereSecondValue = '' )

    {	

      foreach ( $fields as $k => $v )
        {

            $value[] .=  $k." = ?";

      }

      $values = implode( "," , $value );

      $query = " UPDATE $tbl SET $values WHERE $whereKey = $whereValue ";	

      if ( ( $whereSecondKey != '' ) && ( $whereSecondValue != '' ) ) { $query .=  ' AND ' . $whereSecondKey . ' = ' . $whereSecondValue ;}

      $stmt  = $this->_dbc->prepare( $query );			

      $i = 1;
      foreach ( $fields as $k => $v ) {
          $stmt->bindValue( $i++ , stripslashes($v) );
      }


      if ( !$stmt->execute() ) {

              return false;

      }

      else {

        return true;

      }

    }


  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	2.4) Delete
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    public function delete( $tbl , $fieldName , $operator = ' = ', $fieldValue , $secondFieldName = '' , $secondOperator = ' = ' , $secondFieldValue = '' )

    {

        $query = " DELETE FROM `$tbl` WHERE `$fieldName` $operator '$fieldValue'";

      if ( $secondFieldName && $secondFieldValue ) {

            $query .= ' AND '. $secondFieldName . $secondOperator . $secondFieldValue;

      }

        $stmt = $this->_dbc->prepare( $query );
        $stmt->bindParam( ':fieldValue' , $fieldValue , PDO::PARAM_STR );

            if ( !$stmt->execute() ) {

                return false ;

          }

        else {

          return true;

        }

    }


      //  ------------------------------------------------------------------------------------------------------------------------------------------
      // 	2.5) Replace Into
      //  ------------------------------------------------------------------------------------------------------------------------------------------

        public function replaceInto( $tbl , array $fields , array $values )

        {	

          foreach ( $values as $k ) {
              $parameter_values[] = '?';
          }

          $the_fields = implode( "," , $fields );
          $the_values = implode( "," , $parameter_values );

          $query = " REPLACE INTO $tbl ( $the_fields ) VALUES ( $the_values ) ";					
          $stmt  = $this->_dbc->prepare( $query );

          $i = 1;
          foreach ( $values as $k ) {
              $stmt->bindValue( $i++ , $k );
          }


          if ( !$stmt->execute() ) {

                  return false;

          }

          else {

            return true;

          }

        }		






  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	2.6) Replace
  //  ------------------------------------------------------------------------------------------------------------------------------------------


    public function replace( $tbl , $field_to_be_updated , $old_field_value ,  $new_field_value , $whereField , $likeValue )

    {	

      $query = " UPDATE $tbl SET $field_to_be_updated = replace( $field_to_be_updated , '$old_field_value' , '$new_field_value' ) WHERE $whereField LIKE '$likeValue%' ";	
      print $query;
      $stmt  = $this->_dbc->prepare( $query );

      if ( !$stmt->execute() ) {

            return false;

      }

      else {

        return true;

      }

    }




  //  ------------------------------------------------------------------------------------------------------------------------------------------


  //  ******************************************************************************************************************************************
  //  3) HELPERS
  //  ******************************************************************************************************************************************

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	3.1) Count records
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    public function countRecords( $tbl ) {

      $sql     = "SELECT * FROM `$tbl`";
      $records = $this->_dbc->prepare($sql);
      $records->execute();
      $rows    = $records->fetchAll(PDO::FETCH_ASSOC);
      return   count($rows);

    }

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	3.2) Count records where
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    public function countRecordsWhere( $tbl , $where) {

      $sql     = "SELECT * FROM `$tbl` WHERE $where";
      $records = $this->_dbc->prepare($sql);
      $records->execute();
      $rows    = $records->fetchAll(PDO::FETCH_ASSOC);
      return   count($rows);

    }

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	3.3) Get last inserted id
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    public function getLastInsertedId() {

      return $this->_dbc->lastInsertId();

    }

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	3.4) Get matching fields
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    function getMatchingFields( $tbl ) {

    $fields = $this->getFieldsName( $tbl );

      foreach($_POST as $k => $v) {

        if (in_array( $k , $fields ) && isset ($v) ) {

          $matchingFields[$k] = $v;

        }

      }

      return $matchingFields;	

    }

  //  ------------------------------------------------------------------------------------------------------------------------------------------





  //  ******************************************************************************************************************************************
  //  4) DEBUG
  //  ******************************************************************************************************************************************

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	4.1) Print all records
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    public function printAllRecords( $tbl , array $rows ) {

        if ( $rows ) {

          foreach ( $rows as $row )

          {	
            print '<li>';

              foreach ( $row as $fieldname=>$value )

              {

                  print $fieldname.' = '.$value.' | ';

              }

              print '</li>';

          }

        }

        else {

          print 'No records found in table <strong>'.$tbl.'</strong>.';

        }

    }

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	4.2) Print debug info
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    function printDebugInfo( $db , $tbl ) {

      print '<h4>Connection Vars</h4>';
      $this->getConnectionVars();

      print '<br/><br/><h4>Table Names</h4>';
      $this->getTablesName( $db );

      print '<br/><br/><br/><h4>Field Names</h4>';
      $this->countRecords( $tbl );

      print ' records<br/><br/>';
      $this->getFieldsNameForDebug( $tbl );

    }

    //  ------------------------------------------------------------------------------------------------------------------------------------------




    public function buildImageArray( $tbl , $rows , $selected_img_rows ) {

      if ( isset( $rows ) ) {

        foreach ( $rows as $row ) {

            $imgArray[] =				

            array( $row[$selected_img_rows[0]]=>$row[$selected_img_rows[1]].$row[$selected_img_rows[2]] );

            }

            return ( $imgArray ) ;

        }

        else {

        print 'No records found in table <strong>'.$tbl.'</strong>.';

        }

    }

    public function returnImageArray( $build_img_array ) {

      $this->build_img_array = $build_img_array;
      return $this->build_img_array;

    }

    public function printSelectedFields( $tbl , $rows , $selected_rows ) {

        if ( isset( $rows ) ) {

          foreach ($rows as $row ) {

            print '<li>';

            foreach ( $selected_rows as $selected_row ) {

                print $row[$selected_row].' | ';

                }

            print '</li>';

           }

        }

        else {

          print 'No records found in table <strong>'.$tbl.'</strong>.';

        }

    }

    public function fetchSelectedAsObject($tbl, $fieldname=null, $id=null) {
      $sql = "SELECT * FROM `$tbl` WHERE `$fieldname`=:id";
      $records = $this->_dbc->prepare($sql);
      $records->bindParam(':id', $id);
      $records->execute();
      $fetched_obj = $records->fetch(PDO::FETCH_OBJ);

      $recordset = $this->_dbc->query("SHOW COLUMNS FROM $tbl");
      $fields = $recordset->fetchAll(PDO::FETCH_ASSOC);
      foreach ($fields as $field) {
          $fetched_obj->$field['Field'];
      }
      $this->fetched_obj = $fetched_obj;				
    }

    public function getObj($field) {
      return $this->fetched_obj->$field;	
    }

















      public function fetchJoin($id) {
      $sql = "SELECT *
          FROM item_quantity
          JOIN size_array ON item_quantity.size_array_id = size_array.size_array_id
          WHERE item_id = $id
          ORDER BY size_array_rank ASC";
      $records = $this->_dbc->prepare($sql);
      $records->bindParam(':id', $id);
      $records->execute();
      $rows = $records->fetchAll(PDO::FETCH_ASSOC);	
      return $rows;
    }

      public function newFetchJoin($id) {
      $sql = "SELECT DISTINCT size_origin
          FROM range_of_sizes
          JOIN item_quantity ON range_of_sizes.size_array_id = item_quantity.size_array_id
          WHERE item_id = $id
          ORDER BY range_of_sizes.size_value ASC";
      $records = $this->_dbc->prepare($sql);
      $records->bindParam(':id', $id);
      $records->execute();
      $rows = $records->fetchAll(PDO::FETCH_ASSOC);	
      return $rows;
    }



}
?>