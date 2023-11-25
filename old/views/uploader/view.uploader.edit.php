<div class="form_div">
	<form id="" action="" method="post">
	<div id="info_bar">UPLOADER EDIT FORM</div>
		<fieldset>	
				<img src="<?php print $uploader->filterDisplayableFiles($uploader->getFileExtension()); ?>" alt="" />
					<ol>
						<li>
							<label>File Name</label>
							<strong><?php print $rows['0']['upload_file_name'].$rows['0']['upload_file_ext'] ;?></strong>
						</li>
						<li>
							<label>Rename file?</label>
							<input type="input" class="input" value="" name="rename" />
						</li>
					</ol>
		</fieldset>
</div>
<div id="display_errors">
	<?php
	print $file_existence_error;
	print $title_error;
	?>
</div>
<div class="form_div">
		<fieldset>	
						<ol>
							<!--
								<li>
									<label>Select Visibility</label>
									<select name="profile_id" class="short_select">
										<option value="0">MYVERBIER</option>
										<?php
										$where = 'profile_category_id = 2';
										$visibility  =  $crud->select( '' , 'profile' , 'profile_id, profile_name, profile_surname' , '', $where ,  'profile_surname ASC' , '' , '' , '' );

										foreach ($visibility as $v) {
											
											print '<option value="'.$v['profile_id'].'"';
											
												if ( $v['profile_id'] == $rows['0']['profile_id'] ) { print ' selected="selected" ' ;}
											
											print '>'.strtoupper($v['profile_surname']).' '.$v['profile_name'].'</option>';		
										
										}

										?>
									</select>
								</li>
							-->
							<li>
								<label>Select Language</label>
								<select name="language_id" class="short_select">
									<option value="">Select...</option>
									<?php
									$rowst  =  $crud->select( 'num' , 'language' , '*' , '', '' ,  'language_id ASC' , '' , '' , '' );

									foreach ($rowst as $key) {
										print '<option value="'.$key[0].'"';

											if ( isset( $rows['0']['language_id'] ) ) {

												if ( $key[0] == $rows['0']['language_id'] ) { print ' selected="selected" ' ;}
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
								<label><em>*</em> File Title</label>
								<input type="input" class="input" name="upload_file_title"  value="<?php print $rows['0']['upload_file_title'];?>"/>
							</li>
							<li>
								<label>File Description</label>
								<textarea class="textarea_input" name="upload_file_description"><?php print $rows['0']['upload_file_description'];?></textarea>
							</li>
							<li>
								<label>Rank</label>
								<select name="upload_file_rank" class="short_select">
									<?php
									for ($i=1; $i < 101; $i++) { 
										print '<option value="'.$i.'"';
											if( $i == $rows['0']['upload_file_rank'] ) { print ' selected="selected" ' ;} 
										print '>'.$i.'</option>';
									}
									?>
								</select>
							</li>
						
						<li>
							<label>Display?</label>
							<input type="radio" name="upload_file_display" 
							<?php if($rows['0']['upload_file_display']=='1'){print'checked="checked"';} ?> value="1" /> Yes
							<input type="radio" name="upload_file_display"
							<?php if($rows['0']['upload_file_display']=='0'){print'checked="checked"';} ?> value="0" /> No
						</li>
					</ol>
	 			</fieldset>
	 	</div>
	 	<div class="form_div">
	 			<fieldset>	
					<ol>	
						<li class="bottom">
							<label>&nbsp;</label>
							<input type="submit" name="submit" class="submit" value="Edit" />
						</li>
							<input type="hidden"  name="upload_file_modification_date"  value="<?php print date("Y-m-d H:i:s");?>" />
							<input type="hidden"  name="file_field" 					value="upload_file_id" />
							<input type="hidden"  name="upload_file_id" 			    value="<?php print $rows['0']['upload_file_id'];?>" />
							<input type="hidden"  name="upload_file_name"      			value="<?php print $rows['0']['upload_file_name'];?>" />
							<input type="hidden"  name="upload_old_file_name"      		value="<?php print $rows['0']['upload_file_name'];?>" />
							<input type="hidden"  name="upload_file_ext"  			    value="<?php print $rows['0']['upload_file_ext'];?>" />
							<input type="hidden"  name="dir_name"  	    			    value="<?php print $rows['0']['dir_name'];?>" />
							<input type="hidden"  name="slice"  	        		    value="<?php print $_GET['slice'];?>" />
							
					</ol>
		</fieldset>
	</form>
</div>
