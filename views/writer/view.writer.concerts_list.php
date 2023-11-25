<div class="list_div">
	<div id="info_bar">
		CONCERTS LIST &nbsp; &middot; &nbsp; There are
		<em><?php print $crud->countRecords( 'concerts');?> concerts</em> in table
		<em><?php print ucfirst($writer->getTable());?></em>
	</div>
	
	<fieldset>
	 <?php
		
		foreach($rows as $row) {
		
		$where	 = ' profile_id = ' . $row['profile_id'];
		$artists =  $crud->select('','profile','profile_id,profile_name,profile_surname','',$where, 'profile_name ASC', '' ,'1','0');
	
		$artist = $artists[0]['profile_name'].' '.$artists[0]['profile_surname'];
	
	   $dates 	= explode('-',$row['date']);
	   $year 	= $dates[0];
	   $subyear = substr($year,2,2);
	   $month 	= $dates[1];
	   $day 	= $dates[2];
	
	   $place 	= truncateString($row['place'], '6');
	
	  $additional 	= explode('<br/>',$row['additional_info']);
	
	   $additional_info = truncateString($additional[0], '13');
		
		if ($row['concert_status'] == 0) { $status = '<img src="img/icons/crossedeye.png">';} else { $status = '<img src="img/icons/default.png">';}
		
		
	   $id = $row['concert_id'];
	
	 if($row['concert_status'] == 0) { $status = '<img src="img/icons/crossedeye.png">';} else { $status = '<img src="img/icons/default.png">';}

print <<<EOD
	
	<li>
		<span style="float:left;">
			$status $year
			<span class="tinygreyinfo">[$day.$month.$subyear] [$artist] [$place]</span>
			
			<span class="tinygreyinfo">$additional_info</span>
		</span>
		<span style="float:right;">
			<a href="?page=writer&amp;action=delete_concert&amp;concert_id=$id" onclick="return(confirm('Delete concert?'));" class="delete_hover">delete</a> |
			<a href="?page=writer&amp;action=edit_concert&concert_id=$id ">edit/show</a>
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




