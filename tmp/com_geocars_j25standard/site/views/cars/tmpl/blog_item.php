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
 * @CAversion		Id: blog_item.php 418 2014-10-22 14:42:36Z BrianWade $
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

// Create a shortcut for params.
$params = &$this->item->params;
$user		= JFactory::getUser();
$layout		= $params->get('car_layout', 'default');

// Get from global settings the text to use for an empty field
$component = JComponentHelper::getComponent( 'com_geocars' );
$empty = $component->params->get('default_empty_field', '');
?>

<?php if ($this->item->state == 0) : ?>
<div class="system-unpublished">
<?php endif; ?>

<?php if (($params->get('show_car_print_icon') 
	OR $params->get('show_car_email_icon') 
		)
	) : ?>
	<ul class="actions">
		<?php if ($params->get('show_car_print_icon')) : ?>
		<li class="print-icon">
			<?php echo JHtml::_('caricon.print_popup', $this->item, $params); ?>
		</li>
		<?php endif; ?>
		<?php if ($params->get('show_car_email_icon')) : ?>
		<li class="email-icon">
			<?php echo JHtml::_('caricon.email', $this->item, $params); ?>
		</li>
		<?php endif; ?>

			<li class="edit-icon">
				<?php echo JHtml::_('caricon.edit', $this->item, $params); ?>
			</li>
			<li class="delete-icon">
				<?php echo JHtml::_('caricon.delete',$this->item, $params); ?>
			</li>		
	</ul>
<?php endif; ?>
<?php if ($params->get('show_car_name')) : ?>
<h2>
		<?php if ($params->get('link_car_names') ) : ?>
			<a href="<?php echo JRoute::_(GeocarsHelperRoute::getCarRoute($this->item->slug, 
											$this->item->catid, 
											$this->item->language,
											$layout,									
											$params->get('keep_car_itemid'))); ?>">
			<?php echo $this->escape($this->item->name); ?></a>
		<?php else : ?>
			<?php echo $this->escape($this->item->name); ?>
		<?php endif; ?>
</h2>
<?php endif; ?>

<?php  echo $this->item->event->afterDisplayCarName;
?>
<?php echo $this->item->event->beforeDisplayCar; ?>
<?php // to do not that elegant would be nice to group the params ?>

<?php 
	$dummy = false;
	if (
		($params->get('show_car_category')) OR 
		($params->get('show_car_parent_category') AND $this->item->parent_slug != '1:root') OR 
		($params->get('show_car_hits')) OR
		$dummy
		) : ?>
	<dl class="car-info">
 <dt class="car-info-term"><?php  echo JText::_('COM_GEOCARS_CARS_INFO'); ?></dt>
<?php endif; ?>
<?php if ($params->get('show_car_parent_category') AND $this->item->parent_slug != '1:root') : ?>
		<dd class="parent-category-name">
			<?php $title = $this->escape($this->item->parent_title);
			$url = '<a href="' . JRoute::_(GeocarsHelperRoute::getCategoryRoute($this->item->parent_slug, $params->get('keep_car_itemid'))) . '">' . $title . '</a>'; ?>
			<?php if ($params->get('link_car_parent_category') AND $this->item->parent_slug) : ?>
				<?php echo JText::sprintf('COM_GEOCARS_PARENT_CATEGORY', $url); ?>
				<?php else : ?>
				<?php echo JText::sprintf('COM_GEOCARS_PARENT_CATEGORY', $title); ?>
			<?php endif; ?>
		</dd>
<?php endif; ?>
<?php if ($params->get('show_car_category')) : ?>
		<dd class="category-name">
			<?php $title = $this->escape($this->item->category_title);
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
<?php
	$dummy = false;
	if (
		($params->get('show_car_category')) OR 
		($params->get('show_car_parent_category')) OR 
		($params->get('show_car_hits')) OR
		$dummy) : ?>
 </dl>
<?php endif; ?>

<?php if (!$params->get('show_car_readmore') 
		):?>
	<?php echo $this->item->description; ?>

	<?php //Optional link to let them register to see the whole car. ?>
	<?php if ($params->get('show_car_readmore')) :
				$link = JRoute::_(GeocarsHelperRoute::getCarRoute($this->item->slug, 
																							$this->item->catid, 
																							$this->item->language,
																							$layout,									
																							$params->get('keep_car_itemid')));
			endif;?>
			<p class="readmore">
				<a href="<?php echo $link; ?>">
				<?php
				$item_params = new JRegistry;				
				$item_params->loadString($this->item->params);
				if ($item_params->get('car_alternative_readmore') == null) :
						if ($params->get('access-view')) :
							if ($params->get('show_car_readmore_name') == 0) :
								echo JText::sprintf('COM_GEOCARS_READ_MORE');
							else :
								echo JText::_('COM_GEOCARS_READMORE_NAME');
							echo JHtml::_('string.truncate', ($this->item->name), $params->get('car_readmore_limit'));
						endif; 
					else :
						if ($params->get('show_car_readmore_name') == 0) :
							echo JText::_('COM_GEOCARS_REGISTER_TO_READ_MORE');
						else :	
							echo JText::_('COM_GEOCARS_REGISTER_TO_READMORE_NAME');
							echo JHtml::_('string.truncate', ($this->item->name), $params->get('car_readmore_limit'));
						endif;
					
					endif;
				else :
					echo $this->item->car_alternative_readmore;
					if ($params->get('show_car_readmore_name') == 1) :
						echo JHtml::_('string.truncate', ': '.($this->item->name), $params->get('car_readmore_limit'));
					endif;	
				endif;?>
			</a>
		</p>
	<?php endif; ?>

<?php if ($this->item->state == 0) : ?>
</div>
<?php endif; ?>

<div class="item-separator"></div>
<?php echo $this->item->event->afterDisplayCar; ?>
