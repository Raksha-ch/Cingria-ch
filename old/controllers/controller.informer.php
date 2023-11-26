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
   //			2.4) Pager
   //			2.5) Uploader
   //			2.6) Newsletter
   //			2.7) PHPMailer
   //			2.8) Informer
   //			2.9) Filer
   //	3) 	POOLS
   //			3.1) Select pools
   //			3.2) Create pool
   //			3.3) Rename pool
   // 			3.4) Edit pool
   //	4) 	SUBSCRIBERS
   //			4.1) Add Subscriber To Pool
   //			4.2) Add Subscriber From Profile To Pool
   //			4.3) Delete Subscriber From Pool
   //	5) NEWSLETTER
   //			5.1) Select Newsletters
   //			5.2) Create Newsletter	
   //			5.3) Edit Newsletter
   //			5.4) Delete Newsletter
   //			5.5) Flush Newsletter
   //	6) 	SORTING & DISPLAYING
   //			6.1) Build Pools Sorting Array
   //			6.2) Build Pools Display Mode Array
   //			6.3) Build Newsletter Sorting Array
   //
   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




  //  ******************************************************************************************************************************************
  //  0) PERMISSION CHECK
  //  ******************************************************************************************************************************************	

    if ( $_SESSION['login_status'] != 1 ) { header( "location:?page=home" ) ;}


  //  ******************************************************************************************************************************************
  //  1) INCLUDES
  //  ******************************************************************************************************************************************

    include 'classes/class.phpmailer.php' ;
    include 'classes/class.pager.php';

    include 'models/model.crud.php';
    include 'models/model.filer.php';
    include 'models/model.informer.php';
    include 'models/model.newsletter.php';
    include 'models/model.profiler.php';
    include 'models/model.sorter.php';
    include 'models/model.uploader.php';

    include 'functions/function.addPopupToLink.php';
    include 'functions/function.formSelectJump.php';
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

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	2.4) Pager
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    $pager = new Pager;

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
   //  2.6) Newsletter
   //  ------------------------------------------------------------------------------------------------------------------------------------------

    $newsletter = new Newsletter	();

   //  ------------------------------------------------------------------------------------------------------------------------------------------
   //  2.7) PHPMailer
   //  ------------------------------------------------------------------------------------------------------------------------------------------

    $mailer = new PHPMailer			();

   //  ------------------------------------------------------------------------------------------------------------------------------------------
   //  2.8) Informer
   //  ------------------------------------------------------------------------------------------------------------------------------------------

    $informer = new Informer		();
    $informer->setTable				('newsletter');
    $informer->setCrud				($crud);

   //  ------------------------------------------------------------------------------------------------------------------------------------------
   //  2.9) Filer
   //  ------------------------------------------------------------------------------------------------------------------------------------------

    $filer = new Filer				();
    $filer->setFolder				('newsletter_img/newsletter_headers/');
    $filer->buildItemsArray			();

   //  ------------------------------------------------------------------------------------------------------------------------------------------



  //  ******************************************************************************************************************************************
  //  3) POOLS
  //  ******************************************************************************************************************************************

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	3.1) Select Pools
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    if ( $_GET['action'] == 'pool_list' ) {

      if ( !isset( $_GET['pool_sort_key'] 		) )  { $_GET['pool_sort_key']		 	= 'pool_creation_date' ;}
      if ( !isset( $_GET['pool_sort_direction']   ) )  { $_GET['pool_sort_direction']		= 'desc' 			   ;}
      if ( !isset( $_GET['pool_display_type'] 	) )  { $_GET['pool_display_type'] 		= 'minimal' 		   ;}

      $session->setSessionVar( 'sort_key'       , $_GET['pool_sort_key']       );
      $session->setSessionVar( 'sort_direction' , $_GET['pool_sort_direction'] );
      $session->setSessionVar( 'display_type'   , $_GET['pool_display_type']   );
      $session->setSessionVar( 'total_records'  , $crud->countRecords('pool')  );

      $sortDirectionArray 			= $pager->setSortDirection( 'pool_sort_direction' , $_GET['pool_sort_direction'] );
      $sortKeyArray 					= $pager->setSortKey( 'pool_sort_key' , $_GET['pool_sort_key'] );
      $displayTypeArray 				= $pager->setSortKey( 'pool_display_type' , $_GET['pool_display_type'] );

      $pager->setTable				( 'pool' );
      $pager->setPageName				( 'index.php?page=informer&action=pool_list' );
      $pager->setLimit				( 2 );

      $pager->setTotalRecords			( $session->getSessionVar( 'total_records' ) );
      $pager->setPagerData			( ); // necessary call to get pager working

      $informer->setTable				( 'pool' );

      $rows = $crud->select( '' , 'pool' , '*' , '' , '' ,  $session->getSessionVar('sort_key').' '.$session->getSessionVar('sort_direction') , '',
                   $pager->getLimit() , $pager->getOffset() );
    }

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	3.2) Create Pool
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    if ( $_GET['action'] == 'create_pool' ) {

      $informer->setTable( 'profile' );
      $rows  	 =  $crud->select( '' , $informer->getTable() , '*' , '' , '' , 'profile_id ASC' , '' , '' , '' );	

    }

    if ( $_POST['create_pool'] != '' ) {

      $informer->setCrud($crud);

      if ( isset( $_POST['pool_name'] ) ) {

        $informer->setTable('pool');

        $fields =
        array( 'pool_name' 		  	=> $_POST['pool_name'],
               'pool_creation_date' => $_POST['pool_creation_date']
        );

        $lastId = $informer->savePoolName($fields);

      }

      if ( isset( $_POST['pool_list_2'] ) ) {	

        foreach ( $_POST['pool_list_2'] as $key => $value ) {

          $subscriber_data = explode( '+' , $value );

          $fields =
          array( 'pool_id' 		  		  => $lastId,
                 'subscriber_name' 		  => $subscriber_data[0],
               'subscriber_surname' 	  => $subscriber_data[1],
               'subscriber_email_address' => $subscriber_data[2]
          );

          $crud->insert('subscriber', $fields);
        }

      }

    }

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	3.3) Rename Pool
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    if ( $_POST['rename_pool'] == '1' ) {

      //$crud->updateRow( 'pool' , 'pool_name' , $_POST['pool_name'] , 'pool_id' , $_POST['pool_id'] );
      //$crud->updateRow( 'pool' , 'pool_modification_date' , $_POST['pool_modification_date'] , 'pool_id' , $_POST['pool_id'] );
      $informer->setTable				('pool');
      $informer->setRedir				('?page=informer&action=edit_pool&pool_id='.$_POST['pool_id']);

      $informer->editPool('pool_id' , $_POST['pool_id']);

    }

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	3.4) Edit Pool
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    if ( $_GET['action'] == 'edit_pool') {

      $where = " pool_id = " . $_GET['pool_id'];
      $rows  =  $crud->select( '' , 'pool' , '*' , '', $where ,  '' , '' , '1' ,'0' );

      $pool_id   = $rows['0']['pool_id'];
      $pool_name = $rows['0']['pool_name'];

      $informer->setTable('profile');
      $profiles_rows  =  $crud->select( '' , $informer->getTable() , '*' , '', '' ,  'profile_id ASC' , '', '' ,'' );

      $informer->setTable('subscriber');
      $where = " pool_id = ".$_GET['pool_id'];
      $subscriber_rows  =  $crud->select( '' , $informer->getTable() , '*' , '', $where ,  'subscriber_name ASC' , '', '' ,'' );

    }

  //  ------------------------------------------------------------------------------------------------------------------------------------------





  //  ******************************************************************************************************************************************
  //  4) SUBSCRIBERS
  //  ******************************************************************************************************************************************

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	4.1) Add Subscriber To Pool
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    if ( $_POST['add_subscriber_to_pool'] == '1' ) {

      $informer->setTable('subscriber');
      $where = 'subscriber_email_address = '. $_POST['subscriber_email_address'] . ' AND pool_id = '. $_POST['pool_id'];

      if (!$crud->select('' , $informer->getTable(), 'subscriber_email_address', '', $where , '' ,'' ,'' ,'')) {

        $fields =
        array( 'pool_id' => $_POST['pool_id'],
             'subscriber_name' => $_POST['subscriber_name'],
             'subscriber_surname' => $_POST['subscriber_surname'],
             'subscriber_email_address' => $_POST['subscriber_email_address']
        );

        $crud->insert( $informer->getTable() , $fields );

        $fields =
        array('pool_modification_date' => $_POST['pool_modification_date'] );
        $crud->update( 'pool', $fields , 'pool_id', $_POST['pool_id'] );

        $informer->setRedir( 'index.php?page=informer&action=edit_pool&pool_id=' . $_POST['pool_id'] . '#pool' );
        header( "location: " . $informer->getRedir() );

      }

    }

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	4.2) Add Subscriber From Profile To Pool
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    if ( $_POST['add_subscriber_to_pool_from_profile'] == '1' ) {

    foreach ($_POST['pool_list_2'] as $key => $value) {
      $subscriber_data = explode('+',$value);

      $where = 'subscriber_email_address = ' . $subscriber_data[2] . ' AND pool_id = ' . $_POST['pool_id'];
      if(!$crud->select( '' , 'subscriber' , 'subscriber_email_address' , '' , $where , '' , '' , '' )) {

        $fields =
        array(
          'pool_id' 					=> $_POST['pool_id'],
          'subscriber_name' 			=> $subscriber_data['0'],
          'subscriber_surname' 		=> $subscriber_data['1'],
          'subscriber_email_address' 	=> $subscriber_data['2']
        );

        $crud->insert( 'subscriber' , $fields );

        $fields =
        array(
        'pool_modification_date' => $_POST['pool_modification_date']
        );

        $crud->update('pool', $fields, 'pool_id', $_POST['pool_id']);

        $informer->setRedir( 'index.php?page=informer&action=edit_pool&pool_id=' . $_POST['pool_id'] . '#pool' );
        header( "location: " . $informer->getRedir() );

        }
      }

    }



  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	4.3) Delete Subscriber From Pool
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    if ( $_GET['action'] == 'edit_pool') {

      if ( $_GET['subscriber_id'] != '') {

        $informer->setTable( 'subscriber' );
        $informer->setRedir( 'index.php?page=informer&action=edit_pool&pool_id=' . $_GET['pool_id'] . '#pool' );
        $informer->removeSubscriber( 'subscriber_id' , (int) $_GET['subscriber_id'] );

      }

    }

  //  ------------------------------------------------------------------------------------------------------------------------------------------





  //  ******************************************************************************************************************************************
  //  5) NEWSLETTER
  //  ******************************************************************************************************************************************

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	5.1) Select Newsletters
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    if ( $_GET['action'] == 'newsletter_list' ) {

      if ( !isset( $_GET['newsletter_sort_key'] 		) )  { $_GET['newsletter_sort_key']		 	= 'newsletter_creation_date' ;}
      if ( !isset( $_GET['newsletter_sort_direction'] ) )  { $_GET['newsletter_sort_direction']	= 'desc' 					 ;}

      $session->setSessionVar			( 'sort_key'       , $_GET['newsletter_sort_key']       );
      $session->setSessionVar			( 'sort_direction' , $_GET['newsletter_sort_direction'] );
      $session->setSessionVar			( 'total_records'  , $crud->countRecords('newsletter')  );

      $sortDirectionArray 			= $pager->setSortDirection( 'newsletter_sort_direction' , $_GET['newsletter_sort_direction'] );
      $sortKeyArray 					= $pager->setSortKey( 'newsletter_sort_key' , $_GET['newsletter_sort_key'] );

      $pager->setTable				( 'newsletter' );
      $pager->setPageName				( 'index.php?page=informer&action=newsletter_list' );
      $pager->setLimit				( 5 );

      $pager->setTotalRecords			( $session->getSessionVar( 'total_records' ) );
      $pager->setPagerData			( ); // necessary call to get pager working

      $informer->setTable				( 'newsletter' );

      $rows  =  $crud->select( '' , 'newsletter' , '*' , '' , '' , $session->getSessionVar('sort_key').' '. $session->getSessionVar('sort_direction') , '' ,
                           $pager->getLimit(),$pager->getOffset() );	
  }	

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	5.2) Create Newsletter
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    if ( $_POST['create_newsletter'] == '1' ) {

      $informer->setCrud($crud);

      if ( $_POST['newsletter_header_img'] != '' ) { $_POST['newsletter_header'] = $_POST['newsletter_header_img'] ;}
      if ( $_POST['newsletter_footer_img'] != '' ) { $_POST['newsletter_footer'] = $_POST['newsletter_footer_img'] ;}

      $informer->createNewsletter();		

    }


  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	5.3) Edit Newsletter
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    if ( $_GET['action'] == 'edit_newsletter' ) {

      $where = " newsletter_id = ".$_GET['newsletter_id'];
      $rows  =  $crud->select( '' , 'newsletter' , '*' , '', $where ,  '' , '' , '1' ,'0' );	

      $newsletter_id 			= $rows['0']['newsletter_id'];
      $doctype_id 			= $rows['0']['doctype_id'];
      $newsletter_style_id 	= $rows['0']['newsletter_style_id'];
      $width 					= $rows['0']['newsletter_width'];
      $title 					= $rows['0']['newsletter_title'];
      $header 				= $rows['0']['newsletter_header'];
      $header_bg 				= $rows['0']['newsletter_header_background'];
      $header_bg_repeat 		= $rows['0']['newsletter_header_background_repeat'];
      $body 					= $rows['0']['newsletter_body'];
      $body_bg 				= $rows['0']['newsletter_body_background'];
      $body_bg_repeat 		= $rows['0']['newsletter_body_background_repeat'];
      $footer 				= $rows['0']['newsletter_footer'];
      $footer_bg 				= $rows['0']['newsletter_footer_background'];
      $footer_bg_repeat 		= $rows['0']['newsletter_footer_background_repeat'];
      $is_header_img 			= $newsletter->isImageFlag($header,'newsletter_img/newsletter_headers/');
      $is_footer_img 			= $newsletter->isImageFlag($footer,'newsletter_img/newsletter_footers/');

    }


    if ( $_POST['edit_newsletter'] == 1) {

      $informer->setCrud($crud);
      $informer->setRedir('?page=informer&action=newsletter_list');
      $informer->setNewsletterTitle($_POST['newsletter_title']);

        if ( $_POST['newsletter_header_img'] != '' ) { $_POST['newsletter_header'] = $_POST['newsletter_header_img'] ;}
        if ( $_POST['newsletter_footer_img'] != '' ) { $_POST['newsletter_footer'] = $_POST['newsletter_footer_img'] ;}

      $informer->editNewsletter();

    }

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	5.4) Delete Newsletter
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    if ( ( $_GET['action'] == 'delete_newsletter' ) && ( isset( $_GET['newsletter_id'] ) ) ) {

      $informer->setTable( 'newsletter' );
      $informer->setRedir('?page=informer&action=newsletter_list');
      $informer->deleteNewsletter( 'newsletter_id' , '=' , $_GET['newsletter_id'] );

    }	

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	5.5) Flush Newsletter
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    if ( $_GET['action'] == 'flush_newsletter' ) {

      $informer->setTable('newsletter');
      $informer->setCrud($crud);

      $textual_operator = array("on", "before", "after");
      $symbolic_operator   = array("=", "<", ">");
      $operator = str_replace($textual_operator, $symbolic_operator, $_POST['operator']);

        if ( ( $_POST['flush_type'] == 'newsletter_creation_date' ) || ( $_POST['flush_type'] == 'newsletter_modification_date' ) ) {

          $date = $_POST['year'] . '-' . $_POST['month'] . '-' . $_POST['day'];
          $informer->deleteNewsletter( $_POST['flush_type'] , $operator , $date );

        }

        if ( $_POST['flush_type'] == 'sent_newsletter' ) {

          $informer->deleteNewsletter( 'newsletter_sent_date' , '>' , '0000-00-00' );

        }

        if ( $_POST['flush_type'] == 'range_of_dates' ) {

          $start_date = $_POST['start_year'] . '-' . $_POST['start_month'] . '-' . $_POST['start_day'];
          $end_date 	= $_POST['end_year']   . '-' . $_POST['end_month']   . '-' . $_POST['end_day'];
          $informer->deleteNewsletter( 'newsletter_creation_date' , $start_date , 'newsletter_creation_date' , $end_date );

        }

    }


  //  ******************************************************************************************************************************************
  //  6) SORTING & DISPLAYING
  //  ******************************************************************************************************************************************

    if ( $_GET['action'] == 'pool_list' ) {

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	6.1) Build Pools Sorting Array
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    $sorting_array =
    array(	'Name &uarr;'					=> array( 'pool_name' 				, 'asc'	),
        'Creation Date &uarr;'			=> array( 'pool_creation_date' 		, 'asc'	),
        'Modification Date &uarr;'		=> array( 'pool_modification_date' 	, 'asc'	),

        'Name &darr;'					=> array( 'pool_name' 				, 'desc' ),
        'Creation Date &darr;'			=> array( 'pool_creation_date' 		, 'desc' ),
        'Modification Date &darr;'		=> array( 'pool_modification_date' 	, 'desc' )
    );

    foreach ( $sorting_array as $sorting_k => $sorting_v ) {

      $active = ( ( ( $_GET['pool_sort_key'] == $sorting_v[0] ) && ( $_GET['pool_sort_direction'] == $sorting_v[1] ) ) ) ? ' selected="selected"' : '';
      $sort_menu .= '<option value="'.$_SERVER["REQUEST_URI"].'&amp;pool_sort_key='.$sorting_v[0].'&amp;pool_sort_direction='.$sorting_v[1].'" 		
      '.$active.'>'.$sorting_k.'</option>';

    }

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	6.2) Build Pools Display Mode Array
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    $display_mode =
    array( 'Minimal' 	 => array('minimal'),
         'Full' 		 => array('full')
    );

    foreach ( $display_mode as $display_mode_k => $display_mode_v ) {

    $active = ( $_GET['pool_display_type'] == $display_mode_v[0] ) ? ' selected="selected"' : '';
    $display_menu .= '<option value="'.$_SERVER["REQUEST_URI"].'&amp;pool_display_type='.$display_mode_v[0].'" '.$active.'>'.$display_mode_k.'</option>';

    }




  } // end $_GET['action'] == 'pool_list'

  if ( $_GET['action'] == 'newsletter_list' ) {

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	6.3) Build Newsletter Sorting Array
  //  ------------------------------------------------------------------------------------------------------------------------------------------

    $sorting_array =
    array(	'Title &uarr;'					=> array( 'newsletter_title'			,'asc' ),
        'Creation Date &uarr;'			=> array( 'newsletter_creation_date'	,'asc' ),
        'Modification Date &uarr;'		=> array( 'newsletter_modification_date','asc' ),
        'Sent Date &uarr;'				=> array( 'newsletter_sent_date'		,'asc' ),

        'Title &darr;'					=> array( 'newsletter_title'			,'desc' ),
        'Creation Date &darr;'			=> array( 'newsletter_creation_date'	,'desc' ),
        'Modification Date &darr;'		=> array( 'newsletter_modification_date','desc' ),
        'Sent Date &darr;'				=> array( 'newsletter_sent_date'		,'desc' )
    );

    foreach ( $sorting_array as $sorting_k => $sorting_v ) {

      $active = ( ( ( $_GET['newsletter_sort_key'] == $sorting_v[0] ) && ( $_GET['newsletter_sort_direction'] == $sorting_v[1] ) ) ) ? ' selected="selected"' : '';
      $sort_menu .= '<option value="'.$_SERVER["REQUEST_URI"].'&amp;newsletter_sort_key='.$sorting_v[0].'&amp;newsletter_sort_direction='.$sorting_v[1].'"
      '.$active.'>'.$sorting_k.'</option>';

    }

}















