<?php

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//   																																	
//   	SCRIPT SUMMARY (2010.04.27)                                                                                                   	
//   																																	
//   	*****************************************************************************************************************************************
//   																																	
//   	0) INITIALIZE VARS
//		1) CONSTRUCTOR
//		2) GETTERS & SETTERS  | Table | Page Name | Limit | Slice | Page | Offset | Num Page | Total Records |
//		3) SORTING
//	   			3.1) Set Sort Key (dyn var)
//	   			3.2) Set Sort Direction (dyn var)
//	   			3.3) Set Display Type (dyn var)
//		4) DATA
//	   			4.1) Set Pager Data
//	   			4.2) Check and Set Slice Number
//	   			4.3) Build Navigator
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class Pager {


  //  ******************************************************************************************************************************************
  //  0) INITIALIZE VARS
  //  ******************************************************************************************************************************************	


  //  ------------------------------------------------------------------------------------------------------------------------------------------

    static $pager_instance = 1;


  //  ******************************************************************************************************************************************
  //  1) CONSTRUCTOR
  //  ******************************************************************************************************************************************	

  function __construct() {

    $this->setPaginaterId( Pager::$pager_instance++ );
    $this->setLimit( 10 );
    $this->setSlice( 1 );
    $this->setPageName( 'default_page' );
    $this->setHomePage( 'default_homepage' );
    $this->setPagerData( );
    $this->checkAndSetSliceNumber( );
    $this->setOffset( $_GET['slice_'.$this->getPaginaterId()] );

  }

  //  ------------------------------------------------------------------------------------------------------------------------------------------



  //  ******************************************************************************************************************************************
  //  2) GETTERS & SETTERS
  //  ******************************************************************************************************************************************

  function setTable($_tbl) 					{ $this->_tbl = $_tbl; }
  function getTable() 						{ return $this->_tbl; }

  function setPageName($_page_name) 			{ $this->_page_name = $_page_name; }
  function getPageName() 						{ return $this->_page_name; }

  function setHomePage($_home_page) 			{ $this->_home_page = $_home_page; }
  function getHomePage() 						{ return $this->_home_page; }

  function setLimit($_limit) 					{ $this->_limit = $_limit; }
  function getLimit() 						{ return $this->_limit; }

  function setSlice($_slice) 					{ $this->_slice = $_slice; }
  function getSlice() 						{ return $this->_slice;	}

  function setPage($_page) 					{ $this->_page = $_page; }
  function getPage() 							{ return $this->_page; }

  function setOffset($_offset) 				{ $this->_offset = $_offset; }
  function getOffset() 						{ return $this->_offset; }

  function setNumPages($_num_pages) 			{ $this->_num_pages = $_num_pages; }
  function getNumPages() 						{ return $this->_num_pages; }

  function setTotalRecords($_total_records) 	{ $this->_total_records = $_total_records; }
  function getTotalRecords() 					{ return $this->_total_records; }

  function setPaginaterId($_pager_instance) 	{ $this->_pager_instance = $_pager_instance; }
  function getPaginaterId() 					{ return $this->_pager_instance; }

  //  ------------------------------------------------------------------------------------------------------------------------------------------




  //  ******************************************************************************************************************************************
  //  3) SORTING
  //  ******************************************************************************************************************************************

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	3.1) Set Sort Key (dyn var)
  //  ------------------------------------------------------------------------------------------------------------------------------------------


  function setSortKey( $_sort_key_name , $_sort_key_value ) {

    $dynVar = $_sort_key_name;
    $$_sort_key_name = $_sort_key_value;
    $sortKeyArray = array($_sort_key_name, $$dynVar);
    return $sortKeyArray;

  }

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	3.2) Set Sort Direction (dyn var)
  //  ------------------------------------------------------------------------------------------------------------------------------------------

  function setSortDirection( $_sort_direction_name , $_sort_direction_value ) {

    $dynVar = $_sort_direction_name;
    $$_sort_direction_name = $_sort_direction_value;
    $sortDirectionArray = array($_sort_direction_name, $$dynVar);
    return $sortDirectionArray;

  }

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	3.3) Set Display Type (dyn var)
  //  ------------------------------------------------------------------------------------------------------------------------------------------

  function setDisplayType( $_display_type_name , $_display_type_value ) {

    $dynVar = $_display_type_name;
    $$_display_type_name = $_display_type_value;
    $displayTypeArray = array($_display_type_name, $$dynVar);
    return $displayTypeArray;

  }

  //  ------------------------------------------------------------------------------------------------------------------------------------------




  //  ******************************************************************************************************************************************
  //  4) DATA
  //  ******************************************************************************************************************************************

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	4.1) Set Pager Data
  //  ------------------------------------------------------------------------------------------------------------------------------------------

  function setPagerData() {

      $_num_pages 	= ceil($this->getTotalRecords()/ $this->getLimit());
    //$_next_to_last	= $this->_num_pages - 1 ;
    $_prev_page 	= $this->getSlice() - 1;
    $_next_page 	= $this->getSlice() + 1;
      $_offset 		= ( $this->getSlice() - 1 ) * $this->getLimit();

    $this->setNumPages( $_num_pages );
    $this->setOffset( $_offset );

  }

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	4.2) Check and Set Slice Number
  //  ------------------------------------------------------------------------------------------------------------------------------------------

  function checkAndSetSliceNumber() {

    if ( !isset( $_GET['slice_'.$this->getPaginaterId()] ) )

    {

      $this->setSlice(1);

    }

    elseif ( filter_var($_GET['slice_'.$this->getPaginaterId()] , FILTER_VALIDATE_INT , array( "min_range"=>1 , "max_range"=>$this->_num_pages ) ) == false ) {

      $this->setSlice(1);

    }

    else {

      $this->setSlice( ( int ) $_GET['slice_'.$this->getPaginaterId()] );

    }	

  }

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	4.3) Build Navigator
  //  ------------------------------------------------------------------------------------------------------------------------------------------

  function buildSlicesNavigator( $sortKeyArray , $sortDirectionArray , $displayTypeArray , $adjacent = '3' , $prev_word , $next_word) {

    if ( sizeof( $sortKeyArray ) 		> 0 ) { $key 		  = '&amp;'.$sortKeyArray[0] 		. '=' . $sortKeyArray[1] 		;}
    if ( sizeof( $sortDirectionArray )  > 0 ) { $direction 	  = '&amp;'.$sortDirectionArray[0] 	. '=' . $sortDirectionArray[1] 	;}
    if ( sizeof( $displayTypeArray) 	> 0 ) { $display_type = '&amp;'.$displayTypeArray[0] 	. '=' . $displayTypeArray[1] 	;}

    if ( $this->_num_pages > 0)  {

      $this->setPagerData();

        /*

        if ( $this->getSlice() != 1 ) { // First Page

          $recordset_menu .=
          '<li><a href="'.$this->getPageName().$key.$direction.$display_type.'&slice_'.$this->getPaginaterId().'='.($this->getSlice() - 1).'">
          <img src="img/icons/prev.png" alt="prev" />&nbsp; PREV </a></li>';

        }

        else { // Disabled First Page

          $recordset_menu .= '<li><img src="img/icons/arrow_nav_left.gif" alt="disabled_prev" />&nbsp;<span style="color:#CCC;"> PREV </span>&nbsp;</li>';

        }

        */

        $recordset_menu = '';

        if ($this->_num_pages > 1) {


            if ( $this->getSlice() == 2 ) {

              $recordset_menu .=
              '<li class="no_border"><a href="'.$this->getHomePage().$key.$direction.$display_type.'">'.$prev_word.'<span class="left_abled"><img src="img/icons/prev.png" alt="prev" /></span></a></li>';	


            }

            elseif ( $this->getSlice() > 2 ) {

              $recordset_menu .=  '<li class="no_border"><a href="'.$this->getPageName().$key.$direction.$display_type.'&slice_'.$this->getPaginaterId().'='. ($this->getSlice()-1).'">'.$prev_word.'
              <span class="left_abled"><img src="img/icons/prev.png" alt="prev" /></span></a></li>';		

            }

            else {
                $recordset_menu .=
                '<li class="no_border"><span style="color:#CCC;">'.$prev_word.'</span><span class="left_disabled"><img src="img/icons/arrow_nav_left.gif" alt="disabled_prev" /></span></li>';

            }







        if ($this->_num_pages < 7 + ( $adjacent * 2) ) {

          if ( $this->getSlice() == 1 ) {

            $recordset_menu .= '<li class="selected">'.$i.'</li>';

          }

          else {

            $recordset_menu .= '<li><a href="'.$this->getHomePage().$key.$direction.$display_type.'">1</a></li>';

          }

          for ( $i = 2; $i <= $this->_num_pages ; $i++ ) {

            if ( $i == $this->getSlice() ) {

              $recordset_menu .= '<li class="selected">'.$i.'</li>';
              $recordset_menu .= '<li><a href="'.$this->getPageName().$key.$direction.$display_type.'&slice_'.$this->getPaginaterId().'='.$i.'">'.$i.'</a></li>'."\n";

            }

          }

        }

          else {

            if ( $this->getSlice() < 2 + ( $adjacent * 2 ) ) {

              if ( $this->getSlice() == 1 ) {

                $recordset_menu .= '<li class="selected">1</li>' ;

              } else {

                $recordset_menu .= '<li><a href="'.$this->getHomePage().$key.$direction.$display_type.'">1</a></li>';

              }


              for ($i = 2; $i < 4 + ($adjacent * 2); $i++)	{

                if ($i ==  $this->getSlice()) {

                  $recordset_menu .= '<li class="selected">'.$i.'</li>';

                }

                else {

                  $recordset_menu .= '<li><a href="'.$this->getPageName().$key.$direction.$display_type.'&slice_'.$this->getPaginaterId().'='.$i.'">'.$i.'</a></li>'."\n";

                }

            }

            $recordset_menu .= '<li>...</li>';

            $recordset_menu .= '<li><a href="'.$this->getPageName().$key.$direction.$display_type.'&slice_'.$this->getPaginaterId().'='.$this->_num_pages.'">'.$this->_num_pages.'</a></li>';

            }


          elseif ( ( ( $adjacent * 2 ) + 1 < $this->getSlice() ) && ( $this->getSlice() < $this->_num_pages - ( $adjacent * 2 ) ) ) {

              $recordset_menu .= '<li><a href="'.$this->getPageName().$key.$direction.$display_type.'">1</a></li>';
              $recordset_menu .= '<li><a href="'.$this->getPageName().$key.$direction.$display_type.'&slice_'.$this->getPaginaterId().'=2">2</a></li>';
              $recordset_menu .= '<li>...</li>';

              for ($i = $this->getSlice() - $adjacent; $i <= $this->getSlice() + $adjacent; $i++) {

                if ( $i == $this->getSlice() ) {

                  $recordset_menu .= '<li class="selected">'.$i.'</li>';


                }

                else {

                  $recordset_menu .= '<li><a href="'.$this->getPageName().$key.$direction.$display_type.'&slice_'.$this->getPaginaterId().'='.$i.'">'.$i.'</a></li>'."\n";


                }

              }

              $recordset_menu .= '<li>...</li>';

                    /*	$recordset_menu .= '<li><a href="'.$this->getPageName().$key.$direction.$display_type.'&slice_'.$this->getPaginaterId().'='.$next_to_last.'">'.$next_to_last.'</a></li>'; */
              $recordset_menu .= '<li><a href="'.$this->getPageName().$key.$direction.$display_type.'&slice_'.$this->getPaginaterId().'='.$this->_num_pages.'">'.$this->_num_pages.'</a></li>';

            }


            else {

               $recordset_menu .= '<li><a href="'.$this->getPageName().$key.$direction.$display_type.'">1</a></li>';
               $recordset_menu .= '<li><a href="'.$this->getPageName().$key.$direction.$display_type.'&slice_'.$this->getPaginaterId().'=2">2</a></li>';
               $recordset_menu .= '<li>...</li>';



              for ( $i = $this->_num_pages - ( 2 + ( $adjacent * 2 ) ); $i <= $this->_num_pages; $i++ ) {

                if ( $i == $this->getSlice() ) {

                  $recordset_menu .= '<li class="selected">'.$i.'</li>';



                }

                else {

                  $recordset_menu .= '<li><a href="'.$this->getPageName().$key.$direction.$display_type.'&slice_'.$this->getPaginaterId().'='.$i.'">'.$i.'</a></li>'."\n";


                }

              }

             }

          }



        }



        if ( $this->getSlice()  == $this->_num_pages ) {

          $recordset_menu .=
          '<li class="no_border"><span style="color:#CCC;">'.$next_word.'</span><span class="right_disabled"><img src="img/icons/arrow_nav_right.gif" alt="disabled_next" /></span></li>';

        }

        else {

          $recordset_menu .=
          '<li class="no_border"><a href="'.$this->getPageName().$key.$direction.$display_type.'&slice_'.$this->getPaginaterId().'='.($this->getSlice() + 1).'">'.$next_word.'
          <span class="right_abled"><img src="img/icons/next.png" alt="next" /></span></a></li>';

        }













        /*

          for ( $i = 1; $i <= $this->getNumPages(); $i++ ) { // Central Pages

          if ( $i == $this->getSlice() ) { // Current

            $recordset_menu .= '<li class="selected">'.$i.'</li>';

          }

          else { // Rest of Pages

            $recordset_menu .= '<li><a href="'.$this->getPageName().$key.$direction.$display_type.'&slice_'.$this->getPaginaterId().'='.$i.'">'.$i.'</a></li>'."\n";

          }

        }




          if ( $this->getSlice() < $this->getNumPages() )  { // Last Page

              $recordset_menu .=
          '<li><a href="'.$this->getPageName().$key.$direction.$display_type.'&slice_'.$this->getPaginaterId().'='.($this->getSlice() + 1).'"> NEXT &nbsp;
          <img src="img/icons/next.png" alt="next" /></a></li>';

        }

        else { // Disabled Last Page

          $recordset_menu .=
          '<li>&nbsp;<span style="color:#CCC;"> NEXT </span>&nbsp;<img src="img/icons/arrow_nav_right.gif" alt="disabled_next" /> </li>';

        }

        */

      }

      return $recordset_menu;

    }


    //  ------------------------------------------------------------------------------------------------------------------------------------------
    // 	4.3) Build Navigator
    //  ------------------------------------------------------------------------------------------------------------------------------------------

    function buildPlainNavigator( $sortKeyArray , $sortDirectionArray , $displayTypeArray) {

      if ( sizeof( $sortKeyArray ) 		> 0 ) { $key 		  = '&amp;'.$sortKeyArray[0] 		. '=' . $sortKeyArray[1] 		;}
      if ( sizeof( $sortDirectionArray )  > 0 ) { $direction 	  = '&amp;'.$sortDirectionArray[0] 	. '=' . $sortDirectionArray[1] 	;}
      if ( sizeof( $displayTypeArray) 	> 0 ) { $display_type = '&amp;'.$displayTypeArray[0] 	. '=' . $displayTypeArray[1] 	;}

      if ( $this->_num_pages > 0)  {

        $this->setPagerData();



          if ( $this->getSlice() != 1 ) { // First Page

            $recordset_menu .=
            '<li><a href="'.$this->getPageName().$key.$direction.$display_type.'&slice_'.$this->getPaginaterId().'='.($this->getSlice() - 1).'">
            <img src="img/icons/prev.png" alt="prev" /></a></li>';

          }

          else { // Disabled First Page

            $recordset_menu .= '<li><img src="img/icons/arrow_nav_left.gif" alt="disabled_prev" /></li>';

          }



            if ( $this->getSlice() < $this->getNumPages() )  { // Last Page

                $recordset_menu .=
            '<li><a href="'.$this->getPageName().$key.$direction.$display_type.'&slice_'.$this->getPaginaterId().'='.($this->getSlice() + 1).'">
            <img src="img/icons/next.png" alt="next" /></a></li>';

          }

          else { // Disabled Last Page

            $recordset_menu .=
            '<li><img src="img/icons/arrow_nav_right.gif" alt="disabled_next" /> </li>';

          }


        }

        return $recordset_menu;

      }

    //  ------------------------------------------------------------------------------------------------------------------------------------------


}

?>