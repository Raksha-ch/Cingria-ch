<form id="edit_page_form" action="" method="post" enctype="multipart/form-data">
<div class="form_div">
  <div id="info_bar">PAGE</div>
    <fieldset>
      <ol>
        <li>
          <label>Page attribu&eacute;e &agrave;</label>
          <select name="profile_id" class="short_select">
            <option value="">Choisir...</option>
              <?php
              $rows_profile_category =  $crud->select('num','profile','profile_id,profile_name,profile_surname','','','profile_surname ASC','','','');
              foreach ($rows_profile_category as $key) {
                print '<option value="'.$key[0].'"';
                  if($key[0] == $rows['0']['profile_id']) { print 'selected="selected" ';}
                print '>'.$key[1].' '.$key[2].'</option>';		
              }
              ?>
          </select>
        </li>
        <li>
          <label>Titre de la page</label>
          <input type="input" class="input" name="page_title" value="<?php print $rows['0']['page_title'] ?>" />
        </li>
        <li>
          <label>Page de type</label>
          <select name="page_type" class="short_select">
            <option value="0" >Choisir...</option>
             <option value="1" <?php if($rows['0']['page_type'] == 1) { print 'selected="selected"';} ?>>Texte</option>
             <option value="2" <?php if($rows['0']['page_type'] == 2) { print 'selected="selected"';} ?>>Audio</option>
             <option value="3" <?php if($rows['0']['page_type'] == 3) { print 'selected="selected"';} ?>>Vid&eacute;o</option>
             <option value="4" <?php if($rows['0']['page_type'] == 4) { print 'selected="selected"';} ?>>Discographie</option>						
          </select>
        </li>

        <li>
          <label>Dossier m&eacute;dia<br/><span class="tinygreyinfo">D&eacute;pend du type de page</span></label>
          <select name="dir_name" class="short_select">
            <?php
            if ($rows['0']['dir_name'] == '0') {
            ?>
            <option value="0">Choisir...</option>
            <?php
            print $uploader->getDirectoriesArray( "uploads");
            } else {

            $dir_name = $rows['0']['dir_name'];
            $arr = explode('/',$rows['0']['dir_name']);
            array_shift($arr);
            $print_dir_name = implode('/',$arr);

            ?>
            <option value="<?php print $dir_name; ?>" selected="selected"><?php print $print_dir_name; ?></option>
            <option value="<?php print $dir_name; ?>">----------------------------------------------------</option>
            <option value="0">Choisir...</option>

            <?php
            print $uploader->getDirectoriesArray( "uploads" );
            }
            ?>
              <?php
              print $uploader->getDirectoriesArray( "uploads");
              ?>
          </select>
        </li>

        <li>
          <label>Media URL<br/><span class="tinygreyinfo">N&eacute;cessaire pour les pages de type vid&eacute;o</span></label>
          <input type="input" class="input" name="media_url" value="<?php print $rows['0']['media_url'] ?>"/>
        </li>
        <li>
          <label>Discographie<br/><span class="tinygreyinfo">N&eacute;cessaire pour les pages de type discographie</span></label>
          <select name="discography_id" class="short_select">
            <option value="">Choisir...</option>
              <?php
              $rows_discography =  $crud->select('num','discography','discography_id,discography_title','','','discography_title ASC','','','');
              foreach ($rows_discography as $key) {
                print '<option value="'.$key[0].'"';
                  if($key[0] == $rows['0']['discography_id']) { print 'selected="selected" ';}
                print '>'.$key[1].'</option>';		
              }
              ?>
          </select>
        </li>

            <li>
              <label>Position</label>
              <input type="input" class="input" name="page_rank" value="<?php print $rows['0']['page_rank'] ?>"/>
            </li>

        <li>					

            <textarea class="long_textarea_input" name="page_content"><?php print $rows['0']['page_content'] ?></textarea>
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
            <input type="submit" name="submit" class="submit" value="Editer une page" />
        </li>
          <input type="hidden"  name="page_id" value="<?php print $rows['0']['page_id'] ?>" />
          <input type="hidden"  name="edit_page" value="1" />
        </ol>
      </fieldset>
    </form>
</div>
<script type="text/javascript" src="wmd/wmd.js"></script>
