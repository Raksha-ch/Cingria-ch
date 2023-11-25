<?php

   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   //																																		
   //  	SCRIPT SUMMARY (2010.13.03)  (n.b.: this file is included by switch.writer.php)                                                                                                       	
   //																																		
   // 	**************************************************************************************************************************************
   //																																		
   //	0) PERMISSION CHECK
   //	1) INCLUDES
   //	2) INSTANCES
   //			2.1) Crud
   //			2.2) Writer
   //			2.3) Session
   //			2.4) Sorter
   //			2.5) Pager
   //			2.6) Uploader
   //	3) WRITING
   //			3.1) Select Writings
   //			3.2) Create Writing
   // 			3.3) Edit Writing
   //			3.4) Delete Writing
   //	4) NEWS
   //			4.1) Select News
   //			4.2) Create News
   // 			4.3) Edit News
   //			4.4) Delete News
   //	5) SORTING & DISPLAYING
   //			5.1) Build Sorting Array
   //			5.2) Build Display Mode Array
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
	include 'models/model.writer.php';
	include 'models/model.uploader.php';
		
	include 'functions/function.formSelectJump.php';
	include 'functions/function.truncateString.php';
	include 'functions/function.normalizeString.php';

//  ******************************************************************************************************************************************
//  2) INSTANCES
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.1) Crud
//  ------------------------------------------------------------------------------------------------------------------------------------------

	$crud = new Crud			();

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.2) Writer
//  ------------------------------------------------------------------------------------------------------------------------------------------

	$writer = new Writer		();
	
	$writer->setCrud			( $crud );

	$writer->setTable			( 'writing' );
	$writer->setRedir			( '?page=writer&action=writing_list&'.$auto_redir );

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.3) Session
//  ------------------------------------------------------------------------------------------------------------------------------------------

	// $session = new Session(); 			// instanciated in index.php

	$auto_redir = 'writer_sort_key=' 		 . $session->getSessionVar( 'sort_key') 	   .
	              '&writer_sort_direction='  . $session->getSessionVar( 'sort_direction' ) .
	              '&writing_display_type=' 	 . $session->getSessionVar( 'display_type' )   .
				  '&slice=' 				 . $session->getSessionVar( 'slice' );

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.4) Sorter
//  ------------------------------------------------------------------------------------------------------------------------------------------

	$sorter = new Sorter		();

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.5) Pager
//  ------------------------------------------------------------------------------------------------------------------------------------------

	$pager = new Pager			();

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.2) Uploader
//  ------------------------------------------------------------------------------------------------------------------------------------------

	$uploader = new Uploader();
	$uploader->setCrud($crud);
	
//  ------------------------------------------------------------------------------------------------------------------------------------------





