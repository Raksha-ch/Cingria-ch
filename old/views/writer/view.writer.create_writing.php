<style type="text/css" media="screen">
	#copy-description { display: block; padding: 3px 0; cursor:pointer}
</style>
<div id="display_form">
 <form id="create_writing_form" action="" method="post" enctype="multipart/form-data">
 <div class="form_div">
 	<div id="info_bar">CREATE WRITING</div>
 		<fieldset>
 			<ol>
 				<li>
 					<label>* Title</label>
 					<input type="text" class="input" name="writing_title" value="<?php print $_POST['writing_title'] ?>" />
 				</li>
 				<li>
 					<label>Description</label>
 					<input type="text" class="input" name="writing_description" value="<?php print $_POST['writing_description'] ?>" />
 				</li>
 							</ol>
 							</fieldset>
 			</div>
 			<div class="form_div">
 				<fieldset>
 					<ol>
 				<li>
 					<label>* Template Element</label>
 					<select name="template_id" class="short_select">
 						<option value="0">Select...</option>
 						<?php
 						$where = " template_parent_id = 0";
 						$rowx  =  $crud->select( '' , 'template' , '*' , '', $where , 'template_name ASC' , '' ,'' , '' ); 				
 						foreach ($rowx as $keyz) {
 							print '<option value="0">'.$keyz['template_name'].'</option>';
 							
 							$where = " template_parent_id = ".$keyz['template_id'];
 							$rowy  =  $crud->select( '' , 'template' , '*' , '', $where ,  'template_name ASC' , '' , '' , '' );
 							foreach ($rowy as $keyy) {	
 								print '<option value="'.$keyy['template_id'].'">&nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;'.$keyy['template_name'].'</option>';
 									
										$where = " template_parent_id = ".$keyy['template_id'];
			 							$rowz  =  $crud->select( '' , 'template' , '*' , '', $where ,  'template_name ASC' , '' , '' , '' );
			 							foreach ($rowz as $keyz) {	
			 								print '<option value="'.$keyz['template_id'].'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - &nbsp;'.$keyz['template_name'].'</option>';

			 								}


 								}	
 						}
 						?>
 					</select>
 				</li>
 				<li>
 					<label>Rank</label>
 					<select name="writing_rank" class="short_select">
 						<?php
 						for ($i=1; $i < 101; $i++) {
 							print '<option value="'.$i.'"';
 								if( $i == $_POST['writing_rank'] ) { print ' selected="selected" ' ;}
 							print '>'.$i.'</option>';
 						}
 						?>
 					</select>
 				</li>
 				</ol>
 				</fieldset>
 </div>

 			
 				<div class="form_div">
 					<div id="info_bar">WRITING CONTENT</div>
 					<fieldset>
 						<ol>
 					<li>
 						<label>Language</label>
 						<select name="language_id" class="short_select">
 							<option value="">Select...</option>
 							<?php
 							$rowst  =  $crud->select( 'num' , 'language' , '*' , '', '' ,  'language_id ASC' , '' , '' , '' );
 							
 							foreach ($rowst as $key) {
 								print '<option value="'.$key[0].'"';
 								
 									if ( isset( $_POST['language_id'] ) ) {
 										
 										if ( $key[0] == $_POST['language_id'] ) { print ' selected="selected" ' ;}
 									}
 									
 									else {
 										
 										if ( $key[0] == $session->getSessionVar('language_id') ) { print ' selected="selected" ' ;}
 									
 									}
 									
 								print '>'.$key[1].'</option>';		
 							}
 							
 							?>
 						</select>
 					</li>
 					<li>
 						<label>Written by</label>
 						<select name="admin_id" class="short_select">
 							<option value="">Select...</option>
 							<?php
 							$rowss  =  $crud->select( 'num' , 'admin' , '*' , '', '' ,  'admin_id ASC' , '' , '' ,'' , '' );
 							foreach ($rowss as $key) {
 								print '<option value="'.$key[0].'"';
 								
 									if ( isset( $_POST['admin_id'] ) ) {
 										
 										if ( $key[0] == $_POST['admin_id'] ) { print ' selected="selected" ' ;}
 									}
 									
 									else {
 										
 										if ( ( $key[1].' '.$key[2] ) == $session->getSessionVar( 'username' ) ) { print ' selected="selected" ';}
 									
 									}
 								
 									
 								print '>'.$key[1].' '.$key[2].'</option>';		
 							}
 							?>
 						</select>
 					</li>
 					<li>
	 					<label>Public Date<br/><span class="tinygreyinfo">e.g. 1st January 2000<br/>or 01/01/2000</span></label>
	 					<input type="text" class="input" name="writing_public_date" value="<?php print $_POST['writing_public_date'] ?>" />
	 				</li>
 					</ol>
 					</fieldset>
 				</div>		
 		<div class="form_div">
 			<fieldset>
 				<ol>
					<li>					

				<textarea class="long_textarea_input" name="writing_content"><?php print $_POST['writing_content'] ?></textarea>
				<div style="padding: 12px; float:left;">
					<div class="wmd-preview" style="background-color: #EFEFEF; float:left; padding: 2px;"></div>
				</div>
				</li>
					</ol>
 						
 				</fieldset>
 		</div>	
		
		<div class="form_div">
			<fieldset>
				<ol>
					
			<li>
				<label>Attach File<br/><span class="tinygreyinfo">Files marked as <span style="font-style: italic;">(off)</span> must be switched on in Uploader if you want to display them</span></label>
				<select name="upload_file_id" class="short_select">
					<option value="0">Select...</option>
					<?php

						$rowx =  $crud->select('','upload_file','*','','','','','','');
						foreach ($rowx as $rox) {
							
							$arr = explode('/',$rox['dir_name']);
							array_shift($arr);
							$dir_name = implode('/',$arr);
							
							if($rox['upload_file_display']=='0'){$status = ' &nbsp; ( off )';} else { $status= '';}
							
							print '<option value="'.$dir_name.'/'.$rox['upload_file_name'].$rox['upload_file_ext'].'">'.$dir_name.'/'.$rox['upload_file_name'].$rox['upload_file_ext'].$status.'</option>';
						}
					?>
				</select>
			</li>
			<li>
				<label>Attach Directory</label>
				<select name="dir_name" class="short_select">
					<option value="0">Select...</option>
						<?php
					 	print $uploader->getDirectoriesArray( "uploads");
					 	?>
				</select>
			</li>
			<li>
				<label>Embed Media (url)<br/><span class="tinygreyinfo">e.g. Vimeo / Youtube</span></label>
				<textarea class="textarea_input" name="media_url"></textarea>
			</li>
			</ol>
			</fieldset>
		</div>	
 <div class="form_div">
 	<fieldset>
 	
 				<ol>
 					<li>
 						<label>Display?</label>
 						<input type="radio" name="writing_status" value="1"
 							<?php  if ( (!isset($_POST['writing_status'])) || ($_POST['writing_status'] == 1)) { print ' checked="checked" ' ;} ?>
 						/> Yes
 						<input type="radio" name="writing_status" value="0"
 							<?php  if ( $_POST['writing_status'] == '0' ) { print ' checked="checked" ' ;} ?>
 						/> No
 					</li>
 					<li>
 						<label>Publication start date</label>
 						<select name="writing_publication_start_date_y">
 							<?php
 							$y = date('Y');
 							$y_2 = $y + 11;
 							for ($y; $y < $y_2; $y++) {
 								
 								print '<option value="'.$y.'"';
 								
 								if ( isset( $_POST['writing_publication_start_date_y'] ) ) {
 									
 									if ( $y == $_POST['writing_publication_start_date_y'] ) { print ' selected="selected" ' ;}
 								}
 								
 								print '>'.$y.'</option>';
 								
 							}
 							?>
 						</select>
 						<select name="writing_publication_start_date_m">
 							<?php
 							for ($m=1; $m < 13; $m++) {
 								
 								print '<option value="'.$m.'"';
 								
 									if ( isset( $_POST['writing_publication_start_date_m'] ) ) {

 										if ( $m == $_POST['writing_publication_start_date_m'] ) { print ' selected="selected" ' ;}
 									
 									}
 									
 									else {
 										
 										if ( $m == date( 'm' ) ) { print 'selected="selected" ' ;}
 										
 									}
 									
 								print '>'.$m.'</option>';
 								
 							}
 							?>
 						</select>
 						<select name="writing_publication_start_date_d">
 							<?php
 							for ($d=1; $d < 32; $d++) {
 								
 								print '<option value="'.$d.'"';
 								
 								 	if ( isset( $_POST['writing_publication_start_date_d'] ) ) {

 										if ( $d == $_POST['writing_publication_start_date_d'] ) { print ' selected="selected" ' ;}

 									}

 									else {

 										if ( $d == date( 'd' ) ) { print 'selected="selected" ' ;}

 									}
 								
 								print '>'.$d.'</option>';
 								
 							}
 							?>
 						</select> <span class="tinygreyinfo">&nbsp; [today]</span>
 						
 					</li>
 					<li>
 						<label>Publication end date</label>
 						<select name="writing_publication_end_date_y">
 							<?php
 							$y = date('Y');
 							$y_2 = $y + 10;
 							for ($y; $y < $y_2; $y++) {
 								print '<option value="'.$y.'"';
 								
 									if ( isset( $_POST['writing_publication_end_date_y'] ) ) {

 										if ( $y == $_POST['writing_publication_end_date_y'] ) { print ' selected="selected" ' ;}

 									}

 								print '>'.$y.'</option>';
								
 							}

							print '<option value="'.$y_2.'" ';
							
								if ( !isset( $_POST['writing_publication_end_date_y'] ) ) {
									
									print ' selected="selected" ' ;
								
								}
							
							print '>'.$y_2.'</option>';
 							?>
 						</select>
 						<select name="writing_publication_end_date_m">
 							<?php
 							for ($m=1; $m < 13; $m++) {
 								print '<option value="'.$m.'"';
 									
 									if ( isset( $_POST['writing_publication_end_date_m'] ) ) {

 										if ( $m == $_POST['writing_publication_end_date_m'] ) { print ' selected="selected" ' ;}
 									
 									}
 									
 									else {
 										
 										if ( $m == date( 'm' ) ) { print 'selected="selected" ' ;}
 										
 									}
 									
 									
 								print '>'.$m.'</option>';
 							}
 							?>
 						</select>
 						<select name="writing_publication_end_date_d">
 							<?php
 							for ($d=1; $d < 32; $d++) {
 								print '<option value="'.$d.'"';
 									
 										if ( isset( $_POST['writing_publication_end_date_d'] ) ) {

 											if ( $d == $_POST['writing_publication_end_date_d'] ) { print ' selected="selected" ' ;}

 										}

 										else {

 											if ( $d == date( 'd' ) ) { print 'selected="selected" ' ;}

 										}
 									
 								print '>'.$d.'</option>';
 							}
 							?>
 						</select>
 						
 					</li>
 				</ol>
 			</fieldset>
 			</div>

 			<div class="form_div">
 				<fieldset>

 							<ol>
 				<li class="bottom">
 					<label>&nbsp;</label>
   					<input type="submit" name="submit" class="submit" value="Create Writing" />
 				</li>
   					<input type="hidden" name="writing_creation_date" value="<?php print date('Y-m-d');?>" />
   					<input type="hidden" name="create_writing" value="1" />
   			</ol>
   		</fieldset>
   	</form>
 </div>
