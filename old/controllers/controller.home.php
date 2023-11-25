<?php

include 'models/model.login.php';
$login = new Login();
	
if ( ( $_POST['login_value'] != '' ) && ( $_POST['password_value'] != '' ) ) {
	
	$login->fetchUser( 'admin' , 'admin_email' , $_POST['login_value'] , 'admin_password' , $_POST['password_value'] );
	
	if ( $login->getLoginErrorFlag() == 0 ) {
		
		$session->setSessionVar ( 'username'     , $login->getUsername()    );
		$session->setSessionVar ( 'login_status' , $login->getLoginStatus() );
		$session->setSessionVar ( 'admin_group'  , $login->getAdminGroup()  );
		header ( "location:?page=home" );		
	
	}
	
	else {
	
		unset ( $_SESSION['username'] 	  );
		unset ( $_SESSION['login_status'] );
		unset ( $_SESSION['admin_group']  );
	
	}	

}


if ( ( $_POST['profile_surname'] != '' ) && ( $_POST['profile_password'] != '' ) ) {
	
	$login->fetchPublicUser( 'profile' , 'profile_surname' , $_POST['profile_surname'] , 'profile_password' , $_POST['profile_password'] );
	
	if ( $login->getLoginErrorFlag() == 0 ) {
		
		$session->setSessionVar ( 'username'     , $login->getUsername()    );
		$session->setSessionVar ( 'user_login_status' , $login->getLoginStatus() );
		$session->setSessionVar ( 'profile_id' , $login->getProfileId() );
		header ( "location:?page=home" );		
	
	}
	
	else {
	
		unset ( $_SESSION['username'] 	  );
		unset ( $_SESSION['login_status'] );
	
	}	

}

if ( $_GET['action'] == 'logout' ) {
	
	unset ( $_SESSION['username']     );
	unset ( $_SESSION['login_status'] );
	unset ( $_SESSION['admin_group']  );
	
	$session->sessionDestroy();
	header ( "location:?page=home" );
	
}

?>