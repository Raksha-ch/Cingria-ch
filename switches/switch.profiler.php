<?php

include 'controllers/controller.profiler.php';
if(!isset($_GET['action']))  { $_GET['action']='profile_list'; }


$active_list 		 					   	= ( $_GET['action'] == 'profile_list' ) 		 		 ? 'class="active"' : '';
$active_pages_list 		 					= ( $_GET['action'] == 'pages_list' ) 		 		 	 ? 'class="active"' : '';
$active_create_new_profile 				   	= ( $_GET['action'] == 'create_new_profile' ) 	 		 ? 'class="active"' : '';
$active_create_new_page 				   	= ( $_GET['action'] == 'create_new_page' ) 	 		 	 ? 'class="active"' : '';
$active_flush_profiles 					   	= ( $_GET['action'] == 'flush_profiles' ) 		 		 ? 'class="active"' : '';
$active_list_trashed_profile_pictures 	   	= ( $_GET['action'] == 'list_trashed_profile_pictures' ) ? 'class="active"' : '';
$active_manage_profile_description 	   		= ( $_GET['action'] == 'manage_profile_description' ) 	 ? 'class="active"' : '';
$active_discography_list					= ( $_GET['action'] == 'discography_list' ) 	 		 ? 'class="active"' : '';
$active_manage_discography					= ( $_GET['action'] == 'manage_discography' ) 	 	     ? 'class="active"' : '';
$create_new_discography_item 				= ( $_GET['action'] == 'create_new_discography_item' ) 	 ? 'class="active"' : '';


?>

<div id="menu_navigator">
  <ol>
    <li <?php print $active_list;?> >
      <a href="?page=profiler&amp;action=profile_list">Lister les artistes</a>
    </li>

    <li <?php print $active_create_new_profile;?> >
      <a href="?page=profiler&amp;action=create_new_profile">Cr&eacute;er un profil</a>
    </li>
    <!--
    <li <?php print $active_manage_profile_description; ?> >
      <a href="?page=profiler&amp;action=manage_profile_description">G&eacute;rer les biographies</a>
    </li>
    -->
    <li <?php print $active_pages_list; ?> >
      <a href="?page=profiler&amp;action=pages_list">Lister les pages</a>
    </li>
    <li <?php print $active_create_new_page; ?> >
      <a href="?page=profiler&amp;action=create_new_page">Cr&eacute;er une page</a>
    </li>

     <li <?php print $active_discography_list; ?> >
      <a href="?page=profiler&amp;action=discography_list">Lister les discographies</a>
     </li>
     <li <?php print $create_new_discography_item; ?> >
      <a href="?page=profiler&amp;action=create_new_discography_item">G&eacute;rer une discographie</a>
     </li>
    <!--
    <li <?php /*print $active_list_trashed_profile_pictures;*/?> >
      <a href="?page=profiler&amp;action=list_trashed_profile_pictures">List Trashed Profile Pictures</a>
    </li>
    -->
  </ol>
</div>


<?php


if ( $_GET['action']  == 'create_new_profile' )				{ include 'views/profiler/view.profiler.create.php' ;}
if ( $_GET['action']  == 'create_new_page' )				{ include 'views/profiler/view.profiler.create_new_page.php' ;}
if ( $_GET['action']  == 'edit_page' )						{ include 'views/profiler/view.profiler.edit_page.php' ;}
if ( $_GET['action']  == 'profile_list' ) 					{ include 'views/profiler/view.profiler.profile_list.php' ;}
if ( $_GET['action']  == 'pages_list' ) 					{ include 'views/profiler/view.profiler.pages_list.php' ;}
if ( $_GET['action']  == 'edit' )  							{ include 'views/profiler/view.profiler.edit.php' ;}
if ( $_GET['action']  == 'delete' ) 	 					{ $profiler->doDeleteProfile('profile_id',$_GET['profile_id'] ) ;}
if ( $_GET['action']  == 'add_profile_picture' ) 			{ include 'views/profiler/view.profiler.add_picture.php' ;}
if ( $_GET['action']  == 'manage_profile_description' ) 	{ include 'views/profiler/view.profiler.profile_add_description.php' ;}
if ( $_GET['action']  == 'edit_profile_description' ) 		{ include 'views/profiler/view.profiler.profile_edit_description.php' ;}
if ( $_GET['action']  == 'list_trashed_profile_pictures' ) 	{ include 'views/profiler/view.profiler.list_trashed.php' ;}
if ( $_GET['action']  == 'manage_discography' ) 			{ include 'views/profiler/view.profiler.manage_discography.php' ;}
if ( $_GET['action']  == 'edit_discography' ) 				{ include 'views/profiler/view.profiler.edit_discography.php' ;}
if ( $_GET['action']  == 'discography_list' ) 				{ include 'views/profiler/view.profiler.discography_list.php' ;}
if ( $_GET['action']  == 'create_new_discography_item' ) 	{ include 'views/profiler/view.profiler.create_new_discography_item.php' ;}
if ( $_GET['action']  == 'edit_discography_item' ) 			{ include 'views/profiler/view.profiler.edit_discography_item.php' ;}



?>		
