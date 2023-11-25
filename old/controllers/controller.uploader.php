<?php

   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   //																																		
   //  	SCRIPT SUMMARY (2010.04.01)  (n.b.: this file is included by switch.uploader.php)                                                                                                       	
   //																																		
   // 	**************************************************************************************************************************************
   //																																		
   //	0) PERMISSION CHECK
   //	1) INCLUDES
   //	2) INSTANCES
   //			2.1) Crud
   //			2.2) Uploader
   //			2.3) Session
   //			2.4) Sorter
   //			2.5) Image Manipulator
   //			2.6) Trash Browser
   //			2.7) Pager
   //	3) UPLOADER
   //			3.1) Select Uploads
   //			3.2) Upload File
   // 			3.3) Edit File
   //			3.4) Delete File
   //	4) DIRECTORY
   //			4.1) Add Directory
   //			4.2) Rename Directory
   //			4.3) Delete Directory
   //	5) IMAGE MANIPULATOR
   //			5.1) Resize Image
   //	6) TRASH BROWSER
   //			6.1) Erase Trashed File
   //	7) SORTING & DISPLAYING
   //			7.1) Build Sorting Array
   //
   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




//  ******************************************************************************************************************************************
//  0) PERMISSION CHECK
//  ******************************************************************************************************************************************	

	if ( $_SESSION['login_status'] != 1 ) { header( "location:?page=home" ) ;}


//  ******************************************************************************************************************************************
//  1) INCLUDES
//  ******************************************************************************************************************************************

	include 'classes/class.pager.php';
	
	include 'models/model.crud.php';
	include 'models/model.sorter.php';
	include 'models/model.image.manipulator.php';
	include 'models/model.uploader.php';
	include 'models/model.trash.browser.php';
	

	include 'functions/function.addPopupToLink.php';
	include 'functions/function.calculateShrinkage.php';
	include 'functions/function.formSelectJump.php';
	include 'functions/function.normalizeString.php';
	

//  ******************************************************************************************************************************************
//  2) INSTANCES
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.1) Crud
//  ------------------------------------------------------------------------------------------------------------------------------------------

	$crud = new Crud ();

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.2) Uploader
//  ------------------------------------------------------------------------------------------------------------------------------------------

	$uploader = new Uploader ();
	
	$uploader->setCrud		( $crud );
	$uploader->setTrashcan	('uploads/trashed_files' );
	$uploader->setRedir		( '?page=uploader&action=list' );
	$uploader->setTable		( $_GET['dir_name'] );


//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.3) Session
//  ------------------------------------------------------------------------------------------------------------------------------------------

	// $session = new Session(); 			// instanciated in index.php

	$auto_redir = 'profile_sort_key=' 		 . $session->getSessionVar( 'sort_key') 	   .
	              '&profile_sort_direction=' . $session->getSessionVar( 'sort_direction' ) .
				  '&dir_name=' . $session->getSessionVar( 'dir_name' ) .
				  '&slice=' . $session->getSessionVar( 'slice' );

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.4) Sorter
//  ------------------------------------------------------------------------------------------------------------------------------------------

	$sorter = new Sorter();

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.5) Image Manipulator
//  ------------------------------------------------------------------------------------------------------------------------------------------

	$img_manipulator = new ImageManipulator();

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.6) Trash Browser
//  ------------------------------------------------------------------------------------------------------------------------------------------

	$trash_browser = new TrashBrowser( $uploader->getTrashcan() );
	$trash_browser->buildItemsArray( $trash_browser->getItemsArray() );

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.7) Pager
//  ------------------------------------------------------------------------------------------------------------------------------------------

	$pager = new Pager();

//  ------------------------------------------------------------------------------------------------------------------------------------------





