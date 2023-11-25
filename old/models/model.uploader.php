<?php

include('functions/function.convertFromBytes.php');


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//   																																	
//   SCRIPT SUMMARY (2010.04.01)  (n.b.: this file is included by switch.uploader.php & switch.profiler.php)                                                                                                        	
//   																																
//   **************************************************************************************************************************************
//   																																
//   0) INITIALIZE VARS
//	 1) CONSTRUCTOR
//	 2) GETTERS & SETTERS
//	 3) UPLOAD
//	    		3.1) Upload File
//	    		3.2) Edit File
//	    		3.3) Delete File
//	    		3.4) Rename File
//				3.5) Rename File On Server
//				3.6) Move To Trash
//				3.7) Get Directories Array
//	 4) FILE INFO ARRAY
//	 5) FILTER FILE TYPES
//	    		5.1) Get File Extension Icon
//				5.2) Filter Displayable Files
//	 6) CHECKS
//				6.1) Check File Existence
// 				6.2) Check Dir Existence
//				6.3) Check Extension
//				6.4) Check File Size
// 				6.5) Check File Title
// 				6.6) Check File Dir				
//	 7) INFO
//	 			7.1) Editing File Info
//				7.2) Edited File Info
//				7.3) Uploaded File Info
//				7.4) EXIF Info
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




class Uploader
{
	
//  ******************************************************************************************************************************************
//  0) INITIALIZE VARS
//  ******************************************************************************************************************************************	
	
	const  MAX_FILE_SIZE  				= '8000000';

  	public $extension_r 				=  array( ".doc" , ".flv" , ".gif" , ".jpg" , ".mp3" ,".pdf" , ".png" , ".psd" , ".swf" , ".tif" , ".zip" );
  	public $displayable_extension_r 	=  array( ".gif" , ".jpg" , ".png");
  	
  	public $debug_info					= '';
  	public $error_flag					= 0;
  	public $new_file_name				= '';
  	public $upload_info					= '';
  	public $uploader_form				= '';
  	public $file_to_be_trashed			= '';
  	
  	private $_redir						= '';
  	private $_file_ext_field		    = '';
  	private $_file_name_field		    = '';
  	private $_file_parent_id_field		= '';
  	private $_file_creation_field	    = '';
  	private $_file_ext			    	= '';
  	private $_file_src 			    	= '';
  	private $_file_src_mime 		    = '';
  	private $_file_src_size		    	= '';
  	private $_file_src_temp		    	= '';
  	private $_file_name			    	= '';
  	private $_profile_id		    	= '';
  	private $_new_file_name 		    = '';
  	private $_file_name_on_server	    = '';
  	private $_saved_array			    = array();
  	private $_target 				    = '';
  	private $_tbl					    = '';
	
//  ------------------------------------------------------------------------------------------------------------------------------------------





//  ******************************************************************************************************************************************
//  1) CONSTRUCTOR
//  ******************************************************************************************************************************************	

