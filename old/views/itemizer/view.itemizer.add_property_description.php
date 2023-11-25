


<div id="display_form">
 <form id="add_property_description" action="" method="post" enctype="multipart/form-data">
 <div class="form_div">
 	<div id="info_bar">ADD PROPERTY DESCRIPTION</div>
 				<fieldset> 
 					<ol>
 				<li>
 					<label><em>*</em> Property</label>
 					<select name="property_id" class="short_select">
 						<option value="0">Select...</option>
 						<?php
 						$rows  =  $crud->select( '' , 'property' , '*' , '', '' , 'property_name ASC' , '' ,'' , '' ); 				
 						foreach ($rows as $keys) {
 							print '<option value="'.$keys['property_id'].'"';
								if($keys['property_id'] == $_POST['property_id']) { print ' selected="selected"' ;}
							print '>'.$keys['property_name'].'</option>';
 						}
 						?>
 					</select>
 				</li>

				<li>
			 		<label>Language</label>
			 			<select name="language_id" class="short_select">
			 				<option value="">Select...</option>
			 					<?php
			 						$rowst  =  $crud->select( 'num' , 'language' , '*' , '', '' ,  'language_id ASC' , '' , '' , '' );

			 							foreach ($rowst as $key) {
			 								print '<option value="'.$key[0].'"';

			 									if ( isset( $_POST['language_id'] ) ) {

			 										if ( $key[0] == $_POST['language_id'] ) { print ' selected="selected" ' ;}
			 									}

			 									else {

			 										if ( $key[0] == $session->getSessionVar('language_id') ) { print ' selected="selected" ' ;}

			 									}

			 								print '>'.$key[1].'</option>';		
			 							}

			 							?>
			 						</select>
			 					</li>

 								<li>					

	 						<textarea class="long_textarea_input" name="property_description_content"><?php print $_POST['property_description_content'] ?></textarea>
	 						<div style="padding: 12px; float:left;">
	 							<div class="wmd-preview" style="background-color: #EFEFEF; float:left; padding: 2px;"></div>
	 						</div>
	 					</li>
 					</ol>
 				</fieldset> 
 			</div>		
 
 			<div class="form_div">
 				<fieldset> 
 
 							<ol>
 				<li class="bottom">
 					<label>&nbsp;</label>
   					<input type="submit" name="submit" class="submit" value="Add Property Description" />
 				</li>
   					<input type="hidden" name="add_property_description" value="1" />
   			</ol> 
   		</fieldset>
   	</form>
 </div>
</div>



<div class="toggle_info">
	<div id="display_errors">
		<?php
		print $property_existence_error;
		?>
	</div>
</div>



<div class="list_div">
	<div id="info_bar">
		PROPERTIES LIST &nbsp; &middot; &nbsp; There are <em><?php print $crud->countRecords('property');?> records</em> in table <em>
		Property</em>
	</div>

	<fieldset>	
		<ul>
	<?php	
	
	foreach($property_rows as $property_row) {

						print <<<EOD
						<li><strong>{$property_row[property_name]}</strong> </li>
EOD;
		
		$join = " JOIN language ON property_description.language_id = language.language_id";
		$property_descriptions =  $crud->select('','property_description','*', $join, 'property_id = '.$property_row['property_id'],'','','','');
		foreach($property_descriptions as $property_description) {
		
			$content = truncateString( $property_description['property_description_content'] , 62 );
			
			
		print <<<EOD
						<li style="background-color: #FAFAFA;">
						<div style="float:left;">
							<span class="tinygreyinfo" style="width: 30px; float:left">[{$property_description[language_short_name]}]</span>
							<span style="float:left;">{$content} </span>
						</div>

						<div style="float:right;">
							 <a href="?page=itemizer&amp;action=delete_property_description&amp;property_description_id={$property_description[property_description_id]}" onclick="return(confirm('Delete property description?'));"
							class="delete_hover">delete</a> | 
							<a href="?page=itemizer&amp;action=edit_property_description&property_description_id={$property_description[property_description_id]}">edit/show</a>

						</div></li>
EOD;
}
		
		
		
   }
?>	
</ul>
</fieldset>
</div>




<div id="display_errors">
	<?php
	print $title_error;
	print $category_error;
	?>
</div>
<script type="text/javascript" src="wmd/wmd.js"></script>
