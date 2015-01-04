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
 * @CAversion		Id: default_items.php 418 2014-10-22 14:42:36Z BrianWade $
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

// Create some shortcuts.
$params		= &$this->params;
$user		= JFactory::getUser();

$n			= count($this->cars);
$list_order	= $this->state->get('list.ordering');
$list_dirn	= $this->state->get('list.direction');
$layout		= str_replace('_:','',$params->get('car_layout'));
// Get from global settings the text to use for an empty field
$component = JComponentHelper::getComponent( 'com_geocars' );
$empty = $component->params->get('default_empty_field', '');	
?>

<?php if (empty($this->cars)) : ?>

	<?php if ($this->params->get('show_no_cars',1)) : ?>
	<p><?php echo JText::_('COM_GEOCARS_CARS_CATEGORY_NO_ITEMS'); ?></p>
	<?php endif; ?>

<?php else : ?>

<form action="<?php echo JFilterOutput::ampReplace(JFactory::getURI()->toString()); ?>" method="post" name="adminForm" id="adminForm">
	<?php if (($this->params->get('car_filter_field') != '' AND $this->params->get('car_filter_field') != 'hide') OR $this->params->get('show_car_pagination_limit')) :?>
		<fieldset class="filters">
			<div class="filter-search">
				<?php if ($this->params->get('car_filter_field') != '' AND $this->params->get('car_filter_field') != 'hide') :?>
					<label class="filter-search-lbl" for="filter-search"><?php echo JText::_('COM_GEOCARS_'.$this->params->get('car_filter_field').'_FILTER_LABEL').'&#160;'; ?></label>
					<input type="text" name="filter-search" id="filter-search" value="<?php echo $this->escape($this->state->get('list.filter')); ?>" class="inputbox" onchange="document.adminForm.submit();" title="<?php echo JText::_('COM_GEOCARS_FILTER_SEARCH_DESC'); ?>" />
				<?php endif; ?>						
			</div>
			<?php if ($this->params->get('show_car_pagination_limit')) : ?>
				<div class="display-limit">
					<?php echo JText::_('JGLOBAL_DISPLAY_NUM'); ?>&#160;
					<?php echo $this->pagination->getLimitBox(); ?>
				</div>
			<?php endif; ?>			
		</fieldset>	
	<?php endif; ?>


	<table class="cars">
		<?php if ($this->params->get('show_car_headings')) :?>
			<thead>
				<tr>
					<th class="list-name" id="tableOrderingname">
						<?php  echo JHTML::_('grid.sort', 'COM_GEOCARS_HEADING_NAME', 'a.name', $list_dirn, $list_order) ; ?>
					</th>
					<?php if ($date = $this->params->get('list_show_car_date')) : ?>
						<th class="list-date" id="tableOrderingdate">
							<?php echo JHTML::_('grid.sort', 'COM_GEOCARS_FIELD_'.JString::strtoupper($date).'_LABEL', 'a.'.$date, $list_dirn, $list_order); ?>
						</th>
					<?php endif; ?>

					<?php if ($this->params->get('list_show_car_hits',0)) : ?>
						<th class="list-hits" id="tableOrderinghits">
							<?php echo JHTML::_('grid.sort', 'COM_GEOCARS_HEADING_HITS', 'a.hits', $list_dirn, $list_order); ?>
						</th>
					<?php endif; ?>
						<th width="8%" class="list-actions">
						</th> 					
				</tr>
			</thead>
		<?php endif; ?>

		<tbody>

		<?php foreach ($this->cars as $i => $item) : ?>

			<?php if ($item->state == 0) : ?>
				<tr class="system-unpublished cat-list-row<?php echo $i % 2; ?>">
			<?php else: ?>
				<tr class="cat-list-row<?php echo $i % 2; ?>" >
			<?php endif; ?>
					<td class="list-name">
						<a href="<?php echo JRoute::_(GeocarsHelperRoute::getCarRoute($item->slug, 
																								$item->catid, 
																								$item->language,
																								$layout,									
																								$this->params->get('keep_car_itemid'))); ?>">
					
						<?php echo $this->escape($item->name); ?></a>
					</td>

					<?php if ($this->params->get('list_show_car_date')) : ?>
					<td class="list-date">
						<?php echo JHTML::_('date',$item->display_date, $this->escape(
						$this->params->get('car_date_format', JText::_('DATE_FORMAT_LC3')))); ?>
					</td>
					<?php endif; ?>

					<?php if ($this->params->get('list_show_car_hits',0)) : ?>
					<td class="list-hits">
						<?php echo $item->hits; ?>
					</td>
					<?php endif; ?>

					<td class="list-actions">
							<ul class="actions">
									<li class="edit-icon">
										<?php echo JHtml::_('caricon.edit',$item, $params); ?>
									</li>
									<li class="delete-icon">
										<?php echo JHtml::_('caricon.delete',$item, $params); ?>
									</li>
							</ul>
					</td>	
			</tr>
		<?php endforeach; ?>
		</tbody>
	</table>

	<?php if (($this->params->def('show_car_pagination', 2) == 1  OR 
			   ($this->params->get('show_car_pagination') == 2)) AND ($this->pagination->get('pages.total') > 1)) : ?>
		<div class="pagination">

			<?php if ($this->params->def('show_car_pagination_results', 0)) : ?>
				<p class="counter">
					<?php echo $this->pagination->getPagesCounter(); ?>
				</p>
			<?php endif; ?>

			<?php echo $this->pagination->getPagesLinks(); ?>
		</div>
	<?php endif; ?>

	<div>
		<!-- @TODO add hidden inputs -->
		<input type="hidden" name="task" value="" />
		<input type="hidden" name="filter_order" value="" />
		<input type="hidden" name="filter_order_Dir" value="" />
		<input type="hidden" name="limitstart" value="" />
	</div>
</form>
<?php endif; ?>
<?php // Code to add a link to submit an car. ?>
<?php if ($this->params->get('show_car_add_link',1)) : ?>
		<?php echo JHtml::_('caricon.create', $params); ?>
<?php  endif; ?>