	function __construct() {
		
		$this->_file_src 			= normalize ( $_FILES['file']['name'] );	
	  	$this->_file_src_mime  		= $_FILES['file']['type'];
	  	$this->_file_src_size 		= $_FILES['file']['size'];
	  	$this->_file_src_temp		= $_FILES['file']['temp'];
		$this->file_to_be_trashed	= $_GET['file_to_be_trashed'];
		
		$this->setDir				( $_GET['dir'] );
	  	$this->setFileName			( $this->_file_src );	
	  	$this->setFileExtension		( $this->_file_src );
		$this->setSave				( true ); 	
			
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------




//  ******************************************************************************************************************************************
//  2) GETTERS & SETTERS
//  ******************************************************************************************************************************************  		
	
	function setCrud				( $crud ) 					{ $this->crud = $crud ;}
	
	function setFileName			( $_file_name ) 			{ $this->_file_name = $_file_name ;}
	function getFileName			() 							{ return $this->_file_name ;}

	function setOldFileName			( $_old_file_name ) 		{ $this->_old_file_name = $_old_file_name ;}
	function getOldFileName			() 							{ return $this->_old_file_name ;}
	
	function setFileExtension		( $_file_ext ) 				{ $this->_file_ext = $_file_ext ;}
	function getFileExtension		() 							{ return $this->_file_ext ;}
	
	function setTarget				( $_target ) 				{ $this->_target = $_target ;}
	function getTarget				() 							{ return $this->_target ;}
	
	function setProfileId			( $_profile_id ) 			{ $this->_profile_id = $_profile_id ;}
	function getProfileId			() 							{ return $this->_profile_id ;}
	
	function setFileUrl				($_relative_url) 			{ $this->_relative_url = $_relative_url ;}	
	function getFileUrl				() 							{ return $this->_relative_url ;}

	function setTable				( $_tbl ) 					{ $this->_tbl = $_tbl ;}
	function getTable				() 							{ return $this->_tbl ;}
	
	function setDir					( $_dir ) 					{ $this->_dir = $_dir ;}
	function getDir					() 							{ return $this->_dir ;}
	
	function setTrashcan			( $_trashcan ) 				{ $this->_trashcan = $_trashcan ;}
  	function getTrashcan			() 							{ return $this->_trashcan ;}

	function setRedir				( $_redir ) 				{ $this->_redir = $_redir ;}
	function getRedir() 										{ return $this->_redir ;}	

  	function getNormalizedFileName	() 							{ return normalize ( $this->_file_name ) ;}
	function getFileNameOnServer	() 							{ $this->_file_name_on_server = $this->getTarget().$this->getFileName().$this->getFileExtension();
																  return $this->_file_name_on_server ;}
																
	function setSave				( $_save ) 					{ $this->_save = $_save ;}	
    function getSave				() 							{ return $this->_save ;}

    function setErrorFlag			( $_error_flag ) 			{ $this->_error_flag = $_error_flag ;}	
    function getErrorFlag			() 							{ return $this->_error_flag ;}
		
															
//  ------------------------------------------------------------------------------------------------------------------------------------------





//  ******************************************************************************************************************************************
//  3) UPLOAD
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.1) Upload File
//  ------------------------------------------------------------------------------------------------------------------------------------------

	function uploadFile() {
	
		try {
    	
			if ( !move_uploaded_file ( $_FILES['file']['tmp_name'] , $this->getFileUrl() ) ) {
  				
				$this->setErrorFlag( 1 );
  		 		throw new myExceptions( 'Couldn\'t move <em>' . $_FILES['file']['tmp_name'] . '</em> file to server location <em>' . $this->getTarget() . '</em>.' );
  		
 			}
  			
			else {
				
				if ( $this->getErrorFlag() == 0 ) {
  					
					if ( $this->getSave() == true ) {
						
						if ( $this->crud->insert( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) ) ) {

							$serialized_info=serialize( $this->uploadedFileInfo() );	
							header( "location: " .
									 $this->getRedir() . '&info_box=uploaded&file=' . $this->getFileName() . $this->getFileExtension() . '&serialized_info=' . $serialized_info );	

						}

						else {

	  						$this->setErrorFlag( 1 );
							throw new myExceptions( 'The new file couldn\'t be uploaded.' );

						}
						
					}
				
				}
			
			}
		
		}
		
