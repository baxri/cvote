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
 * View to edit a car.
 *
 */
class GeocarsViewCar extends JView
{
	protected $form;
	protected $item;
	protected $state;
	protected $can_do;

	/**
	 * Display the view
	 */
	public function display($tpl = null)
	{
		// Initialise variables.
		$this->form		= $this->get('Form');
		$this->item		= $this->get('Item');
		$this->state	= $this->get('State');

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
		JRequest::setVar('hidemainmenu', true);
		
	
		$user		= JFactory::getUser();
		$user_id		= $user->get('id');
		$is_new		= ($this->item->id == 0);

		JToolBarHelper::title($is_new ? JText::_('COM_GEOCARS_CARS_NEW_HEADER') : JText::_('COM_GEOCARS_CARS_EDIT_HEADER'), 'cars.png');


		JToolbarHelper::apply('car.apply', 'JTOOLBAR_APPLY');
		JToolbarHelper::save('car.save', 'JTOOLBAR_SAVE');

		JToolbarHelper::custom('car.save2new', 'save-new.png', 'save-new_f2.png', 'JTOOLBAR_SAVE_AND_NEW', false);
		// If an existing item, can save to a copy.
		if (!$is_new )
		{
			JToolbarHelper::custom('car.save2copy', 'save-copy.png', 'save-copy_f2.png', 'JTOOLBAR_SAVE_AS_COPY', false);
		}
		
		if (empty($this->item->id))
		{
			JToolbarHelper::cancel('car.cancel','JTOOLBAR_CANCEL');
		}
		else
		{
			JToolbarHelper::cancel('car.cancel', 'JTOOLBAR_CLOSE');
		}
		
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
		
		// Add Javscript functions for validation
		JHtml::_('behavior.formvalidation');
				
		$this->document->addScript(JUri::root() ."administrator/components/com_geocars/assets/js/geocarsvalidate.js");
		
		$this->document->addScript(JUri::root() ."administrator/components/com_geocars/assets/js/formsubmitbutton.js");
		
		JText::script('COM_GEOCARS_ERROR_ON_FORM');
	}	
}
