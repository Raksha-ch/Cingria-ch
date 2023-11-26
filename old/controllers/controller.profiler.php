<?php

   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   //																																		
   //  	SCRIPT SUMMARY (2010.03.21)  (n.b.: this file is included by switch.profiler.php)                                                                                                       	
   //																																		
   // 	**************************************************************************************************************************************
   //																																		
   //	0) 	PERMISSION CHECK
   //	1) 	INCLUDES
   //	2) 	INSTANCES
   //			2.1) Sorter
   //			2.2) Crud
   //			2.3) Session
   //			2.4) Profiler
   //			2.5) Uploader
   //			2.6) Pager
   //			2.7) TrashBrowser
   //	3) 	PROFILES
   //			3.1) Select profiles
   //			3.2) Create profile
   // 			3.3) Edit profile
   //			3.4) Delete profile
   //	4) 	PROFILE PICTURES
   //			4.1) Add profile picture
   //			4.2) Delete profile picture
   //			4.3) Erase trashed profile picture
   //	5) 	PROFILE DESCRIPTIONS
   //			5.1) Select profiles
   //			5.2) Add profile description
   //			5.3) Edit profile description
   //			5.4) Delete profile description
   //	6) 	FLUSH PROFILES
   //			6.1) Flush profiles
   //	7) 	SORTING & DISPLAYING
   //			7.1) Build Sorting Array
   //			7.2) Build Display Mode Array
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
  include 'models/model.profiler.php';
  include 'models/model.sorter.php';
  include 'models/model.trash.browser.php';
  include 'models/model.uploader.php';

  include 'functions/function.addPopupToLink.php';
  include 'functions/function.formSelectJump.php';
  include 'functions/function.truncateString.php';
  include 'functions/function.normalizeString.php';


//  ******************************************************************************************************************************************
//  2) INSTANCES
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.1) Sorter
//  ------------------------------------------------------------------------------------------------------------------------------------------

  $sorter = new Sorter			( );

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.2) Crud
//  ------------------------------------------------------------------------------------------------------------------------------------------

  $crud = new Crud				( );

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.3) Session
//  ------------------------------------------------------------------------------------------------------------------------------------------

  // $session = new Session(); 			// instanciated in index.php

  $auto_redir = 'profile_sort_key=' 		 . $session->getSessionVar( 'sort_key') 	   .
                '&profile_sort_direction=' . $session->getSessionVar( 'sort_direction' ) .
                '&profile_display_type=' 	 . $session->getSessionVar( 'display_type' );

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.4) Profiler
//  ------------------------------------------------------------------------------------------------------------------------------------------

  $profiler = new Profiler		( );

  $profiler->setTable				( 'profile' );
  $profiler->setCrud				( $crud );
  $profiler->setRedir				( '?page=profiler&action=profile_list' );

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.5) Uploader
//  ------------------------------------------------------------------------------------------------------------------------------------------

  $uploader = new Uploader		( );

  $uploader->setTarget   			( 'uploads/uploaded_profiles/' );
  $uploader->setTrashcan 			( 'uploads/trashed_profiles/' );
  $uploader->setTable    			( 'profile_picture' ) ;
  $uploader->setCrud				( $crud );
  $uploader->setRedir				( '?page=profiler&action=list' );

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.6) Pager
//  ------------------------------------------------------------------------------------------------------------------------------------------

  $pager = new Pager;

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.7) TrashBrowser
//  ------------------------------------------------------------------------------------------------------------------------------------------

  $trash_browser = new TrashBrowser ( $uploader->getTrashcan() );

  $trash_browser->buildItemsArray	( $trash_browser->getItemsArray() );		

// -------------------------------------------------------------------------------------------------------------------------------------------




