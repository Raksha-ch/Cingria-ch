<?php
include 'inc/ajax_inc.php';
include 'controllers/controller.public.php';
$chronology 	=  $crud->select( '' , 'chronology' , '*' ,  ''  , '' , 'chronology_year ASC', '' , '' , '' );
?>



<?php
   if($_GET['type'] == 1 ) {
 ?>

  <div id="timeline">  	
  <ul id="dates">
     <?php
     foreach ($chronology as $k => $v) {
      print '<li><a href="#'.$v['chronology_year'].'"> '.$v['chronology_year'].'</a></li>';
     }
     ?>
  </ul>
  <ul id="issues">

     <?php
       foreach ($chronology as $k => $v) {

        print '<li id="'.$v['chronology_year'].'"><h1><span>'.$v['chronology_year'].'</span></h1>

        <div style="float:left; 966px;">
        <div style="float:left; width:750px; margin: 0 24px 0 0; text-align: justify;">'.utf8_encode($v['chronology_description']).'</div>';



        $join		= " LEFT JOIN upload_file ON upload_file.upload_file_id = books.upload_file_id ";
        $where  	= " book_id = " . $v['book_id_1'];   					
        $books_1 	=  $crud->select( '' , 'books' , '*' ,  $join  , $where , '', '' , '1' , '0' );


        $join		= " LEFT JOIN upload_file ON upload_file.upload_file_id = books.upload_file_id ";
        $where  	= " book_id = " . $v['book_id_2'];   					
        $books_2 	=  $crud->select( '' , 'books' , '*' ,  $join  , $where , '', '' , '1' , '0' );

         $join		= " LEFT JOIN upload_file ON upload_file.upload_file_id = books.upload_file_id ";
         $where  	= " book_id = " . $v['book_id_3'];   					
         $books_3 	=  $crud->select( '' , 'books' , '*' ,  $join  , $where , '', '' , '1' , '0' );
         $size = '160px';
        if(sizeof($books_2) > 0) { $size = '100px'; }
        if(sizeof($books_3) > 0) { $size = '60px'; }

        $cover_1 = (sizeof($books_1) > 0) ? '<a href="http://ajax" title="books.php?book_id='.$v['book_id_1'].'"><img src="'.$books_1[0][dir_name].'/tn_'.$books_1[0][upload_file_name].$books_1[0][upload_file_ext].'" alt="" style="height: '.$size.'; float: right; margin: 0  0 1em 2.4em;"/></a>'  : '' ;

        $cover_2 = (sizeof($books_2) > 0) ? '<br/><a href="http://ajax" title="books.php?book_id='.$v['book_id_2'].'"><img src="'.$books_2[0][dir_name].'/tn_'.$books_2[0][upload_file_name].$books_2[0][upload_file_ext].'" alt="" style="height: '.$size.'; float: right; margin: 0  0 1em 2.4em;"/></a>'  : '' ;

              $cover_3 = (sizeof($books_3) > 0) ? '<br/><a href="http://ajax" title="books.php?book_id='.$v['book_id_3'].'"><img src="'.$books_3[0][dir_name].'/tn_'.$books_3[0][upload_file_name].$books_3[0][upload_file_ext].'" alt="" style="height: '.$size.'; float: right; margin: 0  0 1em 2.4em;"/></a>'  : '' ;


      print '<div style="float: right;">'.$cover_1.$cover_2.$cover_3.'</div>';
      print '</div></li>';

    }
       ?>


  </ul>
  </div>
     <?php ;} ?>
