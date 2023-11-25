<form id="create_profile_form" action="" method="post" enctype="multipart/form-data">
<div class="form_div">
	<div id="info_bar">PROFIL D'ARTISTE</div>
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
									if($key[0] == $rows['0']['profile_category_name_en']) { print 'selected="selected" ';}
								print '>'.ucfirst($key[1]).'</option>';		
							}
							?>
					</select>
				</li>
  				<li>
					<label>Pr&eacute;nom</label>
					<input type="input" class="input" name="profile_name" value="<?php print $_POST['profile_name'] ?>" />
				</li>
				<li>
					<label>Nom</label>
					<input type="input" class="input" name="profile_surname" value="<?php print $_POST['profile_surname'] ?>" />
				</li>

				<li>
					<label>Compagnie / Ensemble</label>
					<input type="input" class="input" name="profile_company" value="<?php print $_POST['profile_company'] ?>" />
				</li>
				<li>
					<label>Fonction<br/><span class="tinygreyinfo">Ex. Soliste, claveciniste</span></label>
					<input type="input" class="input" name="profile_function" value="<?php print $_POST['profile_function'] ?>" />
				</li>
				<li>
					<label>Site internet
					<br/><span class="tinygreyinfo"><strong>http://</strong>www.mon_site.ch</span>
					</label>
					<input type="input" class="input" name="profile_company_url" value="<?php print $_POST['profile_company_url'] ?>"/>
				</li>
				<!--
				<li>
					<label>Dossier image</label>
					<select name="dir_name" class="short_select">
						<option value="0">Choisir...</option>
							<?php
						 	print $uploader->getDirectoriesArray( "uploads");
						 	?>
					</select>
				</li>
				<li>
					<label>Dossier son</label>
					<select name="dir_name_2" class="short_select">
						<option value="0">Choisir...</option>
							<?php
						 	print $uploader->getDirectoriesArray( "uploads");
						 	?>
					</select>
				</li>
				
				<li>
					<label>Media URL</label>
					<input type="input" class="input" name="media_url" value="<?php print $_POST['media_url'] ?>"/>
				</li>
				-->	
				</ol>
				</fieldset>
			</div>
			<!--
		 <div class="form_div">
		 	<div id="info_bar">Courte biographie</div>
		 				<fieldset>
		 					<ol>
		 				

		 								<li>					

			 						<textarea class="long_textarea_input" name="profile_short_biography"><?php print $_POST['profile_short_biography'] ?></textarea>
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
					<input type="input" class="input" name="profile_email_address" value="<?php print $_POST['profile_email_address'] ?>" />
				</li>
				
				<li>
					<label>Num&eacute;ro de t&eacute;l&eacute;phone<br/><span class="tinygreyinfo">[info cach&eacute;e]</span></label>
					<input type="input" class="input" name="profile_phone_number" value="<?php print $_POST['profile_phone_number'] ?>" />
				</li>
				<li>
					<label>Addresse<br/><span class="tinygreyinfo">[info cach&eacute;e]</span></label>
					<input type="input" class="input" name="profile_address" value="<?php print $_POST['profile_address'] ?>" />
				</li>
				<li>
					<label>Ville<br/><span class="tinygreyinfo">[info cach&eacute;e]</span></label>
					<input type="input" class="input" name="profile_city" value="<?php print $_POST['profile_city'] ?>" />
				</li>
				<li>
					<label>Code Postal<br/><span class="tinygreyinfo">[info cach&eacute;e]</span></label>
					<input type="input" class="input" name="profile_postal_code" value="<?php print $_POST['profile_postal_code'] ?>" />
				</li>
				<li>
					<label>Pays </label>
					<select name="profile_country" class="short_select">
						<option value="">Choisir...</option>
						<?php
						$rows  =  $crud->select( 'num' , 'country_list' , '*' , '', '' ,  'country_id ASC' , '', '' ,'' );
						foreach ($rows as $key) {
							print '<option value="'.$key[0].'">'.$key[2].'</option>';		
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
  					<input type="submit" name="submit" class="submit" value="Cr&eacute;er" />
				</li>
  					<input type="hidden"  name="profile_creation" 	  value="<?php print date('Y-m-d');?>" />
  					<input type="hidden"  name="profile_modification" value="0000-00-00" />
					<input type="hidden"  name="create_profile" 	  value="1" />

  			</ol>
  		</fieldset>
  	</form>
</div>
<script type="text/javascript" src="wmd/wmd.js"></script>
