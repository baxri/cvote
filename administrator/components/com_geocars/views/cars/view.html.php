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
 * @CAversion		Id: view.html.php 418 2014-10-22 14:42:36Z BrianWade $
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

jimport('joomla.application.component.view');

/**
 * View class for a list of cars.
 *
 */
class GeocarsViewCars extends JView
{
	protected $items;
	protected $pagination;
	protected $state;

	/**
	 * Display the view
	 */
	public function display($tpl = null)
	{
		// Initialise variables.
		$this->items		= $this->get('Items');
		$this->pagination	= $this->get('Pagination');
		$this->state		= $this->get('State');
		
				
		// Check for errors.
		if (count($errors = $this->get('Errors')))
		{
			JError::raiseError(500, implode("\n", $errors));
			return false;
		}

		$this->addToolbar();
		$this->_prepareDocument();		
		parent::display($tpl);
	}

	/**
	 * Add the page title and toolbar.
	 *
	 */
	protected function addToolbar()
	{
		JToolbarHelper::title(JText::_('COM_GEOCARS_CARS_LIST_HEADER'), 'stack cars');

		JToolbarHelper::addNew('car.add','JTOOLBAR_NEW');
		JToolbarHelper::editList('car.edit','JTOOLBAR_EDIT');


			if ($this->state->get('filter.state') != 2)
			{
				JToolbarHelper::divider();
				JToolbarHelper::custom('cars.publish', 'publish.png', 'publish_f2.png','JTOOLBAR_PUBLISH', true);
				JToolbarHelper::custom('cars.unpublish', 'unpublish.png', 'unpublish_f2.png', 'JTOOLBAR_UNPUBLISH', true);
			}

			if ($this->state->get('filter.state') != -1 ) 
			{
				JToolbarHelper::divider();
				if ($this->state->get('filter.state') != 2) 
				{
					JToolbarHelper::archiveList('cars.archive','JTOOLBAR_ARCHIVE');
				}
				else 
				{
					if ($this->state->get('filter.state') == 2) 
					{
						JToolbarHelper::unarchiveList('cars.publish', 'JTOOLBAR_UNARCHIVE');
					}
				}
			}
		

		if ($this->state->get('filter.state') == -2)
		{
			JToolbarHelper::deleteList('', 'cars.delete','JTOOLBAR_EMPTY_TRASH');
			
			JToolbarHelper::divider();
		}
		else 
		{
			JToolbarHelper::trash('cars.trash','JTOOLBAR_TRASH');
			JToolbarHelper::divider();
		}
		
			JToolbarHelper::preferences('com_geocars');
			JToolbarHelper::divider();
	}
	
	/**
	 * Prepares the document
	 */
	protected function _prepareDocument()
	{
		// Include HTML Helpers
		JHtml::addIncludePath(JPATH_COMPONENT.'/helpers/html');	
	
		// Include custom admin css
		$this->document->addStyleSheet(JUri::root()."administrator/components/com_geocars/assets/css/admin.css");
		
		// Add Javscript functions for field display
		JHtml::_('behavior.tooltip');
		
		JHTML::_('script','system/multiselect.js',false,true);
	}	
}
