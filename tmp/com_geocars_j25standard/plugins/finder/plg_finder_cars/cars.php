<?php
/**
 * @version 		$Id:$
 * @name			Cars In Georgia (Release 1.0.0)
 * @author			Giorgi Bibilashvili ()
 * @package			com_geocars
 * @subpackage		com_geocars.finder.geocars.cars
 * @copyright		
 * @license			GNU General Public License version 3 or later; See http://www.gnu.org/copyleft/gpl.html 
 * 
 * The following Component Architect header section must remain in any distribution of this file
 * 
 * @CAversion		Id: compobjectplural.php 418 2014-10-22 14:42:36Z BrianWade $
 * @CAauthor		Component Architect (www.componentarchitect.com)
 * @CApackage		architectcomp
 * @CAsubpackage	architectcomp.finder.architectcomp.compobjectplural
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

defined('JPATH_BASE') or die;

jimport('joomla.application.component.helper');

// Load the base adapter.
require_once JPATH_ADMINISTRATOR . '/components/com_finder/helpers/indexer/adapter.php';

/**
 * Finder adapter for com_geocars - cars
 *
 */
class plgFinderCars extends FinderIndexerAdapter
{
	/**
	 * The plugin identifier.
	 *
	 * @var    string
	 * 
	 */
	protected $context = 'Cars';

	/**
	 * The extension name.
	 *
	 * @var    string
	 * 
	 */
	protected $extension = 'com_geocars';

	/**
	 * @var    $sub_layout	string	The sublayout to use when rendering the results.
	 */
	protected $sub_layout = 'default';

	/**
	 * @var    $layout	string	The layout (i.e. view) to use when rendering the results.
	 */
	protected $layout = 'car';

	/**
	 * The type of content that the adapter indexes.
	 *
	 * @var    string
	 * 
	 */
	protected $type_title = 'Cars';

	/**
	 * The table name.
	 *
	 * @var    string
	 * 
	 */
	protected $table = '#__geocars_cars';

	/**
	 * Constructor
	 *
	 * @param   object  &$subject  The object to observe
	 * @param   array   $config    An array that holds the plugin configuration
	 *
	 */
	public function __construct(&$subject, $config)
	{
		parent::__construct($subject, $config);
		
		if ($this->params->get('sub_layout') AND $this->params->get('sub_layout') != '_:default')
		{		
			$this->sub_layout = str_replace('_:','',$this->params->get('sub_layout'));
		}
		
		$this->loadLanguage();
	}

	/**
	 * Method to update the item link information when the item category is
	 * changed. This is fired when the item category is published or unpublished
	 * from the list view.
	 *
	 * @param   string   $extension  The extension whose category has been updated.
	 * @param   array    $pks        A list of primary key ids of the content that has changed state.
	 * @param   integer  $value      The value of the state that the content has been changed to.
	 *
	 * @return  void
	 *
	 */
	public function onFinderCategoryChangeState($extension, $pks, $value)
	{
		// Make sure we're handling com_geocars categories
		if ($extension == 'com_geocars')
		{
			$this->categoryStateChange($pks, $value);
		}
	}

	/**
	 * Method to remove the link information for items that have been deleted.
	 *
	 * @param   string  $context  The context of the action being performed.
	 * @param   JTable  $table    A JTable object containing the record to be deleted
	 *
	 * @return  boolean  True on success.
	 *
	 * @throws  Exception on database error.
	 */
	public function onFinderAfterDelete($context, $table)
	{
		if ($context == 'com_geocars.car')
		{
			$id = $table->id;
		}
		elseif ($context == 'com_finder.index')
		{
			$id = $table->link_id;
		}
		else
		{
			return true;
		}
		// Remove the items.
		return $this->remove($id);
	}

	/**
	 * Method to determine if the access level of an item changed.
	 *
	 * @param   string   $context  The context of the object passed to the plugin.
	 * @param   JTable   $row      A JTable object
	 * @param   boolean  $is_new    If the content has just been created
	 *
	 * @return  boolean  True on success.
	 *
	 * @throws  Exception on database error.
	 */
	public function onFinderAfterSave($context, $row, $is_new)
	{
		// We only want to handle cars here
		if ($context == 'com_geocars.car' OR $context == 'com_geocars.carform')
		{

			// Reindex the item
			$this->reindex($row->id);
		}

		// Check for access changes in the category
		if ($context == 'com_categories.category')
		{
			// Check if the access levels are different
			if (!$is_new AND $this->old_cataccess != $row->access)
			{
				$this->categoryAccessChange($row);
			}
		}

		return true;
	}

	/**
	 * Method to reindex the link information for an item that has been saved.
	 * This event is fired before the data is actually saved so we are going
	 * to queue the item to be indexed later.
	 *
	 * @param   string   $context  The context of the object passed to the plugin.
	 * @param   JTable   $row     A JTable object
	 * @param   boolean  $is_new    If the content is just about to be created
	 *
	 * @return  boolean  True on success.
	 *
	 * @throws  Exception on database error.
	 */
	public function onFinderBeforeSave($context, $row, $is_new)
	{

		// Check for access levels from the category
		if ($context == 'com_categories.category')
		{
			// Query the database for the old access level if the item isn't new
			if (!$is_new)
			{
				$this->checkCategoryAccess($row);
			}
		}

		return true;
	}

