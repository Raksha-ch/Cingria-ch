<?php

include 'controllers/controller.uploader.php';

$active_list 		 = ( $_GET['action'] == 'list' 				  		  ) ? 'class="active"' : '';
$active_upload 		 = ( $_GET['action'] == 'upload' 			  		  ) ? 'class="active"' : '';
$active_list_trashed = ( $_GET['action'] == 'list_trashed' 		  		  ) ? 'class="active"' : '';
$upload_directories_list = ( $_GET['action'] == 'upload_directories_list' ) ? 'class="active"' : '';

?>

<div id="menu_navigator">
	<ol>
		
		<li <?php print $active_list;?> >
			<a href="?page=uploader&amp;action=list">List Files</a>
		</li>
		<li <?php print $active_upload;?> >
			<a href="?page=uploader&amp;action=upload">Upload New File</a>
		</li>
		<li <?php print $active_list_trashed;?> >
			<a href="?page=uploader&amp;action=list_trashed">List Trashed Files</a>
		</li>
		<?php if ( $_SESSION['admin_group'] < 2 ) { ?>

		<li <?php print $upload_directories_list;?> >
			<a href="?page=uploader&amp;action=upload_directories_list">Manage Upload Directories</a>
		</li>

		<?php } ?>
		
			
	</ol>
</div>

<?php
if($_GET['action']	 == 'list_trashed') 			{ include('views/uploader/view.uploader.list_trashed.php'); }
if($_GET['action']	 == 'erase') 					{ $trash_browser->eraseFile($uploader->getTrashcan().$_GET['file_to_be_erased'],'?page=uploader&amp;action=trashcan'); }
if($_GET['action']	 == 'edit') 					{ include('views/uploader/view.uploader.edit.php'); }
if($_GET['action']	 == 'list') 					{ include('views/uploader/view.uploader.list.php'); }
if($_GET['action']	 == 'upload') 					{ include('views/uploader/view.uploader.upload.php'); }
if($_GET['action']	 == 'delete')					{ $uploader->setCrud($crud); $uploader->doDeleteFile($_GET['file_field'],$_GET['file_id']); }
if($_GET['action']	 == 'resize') 					{ include('views/uploader/view.image_manipulator.resize.php'); }
if($_GET['action']	 == 'upload_directories_list') 	{ include('views/uploader/view.uploader.uploader_directories_list.php'); }
if($_GET['action']	 == 'rename_dir') 				{ include('views/uploader/view.uploader.rename_upload_directory.php'); }
?>