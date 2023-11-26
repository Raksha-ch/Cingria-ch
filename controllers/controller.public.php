<?php

   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   //																																		
   //  	SCRIPT SUMMARY (2010.13.03)  (n.b.: this file is included by switch.writer.php)                                                                                                       	
   //																																		
   // 	**************************************************************************************************************************************
   //																																		
   //	0) PERMISSION CHECK
   //	1) WRITING
   //			1.1) Select Writings
   //
   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




//  ******************************************************************************************************************************************
//  0) PERMISSION CHECK
//  ******************************************************************************************************************************************	

  // if ( $_SESSION['login_status'] != 1 ) { header( "location:?page=home" ) ;}


//  ******************************************************************************************************************************************
//  1) WRITING
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	1.1) Select Writings
//  ------------------------------------------------------------------------------------------------------------------------------------------




  /* PAGES : index.php  => texte accueil */

  if ( isset( $_GET['p'] ) && (  $_GET['p'] == 'accueil' ) ) {

    $where 		= " template_id = 78 ";
    $txts 		= $crud->select(  '' , 'writing' , 'writing_content' ,  ''  , $where , 'writing_rank DESC', '' , '' , '' );

    $where 		= " template_id = 80 ";
    $citations 	= $crud->select(  '' , 'writing' , 'writing_content, writing_description' ,  ''  , $where , 'writing_rank DESC', '' , '' , '' );

    $where 		= " template_id = 82 ";
    $notice_bio = $crud->select(  '' , 'writing' , 'writing_content, writing_title' ,  ''  , $where , 'writing_rank DESC', '' , '' , '' );

    $where 		  = " template_id = 83 ";
    $notice_jacob = $crud->select(  '' , 'writing' , 'writing_content, writing_title' ,  ''  , $where , 'writing_rank DESC', '' , '' , '' );


  }



 if ( isset( $_GET['p'] ) && (  $_GET['p'] == 'association' ) ) {

      $where 		= " template_id = 77 ";
    $txts 		= $crud->select(  '' , 'writing' , 'writing_content' ,  ''  , $where , 'writing_rank DESC', '' , '' , '' );

    $where 		  	  =  " dir_name = 'uploads/documents' AND upload_file_display = 1 ";
    $documents  	  =  $crud->select( '' , 'upload_file' , '*' , '' , $where ,  '' , '' , '' , '' );		

  }


  if ( isset( $_GET['p'] ) && (  $_GET['p'] == 'premiere-edition-des-oeuvres-completes' ) ) {

      $where 		= " template_id = 72 ";
    $txts 		= $crud->select(  '' , 'writing' , 'writing_content' ,  ''  , $where , 'writing_rank DESC', '' , '' , '' );


  }

  /* PAGES : les_livres.php  => texte les livres */

  if ( isset( $_GET['p'] ) && (  $_GET['p'] == 'les-livres' ) ) {

    $join	= " LEFT JOIN upload_file ON upload_file.upload_file_id = books.upload_file_id ";
    $where	= " book_description != '' ";
    $books 	=  $crud->select( '' , 'books' , '*' ,  $join  , $where , 'books.book_title ASC', '' , '' , '' );

  }


  if ( isset( $_GET['p'] ) && (  $_GET['p'] == 'chronologie' ) ) {

    //$chronology 	=  $crud->select( '' , 'chronology' , '*' ,  ''  , '' , 'chronology_year ASC', '' , '' , '' );

  }





?>