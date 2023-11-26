<style type="text/css" media="screen">
  ul {
    margin: 0;
    text-align: left;
  }

  ul.menu {
    margin-left: .5em;
    margin-bottom: 1em;
  }

  ul.menu li {
    list-style-type: none;
    display: inline-block;
    font-weight: bold;
    text-shadow: 1px 1px 0px #f3f5da;
    padding: 2px 15px;
  }

    .selected {  /*
      -webkit-border-radius: 15px;
      -moz-border-radius: 5px;
      border-radius: 5px;
      background: #acac75;
      -webkit-box-shadow: 1px 1px 0px #8c8c5d;    */
    }

    a { color: #4D4D4D; text-decoration: none; }
    .selected a, .selected a:visited {
       /* text-shadow: 1px 1px 0px #8c8c60;   */
      color: #e00071;

    }

  ul.item li {
    list-style-type: none;
    display: block;
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
     .ui-tooltip-content em { color: #4d4d4d; font-style: italic;}
    .ui-tooltip-content h2 em { color: #e00071; font-style: italic; }

    #tabs {float: left; display: block; margin: -2em 0 3em 0; font-family: arial; font-size: 0.82352941176471em;}
    #tabs a { color: #CCC;}
    #tabs a.selected_tab {color: #595959; font-style: italic;}
     .pink { color: #e00071;}
  </style>
<?php

$cover  = $books[0][dir_name].'/'.$books[0][upload_file_name].$books[0][upload_file_ext];
$join	= " LEFT JOIN upload_file ON upload_file.upload_file_id = books.upload_file_id ";
$where  = " book_id = " . $_GET['book_id'];
$books 	=  $crud->select( '' , 'books' , '*' ,  $join  , $where , '', '' , '1' , '0' );

?>	
<div id="main" class="twelvecol">
  <h1><span><span>Chronologie</span></span></h1>
   <div id="tabs">

    <a href="ajax_chrono.php?type=1" id="first_page" class="selected_tab">Chronologie par année</a> &middot;
    <a href="ajax_chrono.php?type=2">Chronologie complète</a>

  </div>
  <div id="chrono_div"></div> <!-- Updated via Ajax-->


</div>


<script type="text/javascript">


    var containerId = '#chrono_div';
    var tabsId = '#tabs';

    function loadTab(tabObj){

        $.get(tabObj.attr('href'), function(data) {

      $(containerId).html(data);

      });


    }


   $(document).ready(function() {

     $(tabsId + ' a').click(function() {
        $('#tabs').find('a').removeClass('selected_tab')
        $(this).addClass('selected_tab');
        loadTab($(this));				
            return false;
       });

        loadTab($('#first_page'));


   });


</script>