//  ******************************************************************************************************************************************
//  3) PROFILES
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.1) Select profiles
//  ------------------------------------------------------------------------------------------------------------------------------------------

  if ( $_GET['action'] == 'profile_list' ) {

    if ( !isset( $_GET['profile_sort_key'] 		 ) )  { $_GET['profile_sort_key']		= 'profile_creation' 		 ;}
    if ( !isset( $_GET['profile_sort_direction'] ) )  { $_GET['profile_sort_direction']	= 'desc' 					 ;}
    if ( !isset( $_GET['profile_display_type'] 	 ) )  { $_GET['profile_display_type'] 	= 'minimal' 		   		 ;}

    $session->setSessionVar			( 'sort_key'       , $_GET['profile_sort_key']       );
    $session->setSessionVar			( 'sort_direction' , $_GET['profile_sort_direction'] );
    $session->setSessionVar			( 'display_type'   , $_GET['profile_display_type']   );
    $session->setSessionVar			( 'total_records'  , $crud->countRecordsWhere('profile', 'profile_category_id <> 2')  );

    $sortDirectionArray 			= $pager->setSortDirection ( 'profile_sort_direction' , $_GET['profile_sort_direction'] );
    $sortKeyArray 					= $pager->setSortKey	   ( 'profile_sort_key' 	  , $_GET['profile_sort_key'] 		);
    $displayTypeArray 				= $pager->setSortKey	   ( 'profile_display_type'   , $_GET['profile_display_type'] 	);


    $pager->setTable				( 'profile' );
    $pager->setPageName				( '?page=profiler&action=profile_list' );
    $pager->setHomePage				( '?page=profiler&action=profile_list' );

    $pager->setLimit				( 50 );

    $pager->setTotalRecords			( $session->getSessionVar( 'total_records' ) );
    $pager->setPagerData			( ); // necessary call to get pager working

    $profiler->setTable				( 'profile' );


    $join = " LEFT JOIN country_list ON profile.profile_country = country_list.country_id
          LEFT JOIN profile_category ON profile.profile_category_id = profile_category.profile_category_id ";

    $rows =  $crud->select('','profile','*',$join,'',$session->getSessionVar('sort_key').' '.$session->getSessionVar('sort_direction'),'',$pager->getLimit(),$pager->getOffset());


  }






  if ( $_GET['action'] == 'pages_list') {



    if ( !isset( $_GET['page_sort_key'] 		 ) )  { $_GET['page_sort_key']			= 'pages.page_title' ;}
    if ( !isset( $_GET['page_sort_direction'] ) )  	  { $_GET['page_sort_direction']	= 'asc' 			;}
    if ( !isset( $_GET['page_display_type'] 	 ) )  { $_GET['page_display_type'] 		= 'minimal' 		;}

    $session->setSessionVar			( 'sort_key'       , $_GET['page_sort_key']       );
    $session->setSessionVar			( 'sort_direction' , $_GET['page_sort_direction'] );
    $session->setSessionVar			( 'display_type'   , $_GET['page_display_type']   );
    $session->setSessionVar			( 'total_records'  , $crud->countRecordsWhere('pages', 'page_id')  );

    $sortDirectionArray 			= $pager->setSortDirection ( 'page_sort_direction' , $_GET['page_sort_direction'] );
    $sortKeyArray 					= $pager->setSortKey	   ( 'page_sort_key' 	 	, $_GET['page_sort_key'] 		);
    $displayTypeArray 				= $pager->setSortKey	   ( 'page_display_type'   , $_GET['page_display_type'] 	);


    $pager->setTable				( 'pages' );
    $pager->setPageName				( '?page=profiler&action=page_list' );
    $pager->setHomePage				( '?page=profiler&action=page_list' );

    $pager->setLimit				( 100 );
    $pager->setTotalRecords			( $session->getSessionVar( 'total_records' ) );
    $pager->setPagerData			( ); // necessary call to get pager working

    $profiler->setTable				( 'pages' );

    $join = " LEFT JOIN profile ON profile.profile_id = pages.profile_id  ";
    $rows =  $crud->select('','pages','*',$join,'',$session->getSessionVar('sort_key').' '.$session->getSessionVar('sort_direction'),'',$pager->getLimit(),$pager->getOffset());



  }


  if ( $_GET['action'] == 'discography_list') {

    $session->setSessionVar			( 'total_records'  , $crud->countRecordsWhere('discography', 'discography_id')  );		

    $pager->setTotalRecords			( $session->getSessionVar( 'total_records' ) );		
    $profiler->setTable				( 'discography' );

    $rows =  $crud->select('','discography','*','','','','','','');


  }


