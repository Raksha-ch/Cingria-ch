<div class="form_div">
	<div id="info_bar">
		CURRENCY LIST
	</div>
			<form id="update_currency_form" action="" method="post" enctype="multipart/form-data">
				<fieldset> 
					<ol>
		  				<li>
							<label>Euro</label>
							<input type="input" class="input" value="<?php print $rows['0']['EURO'];?>" name="EURO" />
						</li>
						<li>
							<label>US Dollars</label>
							<input type="input" class="input" value="<?php print $rows['0']['USD'];?>" name="USD" />
						</li>
						<li>
							<label>British Pounds</label>
							<input type="input" class="input" value="<?php print $rows['0']['GBP'];?>" name="GBP" />
						</li>
						<li class="bottom">
							<label>&nbsp;</label>
							<input type="hidden"  name="update_currency" value="1" />
		  					<input type="submit" name="submit" class="submit" value="Update Currencies" />
						</li>
		  			</ol> 
		  		</fieldset>
		  	</form>
</div>

<?php if ($_GET['updated_flag']==1) { ?>
<div class="info_bar">UPDATE INFO</div>
	<div class="info_box">
   		<fieldset class="info">
   			<strong>Currencies</strong> have been succesfully updated.
   		</fieldset>
   	</div>
<?php } ?>