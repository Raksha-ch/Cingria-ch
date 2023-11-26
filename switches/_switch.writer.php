<?php

include 'controllers/controller.writer.php';

if ( $_GET['action'] == '' ) { include 'views/writer/view.writer.writing_list.php' ;}

$active_writing_list  	= ( $_GET['action'] == 'writing_list'   )  ?  'class="active"'  :  '' ;
$active_create_writing  = ( $_GET['action'] == 'create_writing' )  ?  'class="active"'  :  '' ;
$active_news_list  		= ( $_GET['action'] == 'news_list'   )     ?  'class="active"'  :  '' ;
$active_create_news  	= ( $_GET['action'] == 'create_news' )     ?  'class="active"'  :  '' ;

?>


<div id="menu_navigator">
  <ol>
    <li <?php print $active_writing_list;?> >
      <a href="?page=writer&amp;action=writing_list">List Writings</a>
    </li>
    <li <?php print $active_create_writing;?> >
      <a href="?page=writer&amp;action=create_writing">Create Writing</a>
    </li>
    <li <?php print $active_news_list;?> >
      <a href="?page=writer&amp;action=news_list">Liste des concerts</a>
    </li>
    <li <?php print $active_create_news;?> >
      <a href="?page=writer&amp;action=create_news">Ajouter un concert</a>
    </li>
  </ol>
</div>

<?php			

  if ( $_GET['action'] == 'writing_list'   ) 		{ include 'views/writer/view.writer.writing_list.php'   ;}
  if ( $_GET['action'] == 'create_writing' )		{ include 'views/writer/view.writer.create_writing.php' ;}
  if ( $_GET['action'] == 'edit_writing'   )		{ include 'views/writer/view.writer.edit_writing.php'   ;}
  if ( $_GET['action'] == 'news_list'   	 )		{ include 'views/writer/view.writer.news_list.php'   	;}
  if ( $_GET['action'] == 'create_news'    )		{ include 'views/writer/view.writer.create_news.php'    ;}
  if ( $_GET['action'] == 'edit_news'   	 )		{ include 'views/writer/view.writer.edit_news.php'   	;}


?>


