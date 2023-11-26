<div class="form_div">
  <div id="info_bar">
    CAT&Eacute;GORIES &nbsp; &middot; &nbsp; Il y  <em><?php print $crud->countRecords('category');?> cat&eacute;gories et sous-cat&eacute;gories</em> dans table <em>
    Cat&eacute;gorie</em>
  </div>

      <form id="add_category_form" action="" method="post" enctype="multipart/form-data">
        <fieldset>
          <ol>
              <li>
              <label>Nom de la cat&eacute;gorie</label>
              <input type="input" class="input" name="category_name" />
            </li>
            <li>
              <label>Parent de la cat&eacute;gorie </label>
              <select name="category_parent_id" class="short_select">
                <option value="0">Aucun - La nouvelle cat&eacute;gorie est parent</option>
                <?php
                foreach ($cat_rows as $key) {
                  print '<option value="'.$key[0].'">'.$key[2].'</option>';		
                }
                ?>
              </select>
            </li>
            <li class="bottom">
              <label>&nbsp;</label>
              <input type="hidden" name="add_category" value="1" />
                <input type="submit" name="submit" class="submit" value="Ajouter" />
            </li>
            </ol>
          </fieldset>
        </form>
</div>

<div class="list_div">
  <fieldset>
    <div id="recursive_menu">	
      <?php
      print $extender->display_recursive_menu(0, 0, $rows, 'category');	
      ?>
    </div>
  </fieldset>
</div>