		catch ( myExceptions $e ) {	
			
				print $e->getError();
		
		}

	}
	
	
	function saveFileInfo() {
		
		try {
			
			if ( $this->crud->insert( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) ) ) {

				$serialized_info=serialize( $this->savedFileInfo() );	
				header( "location: " . $this->getRedir() . '&info_box=saved&serialized_info=' . $serialized_info );	

			}

			else {

				$this->setErrorFlag( 1 );
				throw new myExceptions( 'The new file couldn\'t be uploaded.' );

			}
		
		}
		
		catch ( myExceptions $e ) {	
			
				print $e->getError();
		
		}

	}
	
	
	function updateFileInfo( $field , $value, $field_2 , $value_2 ) {
		
		try {
			
			if ( $this->crud->update( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) , $field , '"'.$value.'"', $field_2 , '"'.$value_2.'"' ) ) {
				
				$serialized_info = serialize( $this->editedFileInfo() );	
				header( "location: " . $this->getRedir() . '&info_box=edited&file=&serialized_info=' . $serialized_info );		
				
			}
			
			else {	
				
				$this->setErrorFlag( 1 );
				throw new myExceptions( 'The file couldn\'t be edited.' );
				
			}
				
		}
		
		catch ( myExceptions $e ) {
			
			print $e->getError();	
					
		}

	}
	
	
//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.2) Edit File
//  ------------------------------------------------------------------------------------------------------------------------------------------
 	
  function editFile() {
	
			try {
				
				
				try {
					
					if ( !$this->renameFileOnServer() )  {
						
						$this->setErrorFlag( 1 );
						throw new myExceptions( 'The file couldn\'t be renamed.' );
							
					}
					
				}
				
				catch ( myExceptions $e ) {

					print $e->getError();	

				}
					
				if ( $this->crud->update( $this->getTable() , $this->crud->getMatchingFields( $this->getTable() ) , $_POST['file_field'] , $_POST['upload_file_id'] ) ) {
					
					$serialized_info = serialize( $this->editedFileInfo() );	
					header( "location: " .
							 $this->getRedir() . '&info_box=edited&file=' . $this->getNormalizedFileName() . $this->getFileExtension() . '&serialized_info=' . $serialized_info );		
					
				}
				
				else {	
					
					$this->setErrorFlag( 1 );
					throw new myExceptions( 'The file couldn\'t be edited.' );
					
				}
					
			}
			
			catch( myExceptions $e ) {
				
				print $e->getError();	
						
			}
			
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.3) Delete File
//  ------------------------------------------------------------------------------------------------------------------------------------------
	
  	function deleteFile( $fieldName , $operator = '=' , $fieldValue ) {

		try {
			
			try {
				
				if ( !$this->moveToTrash() ) {
					
					$this->_error_flag = 1;
		  			throw new myExceptions( 'The file <em>' . $this->file_to_be_trashed . '</em> couldn\'t be moved to trashcan.' );
					
				}
			
			}	
			
			catch ( myExceptions $e ) {
				
				print $e->getError();	
			}
			
			
			if ( $this->crud->delete( $this->getTable() , $fieldName , $operator , $fieldValue , '' , '' , '' ) ) {
				
				header( "location: ". $this->getRedir() );	
			
			}
		
			else {
			
				$this->_error_flag = 1;
  				throw new myExceptions( 'The file <em>' . $this->file_to_be_trashed . '</em> couldn\'t be deleted from table <em>' . $this->getTable() . '</em>.' );
			
			}
			
		}
	
		catch ( myExceptions $e ) {
  		
			print $e->getError();			
  		
		}

	}	


