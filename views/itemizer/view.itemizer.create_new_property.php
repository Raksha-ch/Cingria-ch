<form id="create_new_item_form" action="" method="post">
<div class="form_div">
	<div id="info_bar">CREATE NEW PROPERTY</div>		
		<fieldset>	
			<ol>
				<li>
					<label><em>*</em> Property Name</label>
					<input type="input" class="input"  value="" name="property_name" />
				</li>
				<li>
					<label>Property Official Name</label>
					<input type="input" class="input" value="" name="property_official_name" />
				</li>
				<li>
					<label><em>*</em> Category </label>
					<select name="category_id" class="short_select">
						<option value="">Select...</option>
						<?php
						$rows  =  $crud->select( 'num' , 'category' , '*' , '', '' ,  'category_id ASC' , '', '' , '' );					
						foreach ($rows as $key) {
							print '<option value="'.$key[0].'">'.$key[2].'</option>';		
						}
						?>
					</select>
				</li>
				<li>
					<label><em>*</em> Subcategory </label>
					<select name="subcategory_id" class="short_select">
						<option value="">Select...</option>
						<?php
						$rowss  =  $crud->select( 'num' , 'subcategory' , '*' , '', '' ,  'subcategory_id ASC' , '', '' , '' );					
						foreach ($rowss as $key) {
							print '<option value="'.$key[0].'">'.$key[2].'</option>';		
						}
						?>
					</select>
				</li>
				<li>
					<label>Is this property LastMinute?</label>
					<?php
					buildYesNoRadioButton('property_last_minute', '' ,'no');
					?>
				</li>
				<li>
					<label>Has this property got a Virtual Tour?</label>
					<?php
					buildYesNoRadioButton('property_virtual_tour', '' ,'no');
					?>
				</li>
				<li>
					<label>Property Stars</label>
					<select name="property_star" class="short_select">
						<?php buildNumberSelector( 'property_star', 0, 5) ;?>
					</select>					
				</li>
				<li>
					 <label>Owner </label>
					 <select name="profile_id" class="short_select">
					 	<option value="0">Select...</option>
					 	<?php
					 	$where = ' profile_category_id = 2 ';							
					 	$rows  =  $crud->select( '' , 'profile' , '*' , '' , $where ,  'profile_surname ASC' , '', '' , '' );					
					 	foreach ($rows as $key) {
					 		print '<option value="'.$key['profile_id'].'">'.strtoupper($key['profile_surname']).' '.$key['profile_name'].'</option>';		
					 	}
					 	?>
					 </select>
				</li>
			</ol>
		</fieldset>
	</div>

	<div class="form_div">
		<fieldset>	
			<ol>
				<li>
					<label>Address</label>
					<input type="input" class="input" value="" name="property_address" />
				</li>
				<li>
					<label>Longitude</label>
					<input type="input" class="input" value="" name="property_long" />
				</li>
				<li>
					<label>Latitude</label>
					<input type="input" class="input" value="" name="property_lat" />
				</li>
				<li>
					<label>Pictures Directory</label>
					<select name="dir_name" id="dir_name" class="short_select">
						<option value="0">Select...</option>
						<?php
					 	print $uploader->getDirectoriesArray( "uploads");
					 	?>
					</select>
				</li>
			</ol>
		</fieldset>
	</div>
	<div class="form_div">
		<fieldset>	
			<ol>
				<li>
					<label>Rank</label>
					<select name="property_rank" class="short_select">
						<?php buildNumberSelector( 'property_rank', 1 , 200) ;?>
					</select>					
				</li>
				<li>
					<label>Available Property?</label>
					<?php
					buildYesNoRadioButton('property_display', '' ,'yes');
					?>
				</li>
				<li>
				<label>Available Calendar?</label>
					<?php
					buildYesNoRadioButton('property_calendar_display', '' ,'yes');
					?>
				</li>
			</ol>
		</fieldset>
	</div>
				
	<div class="form_div">
		<fieldset>	
			<ol>
				<li class="bottom">
					<label>&nbsp;</label>
					<input type="submit" name="submit" class="submit" value="Create New Property" />
				</li>
					<input type="hidden"  name="property_creation_date" value="<?php print date('Y-m-d');?>" />
					<input type="hidden"  name="create_new_property" value="1" />					
				</ol>
		</fieldset>
</div>
</form>
