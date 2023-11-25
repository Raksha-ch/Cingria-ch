<div class="form_div">
		<div id="info_bar">ADD PROFILE PICTURE</div>
	<form id="" action="" method="post" enctype="multipart/form-data">
		<fieldset>
			<ol>
  				<li class="top">
					<label>Select file</label>
					<input type="file" name="file"/>
				</li>
  				<li>
					<label>Rename file?</label>
					<input type="input" class="input" name="rename" />
				</li>
  				<li>
					<label>Replace existing file?</label>
					<input type="checkbox" name="replace" value="true" />
				</li>
  				<li class="bottom">
					<label>&nbsp;</label>
  					<input type="submit" name="submit" class="submit" value="Upload" />
				</li>
				<input type="hidden" name="check_extension" value="true" />
				<input type="hidden" name="save" value="true" />
				<input type="hidden" name="check_size" value="true" />
  				<input type="hidden" name="profile_id" value="<?php print $_GET['profile_id']?>" />
  			</ol>
  		</fieldset>
  	</form>
</div>