<style type="text/css" media="screen">
  #books_menu {display: block; margin: 36px 0 24px 28px;}
  ul {
    margin: 0;
    text-align: left;
  }

  ul.menu {
    margin: 0.58823529411765em 0 3em 0;

  }

  ul.menu li {
    list-style-type: none;
    display: inline-block;
      padding: 0.52941176470588em 0.47058823529412em 0  0.47058823529412em ;
    width: 200px;

  }

    .selected {
      background-color: #989EA6;
        background-image: none;
        border: medium none;
        border-radius: 2px 2px 2px 2px;
        color: white;
        padding: 2px 4px;
    }

    a { color: #4D4D4D; text-decoration: none;  }
    .selected a, .selected a:visited {
       /* text-shadow: 1px 1px 0px #8c8c60;   */
      /* color: #e00071; */
      color: white;

    }

ul.item { margin: 12px 0 0 38px; }

    ul.item li {
    list-style-type: none;
    display: inline;
    float: left;
    margin: 1px 2px;
    text-align: center;
    cursor: pointer;

  }

  .ui-tooltip-content em { font-size: 1em;}

  .ui-tooltip-wiki{
     max-width: 520px;
  }

     .ui-tooltip-wiki .ui-tooltip-content{
        padding: 1.8em;
          font-size: 1.41176470588235em;
        line-height: 1.4em;
     }

     .ui-tooltip-wiki h1{
        margin: 0 0 7px;

        font-size: 1.5em;
        line-height: 1em;
     }

     .ui-tooltip-wiki img{ padding: 0 10px 0 0; }

     .ui-tooltip-wiki p{ margin-bottom: 9px; }
     .ui-tooltip-wiki .note{ margin-bottom: 0; font-style: italic; color: #888; }


    .sub_td { background-color: #EFEFEF; padding: 1em; -moz-border-radius: 2px;
    border-radius: 2px;}
    .sub_td h2 { font-size: 1em; text-align:left; margin: 0 0 1em 0;}

    .sub { float:left; clear:both; margin: 1em 0;}
    .toggle_btn { float:left; clear: both; padding: 0 0 0 24px;	 background-image: url('img/icons/btn_open_close.png'); background-repeat: no-repeat; background-position: 0 3px; cursor: pointer;}

    .plus { background-position: 0 -297px;}

    .toggler {cursor: pointer;}

    .book_line { border-bottom: 1px dotted #CCC; width: 100%; float: left; padding-bottom: 12px; margin-bottom: 12px; display:block;}
    .tiny_date { font-size: 0.70588235294118em;}

    .ui-tooltip-content em { color: #4d4d4d; font-style: italic;}
    .ui-tooltip-content h2 em { color: #e00071; font-style: italic; }
  </style>
</style>
<div id="main" class="fourcol" style="padding-right: 4em;">
  <h1><span><span>Les Livres</span></span></h1>

  <br/><br/>

  <?php
  foreach ($books as $k => $v) {

      $author 	= ($v[book_author] != '') ? utf8_encode($v[book_author]).', ' : '' ;
    $first_title= utf8_encode($v[book_title]);

    $title 		= ($v[book_title] != '') ? utf8_encode($v[book_title]).', ' : '' ;
    $editor 	= ($v[book_editor] != '') ? utf8_encode($v[book_editor]).', ' : '' ;
    $book_detail_1 = ($v[book_detail_1] != '') ? utf8_encode($v[book_detail_1]).', ' : '' ;
    $book_detail_2 = ($v[book_detail_2] != '') ? '('.utf8_encode($v[book_detail_2]).'), ' : '' ;
    $place = ($v[place] != '') ? utf8_encode($v[place]).', ' : '' ;
    $original_edition_date = ($v[original_edition_date] != '') ? utf8_encode($v[original_edition_date]).', ' : '' ;
    $re_edition_date = ($v[re_edition_date] != '') ? utf8_encode($v[re_edition_date]).', ' : '' ;
    $no_of_pages = ($v[no_of_pages] != '') ? $v[no_of_pages].'pp.' : '' ;


    $cover = $v[dir_name].'/tn_'.$v[upload_file_name].$v[upload_file_ext];
    $description = utf8_encode($v[book_description]);

    $entry = trim($author.$title.$book_detail_1.$place.$editor.$book_detail_2.$original_edition_date.$re_edition_date.$no_of_pages);

    if((strlen($entry)-1) == strrpos($entry, ',') ) { $entry = substr($entry, 0, -1) ;}
        $datete = trim(preg_replace("/[^0-9-\s]/", "", $original_edition_date));

    $first_title = str_replace("<em>", "", $first_title);
        $first_title = str_replace("</em>", "", $first_title);


print <<<HTML
<div class="book_line">
  <div class="toggler">
    <div class="toggle_btn"> $first_title <span class="tiny_date">&middot; $datete</span></div>
  </div>
  <div class="sub">
    <div class="sub_td" style="float:left;">
      <h2>$entry</h2>
      <img src="{$cover}" alt="" class="align_left" alt="" style="height: 160px; float: left; margin: 0 1em 0.4em 0;" />
      $description
    </div>
  </div>
</div>
HTML;


  }
  ?>




</div>
<div class="sevencol">
<div id="books_menu">	
<img src="img/accolade.png" alt="" style="float:left; height:100px; margin: 0 12px 0 0;"/>	
<ul class="menu">
  <li><a href="#" rel="" class="selected">1. Tous les livres</a></li><br/>
  <li><a href="#" rel="1">2. Editions courantes</a></li>
  <li><a href="#" rel="3">3. Editions originales</a></li>
  <li><a href="#" rel="2">4. Livres sur l'auteur</a></li>
</ul>
</div>
<ul class="item">

  <?php

  foreach ($books as $k => $v) {

            print '<li rel="'.$v[book_category].'"><a href="#" title="books.php?book_id='.$v[book_id].'"><img src="'.$v[dir_name].'/tn_'.$v[upload_file_name].$v[upload_file_ext].'"></a></li>';


  }




  ?>


</ul>
</div>
<script type="text/javascript">

  $(document).ready(function() {


    $('.book_line').last().css('border', 'none');



    $('.menu li a').bind('click', function() {


      $('.menu li a').removeClass('selected');
      $(this).addClass('selected');

      thisItem 	= $(this).attr('rel');




        //var min_width = Math.min.apply( null,  $('.item li[rel='+thisItem+'] img').map(function(){ return $(this).width();}).get());
                //var max_height = Math.min.apply( null,  $('.item li[rel='+thisItem+'] img').map(function(){ return $(this).height();}).get());


           $('.item li').stop()
                               .animate({'width' : 0,
                                    'height' : 0,
                                   'opacity' : 0,
                                   'marginRight' : 0,
                                   'marginLeft' : 0
                                  }).css('display','none');


        if(thisItem == '') {
          $('.item li').stop()
                              .animate({	'width' : '180px',
                                    'height' : '180px',
                                    'opacity' : 1,
                                    'marginRight' : '2px',
                                    'marginLeft' : '2px'
                                    }).css('display','inline-block');
        }
        else {

           $('.item li[rel='+thisItem+']').stop()
                                .animate({	'width' : '180px',
                                      'height' : '180px',
                                      'opacity' : 1,
                                      'marginRight' : '2px',
                                      'marginLeft' : '2px'
                                      }).css('display','inline-block');
        }



      return false;
    })




        $('.menu li a:eq(0)').trigger('click');


    $('.item li img').animate({'opacity' : 1}).hover(function() {
      $('.item li img').not(this).stop().animate({'opacity' : 0.5}, 240);
    }, function() {
      $('.item li img').not(this).stop().animate({'opacity' : 1}, 240);
    });

  });




  // Create the tooltips only on document load
  $(document).ready(function()
  {

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
