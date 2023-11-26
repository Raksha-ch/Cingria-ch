<div class="form_div">
  <div id="info_bar">
    RENAME SUBCATEGORY FORM
  </div>
      <form id="rename_subcategory_form" action="" method="post" enctype="multipart/form-data">
        <fieldset>
          <ol>
              <li>
              <label>Subcategory Name</label>
              <input type="input" class="input" value="<?php print $rows['0']['subcategory_name'];?>" name="subcategory_name" />
            </li>
            <li class="bottom">
              <label>&nbsp;</label>
              <input type="hidden"  name="rename_subcategory" value="1" />
              <input type="hidden"  name="subcategory_id" value="<?php print $rows['0']['subcategory_id'];?>" />
                <input type="submit" name="submit" class="submit" value="Rename Subcategory" />
            </li>
            </ol>
          </fieldset>
        </form>
</div>


