<?php

$_PAGE = stripslashes($_GET['p'] ?? 'accueil');

include 'models/model.connection.php';
include 'models/model.crud.php';
include 'models/model.extender.php';
$crud     = new Crud();
$extender   = new Extender();
include 'controllers/controller.public.php';
include 'functions/function.checkPageTitle.php';
include 'functions/function.menuItem.php';
include 'functions/function.checkIfExplorer.php';

$title    = checkPageTitle($_PAGE);

?>

<!doctype html>
<html lang="fr">

<head>
  <title>Association des Amis de Charles-Albert Cingria &middot; <?php print $title; ?></title>

  <!-- <base href="http://www.cingria.ch/index2.php"> -->

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
  <link rel="stylesheet" href="css/fullsize.css" type="text/css" />

  <link rel="shortcut icon" href="img/favicon.ico" />
  <link href='https://fonts.googleapis.com/css?family=Goudy+Bookletter+1911' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Raleway:100' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Cantarell' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Crimson+Text:400,600' rel='stylesheet' type='text/css'>

  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/css3-mediaqueries.js"></script>
  <script type="text/javascript" src="js/scrollto.js"></script>
  <script type="text/javascript" src="js/easing.js"></script>
  <script type="text/javascript" src="js/quovolver.js"></script>
  <script type="text/javascript" src="js/timelinr.js"></script>
  <script type="text/javascript" src="js/qtip.js"></script>
  <script type="text/javascript" src="js/jscroll.js"></script>
  <script type="text/javascript" src="js/masonry.js"></script>
  <script type="text/javascript" src="js/fullsize.js"></script>
  <link href="https://vjs.zencdn.net/c/video-js.css" rel="stylesheet">
  <script src="https://vjs.zencdn.net/c/video.js"></script>


  <!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
  <!--[if lte IE 7]><script src="js/IE8.js" type="text/javascript"></script><![endif]-->
  <!--[if lt IE 7]><link rel="stylesheet" type="text/css" media="all" href="css/ie6.css"/><![endif]-->

</head>

