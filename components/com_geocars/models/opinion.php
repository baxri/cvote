<?php

defined('_JEXEC') or die;

jimport('joomla.application.component.model');

class GeocarsModelOpinion extends JModel
{	
	private $table;

	public function __construct(){

		$this->table = $this->_getTable();

		parent::__construct();
	}

	public function addOpinion( $post ){
		
		if( empty( $post['opinion'] ) ){
			throw new Exception("მოსაზრების ტექსტი ცარიელია");
		}

		if( empty( $post['type'] ) ){
			throw new Exception("არ არის მითითებული მოსაზრების ტიპი");
		}

		if( empty( $post['car_id'] ) ){
			throw new Exception("ავტომობილი არ არის მითითებული");
		}

		$user = JFactory::getUser();

		if( empty( $user->id ) ){
			throw new Exception("გაიარეთ ავტორიზაცია");
		}

		$data = array(
			'car_id' => $post['car_id'],
			'opinion' => $post['opinion'],
			'year_from' => $post['year_from'],
			'year_to' => $post['year_to'],
			'type' => $post['type'],
			'datetime' => date('Y-m-d h:m:s'),
			'user_id' => $user->id,
		);

		$this->table->bind( $data )->store();

	}

	private function _getTable()
	{	
		require_once JPATH_SITE.DS.'components'.DS.'com_geocars'.DS.'tables/opinion.php';
		$db = JFactory::getDBO();
		return $table = new GeocarsTableOpinion( $db );
	}
}