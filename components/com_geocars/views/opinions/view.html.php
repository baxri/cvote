<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.view');
require_once 'components/com_geocars/models/car.php';

class GeocarsViewOpinions extends JView
{
	function display($tpl = null)
	{
		$this->doc = JFactory::getDocument();	
		$this->user = JFactory::getUser();
		$this->option = JRequest::getVar( 'option' );
		$this->car_id = JRequest::getVar('car');		
		$this->model = new GeocarsModelCar();		
		$this->item = $this->model->getItem( $this->car_id );
		
		$options = array();
		$options[] = JHTML::_('select.option', '', 'წელი' );
		
		$year = date('Y');
			
		for( $i = 30; $i > 0; $i-- ){
			$options[] = JHTML::_('select.option', $year, $year );
			$year = $year - 1;
		}
		

		$this->year_from = JHTML::_('select.genericlist', $options, 'year_from', ' class="inputbox form-control"', 'value', 'text' );
		$this->year_to = JHTML::_('select.genericlist', $options, 'year_to', ' class="inputbox form-control"', 'value', 'text' );
		
		$options = array();
		$options[] = JHTML::_('select.option', '', 'ტიპი' );
		$options[] = JHTML::_('select.option', '0', 'გამოვთქვავ დადებით მოსაზრებას' );
		$options[] = JHTML::_('select.option', '1', 'გამოვთქვავ უარყოფით მოსაზრებას' );
		$this->type = JHTML::_('select.genericlist', $options, 'type', ' class="inputbox form-control"', 'value', 'text' );
		
		
		parent::display($tpl);
	}
}
