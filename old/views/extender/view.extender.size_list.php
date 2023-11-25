<div class="form_div">
	<div id="info_bar">
		SIZES LIST &nbsp; &middot; &nbsp; There are <em><?php print $crud->countRecords('size_array');?> records</em> in table <em>
		<?php print ucfirst($crud->getTable());?></em>
	</div>
	
		<form id="add_range_of_sizes_form" action="" method="post" enctype="multipart/form-data">
			<fieldset>
				<ol>
	  				<li>
						<label>New range of sizes</label>
						<input type="input" class="input" name="size_array_name" />
					</li>
					<li class="bottom">
						<label>&nbsp;</label>
						<input type="hidden" name="add_range_of_sizes" value="1" />
	  					<input type="submit" name="submit" class="submit" value="Add range of sizes" />
					</li>
	  			</ol>
	  		</fieldset>
	  	</form>
</div>

<div class="form_div">
	
		<form id="add_to_range_form" action="" method="post" enctype="multipart/form-data">
			<fieldset>
				<ol>
					<li>
						<label>Range of sizes</label>
						<select name="size_array_id" class="short_select">
						<option value="">Select...</option>
						<?php
						foreach ($ranges as $range) {
							print '<option value="'.$range[0].'">'.$range[1].'</option>';		
						}
						?>
						</select>
					</li>
	  				<li>
						<label>System <span class="tinygreyinfo">(e.g. US)</span></label>
						<input type="input" class="input" name="size_origin" />
					</li>
					<li>
						<label>Value <span class="tinygreyinfo">(e.g. 10.5)</span></label>
						<input type="input" class="input" name="size_value" />
					</li>
					<li>
						<label>Rank <span class="tinygreyinfo">(e.g. 3)</span></label>
						<input type="input" class="input" name="size_rank" />
					</li>
					<li class="bottom">
						<label>&nbsp;</label>
						<input type="hidden" name="add_to_range" value="1" />
	  					<input type="submit" name="submit" class="submit" value="Add to Range" />
					</li>
	  			</ol>
	  		</fieldset>
	  	</form>
</div>


<div class="list_div">
	<fieldset>
		<ol>
		<?php
		foreach($rangess as $range) {
			print <<<EOD
			<li>
				<span style="float:left;"><strong>{$range[size_array_name]}</strong></span>
				<span style="float:right;">
				<a href="?page=extender&amp;action=delete_range_of_sizes&amp;range_to_be_deleted={$range[size_array_id]}"
				onclick="return(confirm('Delete range?'));" class="delete_hover">
				delete
				</a> |
				<a href="?page=extender&amp;action=rename_range_of_sizes&amp;range_to_be_renamed={$range[size_array_id]}">
				rename
				</a>
				</span><br/>
EOD;
					$where = " size_array_id = ".$range['size_array_id'];
					$rangdes  =  $crud->select( '' , 'range_of_sizes' , '*' , '', $where ,  'size_rank ASC' , '', '' , '' );					
					foreach ($rangdes as $rangde) {
					print <<<EOD
					[<a href="?page=extender&amp;action=delete_size&amp;size_to_be_deleted={$rangde[range_of_sizes_id]}"
					onclick="return(confirm('Delete size?'));" class="delete_hover">{$rangde[size_origin]} {$rangde[size_value]}</a>]
EOD;
		}
			print <<<EOD
			</li>		
EOD;
}
?>	
</ol>
	</fieldset>
</div>



