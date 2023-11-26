<div class="list_div">
  <div id="info_bar">
    USER LIST &nbsp; &middot; &nbsp; There are <em><?php $crud->countRecords('admin');?> records</em> in table <em>
    <?php print ucfirst($extenser->getTable());?></em>
  </div>

  <fieldset>	
  <?php	
  foreach($rows as $row) {
    /*
  $admin_id		
    $admin_name 	
    $admin_surname 	
    $admin_email 	
    $admin_password
    $admin_group    */

    foreach($rows as $row) {
    print <<<EOD
    <li>
      <span style="float:left;"><strong>{$row[admin_name]}{$row[admin_surname]}</strong></span>
      <span style="float:right;">
      <a href="?page=extender&amp;action=delete_brand&amp;brand_id={$row[admin_id]}" onclick="return(confirm('Delete brand?'));" class="delete_hover">
      delete
      </a> |
      <a href="?page=extender&amp;action=rename_brand&amp;brand_id={$row[admin_id]}">
      rename
      </a>
      </span>
    </li>
EOD;
}
  ?>
  </fieldset>
</div>

<?php
if ($_GET['info_box']=='edited') {
  $profile_info_r = unserialize($_GET['serialized_info']);
  print <<<EDITEDINFO
  <div class="info_bar">EDIT INFO</div>
    <div class="info_box">
      <fieldset class="info">
      <br/>Profile of <strong>{$profile_info_r['name']} {$profile_info_r['surname']}</strong> has been successfully edited.<br/><br/>
      </fieldset>
    </div>
EDITEDINFO;
}

if ($_GET['info_box']=='created') {
  print <<<CREATEDPROFILE
  <div class="info_bar">PROFILE INFO</div>
    <div class="info_box">
      <fieldset class="info">
      <br/><strong>New profile</strong> has been successfully created.<br/><br/>
      </fieldset>
    </div>
CREATEDPROFILE;
}


?>

<?php if ($_SESSION['toggler_state']=='on') { ?>
    <div class="debug_bar">SORTING &amp; DISPLAYING PREFERENCES</div>
      <div class="info_box">
      <fieldset class="info">
        <form action="" method="" name="jump" id="jump" accept-charset="utf-8">
           <br/>&nbsp; Sort by :<br/><br/>
          <select name="sorting_list" id="sorting_list" onchange="go()"><?php print $sort_menu;?></select>
          <br/><br/>
        </form>

        <form action="" method="" name="jump2" id="jump2" accept-charset="utf-8">
           <br/>&nbsp; Display style :<br/><br/>
          <select name="displaying_list" id="displaying_list" onchange="go2()"><?php print $display_menu;?></select>
          <br/><br/>
        </form>
      </fieldset>
    </div>
<?php } ?>