//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.4) Rename File
//  ------------------------------------------------------------------------------------------------------------------------------------------

  	function renameFile( $new_file_name ) {
	
  		try {
  		
			if ( $new_file_name == '' ) {
				
  				$this->_error_flag = 1;
  				throw new myExceptions( 'The method <em>renameFile()</em> needs an argument.' );
  		
			}
  		
			else {
				
				if ( strrpos( $new_file_name , '.' ) ) {
					
					$new_file_name = substr ( $new_file_name , 0 , strrpos ( $new_file_name , '.' ) );	
			
				}
  		
				$this->_file_name = normalize ( $new_file_name );
  			
			}
  	
		}
  	
		catch ( myExceptions $e ) {
  		
			print $e->getError();
  	
		}
	
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.5) Rename File On Server
//  ------------------------------------------------------------------------------------------------------------------------------------------

  	function renameFileOnServer() {
		
		if ( $this->getOldFileName() != $this->getFileName() ) {
			
			try {

				if ( !rename ( $this->getTarget() . '/' . $this->getOldFileName() . $this->getFileExtension(),
							   $this->getTarget() . '/' . $this->getFileName() . $this->getFileExtension() ) ) {

					throw new myExceptions( 'Couldn\'t move <em>' . $this->getOldFileName() . '</em> file to server location <em>' . $this->getTarget() . '</em>.' );
	 			}

			}

			catch ( myExceptions $e ) {

				print $e->getError();

			}
			
		}
		
	
	}
	
	function getDirPathAndDirNameArray( $explode_token , $dir_url ) {
		
		$exploded_array = explode 	( $explode_token , $dir_url );
		$dir_name 		= array_pop	( $exploded_array );
		$dir_path 		= implode	( '/' , $exploded_array );
		
		$dir_path_and_name = array( 'dir_path' => $dir_path, 'dir_name' => $dir_name );
		return $dir_path_and_name;
		
	}

	function renameDirOnServer( $old_dir_name, $new_dir_name ) {
		
		$dir_array 			 = $this->getDirPathAndDirNameArray( '/' , $new_dir_name );
		$normalized_dir_name = normalize ( $dir_array['dir_name'] );
		$new_dir 			 = $dir_array['dir_path'] . '/' . $normalized_dir_name;
		
 		try {
 		
			if ( !rename ( $old_dir_name , $new_dir ) ) {
 		
				throw new myExceptions( 'Couldn\'t rename <em>' . $old_dir_name . '</em> directory.' );
				
 			}

			else {
			
				try {
				
					if ( $this->crud->replace($this->getTable() , 'dir_name', $old_dir_name , $new_dir , 'dir_name' , $old_dir_name ) ) {
            			
						$renamed_info_array = array( 'new_dir_name' => $normalized_dir_name );
						$serialized_info 	= serialize ( $renamed_info_array );
						header( "location: " . $this->getRedir() . '&info_box=renamed_dir&serialized_info=' . $serialized_info );	
						
					}
					
					else {
						
						$this->setErrorFlag( 1 );
						throw new myExceptions( 'The files url couldn\'t be updated according to directory\'s new name.' );
	        		
					}
				}
				
				catch ( myExceptions $e ) {
            	
					print $e->getError();
            	
				}
		
			}
	 	
		}
		
		catch( myExceptions $e ) {
			
			print $e->getError();
	
		}
	
	}


	
	
	function recursive_rm_dir( $dir, $empty = false ) {
	
	
	    if ( !file_exists ( $dir ) || !is_dir ( $dir ) ) {
	
			return false;

	    }
		
		elseif ( !is_readable ( $dir ) ) {
			
	         return false;

	    }
		
		else {

	         $handle = opendir ( $dir );

	         while ( false !== ( $item = readdir( $handle ) ) ) {
	
	            if ( $item != '.' && $item != '..' ) { 	// if the filepointer is not the current directory or the parent directory
	
	                $path = $dir . '/' . $item; 			// path to delete
	
	                if ( is_dir( $path ) ) {
						
	                     $this->recursive_rm_dir( $path );

	                }
					
					else {
	
						try {
							
							if ( unlink ( $path ) ) {
									
								header ( "location: " . $this->getRedir() );
								
							}
							
							else {

								$this->setErrorFlag( 1 );
					  			throw new myExceptions( 'The files couldn\'t be deleted from the directory.' );
					
							}
						}
						
						catch ( myExceptions $e ) {

							print $e->getError();			

						}
	
	                }
	
				}
	
			}
	
	        closedir( $handle );

	
	        if ( $empty == false ) {
	
	            if ( !rmdir( $dir ) ) { 				// try to delete the now empty directory
	
					return false;
	
				}
	
	         }
	         //return true;
			header( "location: " . $this->getRedir() );
			
	     }
	
	}
	

	

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.6) Move To Trash
//  ------------------------------------------------------------------------------------------------------------------------------------------

	function moveToTrash() {
		
		try {
		
			$old_file_url = $this->getDir()   	 .'/'. $this->file_to_be_trashed;
			$new_file_url = $this->getTrashcan() .'/'. $this->file_to_be_trashed;
	  	
				if ( !rename ( $old_file_url , $new_file_url ) ) {
					
					$this->setErrorFlag( 1 );
	  				throw new myExceptions( 'The file couldn\'t be moved to <em>' . $this->getTrashcan() . '</em>.' );
	
	  			}
	  	
		}
	  	
		catch ( myExceptions $e ) {
	  		
			return $e->getError();			
	  	
		}
	
	}


