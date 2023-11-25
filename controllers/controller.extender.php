<?php



   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   //																																		
   //  	SCRIPT SUMMARY (2010.03.22)  (n.b.: this file is included by switch.extender.php)                                                                                                       	
   //																																		
   // 	**************************************************************************************************************************************
   //																																		
   //	0) PERMISSION CHECK
   //	1) INCLUDES
   //	2) INSTANCES
   //				2.1) Extender
   //				2.2) Crud
   //	3) CATEGORIES
   //				3.1) Select categories
   //				3.2) Delete category
   //				3.3) Create category
   //				3.4) Rename category
   //	4) SUBCATEGORIES
   //				4.1) Select subcategories
   //				4.2) Delete subcategory
   //				4.3) Create subcategory
   //				4.4) Rename subcategory
   //	5) BRANDS
   //				5.1) Select brands
   //				5.2) Delete brand
   // 				5.3) Create brand
   //				5.4) Rename brand
   //	6) CURRENCY
   // 				6.1) Select currencies
   //				6.2) Edit currency
   //	7) TAXES
   // 				6.1) Select tax
   //				6.2) Edit tax
   //	8) USERS
   //				7.1) Select users
   //				7.2) Create user
   //				7.3) Delete user
   //				7.4) Edit user
   //	9) SIZES
   //   			8.1) Select sizes
   //				8.2) Create range
   //     			8.3) Add to range
   //     			8.4) Delete range
   //     			8.5) Rename range
   //     			8.6) Delete size
   //   10) TEMPLATES
   //				9.1) Select templates
   //     			9.2) Create template
   //     			9.3) Rename template
   //     			9.4) Delete template
   //   11) LINKS
   //     			10.1) Select link categories
   //     			10.2) Add link category
   //     			10.3) Delete link category
   //     			10.4) Rename link category
   //     			10.5) Create link
   //     			10.6) Edit link
   //
   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////







//  ******************************************************************************************************************************************
//  0) PERMISSION CHECK
//  ******************************************************************************************************************************************	

    if ( $_SESSION['login_status'] != 1 ) { header( "location:?page=home" ) ;}

//  ------------------------------------------------------------------------------------------------------------------------------------------




//  ******************************************************************************************************************************************
//  1) INCLUDES
//  ******************************************************************************************************************************************

	include 'models/model.extender.php';
	
	include 'models/model.crud.php';
	
	include 'functions/function.truncateString.php';

//  ------------------------------------------------------------------------------------------------------------------------------------------




//  ******************************************************************************************************************************************
//  2) INSTANCES
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.1) Extender
//  ------------------------------------------------------------------------------------------------------------------------------------------

	$extender = new extender		( );
	
	if ( $_GET['action'] == 'category_list' )  	 { $extender->setRedir( '?page=extender&action=category_list' ) ;}
	if ( $_GET['action'] == 'delete_category' )  { $extender->setRedir( '?page=extender&action=category_list' ) ;}
	if ( $_GET['action'] == 'rename_category' )  { $extender->setRedir( '?page=extender&action=category_list' ) ;}
	
	if ( $_GET['action'] == 'subcategory_list' )  	{ $extender->setRedir( '?page=extender&action=subcategory_list' ) ;}
	if ( $_GET['action'] == 'delete_subcategory' )  { $extender->setRedir( '?page=extender&action=subcategory_list' ) ;}
	if ( $_GET['action'] == 'rename_subcategory' )  { $extender->setRedir( '?page=extender&action=subcategory_list' ) ;}
	
	
	if ( strpos ( $_GET['action'] , 'template' ) ) { $extender->setRedir( '?page=extender&action=template_list' ) ;}
	if ( strpos ( $_GET['action'] , 'user'     ) ) { $extender->setRedir( '?page=extender&action=user_list'     ) ;}
	if ( strpos ( $_GET['action'] , 'link'     ) ) { $extender->setRedir( '?page=extender&action=link_list'     ) ;}
	
	if ( $_GET['action'] == 'currency_list'    )   { $extender->setRedir( '?page=extender&action=currency_list' ) ;}
	if ( $_GET['action'] == 'link_list'    	   )   { $extender->setRedir( '?page=extender&action=link_list' 	) ;}
	if ( $_GET['action'] == 'template_list'    )   { $extender->setRedir( '?page=extender&action=template_list' ) ;}
	if ( $_GET['action'] == 'user_list'    	   )   { $extender->setRedir( '?page=extender&action=user_list' 	) ;}
	

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	2.2) Crud
//  ------------------------------------------------------------------------------------------------------------------------------------------

	$crud = new Crud				( );

