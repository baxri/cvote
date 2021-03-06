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
 * @CAversion		Id: compobject.php 424 2014-10-23 14:08:27Z BrianWade $
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

jimport('joomla.application.component.modelitem');

/**
 * Cars In Georgia Component Car Model
 *
 */
class GeocarsModelCar extends JModelItem
{
	/**
	 * Model context string.  Used in setting the store id for the session
	 *
	 * @var		string
	 */
	protected $context = 'com_geocars.car';

	/**
	 * Constructor.
	 *
	 * @param	array	An optional associative array of configuration settings.
	 * 
	 */
	public function __construct($config = array())
	{
		if (empty($config['car_filter_fields']))
		{
			$config['car_filter_fields'] = array(
				'id', 'a.id',
				'name', 'a.name',
				'alias', 'a.alias',
				'image_5','a.image_5',
				'image_4','a.image_4',
				'image_3','a.image_3',
				'image_2','a.image_2',
				'image_1','a.image_1',
				'catid', 'a.catid', 'category_title',
				'state', 'a.state',
				'language', 'a.language',
				'hits', 'a.hits',
				'ordering', 'a.ordering',
				);
		}

		parent::__construct($config);
	}
	/**
	 * Method to auto-populate the model state.
	 *
	 * Note. Calling getState in this method will result in recursion.
	 *
	 */
	protected function populateState()
	{
		$app = JFactory::getApplication('site');

		// Load state from the request.
		$pk = JRequest::getInt('id');
		$this->setState('car.id', $pk);

		$offset = JRequest::getInt('limitstart');
		$this->setState('list.offset', $offset);

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

		// TODO: Tune these values based on other permissions.
		$user		= JFactory::getUser();
			
		$this->setState('filter.published', 1);			

		if ($params->get('filter_car_archived'))
		{
			$this->setState('filter.archived', $params->get('filter_car_archived'));
			
		}
		$this->setState('filter.language', JLanguageMultilang::isEnabled());
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
	 * Method to get Car data.
	 *
	 * @param	integer	The id of the car.
	 *
	 * @return	mixed	Menu item data object on success, false on failure.
	 */
	public function &getItem($pk = null)
	{
		// Get current user for authorisation checks
		$user	= JFactory::getUser();
		
		$pk = (!empty($pk)) ? $pk : (int) $this->getState('car.id');
		// Get the global params
		$global_params = JComponentHelper::getParams('com_geocars', true);

		if ($this->_item === null)
		{
			$this->_item = array();
		}

		if (!isset($this->_item[$pk]))
		{
			try
			{
				$db = $this->getDbo();
				$query = $db->getQuery(true);

				$query->select($this->getState(
					'item.select',
					'a.*'

					)
				);
				$query->from($db->quoteName('#__geocars_cars').' AS a');
				
				// Join on category table.
				$query->select($db->quoteName('c.title').' AS category_title, '.
								$db->quoteName('c.alias').' AS category_alias, '.
								$db->quoteName('c.access').' AS category_access'
								);
				$query->join('LEFT', $db->quoteName('#__categories').' AS c on '.$db->quoteName('c.id').' = '.$db->quoteName('a.catid'));
				
				// Join over the categories to get parent category titles
				$query->select($db->quoteName('parent.title').' AS parent_title, '.
								$db->quoteName('parent.id').' AS parent_id, '.
								$db->quoteName('parent.alias').' AS parent_alias, '.
								$db->quoteName('parent.path').' AS parent_route'
				);
				$query->join('LEFT', $db->quoteName('#__categories').' AS parent ON '.$db->quoteName('parent.id').' = '.$db->quoteName('c.parent_id'));				
				
				// Join over the language
				$query->select($db->quoteName('l.title').' AS language_title');
				$query->join('LEFT', $db->quoteName('#__languages').' AS l ON '.$db->quoteName('l.lang_code').' = '.$db->quoteName('a.language'));

				// Filter by language
				if ($this->getState('filter.language'))
				{
					$query->where('a.language in (' . $db->quote(JFactory::getLanguage()->getTag()) . ',' . $db->quote('*') . ')');
				}					

				$query->where('a.id = ' . (int) $pk);
				
				// Join to check for category published status in parent categories up the tree
				// If all categories are published, badcats.id will be null, and we just use the car state
				$sub_query = ' (SELECT '.$db->quoteName('cat.id').' as id FROM '.$db->quoteName('#__categories').' AS cat JOIN '.$db->quoteName('#__categories').' AS parent ';
				$sub_query .= 'ON '.$db->quoteName('cat.lft').' BETWEEN '.$db->quoteName('parent.lft').' AND '.$db->quoteName('parent.rgt').' ';
				$sub_query .= 'WHERE '.$db->quoteName('parent.extension').' = ' . $db->quote('com_geocars');
				$sub_query .= ' AND '.$db->quoteName('parent.published').' <= 0 GROUP BY '.$db->quoteName('cat.id').')';
				$query->join('LEFT OUTER', $sub_query . ' AS badcats ON '.$db->quoteName('badcats.id').' = '.$db->quoteName('c.id'));
					
				// Join on vote rating table
				$query->select('ROUND('.$db->quoteName('v.rating_sum').' / '.$db->quoteName('v.rating_count').', 0) AS rating, '.$db->quoteName('v.rating_count').' as rating_count');
				$query->join('LEFT', $db->quoteName('#__geocars_rating').' AS v ON '.$db->quoteName('a.id').' = '.$db->quoteName('v.content_id').' AND '.$db->quoteName('v.content_type').' = '.$db->quote('cars'));
				
				// Filter by published status.
				$published = $this->getState('filter.published');
				$archived = $this->getState('filter.archived');
				if (is_numeric($published))
				{
					$query->where('('.$db->quoteName('a.state').' = ' . (int) $published . ' OR '.$db->quoteName('a.state').' = ' . (int) $archived . ')');
				
				}
				

																				
				$db->setQuery($query);

				$item = $db->loadObject();

				if ($error = $db->getErrorMsg())
				{
					throw new Exception($error);
				}

				if (empty($item))
				{
					return JError::raiseError(404, JText::_('COM_GEOCARS_CARS_ERROR_ITEM_NOT_FOUND'));
				}
				// Include any manipulation of the data on the record e.g. expand out Registry fields
				// NB The params registry field - if used - is done automatcially in the JAdminModel parent class
				

				
				
				
				
				
				
							
				// Check for published state if filter set.
				if (((is_numeric($published)) OR (is_numeric($archived))) AND (($item->state != $published) AND ($item->state != $archived)))
				{
					return JError::raiseError(404, JText::_('COM_GEOCARS_CARS_ERROR_ITEM_NOT_FOUND'));
				}

				// Convert parameter fields to objects.
				$car_params = new JRegistry;
				
				$item->params = clone $this->getState('params');				
								
				// Car params override menu item params only if menu param = 'use_car'
				// Otherwise, menu item params control the layout
				// If menu item is 'use_car' and there is no car param, use global

				// create an array of just the params set to 'use_car'
				$menu_params_array = $this->getState('params')->toArray();
				$car_array = array();

				foreach ($menu_params_array as $key => $value)
				{
					if ($value === 'use_car')
					{
						// if the car has a value, use it
						if ($car_params->get($key) != '')
						{
							// get the value from the car
							$car_array[$key] = $car_params->get($key);
						}
						else
						{
							// otherwise, use the global value
							$car_array[$key] = $global_params->get($key);
						}
					}
				}

				// merge the selected car params
				if (count($car_array) > 0)
				{
					$car_params = new JRegistry;
					$car_params->loadArray($car_array);
					$item->params->merge($car_params);
				}




				$this->_item[$pk] = $item;
			}
			catch (JException $e)
			{
				$this->setError($e);
				$this->_item[$pk] = false;
			}
		}

		return $this->_item[$pk];
	}
	/**
	 * Method to change the published state of one or more records.
	 *
	 * @param   array    &$pks   A list of the primary keys to change.
	 * @param   integer  $value  The value of the published state.
	 *
	 * @return  boolean  True on success.
	 *
	 */
	public function publish(&$pks, $value = 1)
	{
		// Initialise variables.
		$dispatcher = JDispatcher::getInstance();
		$table = $this->getTable();
		$user	= JFactory::getUser();
	
		$pks = (array) $pks;

		// Include the geocars plugins for the change of state event.
		JPluginHelper::importPlugin('geocars');

		// Access checks.
		foreach ($pks as $i => $pk)
		{
			$table->reset();

			if ($table->load($pk))
			{
				if (!$this->canEditState($table))
				{
					// Prune items that you can't change.
					unset($pks[$i]);
					JError::raiseWarning(403, JText::_('JLIB_APPLICATION_ERROR_EDITSTATE_NOT_PERMITTED'));
					return false;
				}
			}
		}

		// Attempt to change the state of the records.
		if (!$table->publish($pks, $value, $user->get('id')))
		{
			$this->setError($table->getError());
			return false;
		}

		// Trigger the ChangeState event.
		$result = $dispatcher->trigger('onCarChangeState', array('com_geocars.car', $pks, $value));

		if (in_array(false, $result, true))
		{
			$this->setError($table->getError());
			return false;
		}

		// Clear the component's cache
		$this->cleanCache();

		return true;
	}

	/**
	* A protected method to get a set of ordering conditions.
	*
	* @param	object	A record object.
	* @return	array	An array of conditions to add to add to ordering queries.
	*/
	protected function getReorderConditions($table = null)
	{
		$db = JFactory::getDbo();
		
		$condition = array();
		$condition[] = $db->quoteName('catid').' = '.(int) $table->catid;	
		$condition[] = $db->quoteName('state').' >= 0';
		return $condition;
	}
	/**
	 * Method to adjust the ordering of a row.
	 *
	 * Returns NULL if the user did not have edit
	 * privileges for any of the selected primary keys.
	 *
	 * @param   integer  $pks    The ID of the primary key to move.
	 * @param   integer  $delta  Increment, usually +1 or -1
	 *
	 * @return  mixed  False on failure or error, true on success, null if the $pk is empty (no items selected).
	 *
	 */
	public function reorder($pks, $delta = 0)
	{
		
		$table = $this->getTable();
		$pks = (array) $pks;
		$result = true;

		$allowed = true;

		foreach ($pks as $i => $pk)
		{
			$table->reset();

			if ($table->load($pk))
			{
				// Access checks.
				if (!$this->canEditState($table))
				{
					// Prune items that you can't change.
					unset($pks[$i]);
					JError::raiseWarning(403, JText::_('JLIB_APPLICATION_ERROR_EDITSTATE_NOT_PERMITTED'));
					$allowed = false;
					continue;
				}

				$where = array();
				$where = $this->getReorderConditions($table);

				if (!$table->move($delta, $where))
				{
					$this->setError($table->getError());
					unset($pks[$i]);
					$result = false;
				}

			}
			else
			{
				$this->setError($table->getError());
				unset($pks[$i]);
				$result = false;
			}
		}

		if ($allowed === false AND empty($pks))
		{
			$result = null;
		}

		// Clear the component's cache
		if ($result == true)
		{
			$this->cleanCache();
		}

		return $result;
	}
	/**
	 * Saves the manually set order of records.
	 *
	 * @param   array    $pks    An array of primary key ids.
	 * @param   integer  $order  +1 or -1
	 *
	 * @return  mixed
	 *
	 */
	public function saveorder($pks = null, $order = null)
	{
		
		$table = $this->getTable();
		$conditions = array();

		if (empty($pks))
		{
			return JError::raiseWarning(500, JText::_($this->text_prefix . '_ERROR_NO_ITEMS_SELECTED'));
		}

		// update ordering values
		foreach ($pks as $i => $pk)
		{
			$table->load((int) $pk);

			// Access checks.
			if (!$this->canEditState($table))
			{
				// Prune items that you can't change.
				unset($pks[$i]);
				JError::raiseWarning(403, JText::_('JLIB_APPLICATION_ERROR_EDITSTATE_NOT_PERMITTED'));
			}
			elseif ($table->ordering != $order[$i])
			{
				$table->ordering = $order[$i];

				if (!$table->store())
				{
					$this->setError($table->getError());
					return false;
				}

				// Remember to reorder within position and client_id
				$condition = $this->getReorderConditions($table);
				$found = false;

				foreach ($conditions as $cond)
				{
					if ($cond[1] == $condition)
					{
						$found = true;
						break;
					}
				}

				if (!$found)
				{
					$key = $table->getKeyName();
					$conditions[] = array($table->$key, $condition);
				}
			}
		}

		// Execute reorder for each category.
		foreach ($conditions as $cond)
		{
			$table->load($cond[0]);
			$table->reorder($cond[1]);
		}

		// Clear the component's cache
		$this->cleanCache();

		return true;
	}	   	
		
	/**
	 * Method to delete one or more records.
	 *
	 * @param   array    $pks  An array of record primary keys.
	 *
	 * @return  boolean  True if successful, false if an error occurs.
	 * 
	 */
	public function delete(&$pks)
	{
		
		$dispatcher	= JEventDispatcher::getInstance();
		$pks		= (array) $pks;
		$table		= $this->getTable();

		// Include the geocars plugins for the on delete events.
		JPluginHelper::importPlugin('geocars');

		// Iterate the items to delete each one.
		foreach ($pks as $i => $pk)
		{

			if ($table->load($pk))
			{

				if ($this->canDelete($table))
				{

					// Trigger the BeforeDelete event.
					$result = $dispatcher->trigger('onCarBeforeDelete', array('com_geocars.car', &$table));
					if (in_array(false, $result, true))
					{
						$this->setError($table->getError());
						return false;
					}
					if (!$table->delete($pk))
					{
						$this->setError($table->getError());
						return false;
					}

					// Trigger the AfterDelete event.
					$dispatcher->trigger('onCarAfterDelete', array('com_geocars.car', &$table));

				}
				else
				{
					// Prune items that you can't change.
					unset($pks[$i]);
					$error = $this->getError();
					if ($error)
					{
						JError::raiseWarning(500, $error);
						return false;
					}
					else
					{
						JError::raiseWarning(403, JText::_('JLIB_APPLICATION_ERROR_DELETE_NOT_PERMITTED'));
						return false;
					}
				}

			}
			else
			{
				$this->setError($table->getError());
				return false;
			}
		}

		// Clear the component's cache
		$this->cleanCache();

		return true;
	}
	/**
	 * Increment the hit counter for the car.
	 *
	 * @pk		int		Optional primary key of the car to increment.
	 *
	 * @return	boolean	True if successful; false otherwise and internal error set.
	 */
	public function hit($pk = 0)
	{
		$hit_count = JRequest::getInt('hitcount', 1);

		if ($hit_count)
		{
			// Initialise variables.
			$pk = (!empty($pk)) ? $pk : (int) $this->getState('car.id');
			$db = $this->getDbo();

			$db->setQuery(
				'UPDATE '.$db->quoteName('#__geocars_cars') .
				' SET '.$db->quoteName('hits').' = '.$db->quoteName('hits').' + 1' .
				' WHERE '.$db->quoteName('id').' = '.(int) $pk
				);

			if (!$db->query())
			{
				$this->setError($db->getErrorMsg());
				return false;
			}
		}

		return true;
	}
	/**
	 * Update the vote rating for the car.
	 *
	 * @pk		int		Optional primary key of the car to rate.
	 * @rate	int		Optional rating for the car.
	 *
	 * @return	boolean	True if successful; false otherwise and internal error set.
	 */	
    public function storeVote($pk = 0, $rate = 0)
    {
        if ( $rate >= 1 AND $rate <= 5 AND $pk > 0 )
        {
            $user_ip = $_SERVER['REMOTE_ADDR'];
            $db = $this->getDbo();

            $db->setQuery(
                    'SELECT *' .
                    ' FROM '.$db->quoteName('#__geocars_rating') .
                    ' WHERE '.$db->quoteName('content_id').' = '.(int) $pk .
                    ' AND '.$db->quoteName('content_type').' = '.$db->quote('cars')
            );

            $rating = $db->loadObject();

            if (!$rating)
            {
                // There are no ratings yet, so lets insert our rating
                $db->setQuery(
                        'INSERT INTO '.$db->quoteName('#__geocars_rating').' ( '.$db->quoteName('content_type').', '.$db->quoteName('content_id').', '.$db->quoteName('lastip').', '.$db->quoteName('rating_sum').', '.$db->quoteName('rating_count').' )' .
                        ' VALUES ( '.$db->quote('cars').', '.(int) $pk.', '.$db->quote($user_ip).', '.(int) $rate.', 1 )'
                );

                if (!$db->query())
                {
                        $this->setError($db->getErrorMsg());
                        return false;
                }
            }
            else
            {
                if ($user_ip != ($rating->lastip))
                {
                    $db->setQuery(
                            'UPDATE '.$db->quoteName('#__geocars_rating') .
                            ' SET '.$db->quoteName('rating_count').' = '.$db->quoteName('rating_count').' + 1, '.$db->quoteName('rating_sum').' = '.$db->quoteName('rating_sum').' + '.(int) $rate.', '.$db->quoteName('lastip').' = '.$db->quote($user_ip) .
                            ' WHERE '.$db->quoteName('content_id').' = '.(int) $pk.
							' AND '.$db->quoteName('content_type').' = cars'
                    );
                    if (!$db->query())
                    {
                            $this->setError($db->getErrorMsg());
                            return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            return true;
        }
        JError::raiseWarning( 'SOME_ERROR_CODE', JText::sprintf('COM_GEOCARS_CARS_INVALID_RATING', $rate), "GeocarsModelCar::storeVote($rate)");
        return false;
    }
}