//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.2) Create profile / page
//  ------------------------------------------------------------------------------------------------------------------------------------------

  if ( $_POST['create_profile'] != '' ) {

    $profiler->setProfileEmailAddress( $_POST['profile_email_address'] );
    //$profiler->checkProfileExistenceUsingEmailAddress();
    //$profiler->validateEmailAddressFormat();
    // $profiler->validatePassword();

    if ( $profiler->getErrorFlag() == 0 ) {

      $profiler->createProfile();			

    }

  }

  if ( $_POST['create_page'] != '' ) {

    $profiler->setRedir( '?page=profiler&action=pages_list' );

    $profiler->setTable( 'pages' );
    $crud->setTable( 'pages' );

    if ( $profiler->getErrorFlag() == 0 ) {

      $profiler->createProfile();			

    }

  }

  if ( $_POST['create_discography'] != '' ) {

    $profiler->setRedir( '?page=profiler&action=discography_list' );

    $profiler->setTable( 'discography' );
    $crud->setTable( 'discography' );

    if ( $profiler->getErrorFlag() == 0 ) {

      $profiler->createProfile();			

    }

  }






    if ( $_GET['action'] == 'create_new_discography_item') {


      $session->setSessionVar			( 'total_records'  , $crud->countRecordsWhere('discography_item', 'discography_item_id')  );
      $profiler->setTable				( 'discography_item' );

      $join = " LEFT JOIN upload_file ON upload_file.upload_file_id = discography_item.upload_file_id  ";
      $rows =  $crud->select('','discography_item','*',$join,'',' discography_id  ASC, discography_item_title ASC','','','');






  if ( $_POST['create_discography_item'] != '' ) {

    $profiler->setRedir( '?page=profiler&action=create_new_discography_item' );

    $profiler->setTable( 'discography_item' );
    $crud->setTable( 'discography_item' );

    if ( $profiler->getErrorFlag() == 0 ) {

      $profiler->createProfile();			

    }

  }	



  }



//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.3) Edit profile / page
//  ------------------------------------------------------------------------------------------------------------------------------------------

  if ( $_GET['action'] == 'edit' ) {

      $where = "profile_id = " . $_GET['profile_id'];
      $rows =  $crud->select('','profile','*','',$where,'','','1','0');
      $newsletter_subscription = $rows['0']['newsletter_subscription'];


  if ( $_POST['profile_id'] != '' ) {

    $profiler->setProfileName( $_POST['profile_name'] );
    $profiler->setProfileSurname( $_POST['profile_surname'] ); // Name and Surname are used for infoBox

    //$profiler->setProfileEmailAddress( $_POST['profile_email_address'] );
    //$profiler->checkProfileExistenceUsingEmailAddress();
    //$profiler->validateEmailAddressFormat();
    //$profiler->validatePassword();

    if( $profiler->getErrorFlag() == 0 ) {

      $profiler->editProfile();			

    }

  }

  }




  if ( $_GET['action'] == 'edit_page' ) {

      $where = "page_id = " . $_GET['page_id'];
      $rows =  $crud->select('','pages','*','',$where,'','','1','0');


  if ( $_POST['edit_page'] != '' ) {

    $profiler->setRedir( '?page=profiler&action=pages_list' );

    $profiler->setTable( 'pages' );
    $crud->setTable( 'pages' );

    if( $profiler->getErrorFlag() == 0 ) {

      $profiler->editPage();			

    }

  }

  }


  if ( $_GET['action'] == 'edit_discography' ) {

      $where = "discography_id = " . $_GET['discography_id'];
      $rows =  $crud->select('','discography','*','',$where,'','','1','0');


  if ( $_POST['discography_id'] != '' ) {

    $profiler->setRedir( '?page=profiler&action=discography_list' );

    $profiler->setTable( 'discography' );
    $crud->setTable( 'discography' );

    if( $profiler->getErrorFlag() == 0 ) {

      $profiler->editDiscography();			

    }

  }

  }




  if ( $_GET['action'] == 'edit_discography_item' ) {

      $where = "discography_item_id = " . $_GET['discography_item_id'];
      $rows =  $crud->select('','discography_item','*','',$where,'','','1','0');


  if ( $_POST['edit_discography_item'] == 1 ) {

    $profiler->setRedir( '?page=profiler&action=create_new_discography_item' );

    $profiler->setTable( 'discography_item' );
    $crud->setTable( 'discography_item' );

    if( $profiler->getErrorFlag() == 0 ) {

      $profiler->editDiscographyItem();			

    }

  }

  }

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.4) Delete profile / page
//  ------------------------------------------------------------------------------------------------------------------------------------------

  if ( $_GET['action'] == 'delete_profile' ) {

    if( $crud->delete('profile', 'profile_id', ' = ', (int) $_GET['profile_id']) ) {

      header( "location: " . $profiler->getRedir() );	

    }

  }

  if ( $_GET['action'] == 'delete_page' ) {

    $profiler->setRedir	( '?page=profiler&action=pages_list' );


    if( $crud->delete('pages', 'page_id', ' = ', (int) $_GET['page_id']) ) {

      header( "location: " . $profiler->getRedir() );	

    }

  }


  if ( $_GET['action'] == 'delete_discography' ) {

    $profiler->setRedir	( '?page=profiler&action=discography_list' );


    if( $crud->delete('discography', 'discography_id', ' = ', (int) $_GET['discography_id']) ) {


      $crud->delete('discography_item', 'discography_id', ' = ', (int) $_GET['discography_id']);

      header( "location: " . $profiler->getRedir() );	

    }

  }


  if ( $_GET['action'] == 'delete_discography_item' ) {

    $profiler->setRedir	( '?page=profiler&action=create_new_discography_item' );


    if( $crud->delete('discography_item', 'discography_item_id', ' = ', (int) $_GET['discography_item_id']) ) {

      header( "location: " . $profiler->getRedir() );	

    }

  }

