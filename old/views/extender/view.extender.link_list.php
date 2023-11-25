<div class="form_div">
	<div id="info_bar">
		LINK CATEGORY LIST &nbsp; &middot; &nbsp; There are <em><?php print $crud->countRecords('link_category');?> categories and subcategories</em> in table <em>
		<?php print ucfirst($crud->getTable());?></em>
	</div>
	
			<form id="add_link_category_form" action="" method="post" enctype="multipart/form-data">
				<fieldset>
					<ol>
		  				<li>
							<label>Add Link Category</label>
							<input type="input" class="input" name="link_category_name" />
						</li>
						<li>
							<label>Parent Link Category</label>
							<select name="link_category_parent_id" class="short_select">
								<option value="0">None - New link category is parent</option>
								<?php
								foreach ($cat_rows as $key) {
									print '<option value="'.$key[0].'">'.$key[2].'</option>';		
								}
								?>
							</select>
						</li>
						<li class="bottom">
							<label>&nbsp;</label>
							<input type="hidden" name="add_link_category" value="1" />
		  					<input type="submit" name="submit" class="submit" value="Add Link Category" />
						</li>
		  			</ol>
		  		</fieldset>
		  	</form>
</div>

<div class="list_div">
	<fieldset>
		<div id="recursive_menu">	
			<?php
			print $extender->display_recursive_menu_link(0, 0, $rows, 'link_category');	
			?>
		</div>
	</fieldset>
</div>

<div class="form_div">
	<div id="info_bar">
		ADD LINK FORM &nbsp; &middot; &nbsp; There are <em><?php print $crud->countRecords('link');?> links </em> in table <em>
		<?php print ucfirst($extender->getTable());?></em>
	</div>
	
			<form id="add_link_form" action="" method="post" enctype="multipart/form-data">
				<fieldset>
					<ol>
		  				<li>
							<label>Link URL<br/><span class="tinygreyinfo">e.g. http://www.link.com</span></label>
							<input type="input" class="input" name="link_url" />
						</li>
						<li>
	 						<label>Link Language</label>
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
							<label>Link Title<br/><span class="tinygreyinfo">e.g. link.com or link</span></label>
							<input type="input" class="input" name="link_title" />
						</li>
						<li>
							<label>Link Description</label>
							<textarea name="link_description" class="textarea_input"></textarea>
						</li>
							<li>
								<label>Link Rank</label>
									<select name="link_rank" class="short_select">
									<?php
									$i = count($link_rows);
									if($i == 0) { $i = 1;}
									$j = 1;
									while ($j <= $i) {
									print '<option value="'.$j.'">'.$j.'</option>';
									$j++;
									}
									?>
									</select>
							</li>
						<li>
							<label>Link Category</label>
							<select name="link_category_id" class="short_select">
								<option value="0">Select...</option>
								<?php
								foreach ($cat_rows as $keys) {
									print '<option value="'.$keys[0].'">'.$keys[2].'</option>';		
								}
								?>
							</select>
						</li>
							<li>
								<label>Link Status</label>
									<select name="link_status" class="short_select">
										<option value="1">Active</option>
										<option value="2">Hidden</option>
									</select>
							</li>
						<li class="bottom">
							<label>&nbsp;</label>
							<input type="hidden" name="add_link" value="1" />
							<input type="hidden" name="link_creation_date" value="<?php print date('Y-m-d');?>" />
		  					<input type="submit" name="submit" class="submit" value="Add Link" />
						</li>
		  			</ol>
		  		</fieldset>
		  	</form>
</div>

<div class="list_div">
	<fieldset>
		<?php		
		foreach ($link_rows as $k) {
			$status = ($k['link_status'] == 2) ? '<img src="img/icons/crossedeye.png" alt="ok" class="icon" />' : '<img src="img/icons/default.png" alt="ok" class="icon" />';
			$title = truncateString($k['link_title'],32);
			$description = truncateString($k['link_description'],12);
			print <<<EOF
			<li>
				<span style="float:left;">
					<span style="float:left; width: 16px; margin-top: 3px;">$status</span>
					<span class="tinygreyinfo">[{$k[link_rank]}] [{$k[language_short_name]}]</span><a href="{$k[link_url]}" onclick="window.open(this.href, '_blank'); return false;"><strong>{$k[link_category_name]}</strong> / {$title}</a>
						<span class="tinygreyinfo"> $description</span>
					</span>
					<span style="float:right;">
						<a href="?page=extender&amp;action=delete_link&amp;link_id={$k[link_id]}" onclick="return(confirm('Delete link?'));" class="delete_hover">delete</a> |
						<a href="?page=extender&amp;action=edit_link&amp;link_id={$k[link_id]}">edit/show</a>
					</span>
			</li>
EOF;
		}
		?>
	</fieldset>
</div>


