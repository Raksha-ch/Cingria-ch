<div class="list_div">
  <div id="info_bar">
    WRITING LIST &nbsp; &middot; &nbsp; There are
    <em><?php print $crud->countRecordsWhere( 'template', 'template_parent_id != 0' );?> templates</em> and
    <em><?php print $crud->countRecords('writing');?> writings</em> in table
    <em><?php print ucfirst($writer->getTable());?></em>
  </div>

  <fieldset>
   <?php

   foreach($rows as $row) {

    $where = 'template_id =' . $row['template_parent_id'];
    $parent =  $crud->select( '' , 'template' , '*' , '', $where, '', '', '1' , '0' );

    $wheres = " template_id = ".$row['template_id'];
    $rowz  =  $crud->select( '' , 'writing' , '*' , '', $wheres , 'writing_title ASC, writing_rank ASC', '', '' , '' ); // get writings
    $nbr_of_writings = count($rowz);	
    $nbr = ( $nbr_of_writings > 1) ? 'writings' : 'writing';


        print <<<EOD
        <li><strong>{$parent['0']['template_name']}</strong> / {$row['template_name']} <span class="tinygreyinfo">[$nbr_of_writings $nbr]</li>
EOD;
        if($_GET['writing_display_type']== 'full') {
          if($nbr_of_writings > 0) {

          foreach($rowz as $rowzz) {

            $where = " language_id = " . $rowzz['language_id'];
            $rowx =  $crud->select( '' , 'language' , '*' , '' , $where , '' , '' , 1 , 0 );
            foreach($rowx as $rox) {
              $language =  $rox['language_short_name'];
            }

            $description = truncateString( $rowzz['writing_description'] , 12 );

            if($rowzz['writing_publication_end_date'] < date('Y-m-d')) { $due = '<img src="img/icons/attention.png" alt="attention" />';} else { $due = '';}
            if($rowzz['writing_publication_start_date'] > date('Y-m-d')) { $start = '<img src="img/icons/watch.png" alt="attention" />';} else { $start = '';}

            if($rowzz['writing_status'] == 0) { $status = '<img src="img/icons/crossedeye.png">';}	else { $status = '<img src="img/icons/default.png">';}

            print <<<EOF
            <li style="background-color: #FAFAFA;"><span style="float:left;">
              <span style="float:left;width: 14px;">{$status}</span>
              <span class="tinygreyinfo">[{$rowzz[writing_rank]}] [{$language}]</span>
              <span>{$start} {$due}</span>
                {$rowzz[writing_title]}
              <span class="tinygreyinfo">{$description}</span>
            </span>

            <span style="float:right;">
               <a href="?page=writer&amp;action=delete_writing&amp;writing_id={$rowzz[writing_id]}" onclick="return(confirm('Delete writing?'));"
              class="delete_hover">delete</a> |
              <a href="?page=writer&amp;action=edit_writing&writing_id={$rowzz[writing_id]}">edit/show</a>

            </span></li>
EOF;

            }
          }

      }

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