//  ******************************************************************************************************************************************
//  3) WRITING
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.1) Select Writings
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'writing_list' ) {
		
	if ( !isset( $_GET['writer_sort_key'] 		 ) )   { $_GET['writer_sort_key']		= 'template_name' 			 ;}
	if ( !isset( $_GET['writer_sort_direction']  ) )   { $_GET['writer_sort_direction']	= 'desc' 					 ;}
	if ( !isset( $_GET['writing_display_type'] 	 ) )   { $_GET['writing_display_type'] 	= 'minimal' 		   		 ;}

	$session->setSessionVar			( 'sort_key'       , $_GET['writer_sort_key']       );
	$session->setSessionVar			( 'sort_direction' , $_GET['writer_sort_direction'] );
	$session->setSessionVar			( 'display_type'   , $_GET['writing_display_type']  );
	$session->setSessionVar			( 'slice'		   , $_GET['slice'] );
	$session->setSessionVar			( 'total_records'  , $crud->countRecordsWhere( 'template', 'template_parent_id != 0' )  );

	$sortDirectionArray 			= $pager->setSortDirection ( 'writer_sort_direction' , $_GET['writer_sort_direction']   );
	$sortKeyArray 					= $pager->setSortKey	   ( 'writer_sort_key' 	  	 , $_GET['writer_sort_key'] 		);
	$displayTypeArray 				= $pager->setSortKey	   ( 'writing_display_type'  , $_GET['writing_display_type'] 	);
	
	$pager->setTable				( 'template' );
	$pager->setPageName				( 'index.php?page=writer&action=writing_list' );
	$pager->setLimit				( 10 );
	$pager->setTotalRecords			( $session->getSessionVar( 'total_records' ) );
	$pager->setPagerData			( ); // necessary call to get pager working
		
	$where = " template_parent_id != 0 ";
	$rows =  $crud->select('','template','*','',$where,'',$session->getSessionVar('sort_key').' '.$session->getSessionVar('sort_direction'),$pager->getLimit(),$pager->getOffset());
	
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.2) Create Writing
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'create_writing' ) {
		
		if ( isset( $_POST['create_writing'] ) ) {
			
			$writer->setRedir( '?page=writer&action=writing_list&'.$auto_redir );
			
			$_POST['writing_publication_start_date'] =
			$_POST['writing_publication_start_date_y'] . '-' . $_POST['writing_publication_start_date_m'] . '-' . $_POST['writing_publication_start_date_d'];
			
			$_POST['writing_publication_end_date']   =
			$_POST['writing_publication_end_date_y'] . '-' . $_POST['writing_publication_end_date_m'] . '-' . $_POST['writing_publication_end_date_d'];
			

			// error info in views/view.writer.create_writing.php
			$title_error 	= $writer->checkTitle($_POST['writing_title']);	
			$template_error = $writer->checkTemplate($_POST['template_id']);
			//
			
			if ( $writer->getErrorFlag() == 0 ) {
				$writer->setWritingTitle($_POST['writing_title']); // infobox
				$writer->createWriting();
			
			}
		
		}
	
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.3) Edit writing
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'edit_writing' ) {
		
		$where =  " writing_id = " . $_GET['writing_id'];
		$rows  =  $crud->select( '' , 'writing' , '*' , '' , $where , '' , '' , '1' , '0' );					
		
		if ( isset( $_POST['writing_id'] ) ) {
		
			$writer->setCrud ( $crud );
			$writer->setTable( 'writing' );
			$writer->setWritingTitle( $_POST['writing_title'] ) ;
			$writer->setRedir( '?page=writer&action=writing_list&'.$auto_redir );
			
			$_POST['writing_publication_start_date'] =
			$_POST['writing_publication_start_date_y'] . '-' . $_POST['writing_publication_start_date_m'] . '-' . $_POST['writing_publication_start_date_d'];
		
			$_POST['writing_publication_end_date'] 	 =
			$_POST['writing_publication_end_date_y'] . '-' . $_POST['writing_publication_end_date_m'] . '-' . $_POST['writing_publication_end_date_d'];

			
			// error info in views/view.writer.create_writing.php
			$title_error 	= $writer->checkTitle($_POST['writing_title']);	
			$template_error = $writer->checkTemplate($_POST['template_id']);
			//
			
			if ( $writer->getErrorFlag() == 0 ) {
				
				$writer->editWriting();
			
			}

		}

	}


//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.4) Delete Writing
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'delete_writing' ) {
		
		$crud->setTable( 'writing' );
		$writer->setRedir( '?page=writer&action=writing_list&'.$auto_redir );
		$writer->deleteWriting( 'writing_id', (int) $_GET['writing_id'] ) ;
	
	}
	
//  ------------------------------------------------------------------------------------------------------------------------------------------