//  ******************************************************************************************************************************************
//  3) UPLOADER
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.1) Select Uploads
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'list' ) {
		
		if ( !isset( $_GET['upload_sort_key'] 		 ) )  { $_GET['upload_sort_key']		= 'upload_file_creation_date' 	;}
		if ( !isset( $_GET['upload_sort_direction']  ) )  { $_GET['upload_sort_direction']	= 'desc' 				 		;}
      	
		$where = " dir_name = '" . $_GET['dir_name'] . "'";
		
		
	  	$session->setSessionVar			( 'sort_key'       	, $_GET['upload_sort_key']        					 );
	  	$session->setSessionVar			( 'sort_direction' 	, $_GET['upload_sort_direction']  					 );
		$session->setSessionVar			( 'dir_name'    	, $_GET['dir_name']        		  					 );
	  	$session->setSessionVar			( 'slice' 			, $_GET['slice']  	  			  					 );
	  	$session->setSessionVar			( 'total_records'   , $crud->countRecordsWhere( 'upload_file' , $where ) );
		
	  	$sortDirectionArray 			= $pager->setSortDirection ( 'upload_sort_direction' , $_GET['upload_sort_direction'] );
	  	$sortKeyArray 					= $pager->setSortKey	   ( 'upload_sort_key' 	     , $_GET['upload_sort_key'] 	  );     	
  	  	
		$pager->setPageName				( 'index.php?page=uploader&action=list&dir_name=' . $_GET['dir_name'] );
	  	$pager->setLimit				( 30 );
	  	$pager->setTotalRecords			( $session->getSessionVar( 'total_records' ) );

	  	$pager->setPagerData			( ); // necessary call to get pager working	
		
		$uploader->setTarget			( $_GET['dir_name'] . '/' );
		
		$rows  =  $crud->select( '' , 'upload_file' , '*' , '' , $where ,  $_SESSION['sort_key'].' '.$_SESSION['sort_direction'] ,'', $pager->getLimit() , $pager->getOffset() );
			
	}
	

	
//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.2) Upload File
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'upload' ) {
		
		if ( $_FILES["file"]["name"] != '' ) {
			
			$file_name_and_extension 			= explode ( '.', $_FILES["file"]["name"] );
			
			if ( $_POST['rename'] != '' ) {
				
				$_POST['upload_file_name'] 		= normalize ( $_POST['rename'] );
				
			}
			
			else {
				
				$_POST['upload_file_name'] 		= normalize ( $file_name_and_extension[0] );
				
			}
			
			
			$_POST['upload_file_ext'] 			= '.' . strtolower($file_name_and_extension[1]);
			$_POST['upload_file_creation_date'] = date ( 'Y-m-d H:i:s') ;
			
						
			/* Setters */
			$uploader->setTable			( 'upload_file' );
			$uploader->setProfileId		( $_POST['profile_id'] );
			$uploader->setTarget		( $_POST['dir_name'] . '/' );
			$uploader->setFileName		( $_POST['upload_file_name'] );								
			$uploader->setFileExtension	( $_POST['upload_file_ext'] );
			$uploader->setFileUrl		( $_POST['dir_name'] . '/' . $_POST['upload_file_name'] . $_POST['upload_file_ext'] );
			$uploader->setRedir			( '?page=uploader&action=list&dir_name=' . $_POST['dir_name'] );
			
			if ( ( $_POST['dont_save'] == 'true' ) || ( $_POST['replace'] == 'true' ) ) { $uploader->setSave( false ) ;}
			
			/* Checks */
			$size_error 	 			= ( $_POST['check_size'] 		== 'true' ) ? $uploader->checkFileSize() 		: '';
			$extension_error 			= ( $_POST['check_extension']   != 'true' ) ? $uploader->checkExtension() 		: '';
			$file_existence_error 		= ( $_POST['replace'] 		    != 'true' ) ? $uploader->checkFileExistence() 	: '';
			$title_error				= $uploader->checkFileTitle		( $_POST['upload_file_title'] );
			$dir_error					= $uploader->checkFileDir		( $_POST['dir_name'] );


			if ( $uploader->getErrorFlag() == 0 ) {

				$uploader->uploadFile();

			}
				
		}

	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.3) Edit File
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'edit' ) {

		$where = 'upload_file_id =' . $_GET['upload_file_id'];
		$rows = $crud->select( '' , 'upload_file' , '*' , '' , $where, '' , '1' , '0' );

		$uploader->setTarget		( $rows['0']['dir_name'] );
		$uploader->setFileName		( $rows['0']['upload_file_name'] );	
		$uploader->setFileExtension ( $rows['0']['upload_file_ext'] );
		$uploader->setFileUrl		( $rows['0']['dir_name'] . '/' . $rows['0']['upload_file_name'] . $rows['0']['upload_file_ext'] );

		if ( isset ( $_POST['upload_file_id'] ) ) {
			
			if ( $_POST['rename'] != '' ) {
				
				$_POST['upload_file_name'] 	= normalize ( $_POST['rename'] );
				
				$uploader->setFileUrl( $_POST['dir_name'] . '/' . $_POST['upload_file_name'] . $_POST['upload_file_ext'] );
				$file_existence_error = $uploader->checkFileExistence();
				
			}
			$uploader->setTable			( 'upload_file' );
			$uploader->setProfileId		( $_POST['profile_id'] );
			$uploader->setFileUrl		( $_POST['dir_name'] . '/' . $_POST['upload_file_name'] . $_POST['upload_file_ext'] );			
			$uploader->setTarget		( $_POST['dir_name'] 						  										);
			$uploader->setOldFileName	( $_POST['upload_old_file_name']    	  		  									);
			$uploader->setFileName		( $_POST['upload_file_name']    	  	  											);
			$uploader->setFileExtension	( $_POST['upload_file_ext'] 				  										);
			$uploader->setRedir			( '?page=uploader&action=list&' . $auto_redir 										);
			$uploader->setTarget		( $_POST['dir_name'] 						  										);
			
			/* Checks */
			$title_error = $uploader->checkFileTitle( $_POST['upload_file_title'] );
			
			if ( $uploader->getErrorFlag() == 0 ) {
			
				$uploader->editFile();		
				
			}
	   		
		}		
	
	}


