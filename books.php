<?php
include 'models/model.connection.php';
include 'models/model.crud.php';
include 'models/model.extender.php';
$crud 		= new Crud();
$extender 	= new Extender();

$join	= " LEFT JOIN upload_file ON upload_file.upload_file_id = books.upload_file_id ";
$where  = " book_id = " . (int) $_GET['book_id'];
$books 	=  $crud->select( '' , 'books' , '*' ,  $join  , $where , '', '' , '1' , '0' );

$author 	= ($books[0][book_author] != '') ? ($books[0][book_author]).', ' : '' ;
$title 		= ($books[0][book_title] != '') ? ($books[0][book_title]).', ' : '' ;
$editor 	= ($books[0][book_editor] != '') ? ($books[0][book_editor]).', ' : '' ;
$book_detail_1 = ($books[0][book_detail_1] != '') ? ($books[0][book_detail_1]).', ' : '' ;
$book_detail_2 = ($books[0][book_detail_2] != '') ? '('.($books[0][book_detail_2]).'), ' : '' ;
$place = ($books[0][place] != '') ? ($books[0][place]).', ' : '' ;
$original_edition_date = ($books[0][original_edition_date] != '') ? ($books[0][original_edition_date]).', ' : '' ;
$re_edition_date = ($books[0][re_edition_date] != '') ? ($books[0][re_edition_date]).', ' : '' ;
$no_of_pages = ($books[0][no_of_pages] != '') ? $books[0][no_of_pages].' pages.' : '' ;

$cover = $books[0][dir_name].'/'.$books[0][upload_file_name].$books[0][upload_file_ext];
$description = ($books[0][book_description]);

$entry = trim($author.$title.$book_detail_1.$place.$editor.$book_detail_2.$original_edition_date.$re_edition_date.$no_of_pages);


if((strlen($entry)-1) == strrpos($entry, ',') ) { $entry = substr($entry, 0, -1) ;}

?>

<img src="<?php print $cover?>" class="align_left" alt="" style="width: 200px; float: left; margin: 0 1.8em 1em 0;"/>
<h2><?php print $entry;?></h2>
<p><br/><?php print $description; ?></p>