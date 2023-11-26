<div class="list_div">
  <div id="info_bar">
    NEWS LIST &nbsp; &middot; &nbsp; There are
    <em><?php print $crud->countRecords( 'news');?> news</em> in table
    <em><?php print ucfirst($writer->getTable());?></em>
  </div>

  <fieldset>
   <?php
    foreach($rows as $row) {

     $category = $row['news_category_name'];
     $description = truncateString( $row['news_description'] , 12 );
  $title = truncateString( $row['news_title'] , 24 );

     $rank = $row['news_rank'];
     $language = $row['language_short_name'];
     $id = $row['news_id'];

    if($rowz['writing_publication_end_date'] < date('Y-m-d')) { $due = '<img src="img/icons/attention.png" alt="attention" />';} else { $due = '';}
    if($rowz['writing_publication_start_date'] > date('Y-m-d')) { $start = '<img src="img/icons/watch.png" alt="attention" />';} else { $start = '';}

     if($row['news_publication_end_date'] < date('Y-m-d')) { $due = '<img src="img/icons/attention.png" alt="attention" />';}	else { $due = '';}
     if($row['news_status'] == 0) { $status = '<img src="img/icons/crossedeye.png">';}		else { $status = '<img src="img/icons/default.png">';}

print <<<EOD

  <li>
    <span style="float:left;">
      <span style="float:left; width: 16px;">$status</span>
      <span class="tinygreyinfo" style="width: 44px; float:left;"> [$rank] [$language] </span>
      <span>$start $due</span>
      <strong>$category</strong> / $title

      <span class="tinygreyinfo">$description</span>
    </span>
    <span style="float:right;">
      <a href="?page=writer&amp;action=delete_news&amp;news_id=$id" onclick="return(confirm('Delete news?'));" class="delete_hover">delete</a> |
      <a href="?page=writer&amp;action=edit_news&news_id=$id ">edit/show</a>
      </span>
  </li>
EOD;
}
?>	
  </fieldset>

</div>

<div id="pager_sorter">

  <?php

  if ($_GET['info_box']=='edited') {
    $edit_writing_info = unserialize($_GET['serialized_info']);
    print <<<EDITEDINFO
    <div class="info_bar">EDIT INFO</div>
      <div class="info_box">
        <fieldset class="info">
        <br/>Writing <strong>{$edit_writing_info['title']} </strong> has been successfully edited.<br/><br/>
        </fieldset>
      </div>
EDITEDINFO;
  }

    if ($_GET['info_box']=='created') {
      $create_writing_info = unserialize($_GET['serialized_info']);
      print <<<CREATEDINFO
      <div class="info_bar">EDIT INFO</div>
        <div class="info_box">
          <fieldset class="info">
          <br/>Writing <strong>{$create_writing_info['title']} </strong> has been successfully created.<br/><br/>
          </fieldset>
        </div>
CREATEDINFO;
    }
?>


  <?php include 'views/paginater/view.paginater.php' ;?>
    <?php include 'views/sorter/view.sorter.php' ;?>
</div>




