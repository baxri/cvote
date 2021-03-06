<?php
/**
 * @version 		$Id:$
 * @name			Cars In Georgia (Release 1.0.0)
 * @author			Giorgi Bibilashvili ()
 * @package			com_geocars
 * @subpackage		com_geocars.admin
 * @copyright		
 * @license			GNU General Public License version 3 or later; See http://www.gnu.org/copyleft/gpl.html 
 * 
 * The following Component Architect header section must remain in any distribution of this file
 * 
 * @CAversion		Id: architectcomp.php 418 2014-10-22 14:42:36Z BrianWade $
 * @CAauthor		Component Architect (www.componentarchitect.com)
 * @CApackage		architectcomp
 * @CAsubpackage	architectcomp.admin
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
/**
 * Architectcomp_name component helper.
 *
 */
class GeocarsHelper
{
	protected $category_component;
	/**
	 * Constructor.
	 *
	 * @param	array An optional associative array of configuration settings.
	 * @see		JController
	 * 
	 */
	public function __construct()
	{

	}	
	/**
	 * Configure the Linkbar.
	 *
	 * @param	string	The name of the active view.
	 *
	 * @return	void
	 * 
	 */
	public static function addSubmenu($view_name)
	{
		$config = JComponentHelper::getParams(JText::_('COM_GEOCARS_FIELD_CATEGORY_COMPONENT_DEFAULT'));
		$category_component = $config->get('category_component', JText::_('COM_GEOCARS_FIELD_CATEGORY_COMPONENT_DEFAULT'));	

		JSubMenuHelper::addEntry(
			JText::_('COM_GEOCARS_CARS_SUBMENU'),
			'index.php?option=com_geocars&view=cars',
			$view_name == 'cars'
		);
	
		if ($category_component != JText::_('COM_GEOCARS_FIELD_CATEGORY_COMPONENT_NO_CATEGORIES'))
		{	
			JSubMenuHelper::addEntry(
				JText::_('COM_GEOCARS_CATEGORIES_SUBMENU'),
				'index.php?option=com_categories&extension='.$category_component,
				$view_name == 'categories'
				);
			if ($view_name=='categories')
			{
				JToolbarHelper::title(
					JText::sprintf('COM_CATEGORIES_CATEGORIES_TITLE',JText::_($category_component)),
					$category_component.'-categories');
			}	
		}		
	}
}