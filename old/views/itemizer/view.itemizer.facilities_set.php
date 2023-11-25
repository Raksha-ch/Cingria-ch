<form id="create_new_facilities_set_form" action="" method="post">
<div class="form_div">
	
	<div id="info_bar">FACILITIES SET</div>		
		<fieldset>	
			<ol>
			<li>
				<label>Size</label>
				<input type="input" class="input"  value="<?php print $rows['0']['size']?>" name="size" /><span class="tinygreyinfo"> square meters</span>
				</li>	
			<li>
				<label>Master Double Bedroom</label>
				<select name="master_double_bedroom" class="short_select">
					<?php buildNumberSelector( $rows['0']['master_double_bedroom'], 0 , 10) ;?>
				</select>
			</li>
			<li>
				<label>Master Double Bedroom w/ ensuite</label>
				<select name="master_double_bedroom_with_ensuite" class="short_select">
					<?php buildNumberSelector( $rows['0']['master_double_bedroom_with_ensuite'], 0 , 10) ;?>
				</select>
			</li>
			<li>
				<label>Single Bedroom</label>
				<select name="single_bedroom" class="short_select">
					<?php buildNumberSelector( $rows['0']['single_bedroom'], 0 , 10) ;?>
				</select>
			</li>			
			<li>
				<label>Double Bedroom</label>
				<select name="double_bedroom" class="short_select">
					<?php buildNumberSelector( $rows['0']['double_bedroom'], 0 , 10) ;?>
				</select>
			</li>
			<li>
				<label>Triple Bedroom</label>
				<select name="triple_bedroom" class="short_select">
					<?php buildNumberSelector( $rows['0']['triple_bedroom'], 0 , 10) ;?>
				</select>
			</li>
			<li>
				<label>Twin Bedroom</label>
				<select name="twin_bedroom" class="short_select">
					<?php buildNumberSelector( $rows['0']['twin_bedroom'], 0 , 10) ;?>
				</select>
			</li>			
			<li>
				<label>Bunk Bed</label>
				<select name="bunk_bed" class="short_select">
					<?php buildNumberSelector( $rows['0']['bunk_bed'], 0 , 10) ;?>
				</select>
			</li>
			<li>
				<label>Sofa Bed</label>
				<select name="sofa_bed" class="short_select">
					<?php buildNumberSelector( $rows['0']['sofa_bed'], 0 , 10) ;?>
				</select>
			</li>
			<li>
				<label><strong>Total Sleeps</strong></label>
				<select name="total_sleeps" class="short_select">
					<?php buildNumberSelector( $rows['0']['total_sleeps'], 0 , 20) ;?>
				</select>
			</li>			
			</ol>
		</fieldset>
	</div>
	<div class="toggle_info">
		<div class="<?php print $info_bar ;?>">FACILITIES SET STATUS</div>
			<div class="info_box">
			<fieldset class="info">
					<?php
					print $property_info;
					?>
			</fieldset>
		</div>
	</div>
	<div class="form_div">
		<fieldset>	
			<ol>						
			<li>
				<label>Bathroom</label>
				<select name="bathroom" class="short_select">
					<?php buildNumberSelector( $rows['0']['bathroom'], 0 , 10) ;?>
				</select>
			</li>
			<li>
				<label>Shower Room</label>
				<select name="shower_room" class="short_select">
					<?php buildNumberSelector( $rows['0']['shower_room'], 0 , 10) ;?>
				</select>
			</li>
			<li>
				<label>WC</label>
				<select name="wc" class="short_select">
					<?php buildNumberSelector( $rows['0']['wc'], 0 , 10) ;?>
				</select>
			</li>
			<li>
				<label><strong>Total Baths</strong></label>
				<select name="total_baths" class="short_select">
					<?php buildNumberSelector( $rows['0']['total_baths'], 0 , 20) ;?>
				</select>
			</li>
			</ol>
		</fieldset>
	</div>

	<div class="form_div">
		<fieldset>	
			<ol>			
			<li>
				<label>Dining Room For</label>
				<select name="dining_room_for" class="short_select">
					<?php buildNumberSelector( $rows['0']['dining_room_for'], 0 , 20) ;?>
				</select>
			</li>
			<li>
				<label>Lounge For</label>
				<select name="lounge_for" class="short_select">
					<?php buildNumberSelector( $rows['0']['lounge_for'], 0 , 20) ;?>
				</select>
			</li>
			</ol>
		</fieldset>
	</div>
	
	<div class="form_div">
		<fieldset>	
			<ol>				
			<li>
				<label>External Parking For</label>
				<select name="external_parking_for" class="short_select">
					<?php buildNumberSelector( $rows['0']['external_parking_for'], 0 , 20) ;?>
				</select>
			</li>
			<li>
				<label>Garage Parking For</label>
				<select name="garage_parking_for" class="short_select">
					<?php buildNumberSelector( $rows['0']['garage_parking_for'], 0 , 20) ;?>
				</select>
			</li>
			</ol>
	</fieldset>
	</div>			
	<div class="form_div">
		<fieldset>	
			<ol>						
			<li>
				<label>Distance From Piste</label>
				<input type="input" class="input"  value="<?php print $rows['0']['distance_from_piste']?>" name="distance_from_piste" /><span class="tinygreyinfo"> meters</span>
				
			</li>
			<li>
				<label>Distance From Free Bus Service</label>
				<input type="input" class="input"  value="<?php print $rows['0']['distance_from_free_bus_service']?>" name="distance_from_free_bus_service" /><span class="tinygreyinfo"> meters</span>
				
			</li>			
			<li>
				<label>Distance From Shops and Restaurants</label>
				<input type="input" class="input"  value="<?php print $rows['0']['distance_from_shops_and_restaurants_and_bars']?>" name="distance_from_shops_and_restaurants_and_bars" />
				<span class="tinygreyinfo"> meters</span>
			</li>
			</ol>
		</fieldset>
	</div>
	<div class="form_div">
  		<fieldset>	
  			<ol>		
			<li>
				<label>Entrance Hallway</label>
				<?php
				buildYesNoRadioButton('entrance_hallway' , $rows['0']['entrance_hallway']);
				?>
			</li>
			<li>
				<label>Mezzanine Area</label>
				<?php
				buildYesNoRadioButton('mezzanine_area' , $rows['0']['mezzanine_area']);
				?>
			</li>
			<li>
				<label>Patio Area</label>
				<?php
				buildYesNoRadioButton('patio_area' , $rows['0']['patio_area']);
				?>
			</li>
			<li>
				<label>Terrace</label>
				<?php
				buildYesNoRadioButton('terrace' , $rows['0']['terrace']);
				?>
			</li>		
			<li>
				<label>Balcony</label>
				<?php
				buildYesNoRadioButton('balcony' , $rows['0']['balcony']);
				?>
			</li>
			<li>
				<label>Fireplace</label>
				<?php
				buildYesNoRadioButton('fireplace' , $rows['0']['fireplace']);
				?>
			</li>
			</ol>
 		</fieldset>
 	</div>


  	<div class="form_div">
  		<fieldset>	
  			<ol>
			 <li>
			 	<label>Kitchen</label>
			 	<?php
			 	buildYesNoRadioButton('kitchen' , $rows['0']['kitchen']);
			 	?>
			 </li>	
			<li>
				<label>Dishwasher</label>
				<?php
				buildYesNoRadioButton('dishwasher' , $rows['0']['dishwasher']);
				?>
			</li>			
			<li>
				<label>Microwave</label>
				<?php
				buildYesNoRadioButton('microwave' , $rows['0']['microwave']);
				?>
			</li>
			<li>
				<label>BBQ</label>
				<?php
				buildYesNoRadioButton('bbq' , $rows['0']['bbq']);
				?>
			</li>
  			</ol>
  		</fieldset>
  	</div>
 	<div class="form_div">
 		<fieldset>	
 			<ol>
		    <li>
		   		<label>Playroom</label>
		   		<?php
		   		buildYesNoRadioButton('playroom' , $rows['0']['playroom']);
		   		?>
		   </li>
			<li>
				<label>Cable TV</label>
				<?php
				buildYesNoRadioButton('cable' , $rows['0']['cable']);
				?>
			</li>		
			<li>
				<label>Satellite TV</label>
				<?php
				buildYesNoRadioButton('satellite' , $rows['0']['satellite']);
				?>
			</li>
			<li>
				<label>Internet</label>
				<?php
				buildYesNoRadioButton('internet' , $rows['0']['internet']);
				?>
			</li>
			<li>
				<label>Wifi</label>
				<?php
				buildYesNoRadioButton('wifi' , $rows['0']['wifi']);
				?>
			</li>
			<li>
				<label>DVD Player</label>
				<?php
				buildYesNoRadioButton('dvd' , $rows['0']['dvd']);
				?>
			</li>		
 			</ol>
   		</fieldset>
   	</div>

   	<div class="form_div">
   		<fieldset>	
   			<ol>
			<li>
				<label>Jacuzzi or Hot Tub</label>
				<?php
				buildYesNoRadioButton('jacuzzi_or_hot_tub' , $rows['0']['jacuzzi_or_hot_tub']);
				?>
			</li>
			<li>
				<label>Pool</label>
				<?php
				buildYesNoRadioButton('pool' , $rows['0']['pool']);
				?>
			</li>
			<li>
				<label>Sauna</label>
				<?php
				buildYesNoRadioButton('sauna' , $rows['0']['sauna']);
				?>
			</li>
			<li>
				<label>Hairdryer</label>
				<?php
				buildYesNoRadioButton('hairdryer' , $rows['0']['hairdryer']);
				?>
			</li>
			</ol>
	  	</fieldset>
	  </div>
	
  	<div class="form_div">
  		<fieldset>	
  			<ol>
			<li>
				<label>Laundry Facilities</label>
				<?php
				buildYesNoRadioButton('laundry_facilities' , $rows['0']['laundry_facilities']);
				?>
			</li>
			<li>		
				<label>Washing Machine</label>
				<?php
				buildYesNoRadioButton('washing_machine' , $rows['0']['washing_machine']);
				?>
			</li>
			</ol>
  		</fieldset>
  	</div>



  	<div class="form_div">
  		<fieldset>	
  			<ol>
			<li>
				<label>Safe</label>
				<?php
				buildYesNoRadioButton('safe' , $rows['0']['safe']);
				?>
			</li>
			<li>
				<label>Ski Locker</label>
				<?php
				buildYesNoRadioButton('ski_locker' , $rows['0']['ski_locker']);
				?>
			</li>
  			</ol>
    	</fieldset>
    </div>

    <div class="form_div">
    	<fieldset>	
    		<ol>
			<li>
				<label>Children</label>
				<?php
				buildYesNoRadioButton('children', $rows['0']['children'], 'yes');
				?>
			</li>
			<li>
				<label>Pets</label>
				<?php
				buildYesNoRadioButton('pets', $rows['0']['pets'], 'yes');
				?>
			</li>
			<li>
				<label>Smoking</label>
				<?php
				buildYesNoRadioButton('smoking', $rows['0']['smoking'],'yes');
				?>
			</li>	
			</ol>
		</fieldset>
	</div>

			
	<div class="form_div">
		<fieldset>	
			<ol>
				<li>
					<label>&nbsp;</label>
					<input type="submit" name="submit" class="submit" value="<?php print $form_button ?>" />
				</li>
					<input type="hidden"  name="<?php print $property_action ;?>" value="1" />
					<input type="hidden"  name="property_id" value="<?php print $_GET['property_id'];?>" />					
					<input type="hidden"  name="property_facilities_id" value="<?php print $rows['0']['property_facilities_id'];?>" />					
										
				</ol>
		</fieldset>
</div>
</form>