//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.4) Delete File
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'delete' )	{
		
		$uploader->setTable	  ( 'upload_file' 								 );
		$uploader->setRedir	  ( '?page=uploader&action=list&' . $auto_redir	 );
		$uploader->deleteFile ( $_GET['file_field'] , '=' , $_GET['file_id'] );
	
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------




//  ******************************************************************************************************************************************
//  4) DIRECTORY
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	4.1) Add Directory
//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	if ( $_POST['add_dir'] == 1 ) {
		
		if( isset( $_POST['dir_name'] ) ) {
			
			$normalized_dir_name = normalize($_POST['dir_name']);
			$dir = $_POST['dir_parent_name'].'/'.$normalized_dir_name;
			
			$dir_existence_error = $uploader->checkDirExistence($dir);
			
			if ( $uploader->getErrorFlag() == 0 ) {
				
				try {
					
					umask(0);
					if( !mkdir(	$dir , 0777 ) ) {

						throw new myExceptions( 'The directory <em>' . $dir . '</em> couldn\'t be created.' );

					}

				}

				catch (myException $e) {

					print $e->getError();	

				}
				
				
			}
			
			
		}
		
	}
	
	
//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	4.2) Rename Directory
//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	if ( $_GET['action'] == 'rename_dir' ) {
		
	
		
		$dirs = $uploader->getDirPathAndDirNameArray('/' , $_GET['dir_name']);
		
		
		if ( $_POST['rename_dir'] == '1' ) {
			
			$new_name = $_POST['dir_root'].'/'.$_POST['new_dir_name'];
			$uploader->setTable('upload_file');
			$uploader->setRedir('index.php?page=uploader&action=upload_directories_list');
			
			$dir_existence_error = $uploader->checkDirExistence($new_name);
			
			if ( $uploader->getErrorFlag() == 0 ) {
		
				$uploader->renameDirOnServer($_POST['old_dir_name'], $new_name);
		
			}
		
		}
		
	}
	
//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	4.3) Delete Directory
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'delete_dir' )	{
		
		$uploader->setTable( 'upload_file' );
		$uploader->setRedir('?page=uploader&action=upload_directories_list');
		
		if ( $uploader->recursive_rm_dir( $_GET['dir_name'] ) ) {

			$uploader->deleteFile( 'dir_name' , 'LIKE' , $_GET['dir_name'].'%' );

		}

	}


