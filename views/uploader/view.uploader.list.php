<div class="list_div">
  <div id="info_bar">CURRENT FOLDER</div>
  <form action="" method="get" name="" id="" accept-charset="utf-8">
    <input type="hidden" name="page" value="uploader" >
    <input type="hidden" name="action" value="list" >
    <fieldset>
      <ol>
        <li>
          <label>Select directory</label>
          <select name="dir_name" id="dir_name" class="short_select" onchange="submit()">
            <option value="all">Display all</option>
            <option value="all">--------------------------------------------------</option>
            <?php
            print $uploader->getDirectoriesArray( "uploads");
            ?>
          </select>
        </li>
        </ol>
      </fieldset>
    </form>
</div>
<div id="pager_sorter">
  <?php include 'views/paginater/view.paginater.php'; ?>
  <?php include 'views/sorter/view.sorter.php'; ?>
</div>
<div class="list_div">
    <div id="info_bar">FILES LIST
      <?php if(isset($_GET['dir_name']) && ($_GET['dir_name'] != 'all') ) { ?>
       &nbsp; &middot; &nbsp; There
      <?php
      print( $session->getSessionVar('total_records') < 2 ) ? ' is <em>' : ' are <em>' ;
      print $session->getSessionVar('total_records');
      print( $session->getSessionVar('total_records') > 1 ) ? ' files' : ' file' ;?>
      </em> in directory
      <em><?php print ucfirst($uploader->getTable());?></em>
      <?php } else {
        print '&nbsp; &middot; &nbsp; <em>Read only!</em>';
      }?>
    </div>
    <fieldset>	
    <ol>

    <?php

    if(!isset($_GET['dir_name']) || ($_GET['dir_name'] == 'all') ) {

        $uploader->getDirectoriesArray( "uploads", false , 'return_links');

    }


    else {

      if(sizeof($rows)== 0) {
        print '<li>There are no files in this directory yet.</li>';
      }

    foreach($rows as $row) {

      $where = " language_id = " . $row['language_id'];
      $rowx =  $crud->select( '' , 'language' , '*' , '' , $where , '' , '' , 1 , 0 );
      foreach($rowx as $rox) {
        $language =  $rox['language_short_name'];
      }




      $slice		= $_GET['slice'];
      $file_id 	= $row['upload_file_id'];
      $file_title = $row['upload_file_title'];
      $file 		= $row['upload_file_name'].$row['upload_file_ext'];
      $dir_name 	= $row['dir_name'];
      $file_url 	= $dir_name.'/'.$file;	
      $uploader->setFileUrl($file_url);
      $file_name 	= ($_GET['file'] == $file) ? '<img src="img/icons/tick.png" alt="ok" class="icon" />&nbsp;<span style="color: #87CC7B;"><strong>'.$file.'</strong>' : $file;
      $icon		= '<img src="'.$uploader->getFileExtensionIcon($row['upload_file_ext']).'" alt="" class="icon"/>';	
      $popup 		= ($uploader->filterDisplayableFiles($row['upload_file_ext'])) ? img_popup($file_url) : '';
      $status 	= ($row['upload_file_display'] == 0) ? '<img src="img/icons/crossedeye.png" alt="ok" class="icon" />' : '<img src="img/icons/default.png" alt="ok" class="icon" />';
      $file_rank 	= $row['upload_file_rank'];
      $resize 	= ($uploader->filterDisplayableFiles($row['upload_file_ext'])) ? '<a href="?page=uploader&amp;action=resize&amp;upload_file_id='.$row['upload_file_id'].'&dir_name='.$dir_name.'&slice='.$_GET['slice'].'">resize</a> |':'';

      print <<<RECORDS
      <li>
        <span style="float:left;">
          <a href="$file_url" $popup><span style="float:left; width: 14px;">$status</span> $icon <span class="tinygreyinfo">[$file_rank] [$language] </span> $file_title</a>
        </span>
        <span style="float:right;">
           <a href="?page=uploader&amp;action=delete&amp;dir=$dir_name&amp;file_to_be_trashed=$file&file_field=upload_file_id&file_id=$file_id" onclick="return(confirm('Delete?'));" class="delete_hover">delete</a> |  $resize
          <a href="?page=uploader&amp;action=edit&upload_file_id=$file_id&slice=$slice">edit/show</a>
        </span>
      </li>	
RECORDS;
    }
    }
    ?>
    </ol>
    </fieldset>
  </div>



<div class="toggle_info">
<?php
if ($_GET['info_box']=='uploaded') {
  $upload_info_r = unserialize($_GET['serialized_info']);
  print <<<UPLOADINFO
  <div class="info_bar">UPLOAD INFO</div>
    <div class="info_box">
      <fieldset class="info">
        <br/>
        <strong>Name : </strong>{$upload_info_r[name]}<br/>
        <strong>Type : 	</strong>{$upload_info_r['type']}<br/>
        <strong>Filesize : </strong>{$upload_info_r['filesize']}KB<br/><br/>
        <strong>{$upload_info_r['name']}{$upload_info_r['extension']}</strong> has been <br/>uploaded to directory <strong>{$upload_info_r['target']}</strong>
        <div class="uploaded_img"><img src="{$upload_info_r['target']}{$upload_info_r['name']}{$upload_info_r['extension']}" alt="" /></div>
      </fieldset>
    </div>
UPLOADINFO;
}

if ($_GET['info_box']=='edited') {
  $upload_info_r = unserialize($_GET['serialized_info']);
  print <<<EDITEDINFO
  <div class="info_bar">EDIT INFO</div>
    <div class="info_box">
      <fieldset class="info">
      <br/>File <strong>{$upload_info_r['name']}{$upload_info_r['extension']}</strong> has been successfully edited.<br/><br/>
      </fieldset>
    </div>
EDITEDINFO;
}


if ($_GET['info_box']=='resized') {
  $resized_image_info_r = unserialize($_GET['serialized_info']);
  print <<<RESIZEDINFO
  <div class="info_bar">RESIZED IMAGE INFO</div>
    <div class="info_box">
      <fieldset class="info">
      <br/>Image <strong>{$resized_image_info_r['name']}{$resized_image_info_r['extension']}</strong> has been successfully resized.<br/><br/>
      <table>
        <tr><td><strong>Resized width</strong></td><td>: {$resized_image_info_r['width']}px</td></tr>
        <tr><td><strong>Resized height</strong></td><td>: {$resized_image_info_r['height']}px</td></tr>
        <tr><td><strong>Image quality</strong></td><td>: {$resized_image_info_r['quality']}</td></tr>
      </table>
      </fieldset>
    </div>
RESIZEDINFO;
}

?>

</div>









