<?php

include 'controllers/controller.writer.php';

if ( $_GET['action'] == '' ) { include 'views/writer/view.writer.writing_list.php' ;}

$active_writing_list  		= ( $_GET['action'] == 'writing_list'   )  ?  'class="active"'  :  '' ;
$active_create_writing  	= ( $_GET['action'] == 'create_writing' )  ?  'class="active"'  :  '' ;
$active_concerts_list  		= ( $_GET['action'] == 'concerts_list'   )     ?  'class="active"'  :  '' ;
$active_create_concert  	= ( $_GET['action'] == 'create_concert' )     ?  'class="active"'  :  '' ;

?>


<div id="menu_navigator">
  <ol>
    <li <?php print $active_writing_list;?> >
      <a href="?page=writer&amp;action=writing_list">List Writings</a>
    </li>
    <li <?php print $active_create_writing;?> >
      <a href="?page=writer&amp;action=create_writing">Create Writing</a>
    </li>
    <li <?php print $active_concerts_list;?> >
      <a href="?page=writer&amp;action=concerts_list">Liste des concerts</a>
    </li>
    <li <?php print $active_create_concert;?> >
      <a href="?page=writer&amp;action=create_concert">Ajouter un concert</a>
    </li>
  </ol>
</div>

<?php			

  if ( $_GET['action'] == 'writing_list'   ) 		{ include 'views/writer/view.writer.writing_list.php'   ;}
  if ( $_GET['action'] == 'create_writing' )		{ include 'views/writer/view.writer.create_writing.php' ;}
  if ( $_GET['action'] == 'edit_writing'   )		{ include 'views/writer/view.writer.edit_writing.php'   ;}
  if ( $_GET['action'] == 'concerts_list'   	 )		{ include 'views/writer/view.writer.concerts_list.php'   	;}
  if ( $_GET['action'] == 'create_concert'    )		{ include 'views/writer/view.writer.create_concert.php'    ;}
  if ( $_GET['action'] == 'edit_concert'   	 )		{ include 'views/writer/view.writer.edit_concert.php'   	;}


?>


