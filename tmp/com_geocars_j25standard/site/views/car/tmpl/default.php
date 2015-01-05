<?php
/**
 * @version 		$Id:$
 * @name			Cars In Georgia (Release 1.0.0)
 * @author			Giorgi Bibilashvili ()
 * @package			com_geocars
 * @subpackage		com_geocars.admin
 * @copyright		
 * @license			GNU General Public License version 3 or later; See http://www.gnu.org/copyleft/gpl.html 
 * 
 * The following Component Architect header section must remain in any distribution of this file
 *
 * @CAversion		Id: default.php 418 2014-10-22 14:42:36Z BrianWade $
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

// Create shortcuts to some parameters.
$params		= &$this->item->params;
$user		= JFactory::getUser();

// Get from global settings the text to use for an empty field
$component = JComponentHelper::getComponent( 'com_geocars' );
$empty = $component->params->get('default_empty_field', '');
?>
<noscript>
<p style="color: red;"><?php echo JText::_('COM_GEOCARS_WARNING_NOSCRIPT'); ?><p>
</noscript>
<div class="geocars car-view<?php echo $params->get('pageclass_sfx')?>">
	<?php if ($this->params->get('show_page_heading')) : ?>
	<h1>
		<?php echo $this->escape($this->params->get('page_heading')); ?>
	</h1>
	<?php endif; ?>
	<?php
		if (!empty($this->item->pagination) AND $this->item->pagination AND !$this->item->paginationposition AND $this->item->paginationrelative) :
			 echo $this->item->pagination;
		endif;
	?>	
	<?php if ($params->get('show_car_print_icon') 
		OR $params->get('show_car_email_icon') 
		): ?>
		<ul class="actions">
			<?php if (!$this->print) : ?>
					<?php if ($params->get('show_car_print_icon')) : ?>
					<li class="print-icon">
							<?php echo JHtml::_('caricon.print_popup',  $this->item, $params); ?>
					</li>
					<?php endif; ?>

					<?php if ($params->get('show_car_email_icon')) : ?>
					<li class="email-icon">
							<?php echo JHtml::_('caricon.email',  $this->item, $params); ?>
					</li>
					<?php endif; ?>
						<li class="edit-icon">
							<?php echo JHtml::_('caricon.edit', $this->item, $params); ?>
						</li>
						<li class="delete-icon">
							<?php echo JHtml::_('caricon.delete',$this->item, $params); ?>
						</li>					
			<?php else : ?>
				<li>
					<?php echo JHtml::_('caricon.print_screen',  $this->item, $params); ?>
				</li>
			<?php endif; ?>
		</ul>
	<?php endif; ?>

	<?php if ($params->get('show_car_name')) : ?>
		<div style="float: left;">

			<h2>
				<?php if ($params->get('link_car_names') AND !empty($this->item->readmore_link)) : ?>
					<a href="<?php echo $this->item->readmore_link; ?>">
					<?php echo $this->escape($this->item->name); ?></a>
				<?php else : ?>
					<?php echo $this->escape($this->item->name); ?>
				<?php endif; ?>
			</h2>
		</div>
	<?php endif; ?>
	<?php  echo $this->item->event->afterDisplayCarName;	?>
	
	<?php echo $this->item->event->beforeDisplayCar; ?>
	<?php if ($params->get('show_car_hits') != '0'): ?>	
			<?php if ($params->get('show_car_hits')) : ?>

				<?php echo '<br />'.JText::sprintf('COM_GEOCARS_HITS', $this->item->hits); ?>
			<?php endif; ?>	
	<?php endif; ?>	
	<div style="clear:both; padding-top: 10px;">

			<?php
				if (!empty($this->item->pagination) AND $this->item->pagination AND !$this->item->paginationposition AND !$this->item->paginationrelative) :
					echo $this->item->pagination;
				endif;
			?>	
		<?php echo $this->item->description; ?>
			<?php
				if (!empty($this->item->pagination) AND $this->item->pagination AND $this->item->paginationposition AND !$this->item->paginationrelative) :
					echo $this->item->pagination;
				endif;
			?>	
	</div>
	<div style="padding-top: 10px;">

			<form action="" name="carForm" id="carForm">
			<?php $dummy = false;
					$display_fieldset = (
								($params->get('show_car_image_5')) OR 
								($params->get('show_car_image_4')) OR 
								($params->get('show_car_image_3')) OR 
								($params->get('show_car_image_2')) OR 
								($params->get('show_car_image_1')) OR 
								$dummy
								); ?>
			<?php if ($display_fieldset) : ?>				
					<fieldset>	
						<legend><?php echo JText::_('COM_GEOCARS_CARS_FIELDSET_BASIC_DETAILS_LABEL'); ?></legend>
			<?php endif; ?>
						<div style="padding-top: 10px;">			
							<?php if ($params->get('show_car_image_5')) : ?>
							<div class="formelm">
								<label>
									<?php echo JText::_('COM_GEOCARS_CARS_FIELD_IMAGE_5_LABEL'); ?>
								</label>
								<span>
									<?php
										echo $this->item->image_5 != '' ? '<embed height="50" width="100" src="'.$this->item->image_5.'"/>' : $empty;
									?>
								</span>
							</div>	
							<?php endif; ?>
								
							<?php if ($params->get('show_car_image_4')) : ?>
							<div class="formelm">
								<label>
									<?php echo JText::_('COM_GEOCARS_CARS_FIELD_IMAGE_4_LABEL'); ?>
								</label>
								<span>
									<?php
										echo $this->item->image_4 != '' ? '<embed height="50" width="100" src="'.$this->item->image_4.'"/>' : $empty;
									?>
								</span>
							</div>	
							<?php endif; ?>
								
							<?php if ($params->get('show_car_image_3')) : ?>
							<div class="formelm">
								<label>
									<?php echo JText::_('COM_GEOCARS_CARS_FIELD_IMAGE_3_LABEL'); ?>
								</label>
								<span>
									<?php
										echo $this->item->image_3 != '' ? '<embed height="50" width="100" src="'.$this->item->image_3.'"/>' : $empty;
									?>
								</span>
							</div>	
							<?php endif; ?>
								
							<?php if ($params->get('show_car_image_2')) : ?>
							<div class="formelm">
								<label>
									<?php echo JText::_('COM_GEOCARS_CARS_FIELD_IMAGE_2_LABEL'); ?>
								</label>
								<span>
									<?php
										echo $this->item->image_2 != '' ? '<embed height="50" width="100" src="'.$this->item->image_2.'"/>' : $empty;
									?>
								</span>
							</div>	
							<?php endif; ?>
								
							<?php if ($params->get('show_car_image_1')) : ?>
							<div class="formelm">
								<label>
									<?php echo JText::_('COM_GEOCARS_CARS_FIELD_IMAGE_1_LABEL'); ?>
								</label>
								<span>
									<?php
										echo $this->item->image_1 != '' ? '<embed height="50" width="100" src="'.$this->item->image_1.'"/>' : $empty;
									?>
								</span>
							</div>	
							<?php endif; ?>
								
						</div>
			<?php if ($display_fieldset) : ?>				
					</fieldset>	
			<?php endif;?>	
			<?php $dummy = false;
					$display_fieldset = (
								($params->get('show_car_category')) OR 
								($params->get('show_car_parent_category') AND $this->item->parent_slug != '1:root') OR
								($params->get('show_car_admin') AND $this->item->params->get('access-change')) OR							
								$dummy
								); ?>
			<?php if ($display_fieldset) : ?>				
					<fieldset>
						<legend><?php echo JText::_('COM_GEOCARS_FIELDSET_PUBLISHING_LABEL'); ?></legend>
			<?php endif; ?>
	
			<?php if ($params->get('show_car_parent_category') AND $this->item->parent_slug != '1:root') : ?>
				<?php $title = $this->escape($this->item->parent_title);
					  $url = '<a href="'.JRoute::_(GeocarsHelperRoute::getCategoryRoute($this->item->parent_slug, $params->get('keep_car_itemid'))).'">'.$title.'</a>';
				?>				
				<div class="formelm">
					<label>
						<?php echo JText::_('COM_GEOCARS_FIELD_PARENT_CATEGORY_LABEL'); ?>
					</label>
					<span>
						<?php if ($params->get('link_car_parent_category') AND $this->item->parent_slug) : ?>
							<?php echo $url; ?>
							<?php else : ?>
							<?php echo $title; ?>
						<?php endif; ?>
					</span>
				</div>
			<?php endif;?>	
			<?php if ($params->get('show_car_category')) : ?>
				<?php $title = $this->escape($this->item->category_title);
				
					$url = '<a href="'.JRoute::_(GeocarsHelperRoute::getCategoryRoute($this->item->catslug, $params->get('keep_car_itemid'))).'">'.$title.'</a>';
				?>
				<div class="formelm">				
					<label>
						<?php echo JText::_('COM_GEOCARS_FIELD_CATEGORY_LABEL'); ?>
					</label>
					<span>
						<?php if ($params->get('link_car_category') AND $this->item->catslug) : ?>
							<?php echo $url; ?>
						<?php else : ?>
							<?php echo $title; ?>
						<?php endif; ?>	
					</span>
				</div>								
			<?php endif; ?>						
				<?php if ($params->get('show_car_admin')) : ?>
				
					<div class="formelm">
						<label>
						<?php echo JText::_('COM_GEOCARS_FIELD_STATUS_LABEL'); ?>
						</label>
						<span>
							<?php 
								switch ($this->item->state) :
									case '1':
										echo JText::_('JPUBLISHED');
										break;
									case '0':
										echo JText::_('JUNPUBLISHED');
										break;
									case '2':
										echo JText::_('JARCHIVED');
										break;
									case '-2':
										echo JText::_('JTRASH');
										break;
								endswitch;
							?>
						</span>	
					</div>
					<div class="formelm">
						<label>
							<?php echo JText::_('JFIELD_ORDERING_LABEL'); ?>
						</label>
						<span>
							<?php echo $this->item->ordering; ?>
						</span>
					</div>	
				<?php endif; ?>
				
			
			<?php if ($display_fieldset) : ?>				
					</fieldset>	
			<?php endif;?>	
				</form>
		<?php
			if (!empty($this->item->pagination) AND $this->item->pagination AND $this->item->paginationposition AND $this->item->paginationrelative) :
				 echo $this->item->pagination;
			endif;
		?>							
		<?php echo $this->item->event->afterDisplayCar; ?>
	</div>		
</div>