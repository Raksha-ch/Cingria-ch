<div class="list_div">
	<div id="info_bar">PROPERTIES LIST
	 	&nbsp; &middot; &nbsp; There are <em><?php print $crud->countRecords('property');?> records</em> in table 
		<em>Property</em>
	</div>

<?php
$slice = $_GET['slice'];
foreach($rows as $row) {
	
	$pix				= '';

	
	$modification_date 	= ( $row['property_modification_date'] == '0000-00-00' ) ? '' : ' | upd. '.$row['property_modification_date'];
	$status 			= ( $row['property_display'] == 0) ? '<img src="img/icons/crossedeye.png" alt="ok" class="icon" />' : '';
	$last_minute 		= ( $row['property_last_minute'] != 0) ? '<img src="img/icons/last_minute.png" alt="last_minute" class="icon" />' : '';
	$no_calendar 		= ( $row['property_calendar_display'] == 0) ? '<img src="img/icons/no_calendar.gif" alt="ok" class="icon" />' : '';  
	$stars				= str_repeat("<img src=\"img/icons/star.gif\" alt=\"star\" />", $row['property_star']);
	
	$lat 		= ( $row['property_lat'] == 0) ? '<span class="tinygreyinfo">lat. unknown</span>' : 'Lat. ' .$row['property_lat'];  
	$long 		= ( $row['property_lat'] == 0) ? '<span class="tinygreyinfo">long. unknown</span>' : 'long. '.$row['property_long'];  

	
	if ( $row['dir_name'] != '' ) {
			
			$where = " dir_name = '" . $row['dir_name'] ."' ";
			
			$pictures = $crud->select( '' , 'upload_file' , 'upload_file_name, upload_file_ext, upload_file_display' , '' , $where , '' , '' , '' ,'' );
			
			foreach ($pictures as $key => $value) {
				
					if ( $value['upload_file_display'] == '0') {
						$class_unav = ' class="unavailable_img" ';
					
					};
					
					$pix .= '<a href="'.$row['dir_name'].'/'.$value['upload_file_name'].$value['upload_file_ext'].'" ';
					
					$pix .= img_popup($row['dir_name'].'/'.$value['upload_file_name'].$value['upload_file_ext']);
					
					$pix .= '><img src="'.$row['dir_name'].'/'.$value['upload_file_name'].$value['upload_file_ext'].'" alt=""  '.$class_unav.'/></a>';
					
					$class_unav				= '';
					
			}

	}




	
print <<<EOD
		<ol>
		<li>
			<span style="float:left;">
			<span style="float:left;">$status $last_minute $no_calendar</span>&nbsp;<strong>{$row[property_name]}</strong> <span class="tinygreyinfo">[{$row[property_rank]}]  [{$row[property_creation_date]}$modification_date]</span>
			</span>
			<span style="float:right;">
				 <a href="?page=itemizer&amp;action=delete_property&amp;property_to_be_deleted={$row[property_id]}"
				 onclick="return(confirm('Delete property?'));" class="delete_hover">delete</a> |
				<a href="?page=itemizer&amp;action=facilities_set&amp;property_id=$row[property_id]">facilities</a> |  
				 <a href="?page=itemizer&amp;action=edit_property&amp;property_id={$row[property_id]}&slice=$slice">edit/show</a>
			</span>
		</li>
		</ol>
EOD;

if( ($_SESSION['display_type'] == 'half') || ($_SESSION['display_type'] == 'full') ) {		
print <<<EOD

	<table class="booking_info_table" style="background-color: #FAFAFA;">
		<tr>
			<td>$row[property_official_name] $stars</td><td><span class="tinygreyinfo">[ id #{$row[property_id]} ]</span></td>
		</tr>
		<tr>
			<td>$row[property_address]</td><td>$lat $long</td>
			<td></td>
		</tr>
		<tr>
			<td>$row[category_name]</td><td>$row[subcategory_name]</td>
			<td></td>
		</tr>
		<tr>
			<td>$row[profile_name] $row[profile_surname]</td><td><a href="mailto:$row[profile_email_address]">$row[profile_email_address]</a> 		
			<br/><span class="tinygreyinfo">$row[profile_phone_number]</span></td>
			<td></td>
		</tr>
	</table>

EOD;
}


if( ($_SESSION['display_type'] == 'full' ) && ($row['dir_name'] != '0' ) ) {		
print <<<EOD
	
	<table class="booking_info_table_part_2">
	<tr>
	<td>
		<div id="property_pictures">
				$pix
		</div>
	</td>
	</tr>
	</table>
EOD;
}


}?>
</div>

<div id="pager_sorter">
	<?php include 'views/paginater/view.paginater.php'; ?>
	<?php include 'views/sorter/view.sorter.php'; ?>
</div>


<div class="toggle_info">
<?php

if ($_GET['info_box']=='edited') {
	$upload_info_r = unserialize($_GET['serialized_info']);
	print <<<EDITEDINFO
	<div class="info_bar">EDIT INFO</div>
		<div class="info_box">
			<fieldset class="info">
			<br/>Property <strong>{$upload_info_r['name']}</strong> has been successfully edited.<br/><br/>
			</fieldset>
		</div>
EDITEDINFO;
}

if ($_GET['info_box']=='created') {
	$upload_info_r = unserialize($_GET['serialized_info']);
	print <<<CREATEDINFO
	<div class="info_bar">CREATION INFO</div>
		<div class="info_box">
			<fieldset class="info">
			<br/>Property <strong>{$upload_info_r['name']}</strong> has been successfully created.<br/><br/>
			</fieldset>
		</div>
CREATEDINFO;
}

?>

</div>
