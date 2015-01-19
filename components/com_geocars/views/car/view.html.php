<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.view');

class GeocarsViewCar extends JView
{
	
	function display($tpl = null)
	{
		$this->option = JRequest::getVar("option");
		$this->user = JFactory::getUser();
		$this->doc = JFactory::getDocument();
		$app		= JFactory::getApplication();
		$user		= JFactory::getUser();
		$model = $this->getModel();
		$car_id = (int)JRequest::getVar("car");

		$this->item = $model->getItem($car_id);

		if(empty( $this->item )){
			$app->redirect("index.php");
		}

		$this->voted = $model->getVote( $car_id );
		
		
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
		$options[] = JHTML::_('select.option', '1', 'გამოვთქვავ დადებით მოსაზრებას' );
		$options[] = JHTML::_('select.option', '2', 'გამოვთქვავ უარყოფით მოსაზრებას' );
		$this->type = JHTML::_('select.genericlist', $options, 'type', ' class="inputbox form-control"', 'value', 'text' );
		
		
		$this->page_suffix = 'car/'.$this->item->category_alias.'/'.$this->item->alias;
		
		$this->app_url = 'http://www.voteauto.ge';
		$this->page_url = $this->app_url.'/'.$this->page_suffix;
		
		JFactory::getDocument()->setTitle('შეაფასე ავტომობილი  - '.$this->item->category_title.' '.$this->item->name );
		
		$this->opinions = $model->getOpinions( $this->item->id );
		
		parent::display($tpl);
	}

	
}