// -------------------------------------------------------------------------------------------------------------------------------------------




//  ******************************************************************************************************************************************
//  3) CATEGORIES
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.1) Select categories
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'category_list' ) {
	
		$crud->setTable( 'category' );
		$rows  =  $crud->select( '' , $crud->getTable() , '*' , '' , '' , 'category_name ASC' , '' , '' , '' );	
		$cat_rows = $crud->select( 'num' , $crud->getTable() ,'*', '', '', 'category_id ASC', '' , '', '');
			
	}


//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.2) Delete category
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'delete_category' ) {
	
		if ( $_GET['category_parent_id'] == 0 ) {
			
			$crud->delete( 'category' , 'category_parent_id' , '=' , (int) $_GET['category_id'] );
			$crud->delete( 'category' , 'category_id' , '=' , (int) $_GET['category_id'] );
			header( "location: " . $extender->getRedir() );	
				
		}
		else {
			
			$crud->delete( 'category' , 'category_id' , '=' , (int) $_GET['category_id'] );
			header( "location: " . $extender->getRedir() );	
					
		}
		
	}
	
//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.3) Create category
//  ------------------------------------------------------------------------------------------------------------------------------------------


	if ( ( isset( $_POST['add_category'] ) ) && ( $_POST['category_name'] != '' ) ) {
		
		$fields = array( 'category_parent_id' => $_POST['category_parent_id'] , 'category_name' => $_POST['category_name'] );
			
			if ( $crud->insert( 'category' , $fields ) ) {
				
				header( "location: " . $extender->getRedir() );
			
			}
	
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	3.4) Rename category
//  ------------------------------------------------------------------------------------------------------------------------------------------


	if ( $_GET['action'] == 'rename_category' ) {
		
		$where = 'category_id' . '=' . $_GET['category_id'];
		$rows  = $crud->select( '' , 'category' , '*' , '' , $where , '' , '' , '1' , '0' );
	
	}

	if ( isset( $_POST['rename_category'] ) ) {
		
		$fields = array('category_name' => $_POST['category_name']);
		
			if ( $crud->update( 'category' , $fields , 'category_id' , $_POST['category_id'] ) ) {
				
				header("location: " . $extender->getRedir() );
				
			}

	}

//  ------------------------------------------------------------------------------------------------------------------------------------------


//  ******************************************************************************************************************************************
//  4) SUBCATEGORIES
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	4.1) Select subcategories
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'subcategory_list' ) {
	
		$crud->setTable( 'subcategory' );
		$rows  =  $crud->select( '' , $crud->getTable() , '*' , '' , '' , 'subcategory_name ASC' , '' , '' , '' );	
		$cat_rows = $crud->select( 'num' , $crud->getTable() ,'*', '', '', 'subcategory_id ASC', '' , '', '');
			
	}


//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	4.2) Delete subcategory
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'delete_subcategory' ) {
	
		if ( $_GET['subcategory_parent_id'] == 0 ) {
			
			$crud->delete( 'subcategory' , 'subcategory_parent_id' , '=' , (int) $_GET['subcategory_id'] );
			$crud->delete( 'subcategory' , 'subcategory_id' , '=' , (int) $_GET['subcategory_id'] );
			header( "location: " . $extender->getRedir() );	
				
		}
		else {
			
			$crud->delete( 'subcategory' , 'subcategory_id' , '=' , (int) $_GET['subcategory_id'] );
			header( "location: " . $extender->getRedir() );	
					
		}
		
	}
	
