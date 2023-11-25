<?php

/*
 * Copyright (c) 2010, Yannick Saraillon <yan.saraillon@societe-ecran.tv>
 */

/**
 * Source file containing class Connection.
 * 
 * @package    
 * @license    
 * @author     Yannick Saraillon <yan.saraillon@societe-ecran.tv>
 * @version    0.1
 * @see        Connection
 */

/**
 * Class Connection.
 * 
 * Description for class Connection.
 *
 * @package    
 * @license    
 * @author     Yannick Saraillon <yan.saraillon@societe-ecran.tv>
 * @version    0.1
 */

class Connection
{
	const DB_HOST 		= 'localhost';
	const DB_NAME 		= 'cingria';
	const DB_USER 		= 'chabert_13';
	const DB_PASSWORD 	= 'petites_feuilles_13';
	const DB_TYPE		= 'mysql';
	
		private $_connectionConstantsArray = array();
		private $_connection;
		
		protected $_dbc;
	
		static $instances = 0;

		function __construct() {
			
			$_connectionVarsArray = array('host'	=> self::DB_HOST,
										 'name'		=> self::DB_NAME,
										 'user'		=> self::DB_USER,
										 'password'	=> self::DB_PASSWORD,
										 'type'		=> self::DB_TYPE);
			$this->_connectionVarsArray	= $_connectionVarsArray;		
				
			if (Connection::$instances == 0) {
		      	try {
				    $_dbc = new PDO("mysql:host=$_connectionVarsArray[host];
									dbname=$_connectionVarsArray[name]", 
									$_connectionVarsArray['user'],
									$_connectionVarsArray['password']);
					$this->_dbc = $_dbc; 
				}
				catch (PDOException $e) {
				    echo $e->getMessage();
				 }
				
		      Connection::$instances = 1;
		
		   } else {
		     	$msg = "Close the existing instance of the Connection class.";
		      	die($msg);
		   }
					
		}
		
		
	
		function getTablesName($db) {
			$recordset = $this->_dbc->query("SHOW TABLES FROM $db");
			$fields = $recordset->fetchAll(PDO::FETCH_ASSOC);
			foreach ($fields as $key => $value) {
				print '<a href="?table='.$value['Tables_in_'.$db].'">
				'.$value['Tables_in_'.$db].'</a> | ';
			}
			
		}
		
		
		function getFieldsName($tbl) {
			$recordset = $this->_dbc->query("SHOW COLUMNS FROM $tbl");
			$fields = $recordset->fetchAll(PDO::FETCH_ASSOC);
			foreach ($fields as $field) {
				$fieldNames[] = $field['Field'];
			}
			return $fieldNames;
		}
		
		
		function getFieldsNameForDebug($tbl) {
			$recordset = $this->_dbc->query("SHOW COLUMNS FROM $tbl");
			$fields = $recordset->fetchAll(PDO::FETCH_ASSOC);
			foreach ($fields as $key => $value) {
				print '<strong>#'.$key.'</strong> : '.$value['Field'].'<br/>
				<span class="tinygreyinfo">'.$value['Type'].'</span><br/>';
			}
		}
		
		function getConnectionVars() {
			foreach ($this->_connectionVarsArray as $key => $value) {
				print '<strong>'.$key.'</strong> : '.$value.'<br/>';
			}
		}
		
		
		
	 function truncateTable($tbl) {
			$sql = "TRUNCATE `$tbl`";
			print $sql;
		    $stmt = $this->_dbc->prepare($sql);
		    $stmt->execute();	
		}
		
		function __destruct() {
			Connection::$instances = 0;
	    	$this->_dbc = null;
	  }
	
	
}
?>