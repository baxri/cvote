<?php
/*------------------------------------------------------------------------
# order.php - Country Component
# ------------------------------------------------------------------------
# author    Giorgi Bibilashvili
# copyright Copyright (C) 2013. All Rights Reserved
# license   Licensed by Unipay LLC
# website   unipay.ge
-------------------------------------------------------------------------*/

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

// import Joomla table library
jimport('joomla.database.table');

/**
 * States Table State class
 */
class GeocarsTableOpinion extends JTable
{	
	function __construct(&$db) 
	{
		parent::__construct('#__geocars_opinions', 'id', $db);
	}
	
	public function bind( $data, $ignore = Array() ){
		parent::bind( $data );
		return $this;
	}
}

?>