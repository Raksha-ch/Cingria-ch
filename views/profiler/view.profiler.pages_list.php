<div class="list_div">
	<div id="info_bar">		
		LISTE DES PAGES &nbsp; &middot; &nbsp; Il y a <em><?php print $session->getSessionVar( 'total_records');?> enregistrements</em> dans la table <em>
		<?php print ucfirst($profiler->getTable());?></em>
	</div>

	<fieldset>	
	<?php	
	
	$slice = $_GET['slice_1'];

	foreach($rows as $row) {
		$page_title			= $row['page_title'];
		$page_id			= $row['page_id'];
		$profile_name		= $row['profile_name'];
		$profile_surname	= $row['profile_surname'];
		
			print <<<EDO
				<div class="profiles">  
				<div class="underlined_profile_line">
				  	<div class="records_left">
				  		<strong>$page_title</strong><span style="color:#999; font-size: 10px;"> [ $profile_name $profile_surname]</span>
				  	</div>
				  	<div class="records_right">
				  		<a href="?page=profiler&amp;action=delete_page&amp;page_id=$page_id&amp;slice_1=$slice
						" onclick="return(confirm('Delete profile?'));" class="delete_hover">delete</a> | 
				  		<a href="?page=profiler&amp;action=edit_page&amp;page_id=$page_id&amp;slice_1=$slice
						">edit</a>
				  	</div>
				  </div>
				</div>
EDO;
				}


	?>
	</fieldset>
</div>

<?php
if ($_GET['info_box']=='edited') {
	$profile_info_r = unserialize($_GET['serialized_info']);
	print <<<EDITEDINFO
	<div class="info_bar">EDIT INFO</div>
		<div class="info_box">
			<fieldset class="info">
			<br/>Page has been successfully edited.<br/><br/>
			</fieldset>
		</div>
EDITEDINFO;
}

if ($_GET['info_box']=='created') {
	print <<<CREATEDPROFILE
	<div class="info_bar">PAGE INFO</div>
		<div class="info_box">
			<fieldset class="info">
			<br/><strong>New page</strong> has been successfully created.<br/><br/>
			</fieldset>
		</div>
CREATEDPROFILE;
}


?>

	
<?php include 'views/paginater/view.paginater.php'; ?>
<?php include 'views/sorter/view.sorter.php'; ?>
