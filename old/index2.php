<?php

if(!isset($_GET['p'])){ $_GET['p'] = 'accueil';}

include 'models/model.connection.php';
include 'models/model.crud.php';
$crud 		= new Crud();
include 'models/model.extender.php';
$extender 	= new Extender();
include 'controllers/controller.public.php';
include 'functions/function.checkPageTitle.php';  
include 'functions/function.menuItem.php';  
 
$title = checkPageTitle($_GET['p']);


?>

<!doctype html>
<html lang="fr">
<head>
	<title>L'Association des Amis de Charles-Albert Cingria &middot; <?php print $title; ?></title>        
	
	<base href="http://www.cingria.ch/index2.php">                         
	
	<meta name="keywords" content="" /> 
	<meta name="description" content="" />      	
	<meta charset="utf-8" />  
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />  
	
	<link rel="stylesheet" href="css/reset.css" type="text/css" />
	<link rel="stylesheet" href="css/1140.css" type="text/css" media="screen" /> 
	<link rel="stylesheet" href="css/styles.css" type="text/css" /> 
	<link rel="stylesheet" href="css/timelinr.css" type="text/css" />
	<link rel="stylesheet" href="css/qtip.css" type="text/css" />   
		
    <link rel="shortcut icon" href="img/favicon.gif" />
	<link href='http://fonts.googleapis.com/css?family=Goudy+Bookletter+1911' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Raleway:100' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Cantarell' rel='stylesheet' type='text/css'> 
	<link href='http://fonts.googleapis.com/css?family=Crimson+Text:400,600' rel='stylesheet' type='text/css'>	 
	 	  
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/css3-mediaqueries.js"></script>
	<script type="text/javascript" src="js/scrollto.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript" src="js/quovolver.js"></script>  
	<script type="text/javascript" src="js/timelinr.js"></script> 
	<script type="text/javascript" src="js/qtip.js"></script> 
	<script type="text/javascript" src="js/jscroll.js"></script>  
			  							
	<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<!--[if lte IE 7]><script src="js/IE8.js" type="text/javascript"></script><![endif]-->
	<!--[if lt IE 7]><link rel="stylesheet" type="text/css" media="all" href="css/ie6.css"/><![endif]-->  

</head>
<body>
   <div class="container"> 
		<div class="row">  
			
			<div id="logo" class="fourcol">
				<p><a href="?p=accueil"><img src="img/logo_site_2.gif" alt="" /></a></p>
			</div>  
			<div class="eightcol last">
			<nav>
				<ul> 
					<li>
						<?php menu_item( '?p=', 'accueil', 'Accueil & Présentation du site', $_GET['p'] ); ?>
					</li>
					<li>&middot;</li> 
					<li> 
						<?php menu_item( '?p=', 'chronologie', 'Chronologie', $_GET['p'] ); ?>
					</li>
					
					<li>&middot;</li>
					 <li>
						<?php menu_item( '?p=', 'association', 'Présentation de l\'Association', $_GET['p'] ); ?>
					</li>
					</ul>
					<ul>	
					<li>
						<?php menu_item( '?p=', 'oeuvres_completes', 'La nouvelle édition des œuvres complètes', $_GET['p'] ); ?> 
					</li>
					<li>&middot;</li>
					<li>
						<?php menu_item( '?p=', 'les_livres', 'Les livres', $_GET['p'] ); ?> 
					</li>
					<li>&middot;</li>  
					<li>
						<?php menu_item( '?p=', 'fonds_et_archives', 'Les Fonds', $_GET['p'] ); ?> 
					</li>
					<li>&middot;</li>
					<li>
						<?php menu_item( '?p=', 'les_petites_feuilles', 'les Petites Feuilles', $_GET['p'] ); ?> 
					</li> 
					
				</ul>
			 </nav>	 
			</div>   	
		</div>
	 </div>
	 
	<div class="container"> 
		<div class="row">
		   
			<?php include('pages/'.$_GET['p'].'.php') ;?>
		  
        </div>      
    </div> 

    <div class="container" style="margin: 0 0 -34px 0;">
		<div class="row">
			<div class="twelvecol last">
				<div id="contribute"></div>
			 </div>
		</div> 
	</div>
	  
	<div class="container" >
		<footer class="row grey">  
	    
	  <div class="footer threecol">
			hasd <a href="" class="test">udhsusad</a> uusadh dsah
		  </div> 
		
		  <div class="footer sixcol" >
			<form action="index_submit" method="get" accept-charset="utf-8" >
				      <span id="contribution" style="display:none;">
                       <input type="text" name="some_name" value="" id="some_name">
                       <input type="submit" value="Continue &rarr;"> 
					  <span>
			</form>
		  </div>
		<div class="footer onecol last" id="to_top">
		             <span>sommet</span>
		</div> 
		
		</footer>
   </div>  

<?php include 'chunks/slide_arrays.php';?>
<script type="text/javascript" charset="utf-8">
	
	
	function togThis(){
	 $(".sub").toggle();
	}
	
	
	$(document).ready(function() {
        
		var list_items = $('#main_oc').find('li');
		$.each(list_items, function(key) {
			key = key+1;
			$(this).prepend('<img src="img/icons/'+key+'.png" alt="'+key+'" />');
		});



		$('#contribute').toggle(function() {
		  $('#contribution').fadeIn('300');
		}, function() {
		   $('#contribution').hide();  
		});

		
       $('.book').hover(function() {
		  $(this).children('.book_title').delay(120).stop().fadeIn();
		}, function() {
		 $(this).children('.book_title').delay(120).stop().fadeOut();
		});
	    
           $('#more_less').hide();
		  
			$('#show_more').click(function() {
		    $('#more_less').slideToggle('fast');
		    
			text = $(this).text() == 'lire la suite de la notice' ? 'réduire la notice' : 'lire la suite de la notice';
		    $(this).text(text);
		  
		});
	
	
	    $('#to_top').click(function(){ $('html, body').animate({scrollTop:0}, 'slow'); });
		
		$('blockquote').quovolver(500,18000);
  
         
		$(function(){
			$().timelinr({
				orientation: 	'vertical',
				issuesSpeed: 	300,
				datesSpeed: 	100,
				arrowKeys: 		'true',
				startAt:		12
			})
		});
         

	}); 
	
	
	
	 $(window).load(function() {
   
	    setInterval(function() { $('#slides_main :nth-child(1)').next().show().end().fadeOut(1200).appendTo('#slides_main'); } , 12000);
	    setInterval(function() { $('#slides_main_right :nth-child(1)').next().show().end().fadeOut(1200).appendTo('#slides_main_right'); } , 10000);
	
	}); 
		
  
  	    
		
	 $('<?php print $slideshow_1 ?>').insertAfter('#main_text p:first-child');
	 $('<?php print $slideshow_2 ?>').insertAfter('#main_text p:nth-child(4)');   
		
	  $(function() {
	     $("#order_box").jScroll();
	});   
	
	
	
	$('.sub').hide(); 
	$('.toggler').click(function(){
	     $(this).next('.sub').toggle();
	 	 $(this).find('.toggle_btn').toggleClass('plus');
	
		    if($(this).find('.toggle_btn').hasClass('plus')) {  
			
			  $.scrollTo( $(this).next('.sub'), 1400,{easing:"easeInOutExpo"});
		   
		}
			
	   });
	
	
	$('.close_sub').click(function(){
 
	    $.scrollTo( $(this).parent().parent().parent(), 1400,{easing:"easeInOutExpo", onAfter: togThis() }); 
		 
      




	   });
	
		
</script>
       


</body>
</html> 