/**
* Send newsletter
*
*/


if($_GET['action'] == 'send_newsletter') {

  $where = " newsletter_id = ".$_GET['newsletter_id'];
  $subscribers  =  $crud->select( '' , 'subscriber' , '*' , '', $where ,  '' , '' , '1' ,'0' );

  $where = " newsletter_id = ".$_GET['newsletter_id'];
  $rows  =  $crud->select( '' , 'newsletter' , '*' , '', $where ,  '' , '' , '1' ,'0' );

  $newsletter_id = $rows['0']['newsletter_id'];
  $doctype_id = $rows['0']['doctype_id'];
  $newsletter_style_id = $rows['0']['newsletter_style_id'];
  $width = $rows['0']['newsletter_width'];
  $title = $rows['0']['newsletter_title'];
  $header = $rows['0']['newsletter_header'];
  $header_bg = $rows['0']['newsletter_header_background'];
  $header_bg_repeat = $rows['0']['newsletter_header_background_repeat'];
  $body = $rows['0']['newsletter_body'];
  $body_bg =$rows['0']['newsletter_body_background'];
  $body_bg_repeat = $rows['0']['newsletter_body_background_repeat'];
  $footer = $rows['0']['newsletter_footer'];
  $footer_bg = $rows['0']['newsletter_footer_background'];
  $footer_bg_repeat = $rows['0']['newsletter_footer_background_repeat'];
  $is_header_img = $newsletter->isImageFlag($header,'newsletter_img/newsletter_headers/');
  $is_footer_img = $newsletter->isImageFlag($footer,'newsletter_img/newsletter_footers/');


  $informer->setTable('newsletter');
  $crud->fetchSelectedAsObject($informer->getTable(), 'newsletter_id', $_GET['newsletter_id']);
  $doctype_id = $crud->getObj('doctype_id');
  $newsletter_style_id = $crud->getObj('newsletter_style_id');
  $newsletter->setHeader($crud->getObj('newsletter_header'),'http://www.societe-ecran.tv/burling/newsletter_img/newsletter_headers/');
  $header =  $newsletter->getHeader();
  $newsletter->setBody($crud->getObj('newsletter_body'));
  $body = $newsletter->getBody();
  $newsletter->setFooter($crud->getObj('newsletter_footer'),'http://www.societe-ecran.tv/burling/newsletter_img/newsletter_footers/');
  $footer =  $newsletter->getFooter();
  $newsletter->setHeaderBg($crud->getObj('newsletter_header_background'),'http://www.societe-ecran.tv/burling/newsletter_img/newsletter_headers/','#newsletter_header',$crud->getObj('newsletter_header_background_repeat'));
  $header_bg = $newsletter->getHeaderBg();
  $newsletter->setBodyBg($crud->getObj('newsletter_body_background'),'http://www.societe-ecran.tv/burling/newsletter_img/newsletter_bodies/','#newsletter_body',$crud->getObj('newsletter_body_background_repeat'));
  $body_bg = $newsletter->getBodyBg();
  $newsletter->setFooterBg($crud->getObj('newsletter_footer_background'),'http://www.societe-ecran.tv/burling/newsletter_img/newsletter_footers/','#newsletter_footer',$crud->getObj('newsletter_footer_background_repeat'));
  $footer_bg = $newsletter->getFooterBg();
  $newsletter->setWidth($crud->getObj('newsletter_width'),$crud->getObj('newsletter_header'),'http://www.societe-ecran.tv/burling/newsletter_img/newsletter_headers/','#newsletter');
  $width = $newsletter->getWidth();
  $newsletter->setTitle($crud->getObj('newsletter_title'));
  $title = $newsletter->getTitle();
  $informer->setTable('newsletter_style');
  $crud->fetchSelectedAsObject($informer->getTable(), 'newsletter_style_id', $newsletter_style_id);
  $newsletter->setCss($crud->getObj('newsletter_style_css'));
  $css = $newsletter->getCss();
  $informer->setTable('doctype');
  $crud->fetchSelectedAsObject($informer->getTable(), 'doctype_id', $doctype_id);
  $newsletter->setDoctype($crud->getObj('doctype_value'));
  $doctype = $newsletter->getDoctype();

$newsletter_html = <<<EOD

  $doctype
      <header>
        <style type="text/css" media="screen">
        $css
        $width	
        $header_bg
        $body_bg
        $footer_bg
        </style>
        <title>$title</title>
      </header>
        <body>
          <div id="newsletter">
            <div id="newsletter_header">$header</div>
            <div id="newsletter_body">$body</div>
            <div id="newsletter_footer">$footer</div>
          </div>
        </body>
  </html>
EOD;



  if($_POST['send_newsletter'] == '1') {

    $informer->setTable('subscriber');

    /*  CC field  *////////////////////////////////////////////////////////////////////////////

    $where = " pool_id = ".$_POST['cc_pool_id'];
    $cc_subscriber_data  =  $crud->select( '' , $informer->getTable() , '*' , '', $where ,  '' , '' , '1' ,'0' );

    foreach ($cc_subscriber_data as $key) {
      $cc_subscriber_emails .= $key['subscriber_email_address'].',';
    }

    if($_POST['textarea_email_cc'] != '') {
      $cc_subscriber_emails .= $_POST['textarea_email_cc'];
    }
    $cc_subscriber_emails = explode(',', $cc_subscriber_emails);
    $cc_subscriber_emails = array_map('trim', $cc_subscriber_emails);

    if(sizeof($cc_subscriber_emails) > 0) {			
      foreach ($cc_subscriber_emails as $cc_subscriber_email){
      $mailer->AddCC($cc_subscriber_email);
      }
    }	

    /*  BCC field  *////////////////////////////////////////////////////////////////////////////


    $where = " pool_id = ".$_POST['bcc_pool_id'];
    $bcc_subscriber_data  =  $crud->select( '' , $informer->getTable() , '*' , '', $where ,  '' , '' , '1' ,'0' );


    foreach ($bcc_subscriber_data as $key) {
      $bcc_subscriber_emails .= $key['subscriber_email_address'].',';
    }

    if($_POST['textarea_email_bcc'] != '') {
      $bcc_subscriber_emails .= $_POST['textarea_email_bcc'];
    }
    $bcc_subscriber_emails = explode(',', $bcc_subscriber_emails);
    $bcc_subscriber_emails = array_map('trim', $bcc_subscriber_emails);

    if(sizeof($bcc_subscriber_emails) > 0) {			
      foreach ($bcc_subscriber_emails as $bcc_subscriber_email){
        $mailer->AddBCC($bcc_subscriber_email);
      }
    }

    /*  TO field  *////////////////////////////////////////////////////////////////////////////

    if($_POST['email_to'] != '') {
      $mailer->AddAddress($_POST['email_to']);
    }
    else {
      $mailer->AddAddress('dummy@societe-ecran.tv');
    }

    $mailer->Subject= $_POST['email_subject'];
    $mailer->From = $_POST['email_from'];
    $mailer->FromName = $_POST['email_from_name'];
    $mailer->MsgHTML($newsletter_html);
    $mailer->IsHTML(true);
    $mailer->IsMail(true);
    // $mailer->IsSMTP(true);


    print $newsletter_id.'-'.$_POST['newsletter_sent_date'];
    $informer->setTable('newsletter');
    $informer->markNewsletterAsSent();
    //$informer->markNewsletterAsSent($newsletter_id,$_POST['newsletter_sent_date']);
    /*
    if($mailer->Send()) {
      $informer->setTable('newsletter');
      $informer->markNewsletterAsSent($newsletter_id,$_POST['newsletter_sent_date']);
    };
    */
  }

}




?>