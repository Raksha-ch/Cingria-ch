<div class="form_div">
  <div id="info_bar">
    RENAME DIRECTORY FORM
  </div>
      <form id="rename_directory_form" action="" method="post" enctype="multipart/form-data">
        <fieldset>
          <ol>
              <li>
              <label>Directory Name</label>
              <input type="input" class="input" value="<?php print $dirs['dir_name']?>" name="new_dir_name" />
            </li>
            <li class="bottom">
              <label>&nbsp;</label>
              <input type="hidden"  name="rename_dir" value="1" />
              <input type="hidden"  name="old_dir_name" value="<?php print $_GET['dir_name'];?>" />
              <input type="hidden"  name="dir_root" value="<?php print $dirs['dir_path'];?>" />
                <input type="submit" name="submit" class="submit" value="Rename Directory" />
            </li>
            </ol>
          </fieldset>
        </form>
</div>

<div class="toggle_info">
  <div id="display_errors">
    <?php
    print $dir_existence_error;
    ?>
  </div>
</div>
