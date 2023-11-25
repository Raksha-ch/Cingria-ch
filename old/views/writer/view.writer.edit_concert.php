<?php

$dates 	= explode('-',$rows['0']['date']);
$year 	= $dates[0];
$month 	= $dates[1];
$day 	= $dates[2];

?>
<div id="display_form">
 <form id="create_concert_form" action="" method="post" enctype="multipart/form-data">
 <div class="form_div">
	 	<div id="info_bar">CONCERT</div>
	 		<fieldset> 
	 			<ol>
					<li>
	 					<label>Date</label>
						<select name="year">
							<option value="2011" <?php if($year == '2011'){ print ' selected="selected"';}?>>2011</option>
							<option value="2012" <?php if($year == '2012'){ print ' selected="selected"';}?>>2012</option>
							<option value="2013" <?php if($year == '2013'){ print ' selected="selected"';}?>>2013</option>
							<option value="2014" <?php if($year == '2014'){ print ' selected="selected"';}?>>2014</option>
							<option value="2015" <?php if($year == '2015'){ print ' selected="selected"';}?>>2015</option>
							<option value="2016" <?php if($year == '2016'){ print ' selected="selected"';}?>>2016</option>
							<option value="2017" <?php if($year == '2017'){ print ' selected="selected"';}?>>2017</option>
							<option value="2018" <?php if($year == '2018'){ print ' selected="selected"';}?>>2018</option>
							<option value="2019" <?php if($year == '2019'){ print ' selected="selected"';}?>>2019</option>
							<option value="2020" <?php if($year == '2020'){ print ' selected="selected"';}?>>2020</option>
						</select>
						<select name="month">
							<option value="01" <?php if($month == '01'){ print ' selected="selected"';}?>>Janvier</option>
							<option value="02" <?php if($month == '02'){ print ' selected="selected"';}?>>F&eacute;vrier</option>
							<option value="03" <?php if($month == '03'){ print ' selected="selected"';}?>>Mars</option>
							<option value="04" <?php if($month == '04'){ print ' selected="selected"';}?>>Avril</option>
							<option value="05" <?php if($month == '05'){ print ' selected="selected"';}?>>Mai</option>
							<option value="06" <?php if($month == '06'){ print ' selected="selected"';}?>>Juin</option>
							<option value="07" <?php if($month == '07'){ print ' selected="selected"';}?>>Juillet</option>
							<option value="08" <?php if($month == '08'){ print ' selected="selected"';}?>>Août</option>
							<option value="09" <?php if($month == '09'){ print ' selected="selected"';}?>>Septembre</option>
							<option value="10" <?php if($month == '10'){ print ' selected="selected"';}?>>Octobre</option>
							<option value="11" <?php if($month == '11'){ print ' selected="selected"';}?>>Novembre</option>
							<option value="12" <?php if($month == '12'){ print ' selected="selected"';}?>>D&eacute;cembre</option>
						</select>
						
							<select name="day">
								<option value="01" <?php if($day == '01'){ print ' selected="selected"';}?> >01</option>
								<option value="02" <?php if($day == '02'){ print ' selected="selected"';}?> >02</option>
								<option value="03" <?php if($day == '03'){ print ' selected="selected"';}?> >03</option>
								<option value="04" <?php if($day == '04'){ print ' selected="selected"';}?> >04</option>
								<option value="05" <?php if($day == '05'){ print ' selected="selected"';}?> >05</option>
								<option value="06" <?php if($day == '06'){ print ' selected="selected"';}?> >06</option>
								<option value="07" <?php if($day == '07'){ print ' selected="selected"';}?> >07</option>
								<option value="08" <?php if($day == '08'){ print ' selected="selected"';}?> >08</option>
								<option value="09" <?php if($day == '09'){ print ' selected="selected"';}?> >09</option>
								<option value="10" <?php if($day == '10'){ print ' selected="selected"';}?> >10</option>
								<option value="11" <?php if($day == '11'){ print ' selected="selected"';}?> >11</option>
								<option value="12" <?php if($day == '12'){ print ' selected="selected"';}?> >12</option>
								<option value="13" <?php if($day == '13'){ print ' selected="selected"';}?> >13</option>
								<option value="14" <?php if($day == '14'){ print ' selected="selected"';}?> >14</option>
								<option value="15" <?php if($day == '15'){ print ' selected="selected"';}?> >15</option>
								<option value="16" <?php if($day == '16'){ print ' selected="selected"';}?> >16</option>
								<option value="17" <?php if($day == '17'){ print ' selected="selected"';}?> >17</option>
								<option value="18" <?php if($day == '18'){ print ' selected="selected"';}?> >18</option>
								<option value="19" <?php if($day == '19'){ print ' selected="selected"';}?> >19</option>
								<option value="20" <?php if($day == '20'){ print ' selected="selected"';}?> >20</option>
								<option value="21" <?php if($day == '21'){ print ' selected="selected"';}?> >21</option>
								<option value="22" <?php if($day == '22'){ print ' selected="selected"';}?> >22</option>
								<option value="23" <?php if($day == '23'){ print ' selected="selected"';}?> >23</option>
								<option value="24" <?php if($day == '24'){ print ' selected="selected"';}?> >24</option>
								<option value="25" <?php if($day == '25'){ print ' selected="selected"';}?> >25</option>
								<option value="26" <?php if($day == '26'){ print ' selected="selected"';}?> >26</option>
								<option value="27" <?php if($day == '27'){ print ' selected="selected"';}?> >27</option>
								<option value="28" <?php if($day == '28'){ print ' selected="selected"';}?> >28</option>
								<option value="29" <?php if($day == '29'){ print ' selected="selected"';}?> >29</option>
								<option value="30" <?php if($day == '30'){ print ' selected="selected"';}?> >30</option>
								<option value="31" <?php if($day == '31'){ print ' selected="selected"';}?> >31</option>
							</select>
	 				</li>
					<li>
	 					<label>Lieu</label>
	 					<input type="text" class="input" name="place" value="<?php print $rows['0']['place'];?>" />
	 				</li>
	
						<li>
							<label>Artistes<br/><span class="tinygreyinfo"></span></label>
								<select name="profile_id" class="short_select">
									<option value="0">Choisir...</option>
									<?php
										foreach ( $artists as $row ) {
											print '<option value="'.$row['profile_id'].'"';
												if($rows['0']['profile_id'] == $row['profile_id']){ print ' selected="selected"';}
											print '>'.$row['profile_name'].' '.$row['profile_surname'].'</option>';
										}
								?>	
								</select>
					</li>
					<li>
	 					<label>Informations additionnelles<br/><span class="tinygreyinfo">Programme, auteur,...</span></label>
	 					<textarea class="textarea_input" name="additional_info"><?php print $rows['0']['additional_info']?></textarea>
						
	 			
						<li>
	 						<label>Afficher?</label>
	 						<input type="radio" name="concert_status" value="1"
	 							<?php  if ( $rows['0']['concert_status'] == 1) { print ' checked="checked" ' ;} ?> 
	 						/> Oui
	 						<input type="radio" name="concert_status" value="0" 
	 							<?php  if ($rows['0']['concert_status'] == '0' ) { print ' checked="checked" ' ;} ?> 
	 						/> Non
	 					</li>
	 			</ol>
	 		</fieldset> 
	 </div>

	
 
 			<div class="form_div">
 				<fieldset> 
 
 							<ol>
 				<li class="bottom">
 					<label>&nbsp;</label>
					<input type="hidden" name="concert_modification_date" value="<?php print date('Y-m-d');?>" />
	   				<input type="hidden" name="edit_concert" value="1" />
	   				<input type="hidden" name="concert_id" value="<?php print $rows['0']['concert_id']; ?>" />
   					<input type="submit" name="submit" class="submit" value="Modifier" />
 				</li>
   				
   			</ol> 
   		</fieldset>
   	</form>
 </div>
</div>
<div id="display_errors">
	<?php
	print $title_error;
	print $category_error;
	?>
</div>
   