//  ******************************************************************************************************************************************
//  5) IMAGE MANIPULATOR
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	5.1) Resize Image
//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	if ( $_GET['action'] == 'resize' ) {
		
		
		$where = 'upload_file_id =' . $_GET['upload_file_id'];
		$rows = $crud->select('','upload_file','*', '', $where, '', '1', '0');

		$uploader->setTarget($rows['0']['dir_name'].'/');
		$uploader->setFileName($rows['0']['upload_file_name']);	
		$uploader->setFileExtension($rows['0']['upload_file_ext']);
		$uploader->setFileUrl($rows['0']['dir_name'].'/'.$rows['0']['upload_file_name'].$rows['0']['upload_file_ext']);
		$uploader->setTable('upload_file');
		
		$img_manipulator->setSourceImageSize($uploader->getFileUrl());
		
		
		
		if ( isset( $_POST['resize'] ) ) {

			if ( ( trim( $_POST['img_current_width'] )  != trim( $_POST['original_width'] ) ) ||
			     ( trim( $_POST['img_current_height'] ) != trim( $_POST['original_height'] ) ) ) {
				
				$_destination_img_width  = $_POST['img_current_width'];
				$_destination_img_height = $_POST['img_current_height'];
			
			}
		
			else {
			
				$new_size = explode( 'x' , $_POST['param_trans'] );
				$_destination_img_width  = $new_size[0];
				$_destination_img_height = $new_size[1];
				
			}
			
			$uploader->setFileName($_POST['file_name']);	
			$uploader->setFileExtension($_POST['file_extension']);
			
			$img_manipulator->setRedir('?page=uploader&action=list&'.$auto_redir);
			
			$img_manipulator->setSourceImage				( $uploader->getFileName() );		
			$img_manipulator->setSourceImageSize			( $uploader->getFileUrl() );
			$img_manipulator->setSourceImageUrl				( $uploader->getFileUrl() );
			$img_manipulator->setSourceImageExtension		( $uploader->getFileExtension() );
			$img_manipulator->setDestinationImageQuality	( $_POST['decrease_quality'] );
			$img_manipulator->setDestinationImageWidth		( $_destination_img_width );
			$img_manipulator->setDestinationImageHeight 	($_destination_img_height );
			$img_manipulator->imageCreateFromExtension		( $uploader->getFileUrl() , $uploader->getFileExtension() );
			$img_manipulator->imageCreateTrueColor			( $img_manipulator->getDestinationImageWidth() , $img_manipulator->getDestinationImageHeight() , 1 ); // 1 = alpha is preserved
			$img_manipulator->imageCopyResize				();
			$img_manipulator->returnImage					( $_POST['decrease_quality'] );
 	
		}
	
	}
	
	


		function filterThumb($arr,$thumbname)
		{
			foreach ($arr as $item)
			{
				if (!preg_match("/^".$thumbname."/",$item)){$tmparr[]=$item;}
			}
			return $tmparr;
		}


		function removeThumb($dir,$arr,$thumbname)
		{
			foreach ($arr as $item)
			{
				if (preg_match("/^".$thumbname."/",$item)){ unlink($dir.$item);}
			}
		}



		function makeThumb($name,$filename,$new_w,$new_h,$from_center=false)
		{

			$system=explode(".",$name);
			if (preg_match("/jpg|jpeg/",$system[1])){$src_img=imagecreatefromjpeg($name);}
			if (preg_match("/png/",$system[1])){$src_img=imagecreatefrompng($name);}
			$old_x=imagesx($src_img);
			$old_y=imagesy($src_img);


			if($from_center==true) {

				$centre_x = round($old_x / 2);
				$centre_y = round($old_y / 2);
				$crop_width_half  = round($new_w / 2);
				$crop_height_half = round($new_h / 2);
				$x1 = max(0, $centre_x - $crop_width_half);
				$y1 = max(0, $centre_y - $crop_height_half);
				$x2 = min($old_x, $centre_x + $crop_width_half);
				$y2 = min($old_y, $centre_y + $crop_height_half);
				$cropped_width  = $x2 - $x1;
			    $cropped_height = $y2 - $y1;
			    $dst_img = imagecreatetruecolor($cropped_width, $cropped_height);		
			 	//print $dst_img.'--'.$src_img.'--0--0--'.$x1.'--'.$y1.'--'.$cropped_width.'--'.$cropped_height.'--'.$old_x.'--'.$old_y.'<br/>';
			    imagecopy($dst_img,$src_img,0,0,$x1,$y1,$cropped_width,$cropped_height);
				if (preg_match("/png/",$system[1]))
				{
					imagepng($dst_img,$filename);
				} else {
					imagejpeg($dst_img,$filename);
				}
				imagedestroy($dst_img);
				imagedestroy($src_img);

			} else {

				if ($old_x > $old_y)
				{
					$thumb_w=$new_w;
					$thumb_h=$old_y*($new_h/$old_x);
				}
				if ($old_x < $old_y)
				{
					$thumb_w=$old_x*($new_w/$old_y);
					$thumb_h=$new_h;
				}
				if ($old_x == $old_y)
				{
					$thumb_w=$new_w;
					$thumb_h=$new_h;
				}


				$dst_img=imagecreatetruecolor($thumb_w,$thumb_h);
				imagecopyresampled($dst_img,$src_img,0,0,0,0,$thumb_w,$thumb_h,$old_x,$old_y);
				if (preg_match("/png/",$system[1]))
				{
					imagepng($dst_img,$filename);
				} else {
					imagejpeg($dst_img,$filename);
				}
				imagedestroy($dst_img);
				imagedestroy($src_img);
			}



		}

		function getDirectory($dir,$filters)
		{
			$handle=opendir($dir);
			$files=array();
			if ($filters == "all"){while(($file = readdir($handle))!==false){$files[] = $file;}}
			if ($filters != "all")
			{
				$filters=explode(",",$filters);
				while (($file = readdir($handle))!==false)
				{	
					for ($f=0;$f<sizeof($filters);$f++):
						$system=explode(".",$file);
						if ($system[1] == $filters[$f]){$files[] = $file;}
					endfor;
				}
			}
			closedir($handle);
			return $files;
		}



		if ( $_GET['action'] == 'make_thumbs' )	{
		

			if(isset($_GET['folder']) && isset($_GET['width']) && isset($_GET['height'])) {


				$pics = getDirectory($_GET['folder'],"jpg,JPG,JPEG,jpeg,png,PNG");
				
				if ( $_GET['remove'] == 'yes') { removeThumb($_GET['folder'].'/',$pics,"tn_"); } else {

					$pics = filterThumb($pics,"tn_");

					if (sizeof($pics) > 0)
					{
						foreach ($pics as $p)
						{	
							makeThumb($_GET['folder'].'/'.$p, $_GET['folder']."/tn_".$p, $_GET['width'], $_GET['height'], true);

						}
					}
				}



			}

		}


	
	
	
	
	
	
	
	
	