//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	4.3) Create subcategory
//  ------------------------------------------------------------------------------------------------------------------------------------------


	if ( ( isset( $_POST['add_subcategory'] ) ) && ( $_POST['subcategory_name'] != '' ) ) {
		
		$fields = array( 'subcategory_parent_id' => $_POST['subcategory_parent_id'] , 'subcategory_name' => $_POST['subcategory_name'] );
			
			if ( $crud->insert( 'subcategory' , $fields ) ) {
				
				header( "location: " . $extender->getRedir() );
			
			}
	
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	4.4) Rename subcategory
//  ------------------------------------------------------------------------------------------------------------------------------------------


	if ( $_GET['action'] == 'rename_subcategory' ) {
		
		$where = 'subcategory_id' . '=' . $_GET['subcategory_id'];
		$rows  = $crud->select( '' , 'subcategory' , '*' , '' , $where , '' , '' , '1' , '0' );
	
	}

	if ( isset( $_POST['rename_subcategory'] ) ) {
		
		$fields = array('subcategory_name' => $_POST['subcategory_name']);
		
			if ( $crud->update( 'subcategory' , $fields , 'subcategory_id' , $_POST['subcategory_id'] ) ) {
				
				header("location: " . $extender->getRedir() );
				
			}

	}

//  ------------------------------------------------------------------------------------------------------------------------------------------


//  ******************************************************************************************************************************************
//  5) BRANDS
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	5.1) Select brands
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'brand_list' ) {
		
		$crud->setTable( 'brand' );		
		$rows  =  $crud->select( '' , $crud->getTable() , '*' , '' , '' , 'brand_name ASC' , '' , '' , '' );	
		
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	5.2) Delete brand
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'delete_brand' ) {
		
		if ( $crud->delete( 'brand' , 'brand_id' , '=' , (int) $_GET['brand_id'] ) ) {
			
			header( "location: " . $extender->getRedir() );
			
		}
				
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	5.3) Create brand
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( ( isset( $_POST['add_brand'] ) ) && ( $_POST['brand_name'] != '' ) ) {
		
		$fields = array( 'brand_name' => $_POST['brand_name'] );
		
			if ( $crud->insert( 'brand' , $fields ) ) {
				
				header( "location: " . $extender->getRedir() );	
				
			}
				
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	5.4) Rename brand
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'rename_brand' ) {
	
		$where = 'brand_id' . '=' . $_GET['brand_id'];
		$rows  = $crud->select( '' , 'brand' , '*' , '' , $where , '' , '' , '1' , '0' );
	
	}

	if ( isset( $_POST['rename_brand'] ) ) {
		
		$fields = array( 'brand_name' => $_POST['brand_name'] );
		
			if ( $crud->update( 'brand' , $fields , 'brand_id' , $_POST['brand_id'] ) ) {
				
				header("location: " . $extender->getRedir() );
				
			}
			
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------




//  ******************************************************************************************************************************************
//  6) CURRENCY
//  ******************************************************************************************************************************************


//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	6.1) Select currencies
//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	if ( $_GET['action'] == 'currency_list' ) {
		
		$where = " currency_id = 1 ";	
		$rows  =  $crud->select( '' , 'currency' , '*' , '', $where , '' , '' , '1' , '0' );
		
	}
	
//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	6.2) Edit currency
//  ------------------------------------------------------------------------------------------------------------------------------------------


	if ( isset( $_POST['update_currency'] ) ) {
	
		$fields = array( 'EURO' => $_POST['EURO'] , 'USD' => $_POST['USD'] , 'GBP' => $_POST['GBP'] );
		
			if ( $crud->update( 'currency' , $fields , 'currency_id' , '1' ) ) {
				
				header("location: " . $extender->getRedir() . "&updated_flag=1" );
				
			}
	
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------



//  ******************************************************************************************************************************************
//  7) TAXES
//  ******************************************************************************************************************************************


//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	7.1) Select taxes
//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	if ( $_GET['action'] == 'tax_list' ) {
			
			$rows  =  $crud->select( '' , 'tax' , '*' , '', '' , '' , '' , '' , '' );
			
	}
	
//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	7.2) Edit taxes
//  ------------------------------------------------------------------------------------------------------------------------------------------


	if ( isset( $_POST['update_tax'] ) ) {
		
		$extender->setRedir( '?page=extender&action=tax_list' );
		
		
		$fields = array( 'tax_value' => $_POST['1']);
		$crud->update( 'tax' , $fields , 'tax_id' , '1' );
		
		$fields = array( 'tax_value' => $_POST['2']);
		$crud->update( 'tax' , $fields , 'tax_id' , '2' );
		
		$fields = array( 'tax_value' => $_POST['3']);
		$crud->update( 'tax' , $fields , 'tax_id' , '3' );
		
		$fields = array( 'tax_value' => $_POST['4']);
		$crud->update( 'tax' , $fields , 'tax_id' , '4' );
				
		header("location: " . $extender->getRedir() . "&updated_flag=1" );
				
		

	}

