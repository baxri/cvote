<?php
defined('_JEXEC') or die;

jimport('joomla.application.component.view');

class GeocarsViewCar extends JView
{
	function display($tpl = null)
	{	
		$session = JFactory::getSession();
		
		$this->post_data = $session->get( 'opinion.post.data', array() );



		$this->year_from_value = JRequest::getVar('year_from', '');
		$this->year_to_value = JRequest::getVar('year_to', '');
		$this->type_value = JRequest::getVar('type', '');
		$this->country_value = JRequest::getVar('country', '');
		$this->engine_value = JRequest::getVar('engine', '');

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
		$options[] = JHTML::_('select.option', '', 'წელი - დან /მდე' );
		
		$year = date('Y');
			
		for( $i = 30; $i > 0; $i-- ){
			$options[] = JHTML::_('select.option', $year, $year );
			$year = $year - 1;
		}
		
		$this->year_from = JHTML::_('select.genericlist', $options, 'year_from', ' class="inputbox form-control"', 'value', 'text', @$this->post_data['year_from'] );
		$this->year_from_filter = JHTML::_('select.genericlist', $options, 'year_from', ' class="inputbox form-control"', 'value', 'text', $this->year_from_value );
		

		$this->year_to = JHTML::_('select.genericlist', $options, 'year_to', ' class="inputbox form-control"', 'value', 'text', @$this->post_data['year_to'] );
		$this->year_to_filter = JHTML::_('select.genericlist', $options, 'year_to', ' class="inputbox form-control"', 'value', 'text', $this->year_to_value );
		

		$options = array();
		$options[] = JHTML::_('select.option', '', 'ტიპი' );
		$options[] = JHTML::_('select.option', '1', 'დადებითი მოსაზრება' );
		$options[] = JHTML::_('select.option', '2', 'უარყოფითი მოსაზრება' );
		
		$this->type = JHTML::_('select.genericlist', $options, 'type', ' class="inputbox form-control"', 'value', 'text', @$this->post_data['type'] );
		$this->type_filter = JHTML::_('select.genericlist', $options, 'type', ' class="inputbox form-control"', 'value', 'text', $this->type_value );
		

		$options = array();
		$options[] = JHTML::_('select.option', '', 'ქვეყანა' );
		$options[] = JHTML::_('select.option', '1', 'ამერიკული' );
		$options[] = JHTML::_('select.option', '2', 'ევროპული' );
		$options[] = JHTML::_('select.option', '3', 'იაპონური' );
		
		$this->country = JHTML::_('select.genericlist', $options, 'country', ' class="inputbox form-control"', 'value', 'text' );
		$this->country_filter = JHTML::_('select.genericlist', $options, 'country', ' class="inputbox form-control"', 'value', 'text', $this->country_value );
		

		$this->page_suffix = 'car/'.$this->item->category_alias.'/'.$this->item->alias;
		
		$this->app_url = 'http://www.voteauto.ge';
		$this->page_url = $this->app_url.'/'.$this->page_suffix;
		
		JFactory::getDocument()->setTitle('შეაფასე ავტომობილი  - '.$this->item->category_title.' '.$this->item->name );
		
		$this->opinions = $model->getOpinions( $this->item->id );
		$this->pagination = $model->getPagination();

		parent::display($tpl);
	}

	
}
