<div class="form_div">
	<div id="info_bar">
		RENAME BRAND FORM
	</div>
			<form id="rename_category_form" action="" method="post" enctype="multipart/form-data">
				<fieldset>
					<ol>
		  				<li>
							<label>Brand Name</label>
							<input type="input" class="input" value="<?php print $rows['0']['brand_name'];?>" name="brand_name" />
						</li>
						<li class="bottom">
							<label>&nbsp;</label>
							<input type="hidden"  name="rename_brand" value="1" />
							<input type="hidden"  name="brand_id" value="<?php print $rows['0']['brand_id'];?>" />
		  					<input type="submit" name="submit" class="submit" value="Rename Brand" />
						</li>
		  			</ol>
		  		</fieldset>
		  	</form>
</div>


