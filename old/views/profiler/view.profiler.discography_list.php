<form id="create_discography_form" action="" method="post" enctype="multipart/form-data">
<div class="form_div">
	<div id="info_bar">DISCOGRAPHIE</div>
		<fieldset> 
			<ol>
				<li>
					<label>Titre de la discographie</label>
					<input type="input" class="input" name="discography_title" value="<?php print $_POST['discography_title'] ?>" />
				</li>
			
		 		</ol>
		 	</fieldset> 
		 	</div>
		


		<div class="form_div">
				<fieldset>
					<ol>
				<li class="bottom">
					<label>&nbsp;</label>
  					<input type="submit" name="submit" class="submit" value="Cr&eacute;er une discographie" />
				</li>

					<input type="hidden"  name="create_discography" value="1" />
  			</ol> 
  		</fieldset>
  	</form>
</div>
<?php
if ($_GET['info_box']=='edited') {
	$profile_info_r = unserialize($_GET['serialized_info']);
	print <<<EDITEDINFO
	<div class="info_bar">EDIT INFO</div>
		<div class="info_box">
			<fieldset class="info">
			<br/>Discography has been successfully edited.<br/><br/>
			</fieldset>
		</div>
EDITEDINFO;
}

if ($_GET['info_box']=='created') {
	print <<<CREATEDPROFILE
	<div class="info_bar">PAGE INFO</div>
		<div class="info_box">
			<fieldset class="info">
			<br/><strong>New discography</strong> has been successfully created.<br/><br/>
			</fieldset>
		</div>
CREATEDPROFILE;
}


?>
<div class="list_div">
	<div id="info_bar">		
		LISTE DES DISCOGRAPHIES &nbsp; &middot; &nbsp; Il y a <em><?php print $session->getSessionVar( 'total_records');?> enregistrements</em> dans la table <em>
		<?php print ucfirst($profiler->getTable());?></em>
	</div>

	<fieldset>	
	<?php	
	
	$slice = $_GET['slice_1'];

	foreach($rows as $row) {
		$page_title			= $row['discography_title'];
		$page_id			= $row['discography_id'];

		
			print <<<EDO
				<div class="profiles">  
				<div class="underlined_profile_line">
				  	<div class="records_left">
				  		<strong>$page_title</strong>
				  	</div>
				  	<div class="records_right">
				  		<a href="?page=profiler&amp;action=delete_discography&amp;discography_id=$page_id&amp;slice_1=$slice
						" onclick="return(confirm('Delete discography? All records linked to this discography will also be deleted.'));" class="delete_hover">delete</a> | 
				  		<a href="?page=profiler&amp;action=edit_discography&amp;discography_id=$page_id&amp;slice_1=$slice
						">rename</a>
				  	</div>
				  </div>
				</div>
EDO;
				}


	?>
	</fieldset>
</div>


