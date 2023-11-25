<?php
include 'controllers/controller.extender.php';

$active_category_list 	 = ( $_GET['action'] == 'category_list' ) 		? 'class="active"' : '';
$active_subcategory_list = ( $_GET['action'] == 'subcategory_list' ) 	? 'class="active"' : '';
$active_template_list 	 = ( $_GET['action'] == 'template_list' ) 		? 'class="active"' : '';
$active_user_list 		 = ( $_GET['action'] == 'user_list'	   ) 		? 'class="active"' : '';
$active_links_list 		 = ( $_GET['action'] == 'link_list'	   ) 		? 'class="active"' : '';

?>

<div id="menu_navigator">
	<ol>

		<li <?php print $active_category_list;?> >
			<a href="?page=extender&amp;action=category_list">Cat&eacute;gories</a>
		</li>
		<li <?php print $active_subcategory_list;?> >
			<a href="?page=extender&amp;action=subcategory_list">Lieux</a>
		</li>
		<!--
		<li <?php print $active_links_list;?> >
			<a href="?page=extender&amp;action=link_list">Liens</a>
		</li>
		-->
		<?php if ( $_SESSION['admin_group'] < 2 ) { ?>
			
		<li <?php print $active_template_list;?> >
			<a href="?page=extender&amp;action=template_list">Gabarits</a>
		</li>
		<li <?php print $active_user_list;?> >
			<a href="?page=extender&amp;action=user_list">Utilisateurs</a>
		</li>
		
		<?php } ?>
		
	</ol>
</div>

<?php														 	
	if($_GET['action'] == 'category_list') 			{ include	'views/extender/view.extender.category_list.php' ;}
	if($_GET['action'] == 'subcategory_list') 		{ include	'views/extender/view.extender.subcategory_list.php' ;}
	if($_GET['action'] == 'rename_category')		{ include	'views/extender/view.extender.rename_category.php' ;}
	if($_GET['action'] == 'rename_subcategory')		{ include	'views/extender/view.extender.rename_subcategory.php' ;}
	if($_GET['action'] == 'rename_template') 		{ include	'views/extender/view.extender.rename_template.php' ;}
	if($_GET['action'] == 'template_list') 			{ include	'views/extender/view.extender.template_list.php' ;}
	if($_GET['action'] == 'user_list') 				{ include	'views/extender/view.extender.user_list.php' ;}
	if($_GET['action'] == 'edit_user') 				{ include	'views/extender/view.extender.edit_user.php' ;}
	if($_GET['action'] == 'link_list') 				{ include	'views/extender/view.extender.link_list.php' ;}
	if($_GET['action'] == 'edit_link') 				{ include	'views/extender/view.extender.edit_link.php' ;}
	if($_GET['action'] == 'rename_link_category') 	{ include	'views/extender/view.extender.rename_link_category.php' ;}
?>
		

