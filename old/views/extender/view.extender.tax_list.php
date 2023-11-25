<div class="form_div">
	<div id="info_bar">
		TAXES LIST
	</div>
			<form id="update_tax_form" action="" method="post" enctype="multipart/form-data">
				<fieldset> 
					<ol>
		  				<li>
						<?php
						foreach ($rows as $row) {
						
	
							
						print <<< EOD
						<li>
							<label>$row[tax_name]</label>
							<input type="input" class="input" value="$row[tax_value]" name="$row[tax_id]" />
						</li>
EOD;
						}
						?>

						<li class="bottom">
					   		<label>&nbsp;</label>
					   		<input type="hidden"  name="update_tax" value="1" />
			  		   		<input type="submit" name="submit" class="submit" value="Update Tax" />
					   </li>
					</ol> 
		  		</fieldset>
		  	</form>
</div>

<?php if ($_GET['updated_flag']==1) { ?>
<div class="info_bar">UPDATE INFO</div>
	<div class="info_box">
   		<fieldset class="info">
   			<strong>Tax</strong> has been succesfully updated.
   		</fieldset>
   	</div>
<?php } ?>