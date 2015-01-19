<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.view');
require_once 'components/com_geocars/models/car.php';

class GeocarsViewOpinions extends JView
{
	function display($tpl = null)
	{
		$this->option = JRequest::getVar( 'option' );
		$this->car_id = JRequest::getVar('car_id');		
		$this->model = $this->getModel();		
		
		
		
		parent::display($tpl);
	}
}
