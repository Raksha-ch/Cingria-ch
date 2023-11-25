<?php
	class Sorter {

		function __construct() {
		}
		
		function setSortKey($sort_key) {
			if(isset($sort_key)) {
				$this->sort_key = $sort_key;	
			}
			else {
				$this->sort_key = $_SESSION['sort_key'];
			}
		}

		function getSortKey() {
			return $this->sort_key;
		}
		
		function setSortDirection($sort_direction) {
			if(isset($sort_direction)) {
				$this->sort_direction = $sort_direction;	
			}
			else {
				$this->sort_direction = $_SESSION['sort_direction'];
			}
		}
		
		function getSortDirection() {
			return $this->sort_direction;
		}
		
		function setTogglerState($toggler_state) {
			if(isset($toggler_state)) {
				$this->toggler_state = $toggler_state;	
			}
			else {
				$this->toggler_state = $_SESSION['toggler_state'];
			}
		}

		function getTogglerState() {
			return $this->toggler_state;
		}
		
	}
?>
