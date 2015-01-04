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
 * @CAversion		Id: compobject.php 418 2014-10-22 14:42:36Z BrianWade $
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

jimport('joomla.application.component.controllerform');

/**
 * Car controller class.
 * 
 */
class GeocarsControllerCar extends JControllerForm
{

	protected $view_item = 'carform';
	protected $view_list = 'cars';
	/**
	 * Constructor
	 *
	 */
	public function __construct($config = array())
	{
		parent::__construct($config);

		$this->registerTask('apply',		'save');
		$this->registerTask('save2new',		'save');
		$this->registerTask('save2copy',	'save');
	}

	/**
	 * Method to get a model object, loading it if required.
	 *
	 * @param	string	$name	The model name. Optional.
	 * @param	string	$prefix	The class prefix. Optional.
	 * @param	array	$config	Configuration array for model. Optional.
	 *
	 * @return	object	The model.
	 * 
	 */
	public function getModel($name = 'carform', $prefix = '',$config = array('ignore_request' => true))
	{
		$model = parent::getModel($name, $prefix, $config);

		return $model;
	}
	/**
	 * Method to get the return page saved in session data.
	 *
	 * @param	string	$context	The context string used to store the return data
	 *
	 * @return	string	The url string for the return page
	 * 
	 */
	protected function getReturnPage($context)
	{
		$app		= JFactory::getApplication();

		if (!($return = $app->getUserState($context.'.return'))) 
		{
			return JUri::base();
		}

		$return = JFilterInput::getInstance()->clean($return, 'base64');
		$return = urldecode(base64_decode($return));

		if (!JUri::isInternal($return)) 
		{
			$return = JUri::base();
		}

		return $return;
	}
	/**
	 * Method to set the return page as a saved entry in session data.
	 *
	 * @param	string	$context	The context string used to store the return data
	 *
	 * @return	void
	 * 
	 */
	protected function setReturnPage($context)
	{
		$app		= JFactory::getApplication();

		$return = JRequest::getVar('return', null, 'default', 'base64');
		$app->setUserState($context.'.return', $return);
	}
	/**
	 * Method to clear the return page in session data.
	 *
	 * @param	string	$context	The context string used to store the return data
	 *
	 * @return	void
	 * 
	 */	
	protected function clearReturnPage($context)
	{
		$app		= JFactory::getApplication();

		$app->setUserState($context.'.return', null);
	}
	/**
	 * Method to add a new record.
	 *
	 * @return	boolean	True if the Car can be added, false if not.
	 *
	 */
	public function add()
	{
		$app		= JFactory::getApplication();
		$context	= $this->option.'.edit.'.$this->context;


		// Clear the record edit information from the session.
		$app->setUserState($context.'.data',	null);

		// Clear the return page.
		// TODO: We should be including an optional 'return' variable in the URL.
		$this->setReturnPage($context);

		// ItemID required on redirect for correct Template Style
		$redirect = JRoute::_('index.php?option='.$this->option.'&view='.$this->view_item.'&layout=edit', false);
				
		if (JRequest::getInt('Itemid') != 0) 
		{
			$redirect .= '&Itemid='.JRequest::getInt('Itemid');
		}

		$this->setRedirect($redirect);

		return true;
	}

	/**
	 * Method to edit a object
	 *
	 * Sets object ID in the session from the request, checks the item out, and then redirects to the edit page.
	 * 
	 * @param   string  $key     The name of the primary key of the URL variable.
	 * @param   string  $urlVar  The name of the URL variable if different from the primary key
	 * (sometimes required to avoid router collisions).
	 *
	 * @return  boolean  True if access level check and checkout passes, false otherwise.
	 *
	 */
	public function edit($key = 'id', $urlVar = null)
	{
		
		$app		= JFactory::getApplication();
		$context	= $this->option.'.edit.'.$this->context;
		$ids		= JRequest::getVar('cid', array(), '', 'array');

		// Get the id of the group to edit.
		$record_id =  (int) (empty($ids) ? JRequest::getInt('id') : array_pop($ids));


		// Get the menu item model.
		$model = $this->getModel('carform');
		// Set the return url
		$this->setReturnPage($context);

		// Check that this is not a new item.

		if ($record_id > 0) 
		{
			$item = $model->getItem($record_id);

		}

		// Check-out succeeded, register the ID for editing.
		$this->holdEditId($context, $record_id);
		$app->setUserState($context.'.data',	null);

		$redirect = JRoute::_('index.php?option='.$this->option.'&view='.$this->view_item
							.$this->getRedirectToItemAppend($record_id, $key), false);

		// ItemID required on redirect for correct Template Style
		if (JRequest::getInt('Itemid') != 0) 
		{
			$redirect .= '&Itemid='.JRequest::getInt('Itemid');
		}

		$this->setRedirect($redirect);

		return true;
	}

