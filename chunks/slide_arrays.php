<?php
$img_array_1 = array('slides/slide_01.jpg',
					 'slides/slide_02.jpg',
					 'slides/slide_03.jpg',
					 'slides/slide_04.jpg',
					 'slides/slide_05.jpg');
						
$img_array_2 = array('slides/slide_06.jpg',
     				 'slides/slide_07.jpg',
     				 'slides/slide_08.jpg',
     				 'slides/slide_09.jpg',
     				 'slides/slide_10.jpg',
     				 'slides/slide_11.jpg',
     				 'slides/slide_12.jpg',
     				 'slides/slide_13.jpg',
     				 'slides/slide_14.jpg'); 					
 
  shuffle($img_array_1);
  shuffle($img_array_2);   			
  
  $slideshow_1 = '<div id="slides_main">'; 
  $i = 1;
  foreach ($img_array_1 as $key) {
  	     
		if($i == 1) { 
			     $slideshow_1 .=  '<img src="'.$key.'" alt="" class="firstslide" />';
			}
		 else {
			    $slideshow_1 .=  '<img src="'.$key.'" alt="" />'; 
		}   
	   $i++;
  }   
  $slideshow_1 .= '</div>';

  $slideshow_2 = '<div id="slides_main_right">'; 
  $j = 1;
  foreach ($img_array_2 as $key) {

		if($j == 1) { 
			     $slideshow_2 .=  '<img src="'.$key.'" alt="" class="firstslide" />';
			}
		 else {
			    $slideshow_2 .=  '<img src="'.$key.'" alt="" />'; 
		}   
	   $j++;
  }
 $slideshow_2 .= '</div>';
?>