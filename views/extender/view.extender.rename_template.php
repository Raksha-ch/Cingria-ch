<div class="form_div">
  <div id="info_bar">
    RENAME TEMPLATE FORM
  </div>
      <form id="rename_category_form" action="" method="post" enctype="multipart/form-data">
        <fieldset>
          <ol>
              <li>
              <label>Template Name</label>
              <input type="input" class="input" value="<?php print $rows['0']['template_name'];?>" name="template_name" />
            </li>
            <li class="bottom">
              <label>&nbsp;</label>
              <input type="hidden"  name="rename_template" value="1" />
              <input type="hidden"  name="template_id" value="<?php print $rows['0']['template_id'];?>" />
                <input type="submit" name="submit" class="submit" value="Rename Template" />
            </li>
            </ol>
          </fieldset>
        </form>
</div>