//  ------------------------------------------------------------------------------------------------------------------------------------------


//  ******************************************************************************************************************************************
//  8) USERS
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	8.1) Select users
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'user_list' ) {
	
		$crud->setTable( 'admin' );
		$rows  =  $crud->select( '' , $crud->getTable() , '*' , '' , '' , 'admin_surname ASC' , '' , '' , '' );	
		
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	8.2) Create user
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_POST['add_user'] == '1' ) {
		
		$fields = array( 'admin_name'     => $_POST['admin_name'] ,
						 'admin_surname'  => $_POST['admin_surname'] ,
						 'admin_email'    => $_POST['admin_email'] ,
						 'admin_password' => $_POST['admin_password'] ,
						 'admin_group'    => $_POST['admin_group'] );

			if ( $crud->insert( 'admin' , $fields ) ) {

				header( "location: " . $extender->getRedir() );	

			}
		
	}


//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	8.3) Delete user
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'delete_user' ) {
		
		if ( $crud->delete( 'admin' , 'admin_id' , '=' , (int) $_GET['admin_id'] ) ) {

			header( "location: " . $extender->getRedir() );

		}
			
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	8.4) Edit user
//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	if($_GET['action']	 == 'edit_user') {

		$where = " admin_id = ".$_GET['admin_id'];	
		$rows  =  $crud->select( '' , 'admin' , '*' , '' , $where , '' , '' , '1' , '0' );
	
	}
	
	if ( $_POST['edit_user'] == '1' ) {
		
		$fields = array( 'admin_name' 	  => $_POST['admin_name'] ,
						 'admin_surname'  => $_POST['admin_surname'] ,
						 'admin_email' 	  => $_POST['admin_email'],
						 'admin_password' => $_POST['admin_password'],
						 'admin_group' 	  => $_POST['admin_group']
						);
			
			if ( $crud->update( 'admin' , $fields , 'admin_id' , $_POST['admin_id'] ) ) {

					header("location: " . $extender->getRedir() );
				
				}
				
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------




//  ******************************************************************************************************************************************
//  9) SIZES
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	9.1) Select sizes
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'size_list' ) {
	
		$crud->setTable( 'size_array' );
		$ranges  =  $crud->select( 'num' , $crud->getTable() , '*' , '', '' ,  'size_array_id ASC' , '', '' , '' );					
		$rangess  =  $crud->select( 'assoc' , $crud->getTable() , '*' , '', '' ,  'size_array_id ASC' , '', '' , '' );
							
	}


//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	9.2) Create range
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( ( isset( $_POST['add_range_of_sizes'] ) ) && ( $_POST['add_range_of_sizes'] != '' ) ) {
	
			$fields = array( 'size_array_name' => $_POST['size_array_name'] );
							
			if ( $crud->insert( 'size_array' , $fields ) ) {
				
				header( "location: " . $extender->getRedir() );	

			}
	
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	9.3) Add to range
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( ( isset( $_POST['add_to_range'] ) ) && ( $_POST['add_to_range'] != '' ) ) {
	
			$fields = array( 'size_array_id' => $_POST['size_array_id'] ,
							 'size_origin'   => $_POST['size_origin'] ,
							 'size_value'    => $_POST['size_value'] ,
							 'size_rank' 	 => $_POST['size_rank']
							);
							
			if ( $crud->insert( 'range_of_sizes' , $fields ) ) {
				
				header( "location: " . $extender->getRedir() );	

			}	

	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	9.4) Delete range
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'delete_range_of_sizes' ) {
		
			if  ( (
				$crud->delete( 'size_array' , 'size_array_id' , '=' , (int) $_GET['range_to_be_deleted'] )
				)
				&&
				(
				$crud->delete( 'range_of_sizes' , 'size_array_id' , '=' , (int) $_GET['range_to_be_deleted'] )
				) )
				
				{

				header( "location: " . $extender->getRedir() );
				
			}	
			
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	9.5) Rename range
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'rename_range_of_sizes' ) {
		
		$where = 'size_array_id' . '=' . $_GET['range_to_be_renamed'];
		$rows  = $crud->select( '' , 'size_array' , '*' , '' , $where , '' , '' , '1' , '0' );
			
	}


	if ( isset( $_POST['rename_range_of_sizes'] ) ) {
				
			$fields = array( 'size_array_name' => $_POST['size_array_name'] );

				if ( $crud->update( 'size_array' , $fields , 'size_array_id' , $_POST['size_array_id'] ) ) {

					header("location: " . $extender->getRedir() );

				}
	
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	9.6) Delete size
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'delete_size' ) {
		
		if ( $crud->delete( 'range_of_sizes' , 'range_of_sizes_id' , '=' , (int) $_GET['size_to_be_deleted'] ) ) {
       	
			header( "location: " . $extender->getRedir() );
       	
		}
				
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------




//  ******************************************************************************************************************************************
//  10) TEMPLATES
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	10.1) Select template
//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	if ( $_GET['action'] == 'template_list' ) {

		$crud->setTable( 'template' );
		$rows  =  $crud->select( '' , $crud->getTable() , '*' , '' , '' , 'template_name ASC' , '' , '' , '' );	
		$cat_rows  =  $crud->select( 'num' , $crud->getTable()  , '*' , '', '' ,  'template_id ASC' , '', '' , '' );					
		

	}
	
