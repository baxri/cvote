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
 * @CAversion		Id: compobjectplural.php 424 2014-10-23 14:08:27Z BrianWade $
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

jimport('joomla.application.component.modellist');

/**
 * This models supports retrieving lists of cars.
 *
 */
class GeocarsModelCars extends JModelList
{
	/**
	 * Model context string.  Used in setting the store id for the session
	 *
	 * @var		string
	 */
	protected $context = 'com_geocars.cars';

	/**
	 * Constructor.
	 *
	 * @param	array	An optional associative array of configuration settings.
	 * @see		JController
	 * 
	 */
	public function __construct($config = array())
	{
		if (empty($config['filter_fields']))
		{
			$config['filter_fields'] = array(
				'id', 'a.id',
				'name', 'a.name',
				'alias', 'a.alias',
				'catid', 'a.catid', 'category_title',
				'language', 'a.language',
				'hits', 'a.hits',
				'rating',
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
	 * @return	void
	 * 
	 */
	protected function populateState($ordering = null, $direction = null)
	{
		$app = JFactory::getApplication();
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

		$params = $this->state->params;	
		
		$user		= JFactory::getUser();
		
		$item_id = JRequest::getInt('id', 0) . ':' . JRequest::getInt('Itemid', 0);

		// Check to see if a single car has been specified either as a parameter or in the url Request
		$pk = $params->get('car_id', '') == '' ? JRequest::getInt('id', '') : $params->get('car_id');
		$this->setState('filter.car_id', $pk);
		
		// List state information
		if (JRequest::getCmd('layout', 'default') == 'blog')
		{
			$limit = $params->def('car_num_leading', 1) + $params->def('car_num_intro', 4) + $params->def('car_num_links', 4);
		}
		else
		{		
			$limit = $app->getUserStateFromRequest($this->context.'.list.' . $item_id . '.limit', 'limit', $params->get('car_num_per_page'),'integer');
		}
		$this->setState('list.limit', $limit);

		$value = $app->getUserStateFromRequest($this->context.'.limitstart','limitstart',0,'integer');
		$this->setState('list.start', $value);

		$search = $app->getUserStateFromRequest($this->context.'.filter.search', 'filter_search');
		$this->setState('filter.search', $search);
		
		$category_id = $app->getUserStateFromRequest($this->context.'.filter.category_id', 'filter_category_id');
		$this->setState('filter.category_id', $category_id);		

		$order_col = $app->getUserStateFromRequest($this->context. '.filter_order', 'filter_order', $params->get('car_initial_sort','a.ordering'), 'string');
		if (!in_array($order_col, $this->filter_fields))
		{
			$order_col = $params->get('car_initial_sort','a.ordering');
		}

		$this->setState('list.ordering', $order_col);

		$list_order = $app->getUserStateFromRequest($this->context. '.filter_order_Dir', 'filter_order_Dir',  $params->get('car_initial_direction','ASC'), 'cmd');
		if (!in_array(JString::strtoupper($list_order), array('ASC', 'DESC', '')))
		{
			$list_order =  $params->get('car_initial_direction','ASC');
		}
		$this->setState('list.direction', $list_order);
		
				
		$this->setState('filter.published', 1);		

		$this->setState('filter.language',$app->getLanguageFilter());
		
		// check for category selection
		if ($params->get('filter_car_categories') AND implode(',', $params->get('filter_car_categories'))  == true)
		{
			$selected_categories = $params->get('filter_car_categories');
			$this->setState('filter.category_id', $selected_categories);
		}			
		if ($params->get('filter_car_archived'))
		{
			$this->setState('filter.archived', $params->get('filter_car_archived'));
			
		}
		$this->setState('layout', JRequest::getCmd('layout'));
	}

	/**
	 * Method to get a store id based on model configuration state.
	 *
	 * This is necessary because the model is used by the component and
	 * different modules that might need different sets of data or different
	 * ordering requirements.
	 *
	 * @param	string		$id	A prefix for the store id.
	 *
	 * @return	string		A store id.
	 * 
	 */
	protected function getStoreId($id = '')
	{
		// Compile the store id.
		$id .= ':'.$this->getState('filter.search');				
		$id .= ':'.serialize($this->getState('filter.published'));
		$id .= ':'.$this->getState('filter.archived');			
		$id .= ':'.serialize($this->getState('filter.category_id'));
		$id .= ':'.serialize($this->getState('filter.category_id.include'));
		$id .= ':'.$this->getState('filter.car_id');
		$id .= ':'.$this->getState('filter.car_id.include');				
		

		return parent::getStoreId($id);
	}

	/**
	 * Get the main query for retrieving a list of cars subject to the model state.
	 *
	 * @return	JDatabaseQuery
	 * 
	 */
	protected function getListQuery()
	{
		// Get the current user for authorisation checks
		$user	= JFactory::getUser();
	
		// Create a new query object.
		$db = $this->getDbo();
		$query = $db->getQuery(true);

		// Select the required fields from the table.
		$query->select(
			$this->getState(
					'list.select',
					'a.*'
					)
				);


		$query->from($db->quoteName('#__geocars_cars').' AS a');
		// Join over the categories.
		$query->select($db->quoteName('c.title').' AS category_title, '.
						$db->quoteName('c.alias').' AS category_alias, '.	
						$db->quoteName('c.access').' AS category_access, '.
						$db->quoteName('c.path').' AS category_route'
		);
		$query->join('LEFT', $db->quoteName('#__categories').' AS c ON '.$db->quoteName('c.id').' = '.$db->quoteName('a.catid'));
		// Join over the categories to get parent category titles
		$query->select($db->quoteName('parent.title').' AS parent_title, '.
						$db->quoteName('parent.id').' AS parent_id, '.
						$db->quoteName('parent.alias').' AS parent_alias, '.
						$db->quoteName('parent.path').' AS parent_route'
		);
		$query->join('LEFT', $db->quoteName('#__categories').' as parent ON '.$db->quoteName('parent.id').' = '.$db->quoteName('c.parent_id'));



		
		
		// Join on vote rating table
		$query->select('ROUND('.$db->quoteName('v.rating_sum').' / '.$db->quoteName('v.rating_count').', 0) AS rating, '.$db->quoteName('v.rating_count').' as rating_count');
		$query->join('LEFT', $db->quoteName('#__geocars_rating').' AS v ON '.$db->quoteName('a.id').' = '.$db->quoteName('v.content_id').' AND '.$db->quoteName('v.content_type').' = '.$db->quote('cars'));


		// Filter by published status
		$published = $this->getState('filter.published');
		$archived = $this->getState('filter.archived');		
		if (is_numeric($archived))
		{
			$query->where($db->quoteName('a.state').' = '. (int) $archived);
			
		}
		else
		{
			if (is_numeric($published))
			{
				$query->where($db->quoteName('a.state').' = '. (int) $published);
				
			}
			else 
			{
				if (is_array($published))
				{
					JArrayHelper::toInteger($published);
					$published = implode(',', $published);
					// Use car state 
					$query->where($db->quoteName('a.state').' IN ('.$published.')');
				}
			}
		}

		
	

		// Filter by a single or group of cars.
		$car_id = $this->getState('filter.car_id');
		if ($car_id != '')
		{
			if (is_numeric($car_id))
			{
				$type = $this->getState('filter.car_id.include', true) ? '= ' : '<> ';
				$query->where($db->quoteName('a.id').' '.$type.(int) $car_id);
			}
			else
			{
				if (is_array($car_id))
				{
					JArrayHelper::toInteger($car_id);
					$car_id = implode(',', $car_id);
					$type = $this->getState('filter.car_id.include', true) ? 'IN' : 'NOT IN';
					$query->where($db->quoteName('a.id').' '.$type.' ('.$car_id.')');
				}
			}
		}
		// Filter by a single or group of categories
		$category_id = $this->getState('filter.category_id');

		if (is_numeric($category_id))
		{
			$type = $this->getState('filter.category_id.include', true) ? '= ' : '<> ';

			// Add subcategory check
			$include_sub_categories = $this->getState('filter.subcategories', false);
			$category_equals = $db->quoteName('a.catid').' '.$type.(int) $category_id;

			if ($include_sub_categories)
			{
				$levels = (int) $this->getState('filter.max_category_levels', '1');
				// Create a subquery for the subcategory list
				$sub_query = $db->getQuery(true);
				$sub_query->select($db->quoteName('sub.id'));
				$sub_query->from($db->quoteName('#__categories').' as sub');
				$sub_query->join('INNER', $db->quoteName('#__categories').' as this ON '.$db->quoteName('sub.lft').' > '.$db->quoteName('this.lft').' AND '.$db->quoteName('sub.rgt').' < '.$db->quoteName('this.rgt'));
				$sub_query->where($db->quoteName('this.id').' = '.(int) $category_id);
				$sub_query->where($db->quoteName('sub.level').' <= '.$db->quoteName('this.level').' + '.$levels);

				// Add the subquery to the main query
				$query->where('('.$category_equals.' OR '.$db->quoteName('a.catid').' IN ('.$sub_query->__toString().'))');
			}
			else
			{
				$query->where($category_equals);
			}
		}
		else
		{
			if (is_array($category_id) AND (count($category_id) > 0))
			{
				JArrayHelper::toInteger($category_id);
				$category_id = implode(',', $category_id);
				if (!empty($category_id))
				{
					$type = $this->getState('filter.category_id.include', true) ? 'IN' : 'NOT IN';
					$query->where($db->quoteName('a.catid').' '.$type.' ('.$category_id.')');
				}
			}
		}
		

		// process the filter for list views with user-entered filters
		$params = $this->getState('params');

		if ((is_object($params)) AND ($params->get('car_filter_field') != 'hide') AND ($filter = $this->getState('filter.search')))
		{
			// clean filter variable
			$filter = JString::strtolower($filter);
			$hits_filter = intval($filter);
			$filter = $db->quote('%'.$db->escape($filter, true).'%', false);

			switch ($params->get('car_filter_field'))
			{
				case 'hits':
					$query->where($db->quoteName('a.hits').' >= '.(int) $hits_filter.' ');
					break;
				case 'name':
				default: // default to 'name' if parameter is not valid
					$query->where('LOWER('.$db->quoteName('a.name').') LIKE '.$filter);
					break;
				
			}
		}
		// Filter by language
		if ($this->getState('filter.language'))
		{
			$query->where($db->quoteName('a.language').' IN ('.$db->quote(JFactory::getLanguage()->getTag()).','.$db->quote('*').')');
		}

		// Add the list ordering clause.
		if (is_object($params))
		{
			$initial_sort = $params->get('field_initial_sort');
		}
		else
		{
			$initial_sort = '';
		}
		// Fall back to old style if the parameter hasn't been set yet.
		if (empty($initial_sort) OR $this->getState('list.ordering') != '')
		{
			$order_col	= '';
			$order_dirn	= $this->state->get('list.direction');

		
			if ($this->state->get('list.ordering') == 'category_title')
			{
				$order_col = $db->quoteName('c.title').' '.$order_dirn.', '.$db->quoteName('a.ordering');
			}		


			if ($this->state->get('list.ordering') == 'a.ordering' OR $this->state->get('list.ordering') == 'ordering')
			{
				$order_col	= '';
				$order_col	.= $db->quoteName('a.ordering').' '.$order_dirn;		
			}

			if ($order_col == '')
			{
				$order_col = is_string($this->getState('list.ordering')) ? $this->getState('list.ordering') : 'a.ordering';
				$order_col .= ' '.$order_dirn;
			}
			$query->order($db->escape($order_col));			
					
		}
		else
		{
			$query->order($db->quoteName('a.'.$initial_sort).' '.$db->escape($this->getState('list.direction', 'ASC')));
			
		}	
		return $query;
	}

	/**
	 * Method to get a list of cars.
	 *
	 * Overriden to inject convert the params field into a JParameter object.
	 *
	 * @return	mixed	An array of objects on success, false on failure.
	 * 
	 */
	public function getItems()
	{

		$db = $this->getDbo();
		$query = $db->getQuery(true);
		$user	= JFactory::getUser();
		$user_id	= $user->get('id');
		$guest	= $user->get('guest');

		// Get the global params
		$global_params = JComponentHelper::getParams('com_geocars', true);

		if ($items = parent::getItems())
		{
			// Convert the parameter fields into objects.
			foreach ($items as &$item)
			{
				$query->clear();
				$car_params = new JRegistry;
				
		

				
							
				if (!is_object($this->getState('params')))
				{
					$item->params = $car_params;
				}
				else
				{
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


					// get display date
					switch ($item->params->get('list_show_car_date'))
					{
						default:
							$item->display_date = 0;
							break;
					}
				}

			}
		}

		return $items;
	}
}
