<div class="form_div">
	<div id="info_bar">
		DIRECTORY LIST &nbsp; &middot; &nbsp; There are <em><?php print $crud->countRecords('category');?> directories and subdirectories</em>
	</div>
	
			<form id="add_dir_form" action="" method="post" enctype="multipart/form-data">
				<fieldset>
					<ol>
		  				<li>
							<label>Add Directory</label>
							<input type="input" class="input" name="dir_name" />
						</li>
						<li>
							<label>Parent Directory</label>
							<select name="dir_parent_name" class="short_select">
								<option value="uploads">None - New Directory is root</option>
								<?php print $uploader->getDirectoriesArray( "uploads");  ?>
							</select>
						</li>
						<li class="bottom">
							<label>&nbsp;</label>
							<input type="hidden" name="add_dir" value="1" />
		  					<input type="submit" name="submit" class="submit" value="Add Directory" />
						</li>
		  			</ol>
		  		</fieldset>
		  	</form>
</div>
<div class="toggle_info">
	<?php
	if ($_GET['info_box']=='renamed_dir') {
		$resized_image_info_r = unserialize($_GET['serialized_info']);
		print <<<RENAMEDINFO
		<div class="info_bar">RENAMED DIRECTORY INFO</div>
			<div class="info_box">
				<fieldset class="info">
				<br/>Directory <strong>{$resized_image_info_r['new_dir_name']}</strong> has been successfully renamed.<br/><br/>			
				</fieldset>
			</div>
RENAMEDINFO;
	}
	?>
	<div id="display_errors">
		<?php
		print $dir_existence_error;
		?>
	</div>
</div>
<div class="list_div">
	<fieldset>
		<div id="recursive_menu">	
			<?php $uploader->getDirectoriesArray( "uploads", true , "return_list_items");  ?>
		</div>
	</fieldset>
</div>



