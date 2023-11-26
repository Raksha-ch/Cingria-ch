<div id="display_form">
 <form id="add_profile_description" action="" method="post" enctype="multipart/form-data">
 <div class="form_div">
  <div id="info_bar">ADD PROFILE DESCRIPTION</div>
        <fieldset>
          <ol>
        <li>
          <label>* Profile</label>
          <select name="profile_id" class="short_select">
            <option value="0">Select...</option>
            <?php
            $rowx  =  $crud->select( '' , 'profile' , '*' , '', '' , 'profile_surname ASC' , '' ,'' , '' ); 				
            foreach ($rowx as $keyz) {
              print '<option value="'.$keyz['profile_id'].'"';
                if($keyz['profile_id'] == $rows['0']['profile_id']) { print ' selected="selected"' ;}
              print '>'.$keyz['profile_surname'].' '.$keyz['profile_name'].'</option>';
            }
            ?>
          </select>
        </li>

        <li>
          <label>Language</label>
            <select name="language_id" class="short_select">
              <option value="">Select...</option>
                <?php
                  $rowst  =  $crud->select( 'num' , 'language' , '*' , '', '' ,  'language_id ASC' , '' , '' , '' );

                    foreach ($rowst as $key) {
                      print '<option value="'.$key[0].'"';

                        if ( isset( $rows['0']['language_id'] ) ) {

                          if ( $key[0] == $rows['0']['language_id'] ) { print ' selected="selected" ' ;}
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

              <textarea class="long_textarea_input" name="profile_description_content"><?php print $rows['0']['profile_description_content']?></textarea>
              <div style="padding: 12px; float:left;">
                <div class="wmd-preview" style="background-color: #EFEFEF; float:left; padding: 2px;"></div>
              </div>
            </li>
          </ol>
        </fieldset>
      </div>		

      <div class="form_div">
        <fieldset>

              <ol>
        <li class="bottom">
          <label>&nbsp;</label>
            <input type="submit" name="submit" class="submit" value="Edit Profile Description" />
        </li>
          <input type="hidden" name="profile_description_id" value="<?php print $rows['0']['profile_description_id']?>" />
            <input type="hidden" name="edit_profile_description" value="1" />
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
<script type="text/javascript" src="wmd/wmd.js"></script>