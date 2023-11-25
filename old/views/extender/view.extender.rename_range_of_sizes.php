<div class="form_div">
	<div id="info_bar">
		RENAME RANGE OF SIZES FORM
	</div>
			<form id="rename_category_form" action="" method="post" enctype="multipart/form-data">
				<fieldset>
					<ol>
		  				<li>
							<label>Range of sizes</label>
							<input type="input" class="input" value="<?php print $rows['0']['size_array_name'];?>" name="size_array_name" />
						</li>
						<li class="bottom">
							<label>&nbsp;</label>
							<input type="hidden"  name="rename_range_of_sizes" value="1" />
							<input type="hidden"  name="size_array_id" value="<?php print $rows['0']['size_array_id'];?>" />
		  					<input type="submit" name="submit" class="submit" value="Rename Range" />
						</li>
		  			</ol>
		  		</fieldset>
		  	</form>
</div>


