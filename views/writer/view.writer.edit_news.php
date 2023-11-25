<form id="edit_news_form" action="" method="post" name="combo_box" enctype="multipart/form-data">
<div class="form_div">
	<div id="info_bar">COMMUN</div>
		<fieldset>
			<ol>
				<li>
					<label>Intitul&eacute;</label>
					<input type="text" class="input" name="news_title" value="<?php print $rows['0']['news_title'] ?>" />
				</li>
				
				<li>
 					<label>Intitul&eacute; 2&egrave;me ligne</label>
 					<input type="text" class="input" name="news_title_2" value="<?php print $rows['0']['news_title_2'] ?>" />
 				</li>
				<li>
 					<label>Intitul&eacute; 3&egrave;me ligne</label>
 					<input type="text" class="input" name="news_title_3" value="<?php print $rows['0']['news_title_3'] ?>" />
 				</li>
				
					<li>
						<label>Liste des artistes<br/><span class="tinygreyinfo">Double-cliquer sur un nom pour l'<strong>ajouter</strong> &agrave; la liste</span></label>
						
							<?php
								
								if($rows['0']['pool_list_2']!='') {
									$pool_list = unserialize($rows['0']['pool_list_2']);
									$where = " profile_id NOT IN (";
									foreach ($pool_list as $key) {	
									$where .= $key.",";
									}
									$where = substr($where,0,-1).')';
								}
								else {
									$where = '';
								}
							
								
																
							?>
							<select multiple name="pool_list_1" id="pool_list_1" class="multiple_short_select_a" 		
							onDblClick="move(document.combo_box.pool_list_1,document.combo_box['pool_list_2[]'])">
							<?php
						
							$artists =  $crud->select('','profile','profile_id,profile_name,profile_surname,profile_company','',$where, 'profile_name ASC', '' ,'','');
							
							foreach ( $artists as $row ) {
				
							print '<option value="'.$row['profile_id'].'">'.$row['profile_name'].'
							'.$row['profile_surname'].'&nbsp;&nbsp;['.$row['profile_company'].']'.'</option>';
							}
							?>	
							</select>
							<!-- <input type="button" onClick="move(this.form.pool_list_2[],this.form.pool_list_1)" value="<<" id=button1 name=button1>
							<input type="button" onClick="move(this.form.pool_list_1,this.form.pool_list_2[])" value=">>" id=button2 name=button2> -->
					</li>
					<li>
						<label>Artistes du concert<br/><span class="tinygreyinfo">Double-cliquer sur un nom pour le <strong>retirer</strong> de la liste</span></label>
							<select multiple name="pool_list_2[]" class="multiple_short_select_b"
							onDblClick="move(document.combo_box['pool_list_2[]'],document.combo_box.pool_list_1)">
							
							<?php
						
							foreach ( $pool_list as $row ) {
								
							$where = 'profile_id = ' . $row;
							$artists =  $crud->select('','profile','profile_id,profile_name,profile_surname,profile_company','',$where, 'profile_name ASC', '' ,'','');
								
							print '<option value="'.$artists[0]['profile_id'].'">'.$artists[0]['profile_name'].'
							'.$artists[0]['profile_surname'].'&nbsp;&nbsp;['.$artists[0]['profile_company'].']'.'</option>';
							}
							?>
							
							</select>
					</li>
					<li>
			 			<label>Date publique<br/><span class="tinygreyinfo">ex. 1er Janvier 2000<br/>ou 01.01.2000</span></label>
			 			<input type="text" class="input" name="news_public_date" value="<?php print $rows['0']['news_public_date'] ?>" />
			 		</li>
					
					<li>
						<label>Dossier image</label>
							<select name="dir_name" class="short_select">
								<?php
								if ($rows['0']['dir_name'] == '0') {
								?>
								<option value="0">Choisir...</option>
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
								<option value="0">Choisir...</option>

								<?php
								print $uploader->getDirectoriesArray( "uploads" );
								}
								?>
							</select>
					</li>
					<li>
						<label>Dossier son</label>
						<select name="sound_dir_name" class="short_select">
							<?php
							if ($rows['0']['sound_dir_name'] == '0') {
							?>
							<option value="0">Choisir...</option>
							<?php
							print $uploader->getDirectoriesArray( "uploads");
							} else {
							
							$sound_dir_name = $rows['0']['sound_dir_name'];
							$arr = explode('/',$rows['0']['sound_dir_name']);
							array_shift($arr);
							$print_dir_name = implode('/',$arr);
							
							?>
							<option value="<?php print $sound_dir_name; ?>" selected="selected"><?php print $sound_dir_name; ?></option>
							<option value="<?php print $sound_dir_name; ?>">----------------------------------------------------</option>
							<option value="0">Choisir...</option>
														
							<?php
							print $uploader->getDirectoriesArray( "uploads" );
							}
							?>
						</select>
						
					</li>
					<li>
						<label>Dossier biographie</label>
						<select name="bio_dir_name" class="short_select">
								<?php
								if ($rows['0']['bio_dir_name'] == '0') {
								?>
								<option value="0">Choisir...</option>
								<?php
								print $uploader->getDirectoriesArray( "uploads");
								} else {

								$bio_dir_name = $rows['0']['bio_dir_name'];
								$arr = explode('/',$rows['0']['bio_dir_name']);
								array_shift($arr);
								$print_dir_name = implode('/',$arr);

								?>
								<option value="<?php print $bio_dir_name; ?>" selected="selected"><?php print $bio_dir_name; ?></option>
								<option value="<?php print $bio_dir_name; ?>">----------------------------------------------------</option>
								<option value="0">Choisir...</option>

								<?php
								print $uploader->getDirectoriesArray( "uploads" );
								}
								?>
						
						</select>
						
					</li>
				</ol>
			</fieldset>
			</div>

		
			<div class="form_div">
				<div id="info_bar">ACCUEIL</div>
			 	
				<fieldset>
					<ol>
							<li>
								<label>Position Accueil</label>
								<select name="news_rank" class="short_select">
									<?php
									for ($i=1; $i < 101; $i++) {
										print '<option value="'.$i.'"';
											if ( $i == $rows['0']['news_rank'] ) { print ' selected="selected" ' ;}
										print '>'.$i.'</option>';
									}
									?>
								</select>
							</li>
							<li>
			 					<label>Accroche</label>
			 					<input type="text" class="input" name="news_subtitle" value="<?php print $rows['0']['news_subtitle'] ?>" />
			 				</li>
							<li>
									<label>Imagette Accueil<br/><span class="tinygreyinfo">Les images avec mention <span style="font-style: italic;">(off)</span> doivent &ecirc;tre activ&eacute;es dans la section Media>Upload</span></label>
								<select name="upload_file_id" class="short_select">
									<option value="0">Choisir...</option>
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
			
				</ol>
				</fieldset>