//  ******************************************************************************************************************************************
//  4) NEWS
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	4.1) Select News
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'news_list' ) {
		
	if ( !isset( $_GET['news_sort_key'] 		 ) )   { $_GET['news_sort_key']			= 'news_title' 		 ;}
	if ( !isset( $_GET['news_sort_direction']    ) )   { $_GET['news_sort_direction']	= 'desc' 			 ;}

	$session->setSessionVar			( 'sort_key'       , $_GET['news_sort_key']       );
	$session->setSessionVar			( 'sort_direction' , $_GET['news_sort_direction'] );
	$session->setSessionVar			( 'slice' 		   , $_GET['slice'] );
	$session->setSessionVar			( 'total_records'  , $crud->countRecords( 'news' )  );

	$sortDirectionArray 			= $pager->setSortDirection ( 'news_sort_direction' , $_GET['news_sort_direction']   );
	$sortKeyArray 					= $pager->setSortKey	   ( 'news_sort_key' 	   , $_GET['news_sort_key'] 		);
	
	$writer->setTable				( 'news' );
	
	$pager->setTable				( 'news' );
	$pager->setPageName				( 'index.php?page=writer&action=news_list' );
	$pager->setLimit				( 25 );
	$pager->setTotalRecords			( $session->getSessionVar( 'total_records' ) );
	$pager->setPagerData			( ); // necessary call to get pager working
	
	$join = " LEFT JOIN news_category ON  news_category.news_category_id = news.news_category_id
			  LEFT JOIN language 	  ON  language.language_id = news.language_id ";
			
	$rows =  $crud->select('','news','*',$join,'', $session->getSessionVar('sort_key').' '.$session->getSessionVar('sort_direction'), '' ,$pager->getLimit(),$pager->getOffset());
	
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	4.2) Create News
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'create_news' ) {
		
		$artists =  $crud->select('','profile','profile_id,profile_name,profile_surname,profile_company','','', 'profile_name ASC', '' ,'','');
		
		if ( $_POST['create_news'] == 1 ) {
			
			if ( $_POST['pool_list_2'] != '' ) { $_POST['pool_list_2'] = serialize($_POST['pool_list_2']);} 		
						
			$writer->setTable( 'news' );
			$writer->setRedir( '?page=writer&action=news_list&'.$auto_redir );

			$_POST['news_publication_start_date'] =
			$_POST['news_publication_start_date_y'] . '-' . $_POST['news_publication_start_date_m'] . '-' . $_POST['news_publication_start_date_d'];

			$_POST['news_publication_end_date']   =
			$_POST['news_publication_end_date_y'] . '-' . $_POST['news_publication_end_date_m'] . '-' . $_POST['news_publication_end_date_d'];
			
			$_POST['news_content'] = addslashes($_POST['news_content']);
			
			
			// error info in views/view.writer.create_news.php
			$title_error 	= $writer->checkTitle($_POST['news_title']);	
			$category_error = $writer->checkCategory($_POST['news_category_id']);
			//

			if ( $writer->getErrorFlag() == 0 ) {
				
				$writer->setWritingTitle($_POST['news_title']); // infobox
				$writer->createWriting();

			}

		}

	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.3) Edit News
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'edit_news' ) {
	
		$where =  " news_id = " . $_GET['news_id'];
		$rows  =  $crud->select( '' , 'news' , '*' , '' , $where , '' , '' , '1' , '0' );					

		if ( $_POST['update_news'] == 1 ) {

			$writer->setCrud ( $crud );
			$writer->setTable( 'news' );
			$writer->setWritingTitle( $_POST['news_title'] ) ;
			$writer->setRedir( '?page=writer&action=news_list&'.$auto_redir );

			$_POST['news_publication_start_date'] =
			$_POST['news_publication_start_date_y'] . '-' . $_POST['news_publication_start_date_m'] . '-' . $_POST['news_publication_start_date_d'];

			$_POST['news_publication_end_date'] 	 =
			$_POST['news_publication_end_date_y'] . '-' . $_POST['news_publication_end_date_m'] . '-' . $_POST['news_publication_end_date_d'];
			
			if($_POST['pool_list_2'] != '') { $_POST['pool_list_2'] = serialize($_POST['pool_list_2']);} 		
			
			
			// error info in views/view.writer.edit_news.php
			$title_error 	= $writer->checkTitle($_POST['news_title']);	
			$category_error = $writer->checkCategory($_POST['news_category_id']); 			
			//

			$_POST['news_content'] = addslashes($_POST['news_content']);
			
			if ( $writer->getErrorFlag() == 0 ) {

				$writer->editNews();

			}
			

		}

	}


//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	4.4) Delete News
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'delete_news' ) {

		$writer->setTable( 'news' );
		$writer->setRedir( '?page=writer&action=news_list&'.$auto_redir );
		$writer->deleteWriting( 'news_id', (int) $_GET['news_id'] ) ;

	}