// -------------------------------------------------------------------------------------------------------------------------------------------


//  ******************************************************************************************************************************************
//	4) PROFILE PICTURES
// 	******************************************************************************************************************************************

// -------------------------------------------------------------------------------------------------------------------------------------------
// 	4.1) Add profile picture
// -------------------------------------------------------------------------------------------------------------------------------------------

  if ( $_GET['action'] == 'add_profile_picture' ) {

    //$uploader->setFileParentId( $_POST['profile_id'] );

      if( $_FILES["file"]["name"] != '' ) {

        $file = explode('.', $_FILES["file"]["name"]);
        $_POST['profile_picture_name'] = $file[0];
        $_POST['profile_picture_ext'] = '.'.$file[1];
        $_POST['creation_date'] = date('Y-m-d H:i:s');



        if ( $_POST['rename'] ) {

          $uploader->renameFile($_POST['rename']);

        }

        if ( $_POST['check_size'] == 'true' ) {

          $uploader->checkFileSize();
        }

        if ( $_POST['check_extension'] != 'true' ) {

          $uploader->checkExtension();
        }

        if ( $_POST['save'] == 'true' ) {

          $uploader->setCrud($crud);
          //$uploader->saveFileInfoArray();

        }

        if ( $_POST['replace'] != 'true' ) {

          $uploader->checkFileExistence();

        }

        else {

          $uploader->flushFileInfoArray();

        }


      $uploader->uploadFile( '?page=profiler&action=profile_list&'.$auto_redir );
    }

  }


// -------------------------------------------------------------------------------------------------------------------------------------------
// 	4.2) Delete profile picture
// -------------------------------------------------------------------------------------------------------------------------------------------

  if ( $_GET['action'] == 'delete_profile_picture' ) {

    $uploader->setRedir('?page=profiler&action=profile_list&'.$auto_redir);
    $uploader->deleteFile( $_GET['file_field'] , (int) $_GET['file_id'] );

  }

// -------------------------------------------------------------------------------------------------------------------------------------------
// 	4.3) Erase trashed profile picture
// -------------------------------------------------------------------------------------------------------------------------------------------

  if ( $_GET['action'] == 'erase' ) {

    $trash_browser->eraseFile( $uploader->getTrashcan() . (int) $_GET['file_to_be_erased'] , '?page=profiler&action=list_trashed_profile_pictures' );

  }

// -------------------------------------------------------------------------------------------------------------------------------------------


//	5) 	
  //			
  //			5.2) Add profile description
  //			5.3) Delete profile description



