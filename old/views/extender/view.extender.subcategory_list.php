<div class="form_div">
	<div id="info_bar">
		LIEUX &nbsp; &middot; &nbsp; Il y a <em><?php print $crud->countRecords('subcategory')-1;?> lieux</em> dans la table <em>
		Lieux</em>
	</div>
	
			<form id="add_category_form" action="" method="post" enctype="multipart/form-data">
				<fieldset>
					<ol>
		  				<li>
							<label>Ajouter un lieu</label>
							<input type="input" class="input" name="subcategory_name" />
						</li>
						<li>
							<label>Parent du lieu</label>
							<select name="subcategory_parent_id" class="short_select">
								<option value="0">Aucun - le nouveau lieu est parent</option>
								<?php
								foreach ($cat_rows as $key) {
									print '<option value="'.$key[0].'">'.$key[2].'</option>';		
								}
								?>
							</select>
						</li>
						<li class="bottom">
							<label>&nbsp;</label>
							<input type="hidden" name="add_subcategory" value="1" />
		  					<input type="submit" name="submit" class="submit" value="Ajouter" />
						</li>
		  			</ol>
		  		</fieldset>
		  	</form>
</div>

<div class="list_div">
	<fieldset>
		<div id="recursive_menu">	
			<?php
			print $extender->display_recursive_menu_subcategory(0, 0, $rows, 'subcategory');	
			?>
		</div>
	</fieldset>
</div>

