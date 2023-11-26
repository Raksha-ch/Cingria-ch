<form id="create_profile_form" action="" method="post" enctype="multipart/form-data">
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
                  if($key[0] == $_POST['profile_id']) { print 'selected="selected" ';}
                print '>'.$key[1].' '.$key[2].'</option>';		
              }
              ?>
          </select>
        </li>
        <li>
          <label>Titre de  la page</label>
          <input type="input" class="input" name="page_title" value="<?php print $_POST['page_title'] ?>" />
        </li>
        <li>
          <label>Page de type</label>
          <select name="page_type" class="short_select">
            <option value="0">Choisir...</option>
            <option value="1">Texte</option>
            <option value="2">Audio</option>
            <option value="3">Vid&eacute;o</option>
            <option value="4">Discographie</option>
          </select>
        </li>

        <li>
          <label>Dossier m&eacute;dia<br/><span class="tinygreyinfo">D&eacute;pend du type de page</span></label>
          <select name="dir_name" class="short_select">
            <option value="0">Choisir...</option>
              <?php
              print $uploader->getDirectoriesArray( "uploads");
              ?>
          </select>
        </li>
        <li>
          <label>Media URL<br/><span class="tinygreyinfo">N&eacute;cessaire pour les pages de type vid&eacute;o</span></label>
          <input type="input" class="input" name="media_url" value="<?php print $_POST['media_url'] ?>"/>
        </li>
        <li>
          <label>Discographie<br/><span class="tinygreyinfo">N&eacute;cessaire pour les pages de type discographie</span></label>
          <select name="discography_id" class="short_select">
            <option value="">Choisir...</option>
              <?php
              $rows_discography =  $crud->select('num','discography','discography_id,discography_title','','','discography_title ASC','','','');
              foreach ($rows_discography as $key) {
                print '<option value="'.$key[0].'"';
                  if($key[0] == $_POST['discography_id']) { print 'selected="selected" ';}
                print '>'.$key[1].'</option>';		
              }
              ?>
          </select>
        </li>
        <li>
          <label>Position</label>
          <input type="input" class="input" name="page_rank" value="<?php print $_POST['page_rank'] ?>"/>
        </li>


        <li>					

            <textarea class="long_textarea_input" name="page_content"></textarea>
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
            <input type="submit" name="submit" class="submit" value="Cr&eacute;er une page" />
        </li>

          <input type="hidden"  name="create_page" value="1" />
        </ol>
      </fieldset>
    </form>
</div>
<script type="text/javascript" src="wmd/wmd.js"></script>
