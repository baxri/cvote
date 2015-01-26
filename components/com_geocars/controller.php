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
 * @CAversion		Id: controller.php 418 2014-10-22 14:42:36Z BrianWade $
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

/**
 * Cars In Georgia Component Controller
 *
 */
class GeocarsController extends JController
{	

	private $car_item_id = 118;

	/**
	 * @var		string	The default view.
	 */
	protected $default_view = 'cars';
	/**
	 * Method to display a view.
	 *
	 * @param	boolean			If true, the view output will be cached
	 * @param	array			An array of safe url parameters and their variable types, for valid values see {@link JFilterInput::clean()}.
	 *
	 * @return	JController		This object to support chaining.
	 * 
	 */
	public function display($cachable = false, $url_params = false)
	{
		$cachable = true;

		// Get the document object.
		$document = JFactory::getDocument();

		// Set the default view name and format from the Request.
		$view_name		= JRequest::getCmd('view', $this->default_view);
		JRequest::setVar('view', $view_name);

		$user = JFactory::getUser();



		$safe_url_params = array(
			'catid'=>'INT','cid'=>'ARRAY',
			'id'=>'INT','year'=>'INT','month'=>'INT','limit'=>'uINT',
			'limitstart'=>'uINT','showall'=>'INT','return'=>'BASE64',
			'filter'=>'STRING','filter_order'=>'CMD','filter_order_Dir'=>'CMD','filter-search'=>'STRING',
			'filter_car_order'=>'CMD','filter_car_order_Dir'=>'CMD','car-filter-search'=>'STRING',
			'print'=>'BOOLEAN','lang'=>'CMD', 'Itemid'=>'INT');

		parent::display($cachable,$safe_url_params);

		return $this;
	}

	/*
	* Load models from DB with ajax
	*
	*/

	public function getCarModelsByCategory(){

		try{

			$model = $this->getModel('cars');

			$response = new stdClass();
			$response->code = 500;
			$response->text = 'undefined';

			$catId = JRequest::getVar('category');

			$models = $model->getCarModelsByCategory( $catId );


			if( empty( $models ) )
				throw new Exception("მოდელი არ მოიძებნა");
				

			$response = new stdClass();
			$response->code = 0;
			$response->text = 'success';
			$response->models = $models;

			echo json_encode($response);
			exit;


		}catch( Exception $e ){
			$response = new stdClass();
			$response->code = 500;
			$response->text = $e->getMessage();
			$response->models = array();

			echo json_encode($response);
			exit;
		}

	}

	/*
	* Redirect to Car page
	* goToModelPage
	*
	*/

	public function goToModelPage(){

		try{

			$category = JRequest::getVar('category');
			$model = JRequest::getVar('model');

			if( empty($category) )
				throw new Exception("მწარმოებელი არ არის არჩეული");

			if( empty($model) )
				throw new Exception("მოდელი არ არის არჩეული");
			
			$this->setRedirect(JRoute::_("index.php?option=com_geocars&car=".$model."&Itemid=".$this->car_item_id, false));
			return;

		}catch( Exception $e ){
			$this->setRedirect("index.php");
			return;
		}

	}

	/*
	* Add users opinion
	* addOpinion
	*
	*/

	public function addOpinion(){
		
		$post = Jrequest::get('posy');

		$url = JRoute::_("index.php?option=com_geocars&car=".$post['car_id']."&Itemid=".$this->car_item_id, false);
		
		try{
			
			$model = $this->getModel('opinion');
			$model->addOpinion( $post );
			$this->setRedirect( $url, 'თქვენი მოსაზრება წარმატებით დაემატა' );
			return;

		}catch( Exception $e ){
			
			$this->setRedirect( $url, $e->getMessage(), 'error' );
			return;
		}
	}	

	public function voteSuccess(){
		try{

			$model = $this->getModel('car');

			$response = new stdClass();
			
			$model_id = JRequest::getVar('model');
			$model->voteSuccess( $model_id );

			$response = new stdClass();
			$response->code = 0;
			$response->text = 'success';
			
			echo json_encode($response);
			exit;


		}catch( Exception $e ){
			$response = new stdClass();
			$response->code = 500;
			$response->text = $e->getMessage();
			
			echo json_encode($response);
			exit;
		}

	}

	public function votedanger(){
		try{

			$model = $this->getModel('car');

			$response = new stdClass();
			
			$model_id = JRequest::getVar('model');
			$model->votedanger( $model_id );

			$response = new stdClass();
			$response->code = 0;
			$response->text = 'success';
			
			echo json_encode($response);
			exit;


		}catch( Exception $e ){
			$response = new stdClass();
			$response->code = 500;
			$response->text = $e->getMessage();
			
			echo json_encode($response);
			exit;
		}
	}
	
	

}
