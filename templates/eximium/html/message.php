<?php
/**
 * @package     Joomla.Platform
 * @subpackage  Document
 *
 * @copyright   Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('JPATH_PLATFORM') or die;

/**
 * JDocument system message renderer
 *
 * @package     Joomla.Platform
 * @subpackage  Document
 * @since       11.1
 */

function renderMessage($name, $params = array (), $content = null)
{	
	// Initialise variables.
	$buffer = null;
	$lists = null;

	// Get the message queue
	$messages = JFactory::getApplication()->getMessageQueue();

	// Build the sorted message list
	if (is_array($messages) && !empty($messages))
	{
		foreach ($messages as $msg)
		{
			if (isset($msg['type']) && isset($msg['message']))
			{
				$lists[$msg['type']][] = $msg['message'];
			}
		}
	}

	// Build the return string
	$buffer .= "\n<div id=\"system-message-container\">";

	// If messages exist render them
	if (is_array($lists))
	{
		$buffer .= "\n<dl id=\"system-message\">";
		foreach ($lists as $type => $msgs)
		{
			if (count($msgs))
			{
				//$buffer .= "\n<dt class=\"" . strtolower($type) . "\">" . JText::_($type) . "</dt>";
				$buffer .= "\n<dd class=\"" . strtolower($type) . " message\">";
				$buffer .= "\n\t<ul>";
				foreach ($msgs as $msg)
				{
					$buffer .= "\n\t\t<li>" . $msg . "</li>";
				}
				$buffer .= "\n\t</ul>";
				$buffer .= "\n</dd>";
			}
		}
		$buffer .= "\n</dl>";
	}

	$buffer .= "\n</div>";
	return $buffer;
}

