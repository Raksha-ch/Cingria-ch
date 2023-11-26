<div class="form_div">
  <div id="info_bar">
    USER LIST &nbsp; &middot; &nbsp; There are <em><?php print $crud->countRecords('admin');?> records</em> in table <em>
    <?php print ucfirst($crud->getTable());?></em>
  </div>

    <form id="add_user_form" action="" method="post" enctype="multipart/form-data">
      <fieldset>
        <ol>
            <li>
            <label>User Name</label>
            <input type="input" class="input" name="admin_name" />
          </li>
          <li>
            <label>User Surname</label>
            <input type="input" class="input" name="admin_surname" />
          </li>
          <li>
            <label>User Email</label>
            <input type="input" class="input" name="admin_email" />
          </li>
          <li>
            <label>User Password</label>
            <input type="password" class="input" name="admin_password" />
          </li>
          <li>
            <label>User Group</label>
            <select name="admin_group" class="short_select">
              <option value="1">Administrator - All rights</option>
              <option value="2">User - No rights</option>
            </select>
          </li>
          <li class="bottom">
            <label>&nbsp;</label>
            <input type="hidden" name="add_user" value="1" />
              <input type="submit" name="submit" class="submit" value="Add User" />
          </li>
          </ol>
        </fieldset>
      </form>
  </div>

  <div class="list_div">	
  <fieldset>	
  <?php	
    foreach($rows as $row) {
    print <<<EOD
    <li>
      <span style="float:left;"><strong>{$row[admin_name]} {$row[admin_surname]}</strong> | <a href="mailto:{$row[admin_email]}">{$row[admin_email]}</a> <span style="color: #CCC;">[Group {$row[admin_group]}]</span></span>
      <span style="float:right;">
      <a href="?page=extender&amp;action=delete_user&amp;admin_id={$row[admin_id]}" onclick="return(confirm('Delete user?'));" class="delete_hover">
      delete
      </a> |
      <a href="?page=extender&amp;action=edit_user&amp;admin_id={$row[admin_id]}">
      edit
      </a>
      </span>
    </li>
EOD;
}
  ?>
  </fieldset>
</div>



