<form id="edit_property_form" action="" method="post">
<div class="form_div">
  <div id="info_bar">EDIT PROPERTY</div>		
    <fieldset>	
      <ol>
        <li>
          <label><em>*</em> Property Name</label>
          <input type="input" class="input"  value="<?php print $rows['0']['property_name'] ;?>" name="property_name" />
        </li>
        <li>
          <label>Property Official Name</label>
          <input type="input" class="input" value="<?php print $rows['0']['property_official_name'] ;?>" name="property_official_name" />
        </li>
        <li>
          <label><em>*</em> Category </label>
          <select name="category_id" class="short_select">
            <option value="">Select...</option>
            <?php
            $rowx  =  $crud->select( 'num' , 'category' , '*' , '', '' ,  'category_id ASC' , '', '' , '' );					
            foreach ($rowx as $key) {
              print '<option value="'.$key[0].'"';
                if( $key[0] == $rows['0']['category_id'] ) { print ' selected="selected"' ;}
              print '>'.$key[2].'</option>';		
            }
            ?>
          </select>
        </li>
        <li>
          <label><em>*</em> Subcategory </label>
          <select name="subcategory_id" class="short_select">
            <option value="">Select...</option>
            <?php
            $rowss  =  $crud->select( 'num' , 'subcategory' , '*' , '', '' ,  'subcategory_id ASC' , '', '' , '' );					
            foreach ($rowss as $key) {
              print '<option value="'.$key[0].'"';
                if( $key[0] == $rows['0']['subcategory_id'] ) { print ' selected="selected"' ;}
              print '>'.$key[2].'</option>';		
            }
            ?>
          </select>
        </li>
        <li>
          <label>Is this property LastMinute?</label>
          <?php
          buildYesNoRadioButton( 'property_last_minute', $rows['0']['property_last_minute'], 'no');
          ?>
        </li>
        <li>
          <label>Has this property got a Virtual Tour?</label>
          <?php
          buildYesNoRadioButton('property_virtual_tour', $rows['0']['property_virtual_tour'] ,'no');
          ?>
        </li>
        <li>
          <label>Property Stars</label>
          <select name="property_star" class="short_select">
            <?php buildNumberSelector( $rows['0']['property_star'] , 0 , 5) ;?>
          </select>					
        </li>
        <li>
           <label>Owner </label>
           <select name="profile_id" class="short_select">
            <option value="0">Select...</option>
            <?php
            $where = ' profile_category_id = 2 ';							
            $rowy  =  $crud->select( '' , 'profile' , '*' , '' , $where ,  'profile_surname ASC' , '', '' , '' );					
            foreach ($rowy as $key) {
              print '<option value="'.$key['profile_id'].'"';
              if( $key['profile_id'] == $rows['0']['profile_id'] ) { print ' selected="selected"' ;}
              print '>'.strtoupper($key['profile_surname']).' '.$key['profile_name'].'</option>';		
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
          <label>Address</label>
          <input type="input" class="input" value="<?php print $rows['0']['property_address'] ;?>" name="property_address" />
        </li>
        <li>
          <label>Longitude</label>
          <input type="input" class="input" value="<?php print $rows['0']['property_long'] ;?>" name="property_long" />
        </li>
        <li>
          <label>Latitude</label>
          <input type="input" class="input" value="<?php print $rows['0']['property_lat'] ;?>" name="property_lat" />
        </li>
        <li>
          <label>Pictures Directory</label>
          <select name="dir_name" id="dir_name" class="short_select">
            <option value="<?php print $rows['0']['dir_name'] ;?>"><?php $dir = explode('/' , $rows['0']['dir_name']); print array_pop($dir); ?></option>
            <option value="<?php print $rows['0']['dir_name'] ;?>">----------------------------------------------------</option>
            <option value="0">Select...</option>
            <?php
            print $uploader->getDirectoriesArray( "uploads");
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
          <label>Rank</label>
          <select name="property_rank" class="short_select">
            <?php buildNumberSelector( $rows['0']['property_rank'] , 1 , 200) ;?>
          </select>					
        </li>
        <li>
          <label>Available Property?</label>
          <?php
          buildYesNoRadioButton( 'property_display', $rows['0']['property_display'], 'yes');
          ?>
        </li>
        <li>
          <label>Available Calendar?</label>
          <?php
          buildYesNoRadioButton( 'property_calendar_display', $rows['0']['property_calendar_display'], 'yes');
          ?>
        </li>
      </ol>
    </fieldset>
  </div>

  <div class="form_div">
    <fieldset>	
      <ol>
        <li class="bottom">
          <label>&nbsp;</label>
          <input type="submit" name="submit" class="submit" value="Edit Property" />
        </li>
          <input type="hidden"  name="property_modification_date" value="<?php print date('Y-m-d');?>" />
          <input type="hidden"  name="property_id" value="<?php print $rows['0']['property_id'] ;?>" />
          <input type="hidden"  name="slice" value="<?php print $_GET['slice'] ;?>" />

        </ol>
    </fieldset>
</div>
</form>