/*  ****************************************************************************************************************************************** */
// 	5) PROFILE DESCRIPTIONS
// 	******************************************************************************************************************************************

// -------------------------------------------------------------------------------------------------------------------------------------------
// 	5.1) Select profile description
// -------------------------------------------------------------------------------------------------------------------------------------------

  if ( $_GET['action'] == 'manage_profile_description' ) {

    $profile_rows =  $crud->select('','profile','profile_id, profile_name, profile_surname','','','profile_surname ASC','','','');

  }


// -------------------------------------------------------------------------------------------------------------------------------------------
// 	5.2) Add profile description
// -------------------------------------------------------------------------------------------------------------------------------------------


  if ( $_POST['add_profile_description'] == 1 ) {

    //$profiler->checkProfileExistenceUsingEmailAddress();
    //$profiler->validateEmailAddressFormat();
    // $profiler->validatePassword();
    $profiler->setTable('profile_description');
    $profiler->setRedir('?page=profiler&action=manage_profile_description');

    if ( $profiler->getErrorFlag() == 0 ) {

      $profiler->addProfileDescription();			

    }

  }

// -------------------------------------------------------------------------------------------------------------------------------------------
// 	5.3) Edit profile description
// -------------------------------------------------------------------------------------------------------------------------------------------


  if ( $_GET['action'] == 'edit_profile_description' ) {

      $where = "profile_description_id = " . $_GET['profile_description_id'];
      $rows =  $crud->select('','profile_description','*','',$where,'','','1','0');

  if ( $_POST['edit_profile_description'] == 1 ) {

    $profiler->setTable('profile_description');
    $profiler->setRedir('?page=profiler&action=manage_profile_description');

    if( $profiler->getErrorFlag() == 0 ) {

      $profiler->editProfileDescription();			

    }

  }

  }

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	4.4) Delete profile description
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    if ( $_GET['action'] == 'delete_profile_description' ) {

      if( $crud->delete('profile_description', 'profile_description_id', ' = ', (int) $_GET['profile_description_id']) ) {

        header( "location: " . $profiler->getRedir() );	

      }

    }

  // -------------------------------------------------------------------------------------------------------------------------------------------


// -------------------------------------------------------------------------------------------------------------------------------------------







/*  ****************************************************************************************************************************************** */
// 	6) FLUSH PROFILES
// 	******************************************************************************************************************************************

// -------------------------------------------------------------------------------------------------------------------------------------------
// 	6.1) Flush profiles
// -------------------------------------------------------------------------------------------------------------------------------------------

  if ( $_GET['action'] == 'flush_profiles' ) {

    $textual_operator 	= array( "on" , "before" , "after" );
    $symbolic_operator  = array( "=" , "<" , ">" );
    $operator           = str_replace( $textual_operator , $symbolic_operator , $_POST['operator'] );

    if ( ( $_POST['flush_type'] == 'profile_creation' ) || ( $_POST['flush_type'] == 'profile_modification' ) ) {

      $date = $_POST['year'] . '-' . $_POST['month'] . '-' . $_POST['day'];
      $profiler->doFlushSingleOperatorProfile( $_POST['flush_type'] , $operator , $date );

      }

    if ( $_POST['flush_type'] == 'profile_password') {

      $profiler->deleteProfile( $_POST['flush_type'] , ' ' );

    }

    if ( $_POST['flush_type'] == 'range_of_dates' ) {

      $start_date = $_POST['start_year'] . '-' . $_POST['start_month'] . '-' . $_POST['start_day'];
      $end_date 	= $_POST['end_year']   . '-' . $_POST['end_month']   . '-' . $_POST['end_day'];
      $profiler->doFlushMultipleOperatorProfile( 'profile_creation' , $start_date , 'profile_creation' , $end_date );

    }

  }

// -------------------------------------------------------------------------------------------------------------------------------------------