//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.7) Get Directories Array
//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	function getDirectoriesArray( $path = '.' , $only_dirs = true , $return_type = 'return_options' , $level = 0 ) {

		$directories_array = array();
		$ignore 		   = array( 'cgi-bin', 'uploaded_profiles', 'uploaded_item_img' , 'trashed_files', 'trashed_profiles', 'trashed_item_img' , '.' , '..' );

		$directory_handle  = @scandir($path);
		natsort($directory_handle);

		foreach ( $directory_handle as $file ) {
			
			if ( !in_array ( $file, $ignore ) ) {

	            $spaces = str_repeat( '&nbsp;' , ( $level * 5 ) );

				if ( $only_dirs == true ) {
					
					if ( is_dir ( "$path/$file" ) ) {
						
						switch ( $return_type ) {
							
							case 'return_options':
							
								$this->returnOptions($path, $file, $spaces);
							
							break;
							
							case 'return_links':
							
								print $spaces.$file;	//$this->returnLinks($path, $file, $spaces);
							
							break;
							
							case 'return_list_items':
							
								$this->returnListItems( $path , $file , $spaces );
							
							break;							
						
						}
						
						$directories_array 	 = array_merge ( $directories_array , $this->getDirectoriesArray( "$path/$file" , $only_dirs , $return_type, ( $level+1 ) ) );
						$file 				 = $path . "/" . $file;
						$directories_array[] = preg_replace( "/\/\//si" ,  "/" , $file );

		            }
				
				}
				
	            else {
					
					if ( is_dir ( "$path/$file" ) ) {
						
						switch ( $return_type ) {
							
							case 'return_options':
							
								// $this->returnOptions($path, $file, $spaces);
							
							break;
							
							case 'return_links':
							
								print '<li><strong>'.$spaces.$file.'</strong></li>';	//$this->returnLinks($path, $file, $spaces);
							
							break;
							
							case 'return_list_items':
							
								//this->returnListItems($path, $file, $spaces);
								//print '<li><strong>'.$spaces.$file.'</strong></li>';
							
							break;							
						
						}				
										
		
						$directories_array 	 = array_merge( $directories_array , $this->getDirectoriesArray( "$path/$file" , $only_dirs , $return_type, ( $level+1 ) ) );
						$file 				 = $path . "/" . $file;
						$directories_array[] = preg_replace( "/\/\//si" ,  "/" , $file );

					}
					
					else {
						
						switch ( $return_type ) {
							
							case 'return_options':
							
								$this->returnOptions( $path , $file , $spaces );
							
							break;
							
							case 'return_links':
							
								$this->returnLinks( $path , $file , $spaces );
							
							break;
							
							case 'return_list_items':
							
								$this->returnListItems( $path , $file , $spaces );
							
							break;							
						
						}
					}
	            				
				}

	        }

	    }
	
	    return $directories_array;

	}


	function returnOptions( $path , $file , $spaces ) {
		
		print '<option value="' . $path . '/' . $file . '"';
			
			if ( $_GET['dir_name'] == ( $path . '/' . $file ) ) { print ' selected="selected" ';}
		
		print '>' . $spaces.$file . '</option>';
	
	}


	function returnLinks( $path , $file , $spaces ) {
	
		$ext 	=  '.' . end ( explode ( "." , $file ) );
		$popup 	= ( $this->filterDisplayableFiles( $ext ) ) ? img_popup( $path . '/' . $file ) : '';
		print '<li><a href="' . $path . '/' . $file . '" ' . $popup . '>' . $spaces . '<img src="' . $this->getFileExtensionIcon( $ext ) . '" alt="" class="icon"/> ' . $file . '</a></li>';

	}

	function returnListItems( $path , $file , $spaces ) {
	
		print '<li><span style="float:left;">' . $spaces . '<strong>' . $file . '</strong></span><span style="float:right;">
		<a href="?page=uploader&action=delete_dir&dir_name=' . $path . '/' . $file . '" onclick="return(confirm(\'Delete directory and its content?\'))" class="delete_hover">delete</a> |
		<a href="?page=uploader&action=rename_dir&dir_name='.  $path . '/' . $file . '">rename</a></span></li>';

	}