</div>

<div class="debug_bar">IMAGES</div>
	<div class="info_box">
	<fieldset class="info">
		<div id="thumb_check" style="float:left;clear:both; padding: 3px 0;"></div>
		<div style="float:left;clear:both; margin: 6px 0 0 0;">
		<form action="thumb_select" method="get" accept-charset="utf-8">
			<select id="thumb_selector" style="width: 240px;">
				<option value="0">Choisir une image...</option>
				<?php

					$rowx =  $crud->select('','upload_file','*','','','','','','');
					foreach ($rowx as $rox) {

						$arr = explode('/',$rox['dir_name']);
						array_shift($arr);
						$dir_name = implode('/',$arr);

						if($rox['upload_file_display']=='0'){$status = ' &nbsp; ( off )';} else { $status= '';}

						print '<option value="uploads/'.$dir_name.'/'.$rox['upload_file_name'].$rox['upload_file_ext'].'">'.$dir_name.'/'.$rox['upload_file_name'].$rox['upload_file_ext'].$status.'</option>';
					}
				?>
			</select>
		</form>
		</div>
		<div style="float:left;clear:both;margin: 6px 0;position: relative; z-index: 200;">
		<span id="copy-description-r">&rarr; image align&eacute;e &agrave; droite</span><br/>
		<span id="copy-description-l">&rarr; image align&eacute;e &agrave; gauche</span>
		</div>
	</fieldset>
</div>


<div id="display_errors">

	<?php
	print $title_error;
	print $template_error;
	?>
</div>
<script type="text/javascript" src="wmd/wmd.js"></script>
<script type="text/javascript">
(function($){
	$.fn.thumbPeeker = function(div_to_update, root){
	$(this).change(function(event) {		

		if ($(this).val() != '') {
	
			$(div_to_update).fadeOut(0).fadeIn(1500).html('<img src=\"' + $(this).val() + '" alt="" style="width: 100%;"/>');	
			
		}
		else {
			$(div_to_update).fadeOut(400);
		};

	});
	return this;
	};
	
})(jQuery);

$(document).ready(function() {
	
	$('#thumb_selector').thumbPeeker('#thumb_check','uploads');
    $('#copy-description-r').zclip({
       path:'swf/ZeroClipboard.swf',
	   copy:function(){ return '<img src=\"'+$('select#thumb_selector').val()+'\" alt=\"\" class="embed_r" />';}
   });
	$('#copy-description-l').zclip({
      path:'swf/ZeroClipboard.swf',
	   copy:function(){ return '<img src=\"'+$('select#thumb_selector').val()+'\" alt=\"\" class="embed_l" />';}
  });
});

</script>
