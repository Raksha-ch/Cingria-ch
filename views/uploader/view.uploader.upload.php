
	<div class="form_div">
		<form id="" action="" method="post" enctype="multipart/form-data">
			
		<div id="info_bar">UPLOAD FORM</div>
			<fieldset>
				<ol>
					<li>
						<label><em>*</em> Select Directory</label>
						<select name="dir_name" id="dir_name" class="short_select">
							<option value="">Select...</option>
							<?php
						 	print $uploader->getDirectoriesArray( "uploads");
						 	?>
						</select>
					</li>
	  				<li>
						<label><em>*</em> Select File</label>
						<input type="file" name="file"/>
					</li>
				</ol>
	 		</fieldset>
		</div>
		
		
		<div class="toggle_info">
			<div class="debug_bar">ALLOWED FILE TYPES</div>
				<div class="info_box">
				<fieldset class="info">
					<div style="width: 300px; text-align: left; margin-top: 6px; float:left;">
					<?php
					foreach($uploader->extension_r as $extension)
					{
						print '<div style="float:left; width: 60px;"><img src="'.$uploader->getFileExtensionIcon($extension).'" alt="'.$extension.'" />&nbsp;'.$extension.'</div>';
					}
					?>

					</div>
					<div style="width: 300px; text-align: left; margin-top: 12px; float:left; ">
						<strong>Max. filesize : </strong><?php print convertFromBytes(Uploader::MAX_FILE_SIZE,'MB'); ?> MB
						<span style="font-size:9px;">(<?php print number_format(Uploader::MAX_FILE_SIZE); ?> KB)</span>
					</div>
				</fieldset>
			</div>
			
			<div id="display_errors">
				<?php
				print $name_error;
				print $size_error;
				print $extension_error;
				print $file_existence_error;
				print $title_error;
				print $dir_error;
				?>
			</div>
		</div>
		

	 		<div class="form_div">
					<fieldset>
						<ol>
							<!--
							<li>
								<label>Select Visibility</label>
								<select name="profile_id" class="short_select">
									<option value="0">Select</option>
									<?php
									$where = 'profile_category_id = 2';
									$visibility  =  $crud->select( '' , 'profile' , 'profile_id, profile_name, profile_surname' , '', $where ,  'profile_surname ASC' , '' , '' , '' );

									foreach ($visibility as $v) {
										print '<option value="'.$v['profile_id'].'">'.strtoupper($v['profile_surname']).' '.$v['profile_name'].'</option>';		
									}

									?>
								</select>
							</li>
							-->
							<li>
								<label>Select Language</label>
								<select name="language_id" class="short_select">
									<option value="0">Select...</option>
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
								<label><em>*</em> File Title</label>
								<input type="input" class="input" name="upload_file_title" value="<?php print $_POST['upload_file_title'] ;?>" />
							</li>
							<li>
								<label>File Description</label>
								<textarea class="textarea_input" name="upload_file_description"><?php print $_POST['upload_file_description'] ;?></textarea>
							</li>
							<li>
								<label>Rank</label>
								<select name="upload_file_rank" class="short_select">
									<?php
									for ($i=1; $i < 101; $i++) {
										print '<option value="'.$i.'"';
											if( $i == $_POST['upload_file_rank'] ) { print ' selected="selected" ' ;}
										print '>'.$i.'</option>';
									}
									?>
								</select>
							</li>
							<li>
								<label>Display?</label>
								<?php
								if ( ( $_POST['upload_file_display'] == '1' ) || ( !isset( $_POST['upload_file_display'] ) ) ) {
									$yes_check = ' checked="checked" ';
								}
								else {
									$no_check = ' checked="checked" ';
								}
								?>
								<input type="radio" name="upload_file_display" <?php print $yes_check ; ?> value="1"  checked="checked"/> Yes
								<input type="radio" name="upload_file_display" <?php print $no_check ; ?> value="0" /> No
							</li>
						</ol>
			 		</fieldset>

				</div>	
				
				<div class="form_div">
						<fieldset>
							<ol>	
					
	  				<li>
						<label>Rename file?</label>
						<input type="input" class="input" name="rename" value="<?php print $_POST['rename'] ;?>" />
					</li>
					<li>
						<label>Check file size? <span style="font-size: 9px">
						(max. <?php print convertFromBytes(Uploader::MAX_FILE_SIZE,'MB');?>MB)</span>
						</label>
						<input type="checkbox" name="check_size" value="true" checked="checked" />
					</li>
	  				<li>
						<label>Replace existing file?</label>
						<input type="checkbox" name="replace" value="true" />
					</li>
	  				<li>
						<label>Ignore extension check?</label>
						<input type="checkbox" name="check_extension" value="true" />
					</li>
	  				<li>
						<label>Don't save to database?</label>
	  					<input type="checkbox" name="dont_save" value="true" />
					</li>
	  			</ol>
	   		</fieldset>

	  	</div>	
	  	
	  	<div class="form_div">
	  			<fieldset>
	  				<ol>
	  				<li class="bottom">
						<label>&nbsp;</label>
	  					<input type="submit" name="submit" class="submit" value="Upload" />
					</li>
	  			</ol>
	  		</fieldset>
	  	</form>
	</div>