//  ------------------------------------------------------------------------------------------------------------------------------------------




//  ******************************************************************************************************************************************
//  4) FILE INFO ARRAY
//  ******************************************************************************************************************************************


//  ******************************************************************************************************************************************
//  5) FILTER FILE TYPES
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	5.1) Get File Extension Icon
//  ------------------------------------------------------------------------------------------------------------------------------------------

	function getFileExtensionIcon( $extension ) {
		
		switch ( $extension ) {
																
	   		case '.aac':
	   		return 'img/icons/sound.png';
	   		break;
	   		
	   		case '.ai':
	   		return 'img/icons/vector.png';
	   		break;
	   		
	   		case '.aiff':
	   		return 'img/icons/sound.png';
	   		break;
	   		
	   		case '.avi':
	   		return 'img/icons/video.png';
	   		break;
	   		
			case '.bmp':
	   		return 'img/icons/general_picture.png';
	   		break;
	
	   		case '.css':
	   		return 'img/icons/css.png';
	   		break;
	   		
	   		case '.doc':
	   		return 'img/icons/doc.png';
	   		break;
	   		
	   		case '.dv':
	   		return 'img/icons/video.png';
	   		break;
	   		
			case '.emf':
	   		return 'img/icons/general_text.png';
	   		break;
	
	   		case '.flv':
	   		return 'img/icons/swf.png';
	   		break;
	   		
	   		case '.gif':
	   		return 'img/icons/general_picture.png';
	   		break;
	   		
			case '.gz':
	   		return 'img/icons/zip.png';
	   		break;
	
	   		case '.html':
	   		return 'img/icons/html.png';
	   		break;
	   		
	   		case '.jpg':
	   		return 'img/icons/general_picture.png';
	   		break;
	
			case '.JPG':
	   		return 'img/icons/general_picture.png';
	   		break;
	
			case '.jpeg':
	   		return 'img/icons/general_picture.png';
	   		break;
	   		
	   		case '.odt':
	   		return 'img/icons/general_text.png';
	   		break;
	   		
	   		case '.mp3':
	   		return 'img/icons/sound.png';
	   		break;
	   		
	   		case '.mp4':
	   		return 'img/icons/video.png';
	   		break;
	   		
	   		case '.mov':
	   		return 'img/icons/video.png';
	   		break;
	   		
	   		case '.pdf':
	   		return 'img/icons/pdf.png';
	   		break;
	   		
	   		case '.php':
	   		return 'img/icons/php.png';
	   		break;
	   		
	   		case '.psd':
	   		return 'img/icons/bitmap.png';
	   		break;
	   		
	   		case '.png':
	   		return 'img/icons/general_picture.png';
	   		break;
	   		
	   		case '.ppt':
	   		return 'img/icons/ppt.png';
	   		break;
	   		
	   		case '.rtf':
	   		return 'img/icons/general_text.png';
	   		break;
	   		
	   		case '.swf':
	   		return 'img/icons/swf.png';
	   		break;
	   		
	   		case '.tar':
	   		return 'img/icons/zip.png';
	   		break;
	   		
	   		case '.tif':
	   		return 'img/icons/general_picture.png';
	   		break;
	   		
	   		case '.txt':
	   		return 'img/icons/general_text.png';
	   		break;
	   		
	   		case '.wav':
	   		return 'img/icons/sound.png';
	   		break;
	   		
	   		case '.xls':
	   		return 'img/icons/xls.png';
	   		break;
	   		
	   		case '.xhtml':
	   		return 'img/icons/xhtml.png';
	   		break;
	   		
	   		case '.zip':
	   		return 'img/icons/zip.png';
	   		break;
	   	
		}
	}