</div>
<div class="form_div">	
 	<div id="info_bar">PROGRAMME RAPIDE</div>
 		<fieldset>
 			<ol>
 				<li>
 					<label>Titre Programme rapide</label>
 					<input type="text" class="input" name="news_short_title" value="<?php print $rows['0']['news_short_title'] ?>" />
 				</li>

 				</ol>
 				</fieldset>
 </div>
			
 <div class="form_div">	
 	<div id="info_bar">META INFORMATION</div>
 		<fieldset>
 			<ol>

				<li>
 					<label>Cat&eacute;gorie de concert</label>
 					<select name="news_category_id" class="short_select">
 						<option value="0">Choisir...</option>
 						<?php
 						$rowx  =  $crud->select( '' , 'news_category' , '*' , '', '' , 'news_category_name ASC' , '' ,'' , '' ); 				
 						foreach ($rowx as $keyz) {
 							print '<option value="'.$keyz['news_category_id'].'"';
								if($keyz['news_category_id'] == $rows['0']['news_category_id']) { print ' selected="selected"' ;}
							print '>'.$keyz['news_category_name'].'</option>';
 						}
 						?>
 					</select>
 				</li>
				<li>
 					<label>Lieu de concert</label>
 					<select name="subcategory_id" class="short_select">
 						<option value="0">Choisir...</option>
 						<?php
						$where = " subcategory_parent_id != '0' ";
 						$rowx  =  $crud->select( '' , 'subcategory' , '*' , '', $where , 'subcategory_name ASC' , '' ,'' , '' ); 				
 						foreach ($rowx as $keyz) {
 							print '<option value="'.$keyz['subcategory_id'].'"';
								if($keyz['subcategory_id'] == $rows['0']['subcategory_id']) { print ' selected="selected"' ;}
							print '>'.$keyz['subcategory_name'].'</option>';
 						}
 						?>
 					</select>
 				</li>
					<li>
	 					<label>Heure du concert</label>
	 					<input type="text" class="input" name="news_time" value="<?php print $rows['0']['news_time'] ?>" />
	 				</li>
			</ol>
		 </fieldset>
	</div>

		 				<div class="form_div">
		 					<div id="info_bar">DESCRIPTION</div>
		 					<fieldset>
						<ol>
							<li>
								<label>Language</label>
								<select name="language_id" class="short_select">
									<option value="">Choisir...</option>
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
		 						<label>Ecrit par</label>
								<select name="admin_id" class="short_select">
									<option value="">Choisir...</option>
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
							
							</ol>
						</fieldset>
					</div>		
		<div class="form_div">
			<fieldset>

					<ol>
							<li>					
					
						<textarea class="long_textarea_input" name="news_content"><?php print $rows['0']['news_content'] ?></textarea>
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
						<label>Afficher?</label>
						<input type="radio" name="news_status" value="1"
						<?php if($rows['0']['news_status'] == '1'){ print 'checked="checked"' ;} ?>
						/> Oui
						<input type="radio" name="news_status" value="0"
						<?php if($rows['0']['news_status'] == '0'){ print 'checked="checked"' ;} ?>
						/> Non
					</li>
					<li>
						<label>D&eacute;but publication</label>
						<select name="news_publication_start_date_y">
							<?php
							
							$start  = $rows['0']['news_publication_start_date'];
							$start = explode("-", $start);
							$end  = $rows['0']['news_publication_end_date'];
							$end = explode("-", $end);
							
							$y = date('Y');
							$y_2 = $y + 11;
							for ($y; $y < $y_2; $y++) {
								print '<option value="'.$y.'"';
									if($y == $start[0]) { print 'selected="selected"' ;}
								print '>'.$y.'</option>';
							}
							?>
						</select>
						<select name="news_publication_start_date_m">
							<?php
							for ($m=1; $m < 13; $m++) {
								print '<option value="'.$m.'"';
									if($m == $start[1]) { print 'selected="selected"' ;}
								print '>'.$m.'</option>';
							}
							?>
						</select>
						<select name="news_publication_start_date_d">
							<?php
							for ($d=1; $d < 32; $d++) {
								print '<option value="'.$d.'"';
									if($d == $start[2]) { print 'selected="selected"' ;}
								print '>'.$d.'</option>';
							}
							?>
						</select>
						
					</li>
					<li>
						<label>Fin publication</label>
						<select name="news_publication_end_date_y">
							<?php
							$y = date('Y');
							$y_2 = $y + 11;
							for ($y; $y < $y_2; $y++) {
								print '<option value="'.$y.'"';
									if($y == $end[0]) { print 'selected="selected"' ;}
								print '>'.$y.'</option>';
							}
							?>
						</select>
						<select name="news_publication_end_date_m">
							<?php
							for ($m=1; $m < 13; $m++) {
								print '<option value="'.$m.'"';
									if($m == $end[1]) { print 'selected="selected"' ;}
								print '>'.$m.'</option>';
							}
							?>
						</select>
						<select name="news_publication_end_date_d">
							<?php
							for ($d=1; $d < 32; $d++) {
								print '<option value="'.$d.'"';
									if($d == $end[2]) { print 'selected="selected"' ;}
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
					<input type="hidden" name="news_modification_date" value="<?php print date('Y-m-d');?>" />
					<input type="hidden"  name="news_id" value="<?php print $rows['0']['news_id'] ;?>" />
  					<input type="hidden" name="update_news" value="1" />
  					<input type="submit" name="submit" class="submit" value="Editer" onClick="selectAll(document.combo_box['pool_list_2[]']);" />
				</li>
  			</ol>
  		</fieldset>
  	</form>
</div>
<div id="display_errors">
	<?php
	print $title_error;
	print $category_error;
	?>
</div>
<script type="text/javascript" src="wmd/wmd.js"></script>
