<div id="display_form">
	<form id="create_writing_form" action="" method="post" enctype="multipart/form-data">
	<div class="form_div">
		<div id="info_bar">EDIT WRITING</div>
			<fieldset>
				<ol>
					<li>
						<label>* Title</label>
						<input type="text" class="input" name="writing_title" value="<?php print $rows['0']['writing_title'] ?>" />
					</li>
					<li>
						<label>Description</label>
						<input type="text" class="input" name="writing_description" value="<?php print $rows['0']['writing_description'] ?>" />
					</li>
								</ol>
								</fieldset>
				</div>		
				<div class="form_div">
					<fieldset>
						<ol>
							<li>
			 					<label>* Template Element</label>
			 					<select name="template_id" class="short_select">
			 						<option value="0">Select...</option>
			 						<?php
			 						$where = " template_parent_id = 0";
			 						$rowx  =  $crud->select( '' , 'template' , '*' , '', $where , 'template_name ASC' , '' ,'' , '' ); 				
			 						foreach ($rowx as $keyz) {
			 							print '<option value="0">'.$keyz['template_name'].'</option>';
	
			 							$where = " template_parent_id = ".$keyz['template_id'];
			 							$rowy  =  $crud->select( '' , 'template' , '*' , '', $where ,  'template_name ASC' , '' , '' , '' );
			 							foreach ($rowy as $keyy) {	
			 								print '<option value="'.$keyy['template_id'].'"';
					if($keyy['template_id'] == $rows['0']['template_id']) { print 'selected="selected" ';}
			print '>&nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;'.$keyy['template_name'].'</option>';
	
			 								}	
			 						}
			 						?>
			 					</select>
			 				</li>
							<li>
						<label>Rank</label>
						<select name="writing_rank" class="short_select">
							<?php
							for ($i=1; $i < 101; $i++) {
								print '<option value="'.$i.'"';
									if ( $i == $rows['0']['writing_rank'] ) { print ' selected="selected" ' ;}
								print '>'.$i.'</option>';
							}
							?>
						</select>
					</li>
					</ol>
					</fieldset>
	</div>
	
				
					<div class="form_div">
						<div id="info_bar">WRITING CONTENT</div>
						<fieldset>
								<ol>
							<li>
								<label>Language</label>
								<select name="language_id" class="short_select">
									<option value="">Select...</option>
									<?php

									$rowst  =  $crud->select( 'num' , 'language' , '*' , '', '' ,  'language_id ASC' , '', '' , '' );
									foreach ($rowst as $key) {
										print '<option value="'.$key[0].'"';
											if($key[0] == $rows['0']['language_id']) { print ' selected="selected"';}
										print '>'.$key[1].'</option>';		
									}
									?>
								</select>
							</li>
							<li>
								<label>Written by</label>
								<select name="admin_id" class="short_select">
									<option value="">Select...</option>
									<?php
									$rowss  =  $crud->select( 'num' , 'admin' , '*' , '', '' ,  'admin_id ASC' , '', '' , '' );

									foreach ($rowss as $key) {
										print '<option value="'.$key[0].'"';
											if(($key[0]) == $rows['0']['admin_id']) { print 'selected="selected" ';}
										print '>'.$key[1].' '.$key[2].'</option>';		
									}
									?>
								</select>
							</li>
							<li>
			 					<label>Public Date<br/><span class="tinygreyinfo">e.g. 1st January 2000<br/>or 01/01/2000</span></label>
			 					<input type="text" class="input" name="writing_public_date" value="<?php print $rows['0']['writing_public_date'] ?>" />
			 				</li>
							</ol>
							
							
							
							</fieldset>
						</div>		
			<div class="form_div">
				<fieldset>
					<ol>
						<li>					
				
					<textarea class="long_textarea_input" name="writing_content"><?php print $rows['0']['writing_content'] ?></textarea>
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

					<li>
						<label>Attach File<br/><span class="tinygreyinfo">Files marked as
							<span style="font-style: italic;">(off)</span> must be switched on in Uploader if you want to display them</span></label>
						<select name="upload_file_id" class="short_select">
							<option value="0">Select...</option>
							<?php
								$where = 'upload_file_id = '.$rows['0']['upload_file_id'];
								$rowx =  $crud->select('','upload_file','*','','','','','','');
								foreach ($rowx as $rox) {
									
									$arr = explode('/',$rox['dir_name']);
									array_shift($arr);
									$dir_name = implode('/',$arr);
									
									if($rox['upload_file_display']=='0'){$status = ' &nbsp; ( off )';} else { $status= '';}
									
									
									print '<option value="'.$rox['upload_file_id'].'"';
										if($rows['0']['upload_file_id']==$rox['upload_file_id']) { print 'selected="selected"';}
									print '>'.$dir_name.'/<strong>'.$rox['upload_file_name'].$rox['upload_file_ext'].$status.'</strong></option>';
								}
							?>
						</select>
					</li>

					<li>
						<label>Attach Directory</label>
						<select name="dir_name" class="short_select">
							<?php
							if ($rows['0']['dir_name'] == '0') {
							?>
							<option value="0">Select...</option>
							<?php
							print $uploader->getDirectoriesArray( "uploads");
							} else {
							
							$dir_name = $rows['0']['dir_name'];
							$arr = explode('/',$rows['0']['dir_name']);
							array_shift($arr);
							$print_dir_name = implode('/',$arr);
							
							?>
							<option value="<?php print $dir_name; ?>" selected="selected"><?php print $print_dir_name; ?></option>
							<option value="<?php print $dir_name; ?>">----------------------------------------------------</option>
							<option value="0">Select...</option>
														
							<?php
							print $uploader->getDirectoriesArray( "uploads" );
							}
							?>
						</select>
					</li>
					<li>
						<label>Embed Media (url)<br/><span class="tinygreyinfo">e.g. Vimeo / Youtube</span></label>
						<textarea class="textarea_input" name="media_url"><?php print $rows['0']['media_url']; ?></textarea>
					</li>
					</ol>
					</fieldset>
				</div>		
	<div class="form_div">
		<fieldset>
		
					<ol>
						<li>
							<label>Display?</label>
							<input type="radio" name="writing_status" value="1"
							<?php if($rows['0']['writing_status'] == '1'){ print 'checked="checked"' ;} ?>
							/> Yes
							<input type="radio" name="writing_status" value="0"
							<?php if($rows['0']['writing_status'] == '0'){ print 'checked="checked"' ;} ?>
							/> No
						</li>
						<li>
							<label>Publication start date</label>
							<select name="writing_publication_start_date_y">
								<?php
								
								$start  = $rows['0']['writing_publication_start_date'];
								$start = explode("-", $start);
								$end  = $rows['0']['writing_publication_end_date'];
								$end = explode("-", $end);
								
								$y = date('Y');
								$y_2 = $y + 11;
								for ($y; $y < $y_2; $y++) {
									print '<option value="'.$y.'"';
										if($y == $start[0]) {print 'selected="selected"';}
									print '>'.$y.'</option>';
								}
								?>
							</select>
							<select name="writing_publication_start_date_m">
								<?php
								for ($m=1; $m < 13; $m++) {
									print '<option value="'.$m.'"';
										if($m == $start[1]) {print 'selected="selected"';}
									print '>'.$m.'</option>';
								}
								?>
							</select>
							<select name="writing_publication_start_date_d">
								<?php
								for ($d=1; $d < 32; $d++) {
									print '<option value="'.$d.'"';
										if($d == $start[2]) {print 'selected="selected"';}
									print '>'.$d.'</option>';
								}
								?>
							</select>
							
						</li>
						<li>
							<label>Publication end date</label>
							<select name="writing_publication_end_date_y">
								<?php
								$y = date('Y');
								$y_2 = $y + 11;
								for ($y; $y < $y_2; $y++) {
									print '<option value="'.$y.'"';
										if($y == $end[0]) {print 'selected="selected"';}
									print '>'.$y.'</option>';
								}
								?>
							</select>
							<select name="writing_publication_end_date_m">
								<?php
								for ($m=1; $m < 13; $m++) {
									print '<option value="'.$m.'"';
										if($m == $end[1]) {print 'selected="selected"';}
									print '>'.$m.'</option>';
								}
								?>
							</select>
							<select name="writing_publication_end_date_d">
								<?php
								for ($d=1; $d < 32; $d++) {
									print '<option value="'.$d.'"';
										if($d == $end[2]) {print 'selected="selected"';}
									print '>'.$d.'</option>';
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
					<li class="bottom">
						<label>&nbsp;</label>
						<input type="hidden" name="writing_modification_date" value="<?php print date('Y-m-d');?>" />
						<input type="hidden"  name="writing_id" value="<?php print $rows['0']['writing_id'] ;?>" />
	  					<input type="hidden" name="update_writing" value="1" />
	  					<input type="submit" name="submit" class="submit" value="Edit Writing" />
					</li>
	  			</ol>
	  		</fieldset>
	  	</form>
	</div>
</div>
<div id="display_errors">
	<?php
	print $title_error;
	print $template_error;
	?>
</div>
<script type="text/javascript" src="wmd/wmd.js"></script>
