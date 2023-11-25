<div class="form_div">
	<div id="info_bar">
		RENAME LINK CATEGORY FORM
	</div>
			<form id="rename_link_category_form" action="" method="post" enctype="multipart/form-data">
				<fieldset>
					<ol>
		  				<li>
							<label>Link Category Name</label>
							<input type="input" class="input" value="<?php print $rows['0']['link_category_name'];?>" name="link_category_name" />
						</li>
						<li class="bottom">
							<label>&nbsp;</label>
							<input type="hidden"  name="rename_link_category" value="1" />
							<input type="hidden"  name="link_category_id" value="<?php print $rows['0']['link_category_id'];?>" />
		  					<input type="submit" name="submit" class="submit" value="Rename Link Category" />
						</li>
		  			</ol>
		  		</fieldset>
		  	</form>
</div>


