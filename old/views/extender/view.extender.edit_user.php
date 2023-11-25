<div class="form_div">
	<div id="info_bar">
		EDIT USER FORM
	</div>
		<form id="edit_user_form" action="" method="post" enctype="multipart/form-data">
			<fieldset>
				<ol>
	  				<li>
						<label>User Name</label>
						<input type="input" class="input" value="<?php print $rows['0']['admin_name'];?>" name="admin_name" />
					</li>
					<li>
						<label>User Surame</label>
						<input type="input" class="input" value="<?php print $rows['0']['admin_surname'];?>" name="admin_surname" />
					</li>
					<li>
						<label>User Email</label>
						<input type="input" class="input" value="<?php print $rows['0']['admin_email'];?>" name="admin_email" />
					</li>
					<li>
						<label>User Password</label>
						<input type="password" class="input" value="<?php print $rows['0']['admin_password'];?>" name="admin_password" />
					</li>
					<li>
						<label>User Group</label>
						<select name="admin_group" class="short_select">
							<option value="1" <?php if($rows['0']['admin_group'] == 1){print 'selected="selected"';}?> >Administrator - All rights</option>
							<option value="2" <?php if($rows['0']['admin_group'] == 2){print 'selected="selected"';}?> >User - No rights</option>
						</select>
					</li>
					<li class="bottom">
						<label>&nbsp;</label>
						<input type="hidden" name="edit_user" value="1" />
						<input type="hidden" name="admin_id" value="<?php print $rows['0']['admin_id'];?>" />
	  					<input type="submit" name="submit" class="submit" value="Edit User" />
					</li>
	  			</ol>
	  		</fieldset>
	  	</form>
	</div>



