<form id="create_profile_form" action="" method="post" enctype="multipart/form-data">
<div class="form_div">
  <div id="info_bar">EDITER UN DISQUE</div>
    <fieldset>
      <ol>
        <li>
          <label>Entr&eacute;e attribu&eacute;e &agrave;</label>
          <select name="discography_id" class="short_select">
            <option value="">Choisir...</option>
              <?php
              $rows_discography =  $crud->select('num','discography','*','','','discography_title ASC','','','');
              foreach ($rows_discography as $key) {
                print '<option value="'.$key[0].'"';
                  if($key[0] == $rows['0']['discography_id']) { print 'selected="selected" ';}
                print '>'.$key[1].'</option>';		
              }
              ?>
          </select>
        </li>
        <li>
          <label>Titre du disque</label>
          <input type="input" class="input" name="discography_item_title" value="<?php print $rows['0']['discography_item_title'] ?>" />
        </li>

        <li>
          <label>Infos label / opus</label>
          <input type="input" class="input" name="discography_label" value="<?php print $rows['0']['discography_label'] ?>" />
        </li>

        <li>
          <label>Ann&eacute;e de sortie</label>
          <input type="input" class="input" name="discography_release" value="<?php print $rows['0']['discography_release'] ?>" />
        </li>
        <li>
          <label>Couverture</label>
          <select name="upload_file_id" id="upload_file_id" class="short_select">
            <option value="0">Select...</option>
            <?php
              $where = ' dir_name = "uploads/discographies" ';
              $rowx =  $crud->select('','upload_file','*','',$where,'','upload_file_name ASC','','');
              foreach ($rowx as $rox) {
                if($rox['upload_file_display']=='0'){$status = ' &nbsp; ( off )';} else { $status= '';}
                print '<option value="'.$rox['upload_file_id'].'"';

                  if($rox['upload_file_id'] == $rows['0']['upload_file_id'] ) { print ' selected="selected"' ;}

                print '>'.$rox['upload_file_name'].$rox['upload_file_ext'].$status.'</option>';
              }
            ?>
          </select>
        </li>

        <li>					

            <textarea class="long_textarea_input" name="discography_item_content"><?php print $rows['0']['discography_item_content']; ?></textarea>
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
            <input type="submit" name="submit" class="submit" value="&Eacute;diter une entr&eacute;e" />
        </li>
          <input type="hidden"  name="discography_item_id" value="<?php print $rows['0']['discography_item_id']; ?>" />
          <input type="hidden"  name="edit_discography_item" value="1" />
        </ol>
      </fieldset>
    </form>
</div>
<script type="text/javascript" src="wmd/wmd.js"></script>