<div class="form_div">
	<div id="info_bar">
		TEMPLATE LIST &nbsp; &middot; &nbsp; There are <em><?php print $crud->countRecords('template');?> templates</em> in table <em>
		<?php print ucfirst($crud->getTable());?></em>
	</div>
	
			<form id="add_template_form" action="" method="post" enctype="multipart/form-data">
				<fieldset>
					<ol>
		  				<li>
							<label>Add Template</label>
							<input type="input" class="input" name="template_name" />
						</li>
						<li>
							<label>Parent Template</label>
							<select name="template_parent_id" class="short_select">
								<option value="0">None - New template is parent</option>
								<?php
								foreach ($cat_rows as $key) {
									print '<option value="'.$key[0].'">'.$key[2].'</option>';		
								}
								?>
							</select>
						</li>
						<li class="bottom">
							<label>&nbsp;</label>
							<input type="hidden" name="add_template" value="1" />
		  					<input type="submit" name="submit" class="submit" value="Add Template" />
						</li>
		  			</ol>
		  		</fieldset>
		  	</form>
</div>

<div class="list_div">
	<fieldset>
		<div id="recursive_menu">	
			<?php
			print $extender->display_recursive_menu_template(0, 0, $rows, 'template');	
			?>
		</div>
	</fieldset>
</div>