<body>

  <div class="container">
    <div class="row">

      <div id="logo" class="fourcol">
        <p><a href="/accueil"><img src="img/logo_site_2.gif" alt="Logo Cingria" /></a></p>
      </div>
      <div class="eightcol last">
        <nav>
          <ul>
            <li>
              <?php menu_item('/', 'accueil', 'Accueil', $_PAGE); ?>
            </li>
            <li>&middot;</li>

            <li>
              <?php menu_item('/', 'association', 'L\'Association', $_PAGE); ?>
            </li>
            <li>&middot;</li>

            <li>
              <?php menu_item('/', 'premiere-edition-des-oeuvres-completes', 'Les Œuvres complètes', $_PAGE); ?>
            </li>
            <li>&middot;</li>


            <li>
              <?php menu_item('/', 'chronologie', 'Chronologie', $_PAGE); ?>
            </li>

          </ul>


          <ul>


            <li>
              <?php menu_item('/', 'les-livres', 'Les livres', $_PAGE); ?>
            </li>
            <li>&middot;</li>
            <li>
              <?php menu_item('/', 'les-fonds', 'Les Fonds', $_PAGE); ?>
            </li>
            <?php if (!checkIfExplorer()) {  ?>

              <li>&middot;</li>
              <li>
                <?php menu_item('/', 'les-petites-feuilles', 'les Petites Feuilles', $_PAGE); ?>
              </li>
              <li>&middot;</li>
              <li>
                <?php menu_item('/', 'cingria-dans-la-litterature-romande', 'Pour aller plus loin', $_PAGE); ?>
              </li>

            <?php }  ?>


          </ul>
        </nav>
      </div>
    </div>
  </div>

  <div class="container">
    <div class="row">
      <?php include('pages/' . $_PAGE . '.php'); ?>
    </div>
  </div>

  <div class="container" style="margin: 0 0 -34px 0;">
    <div class="row">
      <div class="twelvecol last">
        <div id="contribute"></div>
      </div>
    </div>
  </div>

  <div class="container">
    <footer class="row grey">

      <div class="padded_footer_item" style="float:left; width: 40%;">
        <span style="color: #B2B8BA; font-family:'Raleway'; text-shadow: 0px 1px 1px #212222;">Association des Amis de<br />Charles-Albert Cingria</span>
        <span style="font-size: 0.6em; clear:both; display: block; line-height: 0.9em; margin: 3px 0 0 0; ">rue Centrale 8<br />1804 Corsier-sur-Vevey &middot; Suisse</span>
        <div id="signature" style="font-size: 0.41176470588235em; clear:both; display: block; line-height: 0.6em; margin: 38px 0 0 -4px; color: #B2B8BA; letter-spacing: 1px;">
          <div id="signature_arrow"><img src="img/arrow_grey.png" alt="arrow" /></div>
          <div id="signature_text" class="signature"><a href="http://www.societe-ecran.tv" onclick="window.open(this.href, '_blank'); return false;">SOCIETE-ECRAN MEDIA</a></div>
          <div class="signature" style="color:#272729; float:left; margin: 0 0 0 4px;">
            <?php $start = 2011;
            print $start;
            if (date('Y') != $start) {
              print '-' . date('y');
            } ?>
          </div>
        </div>
      </div>
      <div style="float:left; width: 230px; margin: 52px 0 0 0; ">
        <span id="hidden_contact" style="display: block; color: #B2B8BA; text-align: left; letter-spacing: 2px; font-size: 12px; font-family:'Lucida Grande',sans-serif;">Si vous souhaitez partager des documents autour de Cingria,
          vous pouvez prendre contact avec <a href="mailto:info@cingria.ch" class="pink_link_sans">nous</a> ici .</span>
      </div>
      <div id="footer_right">
        <?php if ($_PAGE != 'cingria-dans-la-litterature-romande') { ?>
          <a href="articles/histoire-de-la-litterature-en-suisse-romande-cingria.pdf">
            <div id="articles" style="display: block; color: #B2B8BA; padding: 0 0 0 80px; margin: 52px 0 0 0; text-align: left; letter-spacing: 2px; font-size: 0.82352941176471em; font-family:'Lucida Grande',sans-serif;">
              <span id="fading_button">
                <h3><span>Pour aller plus loin</span></h3>
                Maryke de Courten, <em>Charles-Albert Cingria</em>, dans Roger Francillon (dir.), Histoire de la littérature en Suisse romande, t.II, Lausanne, Payot, 1997, pp.449-471
              </span>
            </div>
          </a>
        <?php } ?>
        <div id="to_top" style="margin: -12px 0 0 0; clear: both; display:block; width: 300px; text-align: right; float:right; color: #B2B8BA; letter-spacing: 2px; font-size: 0.64705882352941em; font-family:'Lucida Grande',sans-serif;">
          VERS LE SOMMET<img src="img/to_top.png" alt="sommet de page" style="float:right; margin: 3px 0 0 7px" />

        </div>
      </div>


    </footer>
  </div>

  <?php include 'chunks/slide_arrays.php'; ?>
  <script type="text/javascript" charset="utf-8">
    $(window).load(function() {

      $('#masonry').masonry({
        singleMode: true,
        itemSelector: '.masonry_item'
      });

    });


    $(document).ready(function() {



      $(".masonry_item img").fullsize({
        shadow: true,
        forceTitleBar: false
      });


      $('#to_top, #signature_text').fadeTo(0, 0.5);
      $('#signature_arrow').fadeTo(0, 0);

      $('#to_top').mouseover(function() {

        $(this).stop().fadeTo(100, 1);
      }).mouseout(function() {
        $(this).stop().fadeTo(500, 0.5);
      });


      $('#signature_text').hover(

        function() {
          $(this).stop().fadeTo(100, 1).animate({
            marginLeft: '6px'
          }, 80, function() {
            $('#signature_arrow').fadeTo(100, 1)
          });
        },
        function() {

          $(this).stop().fadeTo(500, 0.5).animate({
            marginLeft: '0'
          }, 120, function() {
            $('#signature_arrow').fadeTo(100, 0);
          });
        }
      );






      var list_items = $('#main_oc').find('li');
      $.each(list_items, function(key) {
        key = key + 1;
        $(this).prepend('<img src="img/icons/' + key + '.png" alt="' + key + '" />');
      });


      $('#hidden_contact').hide();
      $('#contribute').toggle(function() {
        $('#hidden_contact').fadeIn('300');
      }, function() {
        $('#hidden_contact').hide();
      });


      $('.book').hover(function() {
        $(this).children('.book_title').delay(120).stop().fadeIn();
      }, function() {
        $(this).children('.book_title').delay(120).stop().fadeOut();
      });

      $('#bio').find('p:nth-child(2)').hide();

      $('#show_more').click(function() {

        $('#bio').find('p:nth-child(2)').slideToggle('fast');

        text = $(this).text() == 'lire la suite de la notice' ? 'réduire la notice' : 'lire la suite de la notice';
        $(this).text(text);

      });

      $('#contact_info').hide();
      $('#contact').click(function() {

        $('#contact_info').slideToggle('fast');
        return false;

      });




      $('#to_top').click(function() {
        $('html, body').animate({
          scrollTop: 0
        }, 'slow');
      });

      $('blockquote').quovolver(500, 18000);



    });



    $(window).load(function() {

      setInterval(function() {
        $('#slides_main :nth-child(1)').next().show().end().fadeOut(1200).appendTo('#slides_main');
      }, 12000);
      setInterval(function() {
        $('#slides_main_right :nth-child(1)').next().show().end().fadeOut(1200).appendTo('#slides_main_right');
      }, 10000);




    });




    $('<?php print $slideshow_1 ?>').insertAfter('#main_text p:first-child');
    $('<?php print $slideshow_2 ?>').insertAfter('#main_text p:nth-child(4)');

    $(function() {
      $("#order_box").jScroll();
    });



    $('.sub').hide();
    $('.toggler').click(function() {
      $(this).next('.sub').toggle();
      $(this).find('.toggle_btn').toggleClass('plus');

      if ($(this).find('.toggle_btn').hasClass('plus')) {

        $.scrollTo($(this).next('.sub'), 1400, {
          easing: "easeInOutExpo"
        });

      }

    });


    $('.close_sub').click(function() {

      $.scrollTo($(this).parent().parent().parent(), 1400, {
        easing: "easeInOutExpo"
      });


    });




    // Once the video is ready
    _V_("example_video_1").ready(function() {

      var myPlayer = this; // Store the video object
      var aspectRatio = 9 / 16; // Make up an aspect ratio

      function resizeVideoJS() {
        // Get the parent element's actual width
        var width = document.getElementById(myPlayer.id).parentElement.offsetWidth;
        // Set width to fill parent element, Set height
        myPlayer.width(width).height(width * aspectRatio);
      }

      resizeVideoJS(); // Initialize the function
      window.onresize = resizeVideoJS; // Call the function on resize
    });
  </script>


</body>

</html>