//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	10.2) Create template
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( ( isset( $_POST['add_template'] ) ) && ( $_POST['template_name'] != '' ) ) {
		
		$fields = array( 'template_parent_id' => $_POST['template_parent_id'] ,
		 				 'template_name' 	  => $_POST['template_name']
						);
						
		if ( $crud->insert( 'template' , $fields ) ) {
			
			header( "location: " . $extender->getRedir() );	

		}
	
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	10.3) Rename template
//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	
	if ( $_GET['action'] == 'rename_template' ) {
		
		$crud->setTable( 'template' );
		
		$where = " template_id = " . $_GET['template_id'];
		$rows  =  $crud->select( '' , $crud->getTable() , '*' , '' , $where , 'template_name ASC' , '' , '1' , '0' );	
	
	}
	
	if ( isset( $_POST['rename_template'] ) ) {
		
		$fields = array( 'template_name' => $_POST['template_name'] );

			if ( $crud->update( 'template' , $fields , 'template_id' , $_POST['template_id'] ) ) {

				header("location: " . $extender->getRedir() );

			}
		
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	10.4) Delete template
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'delete_template' ) {
	
		if ( $_GET['template_parent_id'] == 0 ) {
			
			if  ( (
				$crud->delete( 'template' , 'template_parent_id' , '=' , (int) $_GET['template_id'] )
				)
				&&
				(
				$crud->delete( 'template' , 'template_id' , '=' , (int) $_GET['template_id'] )
				) )
				
				{

				header( "location: " . $extender->getRedir() );
				
			}
					
		}
		else {
			
			if ( $crud->delete( 'template' , 'template_id' , '=' , (int) $_GET['template_id'] ) ) {
				
				header( "location: " . $extender->getRedir() );
				
			}
		
		}
	
	}


//  ------------------------------------------------------------------------------------------------------------------------------------------




//  ******************************************************************************************************************************************
//  11) LINKS
//  ******************************************************************************************************************************************

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	11.1) Select link categories
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'link_list' ) {
		
		$crud->setTable( 'link_category' );
		$rows  		=  $crud->select( '' , $crud->getTable( ) , '*' , '', '' ,  'link_category_name ASC' , '', '' , '' );
		$cat_rows   =  $crud->select( 'num' , $crud->getTable( ) , '*' , '', '' ,  'link_category_id ASC' , '', '' , '' );					
		
		$extender->setTable( 'link' );
		
		$join = " LEFT JOIN language ON language.language_id = link.language_id
				  LEFT JOIN link_category ON link_category.link_category_id = link.link_category_id";
		$link_rows  =  $crud->select( '' , $extender->getTable( ) , '*' , $join , '' ,  'link_category_name ASC' , '', '' , '' );
		
		
				
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	11.2) Add link category
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( ( isset( $_POST['add_link_category'] ) ) && ( $_POST['link_category_name'] != '' ) ) {
		
			$fields = array( 'link_category_parent_id' => $_POST['link_category_parent_id'] ,
			 				 'link_category_name' 	   => $_POST['link_category_name']
							);

			if ( $crud->insert( 'link_category' , $fields ) ) {

				header( "location: " . $extender->getRedir() );	

			}	

	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	11.3) Delete link category
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'delete_link_category' ) {
		
		if ( $_GET['link_category_parent_id'] == 0 ) {
			
			if  ( (
				$crud->delete( 'link_category' , 'link_category_parent_id' , '=' , (int) $_GET['link_category_id'] )
				)
				&&
				(
				$crud->delete( 'link_category' , 'link_category_id' , '=' , (int) $_GET['link_category_id'] )
				) )
				
				{

				header( "location: " . $extender->getRedir() );
				
			}
					
		}
		else {
			
			if ( $crud->delete( 'link_category' , 'link_category_id' , '=' , (int) $_GET['link_category_id'] ) ) {
				
				header( "location: " . $extender->getRedir() );
				
			}
		
		}
	
	}



