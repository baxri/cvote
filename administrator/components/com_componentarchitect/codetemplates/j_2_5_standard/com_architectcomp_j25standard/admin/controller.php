<?php
/**
 * @tempversion
 * @name			[%%ArchitectComp_name%%] (Release [%%COMPONENTSTARTVERSION%%])
 * @author			[%%COMPONENTAUTHOR%%] ([%%COMPONENTWEBSITE%%])
 * @package			[%%com_architectcomp%%]
 * @subpackage		[%%com_architectcomp%%].admin
 * @copyright		[%%COMPONENTCOPYRIGHT%%]
 * @license			GNU General Public License version 3 or later; See http://www.gnu.org/copyleft/gpl.html 
 * 
 * The following Component Architect header section must remain in any distribution of this file
 *
 * @version			$Id: controller.php 418 2014-10-22 14:42:36Z BrianWade $
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

jimport('joomla.application.component.controller');

class [%%ArchitectComp%%]Controller extends JController
{
	/**
	 * @var		string	The default view.
	 * 
	 */
	protected $default_view = '[%%architectcomp_default_admin_view%%]';

	/**
	 * Method to display a view.
	 *
	 * @param	boolean			If true, the view output will be cached
	 * @param	array			An array of safe url parameters and their variable types, for valid values see {@link JFilterInput::clean()}.
	 *
	 * @return	JController		This object to support chaining.
	 * 
	 */
	public function display($cachable = false, $url_params = false)
	{
		$view	= JRequest::getCmd('view', $this->default_view);
		$layout = JRequest::getCmd('layout', 'default');
		$id		= JRequest::getInt('id');

		// Load the submenu.
		[%%ArchitectComp%%]Helper::addSubmenu($view);

		switch ($view)
		{
			[%%FOREACH COMPONENT_OBJECT%%]		
			case '[%%compobject%%]': 
			case '[%%compobjectplural%%]':
				require_once JPATH_COMPONENT.'/helpers/[%%compobjectplural%%].php';			
				break;
			[%%ENDFOR COMPONENT_OBJECT%%]	
			
		}
		// Check for edit form.
		switch ($view)
		{
			[%%FOREACH COMPONENT_OBJECT%%]		
			case '[%%compobject%%]': 
				if ($layout == 'edit' AND !$this->checkEditId('[%%com_architectcomp%%].edit.[%%compobject%%]', $id))
				{

					// Somehow the person just went to the form - we don't allow that.
					$this->setError(JText::sprintf('JLIB_APPLICATION_ERROR_UNHELD_ID', $id));
					$this->setMessage($this->getError(), 'error');
					$this->setRedirect(JRoute::_('index.php?option=[%%com_architectcomp%%]&view=[%%compobjectplural%%]', false));

					return false;
				}
				break;				
			[%%ENDFOR COMPONENT_OBJECT%%]			
		}
		parent::display();

		return $this;
	}
}