	/**
	 * Method to cancel an edit
	 *
	 * Checks the item in, sets item ID in the session to null, and then redirects to the list page.
	 * 
	 * @param   string  $key  The name of the primary key of the URL variable.
	 *
	 * @return  boolean  True if access level checks pass, false otherwise.
	 */
	public function cancel($key = 'id')
	{
		// Check for request forgeries.
		// Fudge on where to find checkToken as this changed from J 2.5.3 to J 2.5.4
		if (method_exists('JSession','checkToken'))
		{
			JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));
		}
		else
		{
			JRequest::checkToken() or jexit(JText::_('JINVALID_TOKEN'));
		}
		
		$app		= JFactory::getApplication();
		$model		= $this->getModel('carform');
		$context	= $this->option.'.edit.'.$this->context;
		$record_id	= JRequest::getInt('id');

		if ($record_id) 
		{
			// Check we are holding the id in the edit list.
			if (!$this->checkEditId($context, $record_id)) 
			{
				// Somehow the person just went to the form - we don't allow that.
				$this->setMessage(JText::sprintf('JLIB_APPLICATION_ERROR_UNHELD_ID', $record_id), 'error');
				$this->setRedirect($this->getReturnPage($context));
				
				// Make sure return url is cleared
				$this->clearReturnPage($context);	
				return false;
			}

		}

		// Clear the menu item edit information from the session.
		$this->releaseEditId($context, $record_id);
		$app->setUserState($context.'.data',	null);

		// Redirect to the list screen.
		$this->setRedirect($this->getReturnPage($context));
		
		// Make sure return url is cleared
		$this->clearReturnPage($context);			
		return true;
	}
	/**
	 * Method to save the record
	 *
	 * @param   string  $key     The name of the primary key of the URL variable.
	 * @param   string  $urlVar  The name of the URL variable if different from the primary key (sometimes required to avoid router collisions).
	 *
	 * @return  boolean  True if successful, false otherwise.* 
	 */
	public function save($key = 'id', $urlVar = null)
	{
		// Check for request forgeries.
		// Fudge on where to find checkToken as this changed from J 2.5.3 to J 2.5.4
		if (method_exists('JSession','checkToken'))
		{
			JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));
		}
		else
		{
			JRequest::checkToken() or jexit(JText::_('JINVALID_TOKEN'));
		}
		
		$app		= JFactory::getApplication();
		$data		= JRequest::getVar('jform', array(), 'post', 'array');
		$model		= $this->getModel('carform');
		$task		= $this->getTask();
		$context	= $this->option.'.edit.'.$this->context;
		$record_id = JRequest::getInt('id',0);	
		if (in_array(JRequest::getCmd('view'), array('category', 'categories'))) 
		{
			$record_id = 0;
		}
		if (!$this->checkEditId($context, $record_id)) 
		{
			// Somehow the person just went to the form and saved it - we don't allow that.
			$this->setMessage(JText::sprintf('JLIB_APPLICATION_ERROR_UNHELD_ID', $record_id), 'error');
			$this->setRedirect($this->getReturnPage($context));
			
			// Make sure return url is cleared
			$this->clearReturnPage($context);	
			return false;
		}

		// Populate the row id from the session.
		$data['id'] = $record_id;
		// The save2copy task needs to be handled slightly differently.
		if ($task == 'save2copy') 
		{

			// Reset the ID and then treat the request as for Apply.
			$data['id']	= 0;
			$task		= 'apply';
		}

		// Validate the posted data.
		$form	= $model->getForm();
		if (!$form) 
		{
			JError::raiseError(500, $model->getError());

			return false;
		}
		$datastore = $data;		
		$data	= $model->validate($form, $data);

		// Check for validation errors.
		if ($data === false) 
		{
			// Get the validation messages.
			$errors	= $model->getErrors();

			// Push up to three validation messages out to the user.
			for ($i = 0, $n = count($errors); $i < $n AND $i < 3; $i++)
			{
				if (JError::isError($errors[$i])) 
				{
					$app->enqueueMessage($errors[$i]->getMessage(), 'warning');
				}
				else 
				{
					$app->enqueueMessage($errors[$i], 'warning');
				}
			}

			// Save the data in the session.
			$app->setUserState($context.'.data', $datastore);

			// Redirect back to the edit screen.
			$this->setRedirect(JRoute::_(
				'index.php?option='.$this->option.'&view='.$this->view_item
				. $this->getRedirectToItemAppend($record_id, $key), false
				)
			);
			return false;
		}

		// Attempt to save the data.
		if (!$model->save($data)) 
		{
			// Save the data in the session.
			$app->setUserState($context.'.data', $data);

			// Redirect back to the edit screen.
			$this->setMessage(JText::sprintf('JLIB_APPLICATION_ERROR_SAVE_FAILED', $model->getError()), 'warning');
			$this->setRedirect(JRoute::_(
				'index.php?option='.$this->option.'&view='.$this->view_item
				. $this->getRedirectToItemAppend($record_id, $key), false
				)
			);
			return false;
		}


		if ($record_id == 0) 
		{
			$this->setMessage(JText::_('COM_GEOCARS_CARS_SUBMIT_SAVE_SUCCESS'));
		} 
		else 
		{
			$this->setMessage(JText::_('COM_GEOCARS_CARS_SAVE_SUCCESS'));
		}

		// Redirect the user and adjust session state based on the chosen task.
		switch ($task)
		{
			case 'apply':
				// Set the row data in the session.
				$record_id = $model->getState('car.id');
				$this->holdEditId($context, $record_id);
				$app->setUserState($context.'.data',	null);

				// Redirect back to the edit screen.
				$this->setRedirect(JRoute::_(
					'index.php?option='.$this->option.'&view='.$this->view_item
					. $this->getRedirectToItemAppend($record_id, $key), false
					)
				);				
				break;

			case 'save2new':
				// Clear the row id and data in the session.
				$this->releaseEditId($context, $record_id);
				$app->setUserState($context.'.data',	null);

				// Redirect back to the edit screen.
				$this->setRedirect(JRoute::_(
					'index.php?option='.$this->option.'&view='.$this->view_item
					.'&layout=edit', false
					)
				);
			break;

			default:
				// Clear the row id and data in the session.
				$this->releaseEditId($context, $record_id);
				$app->setUserState($context.'.data',	null);

				// Redirect to the list screen.
				$this->setRedirect($this->getReturnPage($context));
				
				// Make sure return url is cleared
				$this->clearReturnPage($context);					
				break;
		}
		// Invoke the postSave method to allow for the child class to access the model.
		$this->postSaveHook($model, $data);

		return true;		
	}

	/**
	 * Method to delete a object
	 *
	 * Sets object ID in the session from the request and then deletes the object.
	 *
	 * @return	boolean	True if the record can be edited, false if not.
	 */
	public function delete()
	{
		// Check for request forgeries
		(JSession::checkToken('get') OR JSession::checkToken()) OR die(JText::_('JINVALID_TOKEN'));
		// Fudge on where to find checkToken as this changed from J 2.5.3 to J 2.5.4
		if (method_exists('JSession','checkToken'))
		{
			(JSession::checkToken('get') OR JSession::checkToken()) or jexit(JText::_('JINVALID_TOKEN'));
		}
		else
		{
			(JRequest::checkToken('get') OR JRequest::checkToken()) or jexit(JText::_('JINVALID_TOKEN'));
		}
				
		$app		= JFactory::getApplication();
		$context	= "$this->option.delete.$this->context";
		$ids		= JRequest::getVar('cid', array(), '', 'array');

		// Get the id of the group to edit.
		$id =  (int) (empty($ids) ? JRequest::getInt('id') : array_pop($ids));


		// Get the menu item model.
		$model = $this->getModel('car');

		// Check that this is not a new item.

		if ($id > 0) 
		{
			
			$trash_state = -2;
			if($model->publish($id, $trash_state))
			{
				$this->setMessage(JText::_('COM_GEOCARS_CARS_DELETE_SUCCESS'));
				
			}
			else
			{
				$this->setMessage(JText::_('COM_GEOCARS_CARS_DELETE_FAILED'));
			}
		}

		$this->setReturnPage($context);

		$this->setRedirect($this->getReturnPage($context));
		
		// Make sure return url is cleared
		$this->clearReturnPage($context);	
		
		return true;
	}	
	/**
	 * Method to save a vote.
	 *
	 * @return	void
	 * 
	 */
	function vote()
	{
		// Check for request forgeries.
		// Fudge on where to find checkToken as this changed from J 2.5.3 to J 2.5.4
		if (method_exists('JSession','checkToken'))
		{
			JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));
		}
		else
		{
			JRequest::checkToken() or jexit(JText::_('JINVALID_TOKEN'));
		}
		
		$user_rating = JRequest::getInt('user_rating', -1);

		if ( $user_rating > -1 )
		{
			$url = JRequest::getString('url', '');
			$id = JRequest::getInt('id', 0);
			$view_name = JRequest::getString('view', $this->default_view);
			$model = $this->getModel($view_name);

			if ($model->storeVote($id, $user_rating))
			{
				$this->setRedirect($url, JText::_('COM_GEOCARS_CARS_VOTE_SUCCESS'));
			}
			else
			{
				$this->setRedirect($url, JText::_('COM_GEOCARS_CARS_VOTE_FAILURE'));
			}
		}
	}
}
