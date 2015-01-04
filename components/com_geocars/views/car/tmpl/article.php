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
 * @CAversion		Id: article.php 418 2014-10-22 14:42:36Z BrianWade $
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
<div class="geocars car-article<?php echo $params->get('pageclass_sfx')?>">
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

	<?php if ($params->get('show_car_name')
				): ?>
		<h2>
			<?php if ($params->get('link_car_names') AND !empty($this->item->readmore_link)) : ?>
				<a href="<?php echo $this->item->readmore_link; ?>">
				<?php echo $this->escape($this->item->name); ?></a>
			<?php else : ?>
				<?php echo $this->escape($this->item->name); ?>
			<?php endif; ?>
		</h2>
	<?php endif; ?>
	<?php  echo $this->item->event->afterDisplayCarName;
	?>

	<?php echo $this->item->event->beforeDisplayCar; ?>
		<?php $dummy = false;
				$use_def_list = (
							($params->get('show_car_category')) OR 
							($params->get('show_car_parent_category') AND $this->item->parent_slug != '1:root') OR
							($params->get('show_car_hits')) OR
							$dummy
							); ?>

		<?php if ($use_def_list) : ?>
		<dl class="info">
			<dt class="info-title"><?php  echo JText::_('COM_GEOCARS_CARS_INFO'); ?></dt>
		<?php endif; ?>
		<?php if ($params->get('show_car_parent_category') AND $this->item->parent_slug != '1:root') : ?>
				<dd class="parent-category-name">
					<?php	$title = $this->escape($this->item->parent_title);
					$url = '<a href="'.JRoute::_(GeocarsHelperRoute::getCategoryRoute($this->item->parent_slug, $params->get('keep_car_itemid'))).'">'.$title.'</a>';?>
					<?php if ($params->get('link_car_parent_category') AND $this->item->parent_slug) : ?>
						<?php echo JText::sprintf('COM_GEOCARS_PARENT_CATEGORY', $url); ?>
						<?php else : ?>
						<?php echo JText::sprintf('COM_GEOCARS_PARENT_CATEGORY', $title); ?>
					<?php endif; ?>
				</dd>
		<?php endif; ?>

		<?php if ($params->get('show_car_category')) : ?>
				<dd class="category-name">
					<?php 	$title = $this->escape($this->item->category_title);
					$url = '<a href="'.JRoute::_(GeocarsHelperRoute::getCategoryRoute($this->item->catslug, $params->get('keep_car_itemid'))).'">'.$title.'</a>';?>
					<?php if ($params->get('link_car_category') AND $this->item->catslug) : ?>
						<?php echo JText::sprintf('COM_GEOCARS_CATEGORY', $url); ?>
						<?php else : ?>
						<?php echo JText::sprintf('COM_GEOCARS_CATEGORY', $title); ?>
					<?php endif; ?>
				</dd>
		<?php endif; ?>
		<?php if ($params->get('show_car_hits')) : ?>
				<dd class="hits">
				<?php echo JText::sprintf('COM_GEOCARS_HITS', $this->item->hits); ?>
				</dd>
		<?php endif; ?>
		<?php if ($use_def_list) : ?>
		 </dl>
		<?php endif; ?>
		<?php
			if (isset ($this->item->toc)) :
				echo $this->item->toc;
			endif;
		?>	
		<?php
			if (!empty($this->item->pagination) AND $this->item->pagination AND !$this->item->paginationposition AND !$this->item->paginationrelative):
				echo $this->item->pagination;
			 endif;
		?>	
		<?php echo $this->item->description; ?>
		<?php
			if (!empty($this->item->pagination) AND $this->item->pagination AND $this->item->paginationposition AND!$this->item->paginationrelative):
				echo $this->item->pagination;
			endif;
		?>		
		<?php
			$dummy = false;
			$use_fields_list = (
						($params->get('show_car_image_5')) OR 
						($params->get('show_car_image_4')) OR 
						($params->get('show_car_image_3')) OR 
						($params->get('show_car_image_2')) OR 
						($params->get('show_car_image_1')) OR 
						$dummy
						);
		?>
		<?php if ($use_fields_list) : ?>		
		<dl class="info">
			<dt class="info-title"><?php  echo JText::_('COM_GEOCARS_CARS_INFO'); ?></dt>
		<?php endif; ?>		
		
			<?php if ($params->get('show_car_image_5')) : ?>
				<dd class="field">
					<strong><?php echo JText::_('COM_GEOCARS_CARS_FIELD_IMAGE_5_LABEL'); ?></strong>
					<?php
						echo $this->item->image_5 != '' ? '<embed height="50" width="100" src="'.$this->item->image_5.'"/>' : $empty;
					?>
				</dd>
			<?php endif; ?>
			<?php if ($params->get('show_car_image_4')) : ?>
				<dd class="field">
					<strong><?php echo JText::_('COM_GEOCARS_CARS_FIELD_IMAGE_4_LABEL'); ?></strong>
					<?php
						echo $this->item->image_4 != '' ? '<embed height="50" width="100" src="'.$this->item->image_4.'"/>' : $empty;
					?>
				</dd>
			<?php endif; ?>
			<?php if ($params->get('show_car_image_3')) : ?>
				<dd class="field">
					<strong><?php echo JText::_('COM_GEOCARS_CARS_FIELD_IMAGE_3_LABEL'); ?></strong>
					<?php
						echo $this->item->image_3 != '' ? '<embed height="50" width="100" src="'.$this->item->image_3.'"/>' : $empty;
					?>
				</dd>
			<?php endif; ?>
			<?php if ($params->get('show_car_image_2')) : ?>
				<dd class="field">
					<strong><?php echo JText::_('COM_GEOCARS_CARS_FIELD_IMAGE_2_LABEL'); ?></strong>
					<?php
						echo $this->item->image_2 != '' ? '<embed height="50" width="100" src="'.$this->item->image_2.'"/>' : $empty;
					?>
				</dd>
			<?php endif; ?>
			<?php if ($params->get('show_car_image_1')) : ?>
				<dd class="field">
					<strong><?php echo JText::_('COM_GEOCARS_CARS_FIELD_IMAGE_1_LABEL'); ?></strong>
					<?php
						echo $this->item->image_1 != '' ? '<embed height="50" width="100" src="'.$this->item->image_1.'"/>' : $empty;
					?>
				</dd>
			<?php endif; ?>
		<?php if ($use_fields_list) : ?>		
		</dl>	
		<?php endif; ?>
	<?php
		if (!empty($this->item->pagination) AND $this->item->pagination AND $this->item->paginationposition AND $this->item->paginationrelative) :
			 echo $this->item->pagination;
		endif;
	?>	
	<?php echo $this->item->event->afterDisplayCar; ?>
</div>