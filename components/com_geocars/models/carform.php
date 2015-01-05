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
 * @CAversion		Id: compobjectform.php 418 2014-10-22 14:42:36Z BrianWade $
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

jimport('joomla.application.component.modelform');

class GeocarsModelCarForm extends JModelForm
{
	/**
	 * Model context string.
	 *
	 * @var		string
	 */
	protected $context = 'com_geocars.edit.car';

	/**
	 * Method to auto-populate the model state.
	 *
	 * Note. Calling getState in this method will result in recursion.
	 *
	 */
	protected function populateState()
	{
		$app = JFactory::getApplication();

		// Load state from the request.
		$pk = JRequest::getInt('id');
		$this->setState('car.id', $pk);

		$return = JRequest::getVar('return', null, 'default', 'base64');
		$this->setState('return_page', urldecode(base64_decode($return)));		
		$this->setState('car.catid', JRequest::getInt('catid'));
		
		// Load the parameters. Merge Global and Menu Item params into new object
		$params = $app->getParams();
		$menu_params = new JRegistry;

		if ($menu = $app->getMenu()->getActive())
		{
			$menu_params->loadString($menu->params);
		}

		$merged_params = clone $menu_params;
		$merged_params->merge($params);

		$this->setState('params', $merged_params);

		$this->setState('layout', JRequest::getCmd('layout'));
	}

	/**
	 * Returns a Table object, always creating it
	 *
	 * @param	type	The table type to instantiate
	 * @param	string	A prefix for the table class name. Optional.
	 * @param	array	Configuration array for model. Optional.
	 * @return	JTable	A database object
	*/
	public function getTable($type = 'Cars', $prefix = 'GeocarsTable', $config = array())
	{
		return JTable::getInstance($type, $prefix, $config);
	}

	/**
	 * Method to get the login form.
	 *
	 * The base form is loaded from XML and then an event is fired
	 * for users plugins to extend the form with extra fields.
	 *
	 * @param	array	$data		An optional array of data for the form to interogate.
	 * @param	boolean	$load_data	True if the form is to load its own data (default case), false if not.
	 * @return	mixed	A JForm object on success, false on failure
	 * 
	 */
	public function getForm($data = array(), $load_data = true)
	{
		// Get the form.
		$form = $this->loadForm('com_geocars.edit.car', 'car', array('control' => 'jform', 'load_data' => $load_data));
		if (empty($form))
		{
			return false;
		}
		if ($id = (int) $this->getState('car.id'))
		{
			// Existing record. Can only edit in selected categories.
			$form->setFieldAttribute('catid', 'action', 'core.edit');
			// Existing record. Can only edit own cars in selected categories.
			$form->setFieldAttribute('catid', 'action', 'core.edit.own');
		}
		else
		{
			// New record. Can only create in selected categories.
			$form->setFieldAttribute('catid', 'action', 'core.create');
		}
		return $form;
	}

	/**
	 * Method to get car data.
	 *
	 * @param	integer	The id of the car.
	 *
	 * @return	mixed	Car item data object on success, false on failure.
	 */
	public function getItem($item_id = null)
	{
		
		$item_id = (int) (!empty($item_id)) ? $item_id : $this->getState('car.id');

		// Get a row instance.
		$table = $this->getTable();

		// Attempt to load the row.
		$return = $table->load($item_id);

		// Check for a table object error.
		if ($return === false AND $table->getError())
		{
			$this->setError($table->getError());
			return false;
		}

		$properties = $table->getProperties(1);
		$item = JArrayHelper::toObject($properties, 'JObject');

		// Convert params field to Registry.
		$item->params = new JRegistry;
		$item->params->loadString($item->params);
		
		// Include any manipulation of the data on the record e.g. expand out Registry fields
		// NB The params registry field - if used - is done automatcially in the JAdminModel parent class
		
		
			
		// Compute selected asset permissions.
		$user	= JFactory::getUser();
		$user_id	= $user->get('id');

		// Get user name.
		
		return $item;
	}

	/**
	 * Method to validate the form data.
	 *
	 * @access	public
	 * @param	object		$form		The form to validate against.
	 * @param	array		$data		The data to validate.
	 * @param   string		$group		The name of the field group to validate.
	 * 
	 * @return	mixed		Array of filtered data if valid, false otherwise.
	 */
	public function validate($form, $data, $group = null)
	{

		return parent::validate($form, $data, $group);
	}


	/**
	 * Method to get the data that should be injected in the form.
	 *
	 * @return	mixed	The data for the form.
	 * 
	 */
	protected function loadFormData()
	{
		// Check the session for previously entered form data.
		$data = JFactory::getApplication()->getUserState('com_geocars.edit.car.data', array());

		if (empty($data))
		{
			$data = $this->getItem();
		}

		return $data;
	}

	/**
	 * Method to save the form data.
	 *
	 * @param	array	The form data.
	 * @return	boolean	True on success.
	 * 
	 */
	public function save($data)
	{
		$dispatcher = JDispatcher::getInstance();
		$table		= $this->getTable();
		$form		= $this->getForm($data, false);
		$pk			= (!empty($data['id'])) ? $data['id'] : (int) $this->getState('car.id');
		$is_new		= true;

		if (!$form)
		{
			JError::raiseError(500, $this->getError());
			return false;
		}

		// Validate the posted data.
		$data	= $this->validate($form, $data);
		if ($data === false)
		{
			return false;
		}

		// Load the row if saving an existing item.
		if ($pk > 0)
		{
			$table->load($pk);
			$is_new = false;
		}
		
		// Bind the data.
		if (!$table->bind($data))
		{
			$this->setError($table->getError());
			return false;
		}

		// Check the data.
		if (!$table->check())
		{
			$this->setError($table->getError());
			return false;
		}

		// Reorder the cars so the new car is first
		if (empty($table->id))
		{
			$conditions_array = $this->getReorderConditions($table);
			
			$conditions = implode(' AND ', $conditions_array);				
			$table->reorder($conditions);
		}

		// Include the cars in georgia plugins for the onSave events.
		JPluginHelper::importPlugin('geocars');

		$result = $dispatcher->trigger('onCarBeforeSave', array('com_geocars.car', &$table, $is_new));

		if (in_array(false, $result, true))
		{
			JError::raiseError(500, $table->getError());
			return false;
		}

		// Store the data.
		if (!$table->store())
		{
			$this->setError($table->getError());
			return false;
		}

		// Clean the cache.
		$cache = JFactory::getCache('com_geocars');
		$cache->clean();

		$dispatcher->trigger('onCarAfterSave', array('com_geocars.car', &$table, $is_new));

		$this->setState('car.id', $table->id);

		return true;
	}


	/**
	* A protected method to get a set of ordering conditions.
	*
	* @param	object	A record object.
	* @return	array	An array of conditions to add to add to ordering queries.
	*/
	protected function getReorderConditions($table)
	{
		$db = JFactory::getDbo();
		
		$condition = array();
		$condition[] = $db->quoteName('catid').' = '.(int) $table->catid;	
		$condition[] = $db->quoteName('state').' >= 0';
		return $condition;
	}	
}