//  ------------------------------------------------------------------------------------------------------------------------------------------

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	4.1) Select Concert
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'concerts_list' ) {
		
	if ( !isset( $_GET['concert_sort_key'] 		 ) )   	  { $_GET['concert_sort_key']			= 'date' 		 ;}
	if ( !isset( $_GET['concert_sort_direction']    ) )   { $_GET['concert_sort_direction']		= 'asc' 			 ;}

	$session->setSessionVar			( 'sort_key'       , $_GET['concert_sort_key']       );
	$session->setSessionVar			( 'sort_direction' , $_GET['concert_sort_direction'] );
	$session->setSessionVar			( 'slice' 		   , $_GET['slice'] );
	$session->setSessionVar			( 'total_records'  , $crud->countRecords( 'concerts' )  );

	$sortDirectionArray 			= $pager->setSortDirection ( 'concert_sort_direction' , $_GET['concert_sort_direction']   );
	$sortKeyArray 					= $pager->setSortKey	   ( 'concert_sort_key' 	   , $_GET['concert_sort_key'] 		);
	
	$writer->setTable				( 'concerts' );
	
	$pager->setTable				( 'concerts' );
	$pager->setPageName				( 'admin.php?page=writer&action=concerts_list' );
	$pager->setLimit				( 25 );
	$pager->setTotalRecords			( $session->getSessionVar( 'total_records' ) );
	$pager->setPagerData			( ); // necessary call to get pager working


	$rows =  $crud->select('','concerts','*','','', $session->getSessionVar('sort_key').' '.$session->getSessionVar('sort_direction'), '' ,$pager->getLimit(),$pager->getOffset());
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	4.2) Create Concert
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'create_concert' ) {
		
		$artists =  $crud->select('','profile','profile_id,profile_name,profile_surname','','', 'profile_name ASC', '' ,'','');
		
		if ( $_POST['create_concert'] == 1 ) {
			
						
			$writer->setTable( 'concerts' );
			$writer->setRedir( '?page=writer&action=concerts_list&'.$auto_redir );

			$_POST['date'] = $_POST['year'].'-'.$_POST['month'].'-'.$_POST['day'];

			if ( $writer->getErrorFlag() == 0 ) {
				
				$writer->createWriting();

			}

		}

	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.3) Edit Concert
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'edit_concert' ) {
	
		$artists =  $crud->select('','profile','profile_id,profile_name,profile_surname','','', 'profile_name ASC', '' ,'','');
		
	
		$where =  " concert_id = " . $_GET['concert_id'];
		$rows  =  $crud->select( '' , 'concerts' , '*' , '' , $where , '' , '' , '1' , '0' );					

		if ( $_POST['edit_concert'] == 1 ) {

			$writer->setCrud ( $crud );
			$writer->setTable( 'concerts' );
			$writer->setRedir( '?page=writer&action=concerts_list&'.$auto_redir );
			
			$_POST['date'] = $_POST['year'].'-'.$_POST['month'].'-'.$_POST['day'];
			
			
			if ( $writer->getErrorFlag() == 0 ) {

				$writer->editConcert();

			}
			

		}

	}


//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	4.4) Delete Concert
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'delete_concert' ) {

		$writer->setTable( 'concerts' );
		$writer->setRedir( '?page=writer&action=concerts_list&'.$auto_redir );
		$writer->deleteWriting( 'concert_id', (int) $_GET['concert_id'] ) ;

	}

//  ------------------------------------------------------------------------------------------------------------------------------------------



//  ******************************************************************************************************************************************
//  5) SORTING & DISPLAYING
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	5.1) Build Sorting Array
//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	
	if ($_GET['action'] == 'writing_list') {
		
		$sorting_array =
		array( 'Template Name &uarr;'  => array('template_name','asc'),
			   'Template Name &darr;'  => array('template_name','desc')
		);
		
		foreach ( $sorting_array as $sorting_k => $sorting_v ) {

			$active = ( ( ( $_GET['writer_sort_key'] == $sorting_v[0] ) && ( $_GET['writer_sort_direction'] == $sorting_v[1] ) ) ) ? ' selected="selected"' : '';
		   	$sort_menu .= '<option value="'.$_SERVER["REQUEST_URI"].'&amp;writer_sort_key='.$sorting_v[0].'&amp;writer_sort_direction='.$sorting_v[1].'" 		
		   	'.$active.'>'.$sorting_k.'</option>';

		}
	
	}
	
	else {
		
		$sorting_array =
		array( 'Date &uarr;'  			=> array('date','asc'),
			
				
			   'Date &darr;'  			=> array('date','desc'),
			
			
		);
		
		foreach ( $sorting_array as $sorting_k => $sorting_v ) {

			$active = ( ( ( $_GET['concert_sort_key'] == $sorting_v[0] ) && ( $_GET['concert_sort_direction'] == $sorting_v[1] ) ) ) ? ' selected="selected"' : '';
		   	$sort_menu .= '<option value="'.$_SERVER["REQUEST_URI"].'&amp;concert_sort_key='.$sorting_v[0].'&amp;concert_sort_direction='.$sorting_v[1].'" 		
		   	'.$active.'>'.$sorting_k.'</option>';

		}
		
	}

	
	
	
	
//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	5.2) Build Display Mode Array
//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	if ($_GET['action'] == 'writing_list') {
	
		$display_mode =
		array( 'Minimal' => array( 'minimal' ),
			   'Full' 	 => array( 'full' )
		);
    	
		foreach ( $display_mode as $display_mode_k => $display_mode_v ) {
    	
			$active = ( $_GET['writing_display_type'] == $display_mode_v[0] ) ? ' selected="selected"' : '';
			$display_menu .= '<option value="'.$_SERVER["REQUEST_URI"].'&amp;writing_display_type='.$display_mode_v[0].'" '.$active.'>'.$display_mode_k.'</option>';
    	
		}

	}

// -------------------------------------------------------------------------------------------------------------------------------------------

?>