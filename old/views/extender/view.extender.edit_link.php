<div class="form_div">
  <div id="info_bar">
    EDIT LINK FORM
  </div>

      <form id="edit_link_form" action="" method="post" enctype="multipart/form-data">
        <fieldset>
          <ol>
              <li>
              <label>Link URL<br/><span class="tinygreyinfo">e.g. http://www.link.com</span></label>
              <input type="input" class="input" value="<?php print $rows['0']['link_url'];?>" name="link_url" />
            </li>
            <li>
              <label>Link Language</label>
              <select name="language_id" class="short_select">
                <option value="">Select...</option>
                <?php

                $rowst  =  $crud->select( 'num' , 'language' , '*' , '', '' ,  'language_id ASC' , '', '' , '' );
                foreach ($rowst as $key) {
                  print '<option value="'.$key[0].'"';
                    if($key[0] == $rows['0']['language_id']) { print ' selected="selected"';}
                  print '>'.$key[1].'</option>';		
                }
                ?>
              </select>
            </li>
            <li>
              <label>Link Title<br/><span class="tinygreyinfo">e.g. link.com or link</span></label>
              <input type="input" class="input" value="<?php print $rows['0']['link_title'];?>"  name="link_title" />
            </li>
            <li>
              <label>Link Description</label>
              <textarea name="link_description" class="textarea_input"><?php print $rows['0']['link_description'];?></textarea>
            </li>
              <li>
                <label>Link Rank</label>
                  <select name="link_rank" class="short_select">
                  <?php
                  $i = count($link_rows);
                  if($i == 0) { $i = 1;}
                  $j = 1;
                  while ($j <= $i) {
                  print '<option value="'.$j.'"';
                    if($j == $rows['0']['link_rank']) { print 'selected="selected" ';}
                  print '>'.$j.'</option>';
                  $j++;
                  }
                  ?>
                  </select>
              </li>
            <li>
              <label>Link Category</label>
              <select name="link_category_id" class="short_select">
                <option value="0">Select...</option>
                <?php
                foreach ($cat_rows as $keys) {
                  print '<option value="'.$keys[0].'"';
                    if($keys[0] == $rows['0']['link_category_id']) { print 'selected="selected" ';}
                  print '>'.$keys[2].'</option>';		
                }
                ?>
              </select>
            </li>
              <li>
                <label>Link Status</label>
                  <select name="link_status" class="short_select">
                    <option value="1" <?php if($rows['0']['link_status'] == 1) { print 'selected="selected" ';}?>>Active</option>
                    <option value="2" <?php if($rows['0']['link_status'] == 2) { print 'selected="selected" ';}?>>Hidden</option>
                  </select>
              </li>
            <li class="bottom">
              <label>&nbsp;</label>
              <input type="hidden" name="edit_link" value="1" />
              <input type="hidden" name="link_id" value="<?php print $rows['0']['link_id'];?>" />
              <input type="hidden" name="link_modification_date" value="<?php print date('Y-m-d');?>" />
                <input type="submit" name="submit" class="submit" value="Edit Link" />
            </li>
            </ol>
          </fieldset>
        </form>
</div>