<?php if($_GET['type'] == 2) {
       foreach ($chronology as $k => $v) {
          print '<div id="full_chrono">
        <div style="float:left; display: block; clear: both; margin: 0 1em 0 0;"><h1><span>'.$v['chronology_year'].'</span></h1></div>

    <div style="float:left; 1066px;">
    <div style="float:left; width:750px; margin: 0 42px 0 0; text-align: justify;">'.utf8_encode($v['chronology_description']);



    $join		= " LEFT JOIN upload_file ON upload_file.upload_file_id = books.upload_file_id ";
    $where  	= " book_id = " . $v['book_id_1'];   					
    $books_1 	=  $crud->select( '' , 'books' , '*' ,  $join  , $where , '', '' , '1' , '0' );


    $join		= " LEFT JOIN upload_file ON upload_file.upload_file_id = books.upload_file_id ";
    $where  	= " book_id = " . $v['book_id_2'];   					
    $books_2 	=  $crud->select( '' , 'books' , '*' ,  $join  , $where , '', '' , '1' , '0' );

     $join		= " LEFT JOIN upload_file ON upload_file.upload_file_id = books.upload_file_id ";
     $where  	= " book_id = " . $v['book_id_3'];   					
     $books_3 	=  $crud->select( '' , 'books' , '*' ,  $join  , $where , '', '' , '1' , '0' );

    $size = '160px';

    $cover_1 = (sizeof($books_1) > 0) ? '<a href="http://ajax" title="books.php?book_id='.$v['book_id_1'].'"><img src="'.$books_1[0][dir_name].'/tn_'.$books_1[0][upload_file_name].$books_1[0][upload_file_ext].'" alt="" style="height: '.$size.'; margin-right: 1em;"/></a>'  : '' ;
    $cover_2 = (sizeof($books_2) > 0) ? '<a href="http://ajax" title="books.php?book_id='.$v['book_id_2'].'"><img src="'.$books_2[0][dir_name].'/tn_'.$books_2[0][upload_file_name].$books_2[0][upload_file_ext].'" alt="" style="height: '.$size.'; margin-right: 1em;"/></a>'  : '' ;
    $cover_3 = (sizeof($books_3) > 0) ? '<a href="http://ajax" title="books.php?book_id='.$v['book_id_3'].'"><img src="'.$books_3[0][dir_name].'/tn_'.$books_3[0][upload_file_name].$books_3[0][upload_file_ext].'" alt="" style="height: '.$size.'; "/></a>'  : '' ;    		



  print '<div style="clear:both;float: left; margin: 1em 0;  width: 720px;">'.$cover_1.$cover_2.$cover_3.'</div>';
  print '</div></div>';

  }
  print '</div>';



  } ?>


<script type="text/javascript" charset="utf-8">
     $(function() {
          $().timelinr({
        containerDiv:   '#timeline',
        orientation: 	'vertical',
        issuesSpeed: 	300,
        datesSpeed: 	100,
        arrowKeys: 		'false',
        startAt:		1
      });
      });


        $(function() {
       // Make sure to only match links to wikipedia with a rel tag
       $('a[href*=ajax/][title]').each(function()
       {
          // We make use of the .each() loop to gain access to each element via the "this" keyword...


       adjust = $(this).parent().height();

    $(this).qtip(
          {
             content: {
                // Set the text to an image HTML string with the correct src URL to the loading image you want to use
                text: '<img class="throbber" src="img/ajax-loader.gif" alt="Chargement..." />',
                ajax: {
                   url: $(this).attr('title') // Use the rel attribute of each element for the url to load
                },
                title: {
                   //text: $(this).attr('id'), // Give the tooltip a title using each elements text
                   button: true
                }
             },
        events: {
              render: function(event, api) {
                 // Grab the overlay element
                 var elem = api.elements.overlay;
              }
           },
             position: {
                at: 'right center ', // Position the tooltip above the link
                my: 'left center',
                viewport: $(window), // Keep the tooltip on-screen at all times
                effect: false, // Disable positioning animation,
               adjust: {
                     y: -70,

                  }


             },



             show: {
                event: 'click',
                solo: true, // Only show one tooltip at a time
          modal: {
                   on: true, // Make it modal (darken the rest of the page)...
                   blur: true // ... but don't close the tooltip when clicked
                }
             },
             hide: 'unfocus',
             style: {
                classes: 'ui-tooltip-wiki ui-tooltip-light ui-tooltip-shadow'
             }
          })
       })

       // Make sure it doesn't follow the link when we click it
       .click(function(event) { event.preventDefault(); });
    });
</script>