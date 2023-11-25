<div class="form_div">
	<div id="info_bar">
		BRAND LIST &nbsp; &middot; &nbsp; There are <em><?php print $crud->countRecords('brand');?> brands</em> in table <em>
		<?php print ucfirst($crud->getTable());?></em>
	</div>
	
			<form id="add_brand_form" action="" method="post" enctype="multipart/form-data">
				<fieldset> 
					<ol>
		  				<li>
							<label>Add Brand</label>
							<input type="input" class="input" name="brand_name" />
						</li>
						<li class="bottom">
							<label>&nbsp;</label>
							<input type="hidden" name="add_brand" value="1" />
		  					<input type="submit" name="submit" class="submit" value="Add Brand" />
						</li>
		  			</ol> 
		  		</fieldset>
		  	</form>
</div>

<div class="list_div">
	<fieldset>
		<?php
		foreach($rows as $row) {
		print <<<EOD
		<li>
			<span style="float:left;"><strong>{$row[brand_name]}</strong></span>
			<span style="float:right;">
			<a href="?page=extender&amp;action=delete_brand&amp;brand_id={$row[brand_id]}" onclick="return(confirm('Delete brand?'));" class="delete_hover">
			delete
			</a> |
			<a href="?page=extender&amp;action=rename_brand&amp;brand_id={$row[brand_id]}">
			rename
			</a>
			</span>
		</li>
EOD;
}
?>	
	</fieldset>
</div>