//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	11.4) Rename link category
//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	if ( $_GET['action'] == 'rename_link_category' ) {
		
		$crud->setTable( 'link_category' );
		$where		= " link_category_id = " . $_GET['link_category_id'];
		$rows  		=  $crud->select( '' , $crud->getTable( ) , '*' , '', $where , '' , '', '1' , '0' );
		
	
	}	
	
	if ( isset( $_POST['rename_link_category'] ) ) {
		
		$fields = array( 'link_category_name' => $_POST['link_category_name'] );

			if ( $crud->update( 'link_category' , $fields , 'link_category_id' , $_POST['link_category_id'] ) ) {

				header("location: " . $extender->getRedir() );

			}
	
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	11.5) Create link
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_POST['add_link'] == '1' ) {
	
		$fields = array( 'link_url' 				=> $_POST['link_url'] ,
						 'language_id' 				=> $_POST['language_id'] ,
		 				 'link_title' 				=> $_POST['link_title'] ,
		 				 'link_description' 		=> $_POST['link_description'] ,
		 				 'link_rank' 				=> $_POST['link_rank'] ,
		 				 'link_category_id' 		=> $_POST['link_category_id'] ,
		 				 'link_status' 				=> $_POST['link_status'] ,
		 				 'link_creation_date' 		=> $_POST['link_creation_date']
						);

		if ( $crud->insert( 'link' , $fields ) ) {

			header( "location: " . $extender->getRedir() );	

		}	
		
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	11.6) Edit link
//  ------------------------------------------------------------------------------------------------------------------------------------------
	
	if ( $_GET['action'] == 'edit_link' ) {

		$where 		= " link_id = " . $_GET['link_id'];	
		$rows  		=  $crud->select( '' , 'link' , '*' , '' , $where , '' , '' , '1' , '0' );
		
		$cat_rows  	=  $crud->select( 'num' , 'link_category' , '*' , '', '' ,  'link_category_name ASC' , '', '' , '' );
		$link_rows  =  $crud->select( 'num' , 'link' , '*' , '', '' ,  'link_id ASC' , '', '' , '' );
	
	}
		
	
	if ( $_POST['edit_link'] == '1' ) {
		
		$fields = array( 'link_url' 				=> $_POST['link_url'] ,
						 'language_id' 				=> $_POST['language_id'] ,
						 'link_title' 				=> $_POST['link_title'] ,
						 'link_description' 		=> $_POST['link_description'] ,
						 'link_rank' 				=> $_POST['link_rank'] ,
						 'link_category_id' 		=> $_POST['link_category_id'] ,
						 'link_status' 				=> $_POST['link_status'] ,
						 'link_modification_date' 	=> $_POST['link_modification_date']
						);

			if ( $crud->update( 'link' , $fields , 'link_id' , $_POST['link_id'] ) ) {

				header("location: " . $extender->getRedir() );

			}
		
	}

//  ------------------------------------------------------------------------------------------------------------------------------------------
// 	11.7) Delete link
//  ------------------------------------------------------------------------------------------------------------------------------------------

	if ( $_GET['action'] == 'delete_link' ) {

		if ( $crud->delete( 'link' , 'link_id' , '=' , (int) $_GET['link_id'] ) ) {

			header( "location: " . $extender->getRedir() );

		}

	}

//  ------------------------------------------------------------------------------------------------------------------------------------------

?>