//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	5.2) Filter Displayable Files
//  ------------------------------------------------------------------------------------------------------------------------------------------

  	function filterDisplayableFiles( $displayable_file ) {
	
		if ( in_array ( $displayable_file , $this->displayable_extension_r ) ) {
			
			 return $this->getFileUrl();

		}
	
		else {
		
			return $this->getFileExtensionIcon( $this->getFileExtension() );
		
		}

	}
	
//  ------------------------------------------------------------------------------------------------------------------------------------------






//  ******************************************************************************************************************************************
//  6) CHECKS
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	6.1) Check File Existence
//  ------------------------------------------------------------------------------------------------------------------------------------------

	function checkFileExistence() {
		
	 	try {

	 		if ( file_exists ( $this->getFileUrl() ) )  {
				
				$this->setErrorFlag( 1 );
	 			throw new myExceptions('A file named <em>' . $this->getFileUrl() . '</em> exists already. Please rename your file.');
	 		
			}
	 	
		}
	 	
		catch ( myExceptions $e ) {
	 	
			return $e->getError();
	 	
		}
	
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	6.2) Check Dir Existence
//  ------------------------------------------------------------------------------------------------------------------------------------------

	function checkDirExistence( $dir ) {

	 	try {

	 		if ( file_exists ( $dir ) )  {
		
				$this->setErrorFlag( 1 );
	 			throw new myExceptions('A directory named <em>' . $dir . '</em> exists already. Please name your directory differently.');

			}

		}

		catch ( myExceptions $e ) {

			return $e->getError();

		}

	}


//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	6.2) Check Extension
//  ------------------------------------------------------------------------------------------------------------------------------------------

 	function checkExtension() {
 	
		try {
 		
			if ( !in_array ( $this->getFileExtension() , $this->extension_r ) )  {
 				
				$this->setErrorFlag( 1 );
 				throw new myExceptions('Your file type <em>' . $this->getFileExtension() . '</em> is not allowed.');
 			
			}
 		
		}
 	
		catch ( myExceptions $e ) {
 		
			return $e->getError();
 		
		}

 	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	6.3) Check File Size
//  ------------------------------------------------------------------------------------------------------------------------------------------

	function checkFileSize() {
	
		try {
	 	
			if ( $this->_file_src_size > self::MAX_FILE_SIZE ) {
	 		
				$this->setErrorFlag( 1 );
				throw new myExceptions( 'The file size is too big. It is <em>' . $this->_file_src_size . 'Ko</em> (maximum allowed is <em>' . self::MAX_FILE_SIZE . 'Ko</em>).' );
	 		
			}
	 	
		}
	 	
		catch ( myExceptions $e ) {
	 		
			return $e->getError();			
		
		}
	
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	6.4) Check File Title
//  ------------------------------------------------------------------------------------------------------------------------------------------

	function checkFileTitle( $title ) {
	
		try {
 		
			if ( $title == '' )  {
 			
				$this->setErrorFlag( 1 );
 				throw new myExceptions( 'There is <em>no title</em> to your file.' );
 			
			}
 		
		}
 	
		catch ( myExceptions $e ) {
 		
			return $e->getError();
 		
		}

 	}

