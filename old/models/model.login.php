<?php
class Login extends Connection {	
	
	private $_tbl = '';
	private $_login_field = 'email';
	private $_password_field = 'password';
	private $_profile_email_address = 'profile_email_address';
	private $_profile_password = 'profile_password';
	private $_login_value = '';
	private $_password_value =  '';
	private $_profile_email_address_value = '';
	private $_profile_password_value =  '';
	private $_profile_id = '';
	
		
	function setName($_name)
	{
	    $this->_name = $_name;
	    return $this->_name;
	}
	
	function getName()
	{
	    return $this->_name;
	}
	
	function setSurname($_surname)
	{
	    $this->_surname = $_surname;
	    return $this->_surname;
	}
	
	function getSurname()
	{
	    return $this->_surname;
	}


	function setProfileId( $_profile_id )
	{
	    $this->_profile_id = $_profile_id;
	    return $this->_profile_id;
	}
	
	function getProfileId()
	{
	    return $this->_profile_id;
	}


	
	function getUsername() {
		return $this->getName().' '.$this->getSurname();
	}
	
	function setAdminGroup($_admin_group)
	{
	    $this->_admin_group = $_admin_group;
	    return $this->_admin_group;
	}
	
	function getAdminGroup()
	{
	    return $this->_admin_group;
	}
	
	
	function setLoginStatus($_login_status)
	{
	    $this->_login_status = $_login_status;
	    return $this->_login_status;
	}
	
	function getLoginStatus()
	{
	    return $this->_login_status;
	}
	
	function setLoginErrorFlag($_error_flag)
	{
	    $this->_error_flag = $_error_flag;
	    return $this->_error_flag;
	}
	
	function getLoginErrorFlag()
	{
	    return $this->_error_flag;
	}
	
	public function fetchPublicUser($_tbl,$_profile_email_address,$_profile_email_address_value,$_profile_password,$_profile_password_value) {
		$sql = "SELECT * FROM `$_tbl` WHERE `$_profile_email_address`=:id AND `$_profile_password`=:id2";			
		$records = $this->_dbc->prepare($sql);
		$records->bindParam(':id', $_profile_email_address_value);
        $records->bindParam(':id2', $_profile_password_value);
		$records->execute();
		$fetched_obj = $records->fetch(PDO::FETCH_OBJ);
		
		if ( ( $fetched_obj->profile_email_address) && ( $fetched_obj->profile_password ) ) {
			$this->setName($fetched_obj->profile_name);
			$this->setSurname($fetched_obj->profile_surname);
			$this->setProfileId($fetched_obj->profile_id);
			$this->setLoginStatus(1);
			$this->setLoginErrorFlag(0);	
		}
		else {
			$this->setLoginErrorFlag(1);
		}
	}
	
	public function fetchUser($_tbl,$_login_field,$_login_value,$_password_field,$_password_value) {
        $sql = "SELECT * FROM `$_tbl` WHERE `$_login_field`=:id AND `$_password_field`=:id2";			
		$records = $this->_dbc->prepare($sql);
		$records->bindParam(':id', $_login_value);
        $records->bindParam(':id2', $_password_value);
		$records->execute();
		$fetched_obj = $records->fetch(PDO::FETCH_OBJ);
		
		if (($fetched_obj->admin_email) && ($fetched_obj->admin_password)) {
			$this->setName($fetched_obj->admin_name);
			$this->setSurname($fetched_obj->admin_surname);
			$this->setAdminGroup($fetched_obj->admin_group);
			$this->setLoginStatus(1);
			$this->setLoginErrorFlag(0);	
		}
		else {
			$this->setLoginErrorFlag(1);
		}
	}

}
?>