<?php
function img_popup($file_url) {
  $sizes = @getimagesize($file_url);
  if($sizes==''){$sizes[0]='200'; $sizes[1]='auto';}
  return 'onclick="popupcentre(this.href, \''.$file_url.'\',\''.$sizes[0].'\', \''.$sizes[1].'\', \'no\');return false;"';
}
?>


<?php
function file_popup($popup_title, $width, $height) {
  return 'onclick="popupcentre(this.href, \''.$popup_title.'\',\''.$width.'\', \''.$height.'\');return false;"';
}
?>


