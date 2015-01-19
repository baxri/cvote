<?php
defined('_JEXEC') or die;

// Include dependancies
jimport('joomla.application.component.controller');

$doc = JFactory::getDocument();

require_once JPATH_COMPONENT.'/helpers/route.php';
require_once JPATH_COMPONENT.'/helpers/query.php';
require_once JPATH_COMPONENT.'/helpers/geocars.php';

$doc->addScript( "https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js" );
$doc->addScript(JURI::root().'components/com_geocars/assets/js/custom.js');

$controller = JController::getInstance('Geocars');

$controller->execute(JRequest::getCmd('task'));
$controller->redirect();
