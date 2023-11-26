<?php

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //   																																	
  //   	SCRIPT SUMMARY (2010.03.24)  (n.b.: this file is included by switch.extender.php)                                                                                                       	
  //   																																	
  //   	**************************************************************************************************************************************
  //   																																	
  //   	0) INITIALIZE VARS
  //	1) CONSTRUCTOR
  //	2) GETTERS & SETTERS  | Crud | ErrorFlag | ProfileEmailAddress | ProfileName | ProfilePassword | ProfileSurname | Redir | Table |
  //	3) RECURSIVE MENU
  //	   		3.1) Recursive menu
  //	   		3.2) Recursive menu template
  //	   		3.3) Recursive menu link
  //
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Extender {

  //  ******************************************************************************************************************************************
  //  0) INITIALIZE VARS
  //  ******************************************************************************************************************************************	

    private $_redir					= '';


  //  ******************************************************************************************************************************************
  //  1) CONSTRUCTOR
  //  ******************************************************************************************************************************************	

    function __construct() {

    }

  //  ------------------------------------------------------------------------------------------------------------------------------------------


  //  ******************************************************************************************************************************************
  //  2) GETTERS & SETTERS
  //  ******************************************************************************************************************************************

  function setCrud($crud) 									{ $this->crud = $crud; }

  function setTable($_tbl) 									{ $this->_tbl = $_tbl; }
  function getTable() 										{ return $this->_tbl; }

  function setRedir($_redir) 									{ $this->_redir = $_redir; }
  function getRedir() 										{ return $this->_redir; }

  //  ------------------------------------------------------------------------------------------------------------------------------------------



  //  ******************************************************************************************************************************************
  //  3) RECURSIVE MENU
  //  ******************************************************************************************************************************************

  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	3.1) Recursive menu
  //  ------------------------------------------------------------------------------------------------------------------------------------------

  function display_recursive_menu($parent, $level, $rows, $table) {
  $recursive_menu = "";
  $parent_level = 0;
    if (!$level && !$parent_level) $recursive_menu .= "<ul>";
      foreach ($rows as $node) {
        if ($parent == $node['category_parent_id']) {
          if ($parent_level < $level) {
            $recursive_menu .= "<ul>";
          }
          $recursive_menu .= "<li><strong>".$node['category_name'].'</strong>
            <a href="?page=extender&action=rename_category&category_id='.$node['category_id'].'&category_parent_id='.$node['category_parent_id'].'&table='.$table.'">
              renommer
            </a> |
            <a href="?page=extender&action=delete_category&category_id='.$node['category_id'].'&table='.$table.'" onclick="return(confirm(\'Supprimer la cat&eacute;gorie?\'));">
              supprimer
            </a>';
          $parent_level = $level;
          $recursive_menu .= $this->display_recursive_menu($node['category_id'], ($level + 1), $rows, $table);
        }
    }
    if (($parent_level == $level) && ($parent_level != 0)) {
      $recursive_menu .= "</ul></li>";
    }
    else if ($parent_level == $level) {
      $recursive_menu .= "</ul>";
    }
    else {
      $recursive_menu .= "</li>";
    }
  return $recursive_menu;
  }


  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	3.1) Recursive menu subcategory
  //  ------------------------------------------------------------------------------------------------------------------------------------------

  function display_recursive_menu_subcategory($parent, $level, $rows, $table) {
  $recursive_menu = "";
  $parent_level = 0;
    if (!$level && !$parent_level) $recursive_menu .= "<ul>";
      foreach ($rows as $node) {
        if ($parent == $node['subcategory_parent_id']) {
          if ($parent_level < $level) {
            $recursive_menu .= "<ul>";
          }
          $recursive_menu .= "<li><strong>".$node['subcategory_name'].'</strong>
            <a href="?page=extender&action=rename_subcategory&subcategory_id='.$node['subcategory_id'].'&subcategory_parent_id='.$node['subcategory_parent_id'].'&table='.$table.'">
              renommer
            </a> |
            <a href="?page=extender&action=delete_subcategory&subcategory_id='.$node['subcategory_id'].'&table='.$table.'" onclick="return(confirm(\'Supprimer le lieu?\'));">
              supprimer
            </a>';
          $parent_level = $level;
          $recursive_menu .= $this->display_recursive_menu_subcategory($node['subcategory_id'], ($level + 1), $rows, $table);
        }
    }
    if (($parent_level == $level) && ($parent_level != 0)) {
      $recursive_menu .= "</ul></li>";
    }
    else if ($parent_level == $level) {
      $recursive_menu .= "</ul>";
    }
    else {
      $recursive_menu .= "</li>";
    }
  return $recursive_menu;
  }


  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	3.2) Recursive menu template
  //  ------------------------------------------------------------------------------------------------------------------------------------------

  function display_recursive_menu_template($parent, $level, $rows, $table) {
  $recursive_menu = "";
  $parent_level = 0;
    if (!$level && !$parent_level) $recursive_menu .= "<ul>";
      foreach ($rows as $node) {
        if ($parent == $node['template_parent_id']) {
          if ($parent_level < $level) {
            $recursive_menu .= "<ul>";
          }
          $recursive_menu .= "<li><strong>".$node['template_name'].'</strong>
            <a href="?page=extender&action=rename_template&template_id='.$node['template_id'].'&template_parent_id='.$node['template_parent_id'].'&table='.$table.'">
              rename
            </a> |
            <a href="?page=extender&action=delete_template&template_id='.$node['template_id'].'&table='.$table.'" onclick="return(confirm(\'Delete template?\'));">
              delete
            </a>';
          $parent_level = $level;
          $recursive_menu .= $this->display_recursive_menu_template($node['template_id'], ($level + 1), $rows, $table);
        }
    }
    if (($parent_level == $level) && ($parent_level != 0)) {
      $recursive_menu .= "</ul></li>";
    }
    else if ($parent_level == $level) {
      $recursive_menu .= "</ul>";
    }
    else {
      $recursive_menu .= "</li>";
    }
  return $recursive_menu;
  }


  //  ------------------------------------------------------------------------------------------------------------------------------------------
  // 	3.3) Recursive menu link
  //  ------------------------------------------------------------------------------------------------------------------------------------------


  function display_recursive_menu_link($parent, $level, $rows, $table) {
  $recursive_menu = "";
  $parent_level = 0;
    if (!$level && !$parent_level) $recursive_menu .= "<ul>";
      foreach ($rows as $node) {
        if ($parent == $node['link_category_parent_id']) {
          if ($parent_level < $level) {
            $recursive_menu .= "<ul>";
          }
          $recursive_menu .= "<li><strong>".$node['link_category_name'].'</strong>
            <a href="?page=extender&action=rename_link_category&link_category_id='.$node['link_category_id'].'&link_category_parent_id='.$node['link_category_parent_id'].'&table='.$table.'">
              rename
            </a> |
            <a href="?page=extender&action=delete_link_category&link_category_id='.$node['link_category_id'].'&table='.$table.'" onclick="return(confirm(\'Delete link category?\'));">
              delete
            </a>';
          $parent_level = $level;
          $recursive_menu .= $this->display_recursive_menu_link($node['link_category_id'], ($level + 1), $rows, $table);
        }
    }
    if (($parent_level == $level) && ($parent_level != 0)) {
      $recursive_menu .= "</ul></li>";
    }
    else if ($parent_level == $level) {
      $recursive_menu .= "</ul>";
    }
    else {
      $recursive_menu .= "</li>";
    }
  return $recursive_menu;
  }



}
?>