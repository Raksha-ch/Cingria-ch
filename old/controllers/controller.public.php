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



  /* CHUNKS : programme.php => programme concerts  */

  $where 				= " news_status = 1 ";			
  $quick_programme 	=  $crud->select( '' , 'news' , 'news_id,news_short_title,news_public_date' ,  ''  , $where , 'news_rank ASC', '' , '' , '' );


  /* PAGES : index.php  => texte accueil */

  if ( isset( $_GET['p'] ) && (  $_GET['p'] == 'accueil' ) ) {

    $where 		= " template_id = 78 ";
    $txts 		= $crud->select(  '' , 'writing' , 'writing_content' ,  ''  , $where , 'writing_rank DESC', '' , '' , '' );

    $where 	= " template_id = 80 ";
    $citations = $crud->select(  '' , 'writing' , 'writing_content, writing_description' ,  ''  , $where , 'writing_rank DESC', '' , '' , '' );

    $where 	= " template_id = 82 ";
    $notice_bio = $crud->select(  '' , 'writing' , 'writing_content, writing_title' ,  ''  , $where , 'writing_rank DESC', '' , '' , '' );


  }



 if ( isset( $_GET['p'] ) && (  $_GET['p'] == 'association' ) ) {

      $where 		= " template_id = 77 ";
    $txts 		= $crud->select(  '' , 'writing' , 'writing_content' ,  ''  , $where , 'writing_rank DESC', '' , '' , '' );

    $where 		  	  =  " dir_name = 'uploads/documents' AND upload_file_display = 1 ";
    $documents  	  =  $crud->select( '' , 'upload_file' , '*' , '' , $where ,  '' , '' , '' , '' );		

  }


  if ( isset( $_GET['p'] ) && (  $_GET['p'] == 'oeuvres_completes' ) ) {

      $where 		= " template_id = 72 ";
    $txts 		= $crud->select(  '' , 'writing' , 'writing_content' ,  ''  , $where , 'writing_rank DESC', '' , '' , '' );


  }

  /* PAGES : agence.php  => texte agence */

  if ( isset( $_GET['p'] ) && (  $_GET['p'] == 'agence' ) ) {

    $where 				= " template_id = 63 ";
    $txt_agence 		= $crud->select(  '' , 'writing' , 'writing_content, writing_title' ,  ''  , $where , 'writing_rank DESC', '' , '1' , '0' );

  }


  /* PAGES : prodution.php  => texte production */

  if ( isset( $_GET['p'] ) && (  $_GET['p'] == 'production' ) ) {

    $where 				= " template_id = 65 ";
    $txt_production 	= $crud->select(  '' , 'writing' , 'writing_content, writing_title' ,  ''  , $where , 'writing_rank DESC', '' , '1' , '0' );
  }


  /* PAGES : diffusion.php  => texte diffusion */

  if ( isset( $_GET['p'] ) && (  $_GET['p'] == 'diffusion' ) ) {

    $where 				= " template_id = 67 ";
    $txt_diffusion 	= $crud->select(  '' , 'writing' , 'writing_content, writing_title' ,  ''  , $where , 'writing_rank DESC', '' , '1' , '0' );




  }

  /* PAGES : concerts.php  => entrées concerts  */

  if ( isset( $_GET['p'] ) && (  $_GET['p'] == 'concerts' ) ) {

    $join				= " LEFT JOIN profile ON profile.profile_id = calendar.profile_id ";
    $txt_concert		= $crud->select(  '' , 'calendar' , '*' ,  $join  , '' , 'date ASC', '' , '' , '' );

  }


  /* PAGES : index.php  => entrées concerts  */


  $join		= " LEFT JOIN upload_file ON upload_file.upload_file_id = news.upload_file_id ";
  $join	   .= " LEFT JOIN subcategory ON subcategory.subcategory_id = news.subcategory_id ";	
  $where 		= " news_status = 1 ";
  if ( isset( $_GET['id'] ) &&  ( $_GET['p'] == 'concerts') )	{ $where .= "AND news.news_id = " . $_GET['id']; }	
  $select		= " news.news_id,
          news.news_public_date,
          news.news_time,
          news.pool_list_2,	
            news.news_title,
          news.news_title_2,
          news.news_title_3,	
            news.news_subtitle,
            news.news_short_title,
          news.news_content,
          news.bio_dir_name,
            upload_file.upload_file_name,
            upload_file.upload_file_ext,
            upload_file.dir_name,
          subcategory.subcategory_name
            ";
  $concerts 	=  $crud->select( '' , 'news' , $select ,  $join  , $where , 'news.news_rank ASC', '' , '' , '' );



  $where 		= " news_status = 1 ";
  $billeterie =  $crud->select( '' , 'news' , $select ,  $join  , $where , 'news.news_rank ASC', '' , '' , '' );


  if ( $_GET['p'] == 'accueil' ) {




      $where 			= " concert_status = 1 AND date >= NOW() ";	
      $home_concerts 	=  $crud->select( '' , 'concerts' , '*' , '' , $where , 'date ASC' , '' , '4','0');

      $concerts = '';
      foreach ($home_concerts as $k => $v) {

        $dates 	 = explode("-", $v['date']);
        $year 	 = $dates['0'];
        $month 	 = $dates['1'];
        $day   	 = $dates['2'];

        $month   = ltrim($month, '0');
        $mois    = array("","janvier", "f&eacute;vrier","mars","avril","mai","juin","juillet","ao&ucirc;t","septembre", "octobre", "novembre", "d&eacute;cembre");
        $nomMois = $mois[$month];

        $place   	= $v['place'];
        $additional = $v['additional_info'];

        $where 		= " profile_id = " . $v['profile_id'];
        $artists	= $crud->select( '' , 'profile' , '*' , ''  , $where , '', '' , '1' , '0' );

        $artist	 	= $artists[0]['profile_name'].' '.$artists[0]['profile_surname'];

        $concerts .= $day.' '. $nomMois . ' '.$year.', <strong>'. $artist  .'</strong>, '.$place. '<br/>';
      }

  }


  if ( $_GET['p'] == 'concerts' ) {


  if($_GET['year'] == 'passes') {
    $where	  = " concerts.date < NOW() AND concerts.concert_status = 1 " ;
    $concerts = $crud->select( '' , 'concerts' , '*' ,  ''  , $where, 'date DESC', '' , '' , '' );

  } else {
    $where	  = " concerts.date >= NOW() AND concerts.concert_status = 1 ";
    $concerts = $crud->select( '' , 'concerts' , '*' ,  ''  , $where, 'date ASC', '' , '' , '' );

  }



  $dir =  $crud->select( '' , 'news' , 'dir_name' ,  ''  , 'news_id='.$_GET['id'], '', '' , '' , '' );

  $where = 'dir_name=\''.$dir[0]['dir_name'].'\'';
  $slide_show_pictures =  $crud->select( '' , 'upload_file' , '*' ,  ''  , $where, '', '' , '' , '' );


  $artist = unserialize($concerts[0]['pool_list_2']);

  foreach ($artist as $key) {

    $join		= " LEFT JOIN profile_description ON profile_description.profile_id = profile.profile_id ";	
    $where 		= " profile.profile_status = 1 AND profile.profile_id = " .$key;
    $artists[] 	=  $crud->select( '' , 'profile' , '*' ,  $join  , $where , '', '' , '' , '' );

  }

  $where 		= " dir_name = '" . $concerts[0]['dir_name'] ."'" ;
  //$where 		.= " AND upload_file_rank != 1" ;
  $where 		.= " AND upload_file_display = 1" ;
  $pictures 	=  $crud->select( '' , 'upload_file' , '*' ,  ''  , $where , 'upload_file_rank ASC', '' , '' , '' );	



  $where 			= " dir_name = 'uploads/slideshows/detail_header' AND upload_file_display = 1" ;
  $detail_header 	=  $crud->select( '' , 'upload_file' , 'dir_name,upload_file_name,upload_file_ext' ,  ''  , $where , ' RAND()', '' , '' , '' );

  }







if ( isset( $_GET['p'] ) && ( $_GET['p'] == 'artistes') ) {

  $join		= " LEFT JOIN profile_description ON profile_description.profile_id = profile.profile_id ";
  $join	   .= " LEFT JOIN upload_file ON upload_file.upload_file_id = profile.upload_file_id ";	
  $where		=  " profile_status = 1 ";
  $artists	=  $crud->select( '' , 'profile' , '*' ,  $join  , $where , 'profile_name ASC', '' , '' , '' );

}




  $where 				= ' profile_category_id = 2 AND profile_status = 1 ';	
  $diffusion_artists	=  $crud->select( '' , 'profile' , '*' ,  '' , $where , 'profile_name ASC', '' , '' , '' );



  $where 				= ' profile_category_id = 1 AND profile_status = 1 ';	
  $production_artists	=  $crud->select( '' , 'profile' , '*' ,  '' , $where , 'profile_name ASC', '' , '' , '' );





?>