//  ------------------------------------------------------------------------------------------------------------------------------------------

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	6.5) Check File Dir
//  ------------------------------------------------------------------------------------------------------------------------------------------

	function checkFileDir( $dir ) {
	
		try {
 		
			if ( ( $dir == '' ) || ( $dir == '0' ) )  {
 			
				$this->setErrorFlag( 1 );
 				throw new myExceptions( 'Please <em>select a directory</em> where to upload the file.' );
 			
			}
 		
		}
 	
		catch ( myExceptions $e ) {
 		
			return $e->getError();
 		
		}

 	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	6.5) Check File Name
//  ------------------------------------------------------------------------------------------------------------------------------------------

	function checkFileName( $file_name ) {

		try {

			if ( empty ( $file_name ) )  {

				$this->setErrorFlag( 1 );
 				throw new myExceptions( 'There is <em>no name</em> to your file.' );

			}

		}

		catch ( myExceptions $e ) {

			return $e->getError();

		}

 	}


//  ------------------------------------------------------------------------------------------------------------------------------------------




//  ******************************************************************************************************************************************
//  7) INFO
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	7.1) Editing File Info
//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	function editFileInfo( $file_name , $file_ext ) {
		
		$this->setFileName		( $this->file_name );	
	  	$this->setFileExtension ( $file_ext 	   );

		$edit_file_info_r = array( 'name' => $this->getFileName(),
			   					   'src'  => $this->filterDisplayableFiles( $this->getFileExtension() ) );
		
		return $edit_file_info_r;
								
	  }

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	7.2) Edited File Info
//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	function editedFileInfo() {

		$edited_file_info_r =	array( 'name' 		=> $this->getNormalizedFileName(),
			   						   'extension'	=> $this->getFileExtension() );
		
		return $edited_file_info_r;

	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	7.3) Editing Report Info
//  ------------------------------------------------------------------------------------------------------------------------------------------

	function savedFileInfo( ) {

		$saved_file_info_r = array( 'name' => $this->getFileName(),
			   					   'ext'  => $this->getFileExtension(),
			 					   'url' => $this->getFileUrl()
								);

		return $saved_file_info_r;

	  }



//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	7.3) Uploaded File Info
//  ------------------------------------------------------------------------------------------------------------------------------------------

	function uploadedFileInfo() {
		
		$uploaded_file_info_r =	array(	'name'		=> $this->getFileName(),
										'extension'	=> $this->getFileExtension(),
										'type'		=> $_FILES['file']['type'],
										'filesize'	=> number_format ( $_FILES['file']['size'] ),
										'error'		=> $_FILES['file']['error'],
										'src'		=> $this->filterDisplayableFiles( $this->getFileExtension() ),
										'target'	=> $this->getTarget() );
		
		return $uploaded_file_info_r;
		
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	7.4) EXIF Info
//  ------------------------------------------------------------------------------------------------------------------------------------------

	function printExifInfo() {
		
		if ( $this->getFileExtension() == '.jpg' ) {
			
			$exif = exif_read_data( $this->getFileUrl() , 0 , true );
			
			$exif_info  = '<div class="info_box"><fieldset class="info"><legend>EXIF INFO &ndash; JPG FILES ONLY</legend><table>';
				
				foreach ( $exif as $key => $section ) {
			
					foreach ( $section as $name => $val ) {
			
						$exif_info .= '<tr><td><strong>' . ucfirst ( $name ) . '</strong></td><td>: ' . strtolower( $val ) . '</td></tr>';
			    	
					}
			
				}
				
			$exif_info  .= '</table></fieldset></div>';
		
		}
		
		return $exif_info;
	
	}
	
//  ------------------------------------------------------------------------------------------------------------------------------------------

}
?>