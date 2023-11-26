<div class="form_div">
  <div id="info_bar">
    RENOMMER LA CAT&Eacute;GORIE
  </div>
      <form id="rename_category_form" action="" method="post" enctype="multipart/form-data">
        <fieldset>
          <ol>
              <li>
              <label>Nom de la cat&eacute;gorie</label>
              <input type="input" class="input" value="<?php print $rows['0']['category_name'];?>" name="category_name" />
            </li>
            <li class="bottom">
              <label>&nbsp;</label>
              <input type="hidden"  name="rename_category" value="1" />
              <input type="hidden"  name="category_id" value="<?php print $rows['0']['category_id'];?>" />
                <input type="submit" name="submit" class="submit" value="Renommer" />
            </li>
            </ol>
          </fieldset>
        </form>
</div>