	/**
	 * Method to update the link information for items that have been changed
	 * from outside the edit screen. This is fired when the item is published,
	 * unpublished, archived, or unarchived from the list view.
	 *
	 * @param   string   $context  The context for the object passed to the plugin.
	 * @param   array    $pks      A list of primary key ids of the content that has changed state.
	 * @param   integer  $value    The value of the state that the content has been changed to.
	 *
	 * @return  void
	 *
	 */
	public function onFinderChangeState($context, $pks, $value)
	{
		// We only want to handle cars here
		if ($context == 'com_geocars.car' OR $context == 'com_geocars.carform')
		{
			$this->itemStateChange($pks, $value);
		}
		// Handle when the plugin is disabled
		if ($context == 'com_plugins.plugin' AND $value === 0)
		{
			$this->pluginDisable($pks);
		}
	}

	/**
	 * Method to index an item. The item must be a FinderIndexerResult object.
	 *
	 * @param   FinderIndexerResult  $item    The item to index as an FinderIndexerResult object.
	 * @param   string               $format  The item format
	 *
	 * @return  void
	 *
	 * @throws  Exception on database error.
	 */
	protected function index(FinderIndexerResult $item, $format = 'html')
	{
		// Check if the extension is enabled
		if (JComponentHelper::isEnabled($this->extension) == false)
		{
			return;
		}

		// Initialize the item parameters.
		$registry = new JRegistry;
		$registry->loadString($item->params);
		$item->params = JComponentHelper::getParams('com_geocars', true);
		$item->params->merge($registry);

		$registry = new JRegistry;
		$registry->loadString($item->metadata);
		$item->metadata = $registry;

		// Trigger the onContentPrepare event.
		$item->body = FinderIndexerHelper::prepareContent($item->body, $item->params);

		if ($this->sub_layout != 'default')
		{
			$view = $this->layout.'&layout='.$this->sub_layout;
		}
		else
		{
			$view = $this->layout;
		}

		// Build the necessary route and path information.
		$item->url = $this->getURL($item->id, $this->extension, $view);
	
		$item->route = GeocarsHelperRoute::getCarRoute($item->slug, $item->catslug, $item->language, $this->sub_layout);
		$item->path = FinderIndexerHelper::getContentPath($item->route);

		// Get the menu title if it exists.
		$title = $this->getItemMenuTitle($item->url);

		if (!empty($title) AND $this->params->get('use_menu_title', true))
		{
			$item->title = $title;
		}
		else
		{
			$item->title = $item->name;
		}
		
		

		// Translate the state. 
		$item->state = $this->translateState($item->state);

		// Add the type taxonomy data.
		$item->addTaxonomy('Type', 'Car');


		// Add the category taxonomy data.
		$item->addTaxonomy('Category', $item->category, $item->cat_state, $item->cat_access);

		// Add the language taxonomy data.
		$item->addTaxonomy('Language', $item->language);

		// Get content extras.
		FinderIndexerHelper::getContentExtras($item);

		// Index the item.
		FinderIndexer::index($item);
	}

	/**
	 * Method to setup the indexer to be run.
	 *
	 * @return  boolean  True on success.
	 *
	 */
	protected function setup()
	{
		// Load dependent classes.
		include_once JPATH_SITE . '/components/com_geocars/helpers/route.php';

		return true;
	}

	/**
	 * Method to get the SQL query used to retrieve the list of content items.
	 *
	 * @param   mixed  $sql  A JDatabaseQuery object or null.
	 *
	 * @return  JDatabaseQuery  A database object.
	 *
	 */
	protected function getListQuery($sql = null)
	{
		$db = JFactory::getDbo();
		// Check if we can use the supplied SQL query.
		$sql = $sql instanceof JDatabaseQuery ? $sql : $db->getQuery(true);
		$sql->select('a.id');
		$sql->select('a.name');
		$sql->select('a.alias');
		$sql->select('a.description AS body');
		$sql->select('a.state');
		$sql->select('a.catid');
		$sql->select('a.language'); 
		$sql->select('c.title AS category, c.published AS cat_state, c.access AS cat_access');
		$sql->select('a.ordering');

		// Handle the alias CASE WHEN portion of the query
		$a_id = $sql->castAsChar('a.id');
		$case_when_item .= $a_id.' END as slug';
		$sql->select($case_when_item);
		
		$case_when_category_alias = ' CASE WHEN ';
		$case_when_category_alias .= $sql->charLength('c.alias');
		$case_when_category_alias .= ' THEN ';
		$c_id = $sql->castAsChar('c.id');
		$case_when_category_alias .= $sql->concatenate(array($c_id, 'c.alias'), ':');
		$case_when_category_alias .= ' ELSE ';
		$case_when_category_alias .= $c_id.' END as catslug';
		$sql->select($case_when_category_alias);

		$sql->from('#__geocars_cars AS a');
		$sql->join('LEFT', '#__categories AS c ON c.id = a.catid');

		return $sql;
	}
}
