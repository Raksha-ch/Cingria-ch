<div class="form_div">
	<div id="info_bar">FLUSH PROFILES FORM</div>
	<form action="" name="jump" id="jump"  method="post" enctype="multipart/form-data">
		<fieldset> 
			<ol>
				<li>
					<label>Flush Type</label>
					<select name="sorting_list" id="sorting_list"class="short_select" onchange="go()">
						<option value="">Select...</option>
						<option value="?page=profiler&amp;action=flush_profiles&amp;flush_type=profile_creation"
						<?php if ($_GET['flush_type']=='profile_creation'){ print 'selected="selected"';} ?>
						>Creation date</option>
						<option value="?page=profiler&amp;action=flush_profiles&amp;flush_type=profile_modification"
						<?php if ($_GET['flush_type']=='profile_modification'){ print 'selected="selected"';} ?>
						>Modification date</option>
						<option value="?page=profiler&amp;action=flush_profiles&amp;flush_type=range_of_dates"
						<?php if ($_GET['flush_type']=='range_of_dates'){ print 'selected="selected"';} ?>>Range of dates</option>
						<option value="?page=profiler&amp;action=flush_profiles&amp;flush_type=profile_password"
						<?php if ($_GET['flush_type']=='profile_password'){ print 'selected="selected"';} ?>>Unregistered users</option>
					</select>
				</li>
  			</ol> 
  		</fieldset>
  	</form>
</div>

<?php
if($_GET['flush_type'] == 'profile_creation') {
?>
<div class="form_div">
	<form action="" name="" id=""  method="post" enctype="multipart/form-data">
		<fieldset> 
			<ol>
  				<li>
					<label>Flush <strong>profiles created</strong></label>
					<select name="operator" class="shorter_select">
						<option value="on">on</option>
						<option value="before">before</option>
						<option value="after">after</option>
					</select>
				</li>
				<li>
					<label>Date <span style="color: #999">[yyyy/mm/dd]</span></label>
					<select name="year" class="shorter_select">
						<option>year</option>
						<?php
						$current = date('Y')+1;
						for ($i=2000; $i < $current ; $i++) { 
							print '<option value="'.$i.'">'.$i.'</option>';
						}
						?>
					</select>
					<select name="month" class="shorter_select">
						<option>month</option>
						<?php
						for ($i=1; $i < 13 ; $i++) {
							$j = sprintf("%02d", $i);  
							print '<option value="'.$j.'">'.$j.'</option>';
						}
						?>
					</select>
					<select name="day" class="shorter_select">
						<option >day</option>
						<?php
						for ($i=1; $i < 32 ; $i++) {
							$j = sprintf("%02d", $i);  
							print '<option value="'.$j.'">'.$j.'</option>';
						}
						?>
						
					</select>
				</li>
				<li class="bottom">
					<label>&nbsp;</label>
					<input type="hidden" name="flush_type" value="profile_creation">
  					<input type="submit" name="submit" class="submit" value="Flush" />
				</li>
  			</ol> 
  		</fieldset>
  	</form>
</div>
<?php
}

if($_GET['flush_type'] == 'profile_modification') {
?>
<div class="form_div">
	<form action="" name="" id=""  method="post" enctype="multipart/form-data">
		<fieldset> 
			<ol>
  				<li>
					<label>Flush <strong>profiles modified</strong></label>
					<select name="operator" class="shorter_select">
						<option value="on">on</option>
						<option value="before">before</option>
						<option value="after">after</option>
					</select>
				</li>
				<li>
					<label>Date <span style="color: #999">[yyyy/mm/dd]</span></label>
					<select name="year" class="shorter_select">
						<option>year</option>
						<?php
						$current = date('Y')+1;
						for ($i=2000; $i < $current ; $i++) { 
							print '<option value="'.$i.'">'.$i.'</option>';
						}
						?>
					</select>
					<select name="month" class="shorter_select">
						<option>month</option>
						<?php
						for ($i=1; $i < 13 ; $i++) {
							$j = sprintf("%02d", $i);  
							print '<option value="'.$j.'">'.$j.'</option>';
						}
						?>
					</select>
					<select name="day" class="shorter_select">
						<option >day</option>
						<?php
						for ($i=1; $i < 32 ; $i++) {
							$j = sprintf("%02d", $i);  
							print '<option value="'.$j.'">'.$j.'</option>';
						}
						?>
						
					</select>
				</li>
				<li class="bottom">
					<label>&nbsp;</label>
					<input type="hidden" name="flush_type" value="profile_modification">
  					<input type="submit" name="submit" class="submit" value="Flush" />
				</li>
  			</ol> 
  		</fieldset>
  	</form>
</div>
<?php
}
if($_GET['flush_type'] == 'range_of_dates') {
?>
<div class="form_div">
	<span style="font-size: 12px;"><br/>&nbsp;&nbsp;Flush profiles created between <strong>Date #1</strong> and <strong>Date #2</strong></span>
	
	<form action="" name="" id=""  method="post" enctype="multipart/form-data">
		<fieldset> 
			<ol>
				<li>
					<label>Date #1</label>
					<select name="start_year" class="shorter_select">
						<option>year</option>
						<?php
						$current = date('Y')+1;
						for ($i=2000; $i < $current ; $i++) { 
							print '<option value="'.$i.'">'.$i.'</option>';
						}
						?>
					</select>
					<select name="start_month" class="shorter_select">
						<option>month</option>
						<?php
						for ($i=1; $i < 13 ; $i++) { 
							$j = sprintf("%02d", $i); 
							print '<option value="'.$j.'">'.$j.'</option>';
						}
						?>
					</select>
					<select name="start_day" class="shorter_select">
						<option>day</option>
						<?php
						
						for ($i=1; $i < 32 ; $i++) { 
							$j = sprintf("%02d", $i); 
							print '<option value="'.$j.'">'.$j.'</option>';
						}
						?>
						
					</select>
				</li>
				<li>
					<label>Date #2</label>
					<select name="end_year" class="shorter_select">
						<option>year</option>
						<?php
						$current = date('Y')+1;
						for ($i=2000; $i < $current ; $i++) { 
							print '<option value="'.$i.'">'.$i.'</option>';
						}
						?>
					</select>
					<select name="end_month" class="shorter_select">
						<option>month</option>
						<?php
						for ($i=1; $i < 13 ; $i++) { 
							$j = sprintf("%02d", $i); 
							print '<option value="'.$j.'">'.$j.'</option>';
						}
						?>
					</select>
					<select name="end_day" class="shorter_select">
						<option>day</option>
						<?php
						for ($i=1; $i < 32 ; $i++) {
							$j = sprintf("%02d", $i);  
							print '<option value="'.$j.'">'.$j.'</option>';
						}
						?>
						
					</select>
				</li>
				<li class="bottom">
					<label>&nbsp;</label>
					<input type="hidden" name="flush_type" value="range_of_dates">
  					<input type="submit" name="submit" class="submit" value="Flush" />
				</li>
  			</ol> 
  		</fieldset>
  	</form>
</div>
<?php
}
if($_GET['flush_type'] == 'profile_password') {
?>
<div class="form_div">	
	<form action="" name="" id=""  method="post" enctype="multipart/form-data">
		<fieldset> 
			<ol>
				<li class="bottom">
					<label>Flush <strong>unregistered users</strong></label>
  					<input type="submit" name="submit" class="submit" value="Flush" />
					<input type="hidden" name="flush_type" value="profile_password">
				</li>
  			</ol> 
  		</fieldset>
  	</form>
</div>
<?php
}
?>