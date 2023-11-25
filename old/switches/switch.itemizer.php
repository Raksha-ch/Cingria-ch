<?php
include 'controllers/controller.itemizer.php';

if ( !isset( $_GET['action'] ) )  { $_GET['action'] = 'properties_list' ;}

$active_properties_list  	 		 = ( $_GET['action'] == 'properties_list' )  		    ? 'class="active"' : '';
$active_create_new_property  		 = ( $_GET['action'] == 'create_new_property' )  		? 'class="active"' : '';
$active_facilities_set 				 = ( $_GET['action'] == 'facilities_set' )   			? 'class="active"' : '';
$active_manage_property_description  = ( $_GET['action'] == 'manage_property_description' ) ? 'class="active"' : '';

?>

<div id="menu_navigator">
	<ol>
		<li <?php print $active_properties_list;?> >
			<a href="?page=itemizer&amp;action=properties_list">List Properties</a>
		</li>
		<li <?php print $active_create_new_property;?> >
			<a href="?page=itemizer&amp;action=create_new_property">Create New Property</a>
		</li>
		<li <?php print $active_manage_property_description;?> >
			<a href="?page=itemizer&amp;action=manage_property_description">Manage Property Description</a>
		</li>
	</ol>
</div>

<?php														 	
	if($_GET['action'] == 'properties_list') 			 { include('views/itemizer/view.itemizer.properties_list.php'); }
	if($_GET['action'] == 'create_new_property')		 { include('views/itemizer/view.itemizer.create_new_property.php'); }
	if($_GET['action'] == 'edit_property') 				 { include('views/itemizer/view.itemizer.edit_property.php'); }
	if($_GET['action'] == 'facilities_set')	 			{ include('views/itemizer/view.itemizer.facilities_set.php'); }
	if($_GET['action'] == 'manage_property_description') { include('views/itemizer/view.itemizer.add_property_description.php'); }
	if($_GET['action'] == 'edit_property_description') { include('views/itemizer/view.itemizer.edit_property_description.php'); }
	
	
?>
		

