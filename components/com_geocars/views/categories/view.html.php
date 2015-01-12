<?php
/**
 * @version 		$Id:$
 * @name			Cars In Georgia (Release 1.0.0)
 * @author			Giorgi Bibilashvili ()
 * @package			com_geocars
 * @subpackage		com_geocars.site
 * @copyright		
 * @license			GNU General Public License version 3 or later; See http://www.gnu.org/copyleft/gpl.html 
 * 
 * The following Component Architect header section must remain in any distribution of this file
 *
 * @CAversion		Id: view.html.php 418 2014-10-22 14:42:36Z BrianWade $
 * @CAauthor		Component Architect (www.componentarchitect.com)
 * @CApackage		architectcomp
 * @CAsubpackage	architectcomp.site
 * @CAtemplate		joomla_2_5_standard (Release 1.0.4)
 * @CAcopyright		Copyright (c)2013 - 2014 Simply Open Source Ltd. (trading as Component Architect). All Rights Reserved
 * @Joomlacopyright Copyright (c)2005 - 2014 Open Source Matters, Inc. All rights reserved.
 * @CAlicense		GNU General Public License version 3 or later; See http://www.gnu.org/copyleft/gpl.html
 * 
 * This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 */

defined('_JEXEC') or die;

jimport('joomla.application.component.view');

class GeocarsViewCategories extends JView
{
	protected $state = null;
	protected $parent = null;
	protected $children = null;

	/**
	 * Display the view
	 *
	 * @return	mixed	False on error, null otherwise.
	 */
	function display($tpl = null)
	{
		// Initialise variables
		$state		= $this->get('State');
		$children	= $this->get('Children');
		$parent		= $this->get('Parent');
		$this->doc = JFactory::getDocument();

		// Check for errors.
		if (count($errors = $this->get('Errors')))
		{
			JError::raiseWarning(500, implode("\n", $errors));
			return false;
		}

		if ($children === false)
		{
			JError::raiseWarning(500, JText::_('COM_GEOCARS_ERROR_CATEGORY_NOT_FOUND'));
			return false;
		}

		if ($parent == false)
		{
			JError::raiseWarning(500, JText::_('COM_GEOCARS_ERROR_PARENT_CATEGORY_NOT_FOUND'));
			return false;
		}

		$params = &$state->params;

		$children = array($parent->id => $children);

		$this->max_level_categories = $params->get('show_categories_max_level', -1);
		$this->assignRef('params',		$params);
		$this->assignRef('parent',		$parent);
		$this->assignRef('children',	$children);

		$options = array();
		$options[] = JHTML::_('select.option', '', 'აირჩიეთ მწარმოებელი' );

		foreach($children[$parent->id] as $id => $child):
			$options[] = JHTML::_('select.option', $this->escape($child->id), $this->escape($child->title) );
		endforeach; 

		$this->category_list = JHTML::_('select.genericlist', $options, 'category', ' class="inputbox form-control" style="width: 200px;"  ', 'value', 'text' );
		

		$options = array();

		$options[] = JHTML::_('select.option', '', 'აირჩიეთ მოდელი' );
		$this->model_list = JHTML::_('select.genericlist', $options, 'model', ' class="inputbox form-control" style="width: 200px;"  ', 'value', 'text' );
		
		parent::display($tpl);
	}
}
