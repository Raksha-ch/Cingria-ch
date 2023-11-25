<?php
include 'functions/function.validateEmailAddress.php';

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //   																																	
  //   	SCRIPT SUMMARY (2010.03.21)  (n.b.: this file is included by switch.profiler.php)                                                                                                       	
  //   																																	
  //   	**************************************************************************************************************************************
  //   																																	
  //   	0) INITIALIZE VARS
  //	1) CONSTRUCTOR
  //	2) GETTERS & SETTERS  | Crud | ErrorFlag | ProfileEmailAddress | ProfileName | ProfilePassword | ProfileSurname | Redir | Table |
  //	3) PROFILES
  //	   		3.1) Create profile
  //	   		3.2) Edit profile
  //	   		3.3) Delete profile
  //	   		3.4) Flush profile
  //	4) PROFILES
  //	   		4.1) Create profile
  //	   		4.2) Edit profile
  //	   		4.3) Delete profile
  //	5) CHECKS
  //	   		5.1) Check existence using Email Address
  //	   		5.2) Validate Email Address format
  //	   		5.3) Validate Email Address
  //	6) INFO
  //	   		6.1) Exceptions
  //	   		6.2) Profile Info
  //
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Profiler
{		

	//  ******************************************************************************************************************************************
	//  0) INITIALIZE VARS
	//  ******************************************************************************************************************************************	

		public $profile_field			= '';
		public $profile_id				= '';
		public $fieldname				= '';
		public $operator				= '';
		public $fieldvalue				= '';
    	
		private	$_profile_email_address	= '';
		private	$_profile_name			= '';
		private	$_profile_surname		= '';
  		private $_redir					= '';
  		private $_tbl					= '';
 		private $edited_profile_info 	= array();
	
	//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	
	
	
	//  ******************************************************************************************************************************************
	//  1) CONSTRUCTOR
	//  ******************************************************************************************************************************************	

  		function __construct() {
			$this->setErrorFlag(0);
			$this->setTable('profile');
  		}

	//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	
	
	
	//  ******************************************************************************************************************************************
	//  2) GETTERS & SETTERS
	//  ******************************************************************************************************************************************

  		function setCrud($crud) 									{ $this->crud = $crud; }
    	
  		function setProfileName( $_profile_name ) 					{ $this->_profile_name = $_profile_name; }
  		function getProfileName() 									{ return $this->_profile_name; }
    	
		function setProfileSurname($_profile_surname) 				{ $this->_profile_surname = $_profile_surname; }
		function getProfileSurname() 								{ return $this->_profile_surname; }
    	
		function setProfilePassword($_profile_password) 			{ $this->_profile_password = $_profile_password; }
		function getProfilePassword() 								{ return $this->_profile_password; }	
    	
		function setProfileEmailAddress($_profile_email_address) 	{ $this->_profile_email_address = $_profile_email_address; }	
		function getProfileEmailAddress() 							{ return $this->_profile_email_address; }	
    	
		function setTable($_tbl) 									{ $this->_tbl = $_tbl; }
		function getTable() 										{ return $this->_tbl; }
    	
		function setRedir($_redir) 									{ $this->_redir = $_redir; }
		function getRedir() 										{ return $this->_redir; }
    	
		function setErrorFlag($_error_flag) 						{ $this->_error_flag = $_error_flag; }	
		function getErrorFlag() 									{ return $this->_error_flag; }

	//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	
	
	
	//  ******************************************************************************************************************************************
	//  3) PROFILES
	//  ******************************************************************************************************************************************

	//  ------------------------------------------------------------------------------------------------------------------------------------------
	// 	3.1) Create profile
	//  ------------------------------------------------------------------------------------------------------------------------------------------

		function createProfile() {
			
			try {
				
				if ( $this->crud->insert( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) ) ) {
					
					header("location: ".$this->getRedir().'&info_box=created');
				
				}
				else {
					
		  			$this->setErrorFlag( 1 );
  					throw new myExceptions( 'The new record couldn\'t be created</em>.' );

				}
				
			}
			
			catch( myExceptions $e ) {
				
  				print $e->getError();
			
  			}	
						
		}
	
	//  ------------------------------------------------------------------------------------------------------------------------------------------
	// 	3.2) Edit profile
	//  ------------------------------------------------------------------------------------------------------------------------------------------
	
		function editProfile() {
			
			try {
					
				if ( $this->crud->update( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) , 'profile_id' , $_POST['profile_id'] ) ) {
					
					$serialized_info = serialize( $this->returnEditedProfileInfo() );	
					header( "location: " . $this->getRedir() . '&info_box=edited&serialized_info=' . $serialized_info .'&slice_1=' .$_POST['slice_1'] );
					
				}
				
				else {	
					
  					$this->setErrorFlag( 1 );
					throw new myExceptions( 'The profile couldn\'t be edited.' );
					
				}
					
			}
			
			catch( myExceptions $e ) {
				
				print $e->getError();	
						
			}
					
 		}




		function editPage() {
			
			try {
					
				if ( $this->crud->update( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) , 'page_id' , $_POST['page_id'] ) ) {
					
					
					header( "location: " . $this->getRedir() . '&info_box=edited&serialized_info=1&slice_1=' .$_POST['slice_1'] );
					
				}
				
				else {	
					
  					$this->setErrorFlag( 1 );
					throw new myExceptions( 'The page couldn\'t be edited.' );
					
				}
					
			}
			
			catch( myExceptions $e ) {
				
				print $e->getError();	
						
			}
					
 		}



		function editDiscography() {
			
			try {
					
				if ( $this->crud->update( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) , 'discography_id' , $_POST['discography_id'] ) ) {
					
					
					header( "location: " . $this->getRedir() . '&info_box=edited&serialized_info=1&slice_1=' .$_POST['slice_1'] );
					
				}
				
				else {	
					
  					$this->setErrorFlag( 1 );
					throw new myExceptions( 'The discography couldn\'t be edited.' );
					
				}
					
			}
			
			catch( myExceptions $e ) {
				
				print $e->getError();	
						
			}
					
 		}


		function editDiscographyItem() {
			
			try {
					
				if ( $this->crud->update( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) , 'discography_item_id' , $_POST['discography_item_id'] ) ) {
					
					
					header( "location: " . $this->getRedir() . '&info_box=edited&serialized_info=1&slice_1=' .$_POST['slice_1'] );
					
				}
				
				else {	
					
  					$this->setErrorFlag( 1 );
					throw new myExceptions( 'The discography item couldn\'t be edited.' );
					
				}
					
			}
			
			catch( myExceptions $e ) {
				
				print $e->getError();	
						
			}
					
 		}

	//  ------------------------------------------------------------------------------------------------------------------------------------------
	// 	3.3) Delete profile
	//  ------------------------------------------------------------------------------------------------------------------------------------------
  	
  		function deleteProfile( $fieldName , $fieldValue ) {
		
			try {
				
				if ( $this->crud->delete( $this->getTable() , $fieldName , '=' , $fieldValue , '' , '' , '' ) ) {
					
					header( "location: " . $this->getRedir() . '&slice_1=' .$_POST['slice_1'] );	
					
				}
				
				else {
					
		  			$this->setErrorFlag( 1 );
  					throw new myExceptions( 'The profile <em>#' . $profile_id . '</em> couldn\'t be deleted from table <em>' . $this->getTable() . '</em>.' );

				}
				
			}
			catch( myExceptions $e ) {
				
  				print $e->getError();
			
  			}
  		}
	
	//  ------------------------------------------------------------------------------------------------------------------------------------------
	// 	3.4) Flush profile
	//  ------------------------------------------------------------------------------------------------------------------------------------------

  		function doFlushSingleOperatorProfile( $fieldname , $operator , $fieldvalue ) {
	
			try {
				
		    	if ( $this->crud->singleOperatorDeleteRow( $this->getTable() , $fieldname , $operator , $fieldvalue ) == 1 ) { // PDO returns 1 if  delete is OK
			
		    		header("location: ".$this->getRedir());	
		    	
				}
				
		    	else {
			
			  		$this->setErrorFlag( 1 );
		  			throw new myExceptions( 'The profile(s) couldn\'t be deleted from table <em>' . $this->getTable() . '</em>.' );
	
		    	}
		
		    }
		
		    catch( myExceptions $e ) {
			
		  		print $e->getError();
					
		  	}
		
		}
		
		function doFlushMultipleOperatorProfile( $fieldname , $field_id , $fieldname_2 , $field_id_2 ) {
			
			try {
		    	if ( $this->crud->multipleOperatorDeleteRow( $this->getTable() , $fieldname , $field_id , $fieldname_2 , $field_id_2 ) == 1 ) { // PDO returns 1 if  delete is OK
			
		    		header( "location: " . $this->getRedir() );	
		
		    	}
		
		    	else {
			
			  		$this->setErrorFlag( 1 );
		  			throw new myExceptions( 'The profile(s) couldn\'t be deleted from table <em>' . $this->getTable() . '</em>.' );
		
		    	}
		
		    }
		
		    catch( myExceptions $e ) {
			
		  		print $e->getError();
					
		  	}
		
		}
	
	//  ------------------------------------------------------------------------------------------------------------------------------------------





	//  ******************************************************************************************************************************************
	//  4) PROFILE DESCRIPTION
	//  ******************************************************************************************************************************************

	//  ------------------------------------------------------------------------------------------------------------------------------------------
	// 	4.1) Add profile description
	//  ------------------------------------------------------------------------------------------------------------------------------------------
	

	function addProfileDescription() {
		
		try {
			
			if ( $this->crud->insert( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) ) ) {
				
				header("location: ".$this->getRedir().'&info_box=created');
			
			}
			else {
				
	  			$this->setErrorFlag( 1 );
				throw new myExceptions( 'The new profile couldn\'t be created</em>.' );

			}
			
		}
		
		catch( myExceptions $e ) {
			
			print $e->getError();
		
		}	
					
	}

	//  ------------------------------------------------------------------------------------------------------------------------------------------
	// 	4.2) Edit profile description
	//  ------------------------------------------------------------------------------------------------------------------------------------------
	
		function editProfileDescription() {
			
			try {
					
				if ( $this->crud->update( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) , 'profile_description_id' , $_POST['profile_description_id'] ) ) {
					
					$serialized_info = serialize( $this->returnEditedProfileInfo() );	
					header( "location: " . $this->getRedir() . '&info_box=edited&serialized_info=' . $serialized_info );
					
				}
				
				else {	
					
  					$this->setErrorFlag( 1 );
					throw new myExceptions( 'The profile couldn\'t be edited.' );
					
				}
					
			}
			
			catch( myExceptions $e ) {
				
				print $e->getError();	
						
			}
					
 		}
	
	
	
	//  ******************************************************************************************************************************************
	//  5) CHECKS
	//  ******************************************************************************************************************************************

	//  ------------------------------------------------------------------------------------------------------------------------------------------
	// 	5.1) Check existence using Email Address
	//  ------------------------------------------------------------------------------------------------------------------------------------------

  		function checkProfileExistenceUsingEmailAddress() {
  			
			try {
			
				// $email_address = $this->crud->fetchSelected($this->getTable(),'profile_email_address',$this->getProfileEmailAddress());
				
				$where = " profile_email_address = " . $this->getProfileEmailAddress();
				$email_address = $this->crud->select( '' , $this->getTable() , '*' , '', $where , '', '', '1' , '0' );
				
				
				if ( count( $email_address ) > 0 )  {
					
  					$this->setErrorFlag( 1 );
  					throw new myExceptions( 'A profil using <em>the same email address</em> exists already. Please check/change it.' );

  				}

  			}

  			catch( myExceptions $e ) {
	
  				print $e->getError();

  			}

  		}

	//  ------------------------------------------------------------------------------------------------------------------------------------------
	// 	5.2) Validate Email Address format
	//  ------------------------------------------------------------------------------------------------------------------------------------------

		function validateEmailAddressFormat() {
			
			try {
		  		
				if ( validate_email( $this->getProfileEmailAddress() ) == false )  {
					
			  		$this->setErrorFlag( 1 );
		  			throw new myExceptions('Your have an <em>invalid email address </em> format. Please correct it.');
		
		  		}
		
		  	}
		
		  	catch( myExceptions $e ) {
			
		  		print $e->getError();
		
		  	}
		
		}

	//  ------------------------------------------------------------------------------------------------------------------------------------------
	// 	5.3) Validate Email Address
	//  ------------------------------------------------------------------------------------------------------------------------------------------

 		function validatePassword() {
	
		  	try {
			
		  		if ( !preg_match( '`^\w{4,16}$`' , $this->getProfilePassword() ) ) {
			
			  		$this->setErrorFlag( 1 );
		  			throw new myExceptions( 'Your have an <em>invalid password</em> format.
					Password must be <em>at least 4 characters</em> long and contain <em>only letters or numbers</em>.' );
					
		  		}
		
		  	}
		
		  	catch( myExceptions $e ) {
			
		  		print $e->getError();
		
		  	}
		
		}
	
	//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	
	
		
	//  ******************************************************************************************************************************************
	//  6) INFO
	//  ******************************************************************************************************************************************

	//  ------------------------------------------------------------------------------------------------------------------------------------------
	// 	6.1) Profile Info
	//  ------------------------------------------------------------------------------------------------------------------------------------------
	
  		function returnEditedProfileInfo() {
	
			$edited_profile_info = array( 'name'	 => $this->getProfileName(),
										  'surname'	 => $this->getProfileSurname() );
										
			return $edited_profile_info;
			
  		}


 	//  ------------------------------------------------------------------------------------------------------------------------------------------


}
?>