//  ------------------------------------------------------------------------------------------------------------------------------------------




//  ******************************************************************************************************************************************
//  6) TRASH BROWSER
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	6.1) Erase Trashed File
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'erase' ) {
		
		$trash_browser->eraseFile( $uploader->getTrashcan() . '/' . $_GET['file_to_be_erased'] , '?page=uploader&action=list_trashed' );
	
	}
	
//  ------------------------------------------------------------------------------------------------------------------------------------------






//  ******************************************************************************************************************************************
//  7) SORTING & DISPLAYING
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	7.1) Build Sorting Array
//  ------------------------------------------------------------------------------------------------------------------------------------------

	$sorting_array = array( 'Name &uarr;' 			=> array('upload_file_name','asc'),
							'Rank &uarr;' 			=> array('upload_file_rank','asc'),
							'Type &uarr;' 			=> array('upload_file_ext','asc'),
							'Creation &uarr;'		=> array('upload_file_creation_date','asc'),
							'Modification &uarr;'   => array('upload_file_modification_date','asc'),
							'Name &darr;' 	   		=> array('upload_file_name','desc'),
							'Rank &darr;' 	   		=> array('upload_file_rank','desc'),
							'Type &darr;' 	   		=> array('upload_file_ext','desc'),
							'Creation &darr;' 	 	=> array('upload_file_creation_date','desc'),
							'Modification &darr;' 	=> array('upload_file_modification_date','desc') );


   	foreach ( $sorting_array as $sorting_k => $sorting_v ) {

   		$active = ( ( ( $_GET['upload_sort_key'] == $sorting_v[0] ) && ( $_GET['upload_sort_direction'] == $sorting_v[1] ) ) ) ? ' selected="selected"' : '';
   		$sort_menu .= '<option value="'.$_SERVER["REQUEST_URI"].'&amp;upload_sort_key='.$sorting_v[0].'&amp;upload_sort_direction='.$sorting_v[1].'" 		
   		'.$active.'>'.$sorting_k.'</option>';

   	}

//  ------------------------------------------------------------------------------------------------------------------------------------------




   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   //																																		
   //  	FOOTNOTES (2010.04.01)                                                                                                      	
   //																																		
   // 	**************************************************************************************************************************************																																		
   //	
   //	3.2) Upload File
   //   - Checks if a file was selected for upload
   //   - Performs a series of tests ( renameFile / checkFileSize / checkExtension ) all of which can be overidden
   //   - Checks if file already exists on server and overwrite it if Replace is true
   //   - Loads Crud class ( setCrud ) and saves file info in an array ( saveFileInfoArray ) which is used by Crud for writing into dB
   //   - Eventually uploads file to server
   //
   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

?>