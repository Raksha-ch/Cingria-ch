<div class="list_div">
	<div id="info_bar">
		PROFILES LIST &nbsp; &middot; &nbsp; There are <em><?php print $crud->countRecords('profile_description');?> records</em> in table <em>
		Profile_description</em>
	</div>

	<fieldset>	
		<ul>
	<?php	
	
	foreach($profile_rows as $profile_row) {

						print <<<EOD
						<li><strong>{$profile_row[profile_surname]} {$profile_row[profile_name]}</strong> </li>
EOD;
		
		$join = " JOIN language ON profile_description.language_id = language.language_id";
		$profile_descriptions =  $crud->select('','profile_description','*', $join, 'profile_id = '.$profile_row['profile_id'],'','','','');
		foreach($profile_descriptions as $profile_description) {
		
			$content = truncateString( $profile_description['profile_description_content'] , 72 );
			
			
		print <<<EOD
						<li style="background-color: #FAFAFA;">
						<div style="float:left;">
							<span class="tinygreyinfo" style="width: 30px; float:left">[{$profile_description[language_short_name]}]</span>
							<span style="float:left;">{$content} </span>
						</div>

						<div style="float:right;">
							 <a href="?page=profiler&amp;action=delete_profile_description&amp;profile_description_id={$profile_description[profile_description_id]}" onclick="return(confirm('Delete profile description?'));"
							class="delete_hover">delete</a> |
							<a href="?page=profiler&amp;action=edit_profile_description&profile_description_id={$profile_description[profile_description_id]}">edit/show</a>

						</div></li>
EOD;
}
		
		
		
   }
?>	
</ul>
</fieldset>
</div>

<div id="display_form">
 <form id="add_profile_description" action="" method="post" enctype="multipart/form-data">
 <div class="form_div">
 	<div id="info_bar">ADD PROFILE DESCRIPTION</div>
 				<fieldset>
 					<ol>
 				<li>
 					<label>* Profile</label>
 					<select name="profile_id" class="short_select">
 						<option value="0">Select...</option>
 						<?php
 						$rowx  =  $crud->select( '' , 'profile' , '*' , '', '' , 'profile_surname ASC' , '' ,'' , '' ); 				
 						foreach ($rowx as $keyz) {
 							print '<option value="'.$keyz['profile_id'].'"';
								if($keyz['profile_id'] == $_POST['profile_id']) { print ' selected="selected"' ;}
							print '>'.$keyz['profile_surname'].' '.$keyz['profile_name'].'</option>';
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

	 						<textarea class="long_textarea_input" name="profile_description_content"><?php print $_POST['profile_description_content'] ?></textarea>
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
   					<input type="submit" name="submit" class="submit" value="Add Profile Description" />
 				</li>
   					<input type="hidden" name="add_profile_description" value="1" />
   			</ol>
   		</fieldset>
   	</form>
 </div>
</div>
<div id="display_errors">
	<?php
	print $title_error;
	print $category_error;
	?>
</div>
<script type="text/javascript" src="wmd/wmd.js"></script>