//  ******************************************************************************************************************************************
//  7) SORTING & DISPLAYING
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	7.1) Build Sorting Array
//  ------------------------------------------------------------------------------------------------------------------------------------------

  if ( $_GET['action'] == 'pages_list') {
    $sorting_array =
    array( 	'Titre &uarr;' 			=> array( 'pages.page_title' 	     , 'asc'  ),
        'Type &uarr;' 			=> array( 'pages.page_type'       	, 'asc'  ),
        'Groupe &uarr;' 		=> array( 'profile.profile_name'       , 'asc'  ),



        'Titre &darr;' 	   		=> array( 'pages.page_title'		        , 'desc' ),
        'Type &darr;' 	   		=> array( 'pages.page_type'       , 'desc' ),
        'Groupe &darr;' 		=> array( 'profile.profile_name'       , 'desc'  ),

    );


    foreach ( $sorting_array as $sorting_k => $sorting_v ) {

      $active = ( ( ( $_GET['page_sort_key'] == $sorting_v[0] ) && ( $_GET['page_sort_direction'] == $sorting_v[1] ) ) ) ? ' selected="selected"' : '';
      $sort_menu .= '<option value="'.$_SERVER["REQUEST_URI"].'&amp;page_sort_key='.$sorting_v[0].'&amp;page_sort_direction='.$sorting_v[1].'" 		
      '.$active.'>'.$sorting_k.'</option>';

    }


  } else {
    $sorting_array =
    array( 	'Surname &uarr;' 		=> array( 'profile_surname' 	        , 'asc'  ),
        'Email &uarr;' 			=> array( 'profile_email_address'       , 'asc'  ),
        'Country &uarr;' 		=> array( 'profile_country'     		, 'asc'  ),
        'Category &uarr;'		=> array( 'profile.profile_category_id'	, 'asc'  ),
        'Creation &uarr;'		=> array( 'profile_creation'	        , 'asc'  ),
        'Modification &uarr;'   => array( 'profile_modification'        , 'asc'  ),
        'Category &uarr; and Surname &uarr;'   => array( 'profile.profile_category_id  asc,  profile.profile_surname'        , 'asc'  ),
        'Category &uarr; and Surname &darr;'   => array( 'profile.profile_category_id  asc,  profile.profile_surname'        , 'desc'  ),


        'Surname &darr;' 	   	=> array( 'profile_surname'		        , 'desc' ),
        'Email &darr;' 	   		=> array( 'profile_email_address'       , 'desc' ),
        'Country &darr;' 	   	=> array( 'profile_country'		        , 'desc' ),
        'Category &darr;'		=> array( 'profile.profile_category_id'	, 'desc' ),
        'Creation &darr;' 	 	=> array( 'profile_creation'	        , 'desc' ),
        'Modification &darr;' 	=> array( 'profile_modification'        , 'desc' ),
        'Category &darr; and Surname &uarr;'   => array( 'profile.profile_category_id  desc,  profile.profile_surname'        , 'asc'  ),
        'Category &darr; and Surname &darr;'   => array( 'profile.profile_category_id  desc,  profile.profile_surname'        , 'desc'  ),

    );
  foreach ( $sorting_array as $sorting_k => $sorting_v ) {

    $active = ( ( ( $_GET['profile_sort_key'] == $sorting_v[0] ) && ( $_GET['profile_sort_direction'] == $sorting_v[1] ) ) ) ? ' selected="selected"' : '';
    $sort_menu .= '<option value="'.$_SERVER["REQUEST_URI"].'&amp;profile_sort_key='.$sorting_v[0].'&amp;profile_sort_direction='.$sorting_v[1].'" 		
    '.$active.'>'.$sorting_k.'</option>';

  }

  }





//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	7.2) Build Display Mode Array
//  ------------------------------------------------------------------------------------------------------------------------------------------
  if ( $_GET['action'] == 'pages_list') {
  }
  else {
    $display_mode =
    array( 'Full' 	    => array( 'full' ),
         'Half' 	    => array( 'half' ),
         'Minimal'    => array( 'minimal' )
    );

    foreach ( $display_mode as $display_mode_k => $display_mode_v ) {

    $active = ( $_GET['profile_display_type'] == $display_mode_v[0] ) ? ' selected="selected"' : '';
    $display_menu .= '<option value="'.$_SERVER["REQUEST_URI"].'&amp;profile_display_type='.$display_mode_v[0].'" '.$active.'>'.$display_mode_k.'</option>';

    }

  }





// -------------------------------------------------------------------------------------------------------------------------------------------


?>