<?php

if ($_GET['info_box']=='edited') {

  $edited_info_r = unserialize($_GET['serialized_info']);
  if(empty($edited_info_r)) {
    print 'Serialized info array in empty.';
  }

  switch ($_GET['info_box_type']) {
    case 'profile':
      $edited_info = "Profile of <strong>'.$edited_info_r[name].' '.$edited_info_r[surname].'</strong>";
      $created_info_1 = "New profile";
      $created_info_2 = "created";
      break;
    case 'upload':
      $edited_info = "File <strong>'.$edited_info_r[name].' '.$edited_info_r[extension].'</strong>";
      $created_info_1 = "New file";
      $created_info_2 = "uploaded";
      break;	
    case 'newsletter':
      $edited_info = "Newsletter <strong>'.$edited_info_r[newsletter_title].' [#'.$edited_info_r[newsletter_id].']</strong>";
      $created_info_1 = "The newsletter";
      $created_info_2 = "recorded";
      break;
    case 'pool':
      $edited_info = "Pool <strong>'.$edited_info_r[pool_name].'</strong>";
      $created_info_1 = "The pool";
      $created_info_2 = "created";
      break;	
  }

  print <<<EDITEDINFO
  <div class="info_bar">EDIT INFO</div>
    <div class="info_box">
      <fieldset class="info">
      <br/>{$info} has been successfully edited.<br/><br/>
      </fieldset>
    </div>
EDITEDINFO;
}

if ($_GET['info_box']=='created') {
  print <<<CREATEDINFO
  <div class="info_bar">PROFILE INFO</div>
    <div class="info_box">
      <fieldset class="info">
      <br/><strong>{$created_info_1}</strong> has been successfully {$created_info_2}.<br/><br/>
      </fieldset>
    </div>
CREATEDINFO;
}



?>