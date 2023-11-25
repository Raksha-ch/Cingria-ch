<div id="display_form">
 <form id="create_concert_form" action="" method="post" enctype="multipart/form-data">
 <div class="form_div">
	 	<div id="info_bar">CONCERT</div>
	 		<fieldset>
	 			<ol>
					<li>
	 					<label>Date</label>
						<select name="year">
							<option value="2011">2011</option>
							<option value="2012">2012</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
							<option value="2020">2020</option>
						</select>
						<select name="month">
							<option value="01">Janvier</option>
							<option value="02">F&eacute;vrier</option>
							<option value="03">Mars</option>
							<option value="04">Avril</option>
							<option value="05">Mai</option>
							<option value="06">Juin</option>
							<option value="07">Juillet</option>
							<option value="08">Août</option>
							<option value="09">Septembre</option>
							<option value="10">Octobre</option>
							<option value="11">Novembre</option>
							<option value="12">D&eacute;cembre</option>
						</select>
						
							<select name="day">
								<option value="01">01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
								<option value="07">07</option>
								<option value="08">08</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
								<option value="31">31</option>
							</select>
	 				</li>
					<li>
	 					<label>Lieu</label>
	 					<input type="text" class="input" name="place" value="<?php print $_POST['place'] ?>" />
	 				</li>
	
						<li>
							<label>Artistes<br/><span class="tinygreyinfo"></span></label>
								<select name="profile_id" class="short_select">
									<option value="0">Choisir...</option>
									<?php
										foreach ( $artists as $row ) {
											print '<option value="'.$row['profile_id'].'">'.$row['profile_name'].' '.$row['profile_surname'].'</option>';
										}
								?>	
								</select>
					</li>
					<li>
	 					<label>Informations additionnelles<br/><span class="tinygreyinfo">Programme, auteur,...</span></label>
	 					<textarea class="textarea_input" name="additional_info"><?php print $_POST['writing_content'] ?></textarea>
						
	 				</li>
					<li>
 						<label>Afficher?</label>
 						<input type="radio" name="concert_status" value="1"
 							<?php  if ( (!isset($_POST['news_status'])) || ($_POST['news_status'] == 1)) { print ' checked="checked" ' ;} ?>
 						/> Oui
 						<input type="radio" name="concert_status" value="0"
 							<?php  if ( $_POST['news_status'] == '0' ) { print ' checked="checked" ' ;} ?>
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
					<input type="hidden" name="concert_creation_date" value="<?php print date('Y-m-d');?>" />
	   				<input type="hidden" name="create_concert" value="1" />
   					<input type="submit" name="submit" class="submit" value="Ajouter" />
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
