<div class="form_div">
	<form id="" action="" method="post">
		<div id="info_bar">EDITER PROFIL D'ARTISTE</div>
				<fieldset> 
					<ol>
						<li>
							<label>Type d'artiste</label>
							<select name="profile_category_id" class="short_select">
								<option value="">Choisir...</option>
									<?php
									$rows_profile_category =  $crud->select('num','profile_category','*','','','profile_category_id ASC','','','');
									foreach ($rows_profile_category as $key) {
										print '<option value="'.$key[0].'"';
											if($key[0] == $rows['0']['profile_category_id']) { print 'selected="selected" ';}
										print '>'.ucfirst($key[1]).'</option>';		
									}
									?>
							</select>
						</li>
		  				<li>
							<label>Pr&eacute;nom</label>
							<input type="input" class="input" name="profile_name" value="<?php print $rows['0']['profile_name'] ?>" />
						</li>
						<li>
							<label>Nom</label>
							<input type="input" class="input" name="profile_surname" value="<?php print $rows['0']['profile_surname'] ?>" />
						</li>
						<li>
							<label>Compagnie / Ensemble</label>
							<input type="input" class="input" name="profile_company" value="<?php print $rows['0']['profile_company'] ?>" />
						</li>
						<li>
							<label>Fonction<br/><span class="tinygreyinfo">Ex. Soliste, claveciniste</span></label>
							<input type="input" class="input" name="profile_function" value="<?php print $rows['0']['profile_function'] ?>" />
						</li>
						<li>
							<label>Site internet
							<br/><span class="tinygreyinfo"><strong>http://</strong>www.mon_site.ch</span>
							</label>
							<input type="input" class="input" name="profile_company_url" value="<?php print $rows['0']['profile_company_url'] ?>"/>
						</li>
						<!--
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
								<option value="<?php print $dir_name; ?>"></option>
								<option value="0">Choisir...</option>

								<?php
								print $uploader->getDirectoriesArray( "uploads" );
								}
								?>
							</select>
						</li>
						<li>
							<label>Dossier son</label>
							<select name="dir_name_2" class="short_select">
								<?php
								if ($rows['0']['dir_name_2'] == '0') {
								?>
								<option value="0">Choisir...</option>
								<?php
								print $uploader->getDirectoriesArray( "uploads");
								} else {

								$dir_name_2 = $rows['0']['dir_name_2'];
								$arr = explode('/',$rows['0']['dir_name_2']);
								array_shift($arr);
								$print_dir_name_2 = implode('/',$arr);

								?>
								<option value="<?php print $dir_name_2; ?>" selected="selected"><?php print $print_dir_name_2; ?></option>
								<option value="<?php print $dir_name_2; ?>"></option>
								<option value="0">Choisir...</option>

								<?php
								print $uploader->getDirectoriesArray( "uploads" );
								}
								?>
							</select>
						</li>
						<li>
							<label>Media URL</label>
							<input type="input" class="input" name="media_url" value="<?php print $rows['0']['media_url'] ?>"/>
						</li>
						-->	
							<li>
								<label>Afficher?</label>
								<input type="radio" name="profile_status" 
								<?php if($rows['0']['profile_status']=='1'){print'checked="checked"';} ?> value="1" /> Oui
								<input type="radio" name="profile_status"
								<?php if($rows['0']['profile_status']=='0'){print'checked="checked"';} ?> value="0" /> Non
							</li>
								</ol>
								</fieldset>
							</div>
							<!--
							<div class="form_div">
							 	<div id="info_bar">Courte biographie</div>
							 				<fieldset> 
							 					<ol>


							 								<li>					

								 						<textarea class="long_textarea_input" name="profile_short_biography"><?php print $rows['0']['profile_short_biography'] ?></textarea>
								 						<div style="padding: 12px; float:left;">
								 							<div class="wmd-preview" style="background-color: #EFEFEF; float:left; padding: 2px;"></div>
								 						</div>
								 					</li>
							 					</ol>
							 				</fieldset> 
							 			</div>
							-->
								<div class="form_div">
									<div id="info_bar">Infos priv&eacute;es</div>
									<fieldset>
										<ol>
						<li>
							<label>Addresse email<br/><span class="tinygreyinfo">[info cach&eacute;e]</span></label>
							<input type="input" class="input" name="profile_email_address" value="<?php print $rows['0']['profile_email_address'] ?>" />
						</li>
						
						<li>
							<label>Num&eacute;ro de t&eacute;l&eacute;phone<br/><span class="tinygreyinfo">[info cach&eacute;e]</span></label>
							<input type="input" class="input" name="profile_phone_number" value="<?php print $rows['0']['profile_phone_number'] ?>" />
						</li>
						<li>
							<label>Addresse<br/><span class="tinygreyinfo">[info cach&eacute;e]</span></label>
							<input type="input" class="input" name="profile_address" value="<?php print $rows['0']['profile_address'] ?>" />
						</li>
						<li>
							<label>Ville<br/><span class="tinygreyinfo">[info cach&eacute;e]</span></label>
							<input type="input" class="input" name="profile_city" value="<?php print $rows['0']['profile_city'] ?>" />
						</li>
						<li>
							<label>Code Postal<br/><span class="tinygreyinfo">[info cach&eacute;e]</span></label>
							<input type="input" class="input" name="profile_postal_code" value="<?php print $rows['0']['profile_postal_code'] ?>" />
						</li>
						<li>
							<label>Pays </label>
							<select name="profile_country" class="short_select">
								<option value="">Choisir...</option>
									<?php
									$rows_country =  $crud->select('num','country_list','*','','','country_id ASC','','','');
									foreach ($rows_country as $key) {
										print '<option value="'.$key[0].'"';
											if($key[0] == $rows['0']['profile_country']) { print 'selected="selected" ';}
										print '>'.$key[1].'</option>';		
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
							<input type="hidden"  name="slice_1" value="<?php print $_GET['slice_1'];?>" />		
							<input type="hidden"  name="profile_modification" value="<?php print date('Y-m-d');?>" />		
							<input type="hidden"  name="profile_id" 		  value="<?php print $rows['0']['profile_id'] ;?>" />
		  					<input type="submit" name="submit" class="submit" value="Edit" />
						</li>
		  					
		  			</ol> 
		  		</fieldset>
		  	</form>
		</div>
<script type="text/javascript" src="wmd/wmd.js"></script>

		