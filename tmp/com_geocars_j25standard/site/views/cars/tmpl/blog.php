
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
 * @CAversion		Id: blog.php 418 2014-10-22 14:42:36Z BrianWade $
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

// If the page class is defined, add to class as suffix.
// It will be a separate class if the user starts it with a space
?>
<noscript>
<p style="color: red;"><?php echo JText::_('COM_GEOCARS_WARNING_NOSCRIPT'); ?><p>
</noscript>
<div class="geocars cars-blog<?php echo $this->params->get('pageclass_sfx');?>">
	<?php if ($this->params->get('show_page_heading')): ?>
		<h1>
		<?php echo $this->escape($this->params->get('page_heading')); ?>
		</h1>
	<?php endif; ?>
	<?php if (empty($this->lead_items) AND empty($this->intro_items) AND empty($this->link_items)) : ?>
		<?php if ($this->params->get('show_no_cars',1)) : ?>
		<p><?php echo JText::_('COM_GEOCARS_CARS_NO_ITEMS'); ?></p>
		<?php endif; ?>
	<?php else : ?>
		<?php $leading_count=0 ; ?>
		<?php if (!empty($this->lead_items)) : ?>
			<div class="items-leading">
			<?php foreach ($this->lead_items as &$item) : ?>
				<div class="leading-<?php echo $leading_count; ?><?php echo $item->state == 0 ? ' system-unpublished' : null; ?>">
				<?php
					$this->item = &$item;
					echo $this->loadTemplate('item');
					?>
				</div>
				<?php
				$leading_count++;
				?>
			<?php endforeach; ?>
		</div>
		<?php endif; ?>
		<?php
		$intro_count=(count($this->intro_items));
		$counter=0;
		?>
		<?php if (!empty($this->intro_items)) : ?>
			<?php foreach ($this->intro_items as $key => &$item) : ?>

			<?php
			$key= ($key-$leading_count)+1;
			$row_count=( ((int)$key-1) %	(int) $this->columns) +1;
			$row = $counter / $this->columns ;

			if ($row_count==1) : ?>

					<div class="items-row cols-<?php echo (int) $this->columns;?> <?php echo 'row-'.$row ; ?>">
				<?php endif; ?>
				<div class="item column-<?php echo $row_count;?><?php echo $item->state == 0 ? ' system-unpublished"' : null; ?>">
				<?php
					$this->item = &$item;
					echo $this->loadTemplate('item');
					?>
				</div>
				<?php $counter++; ?>
					<?php if (($row_count == $this->columns) or ($counter ==$intro_count)): ?>
			<span class="row-separator"></span>
			</div>

					<?php endif; ?>
			<?php endforeach; ?>
		<?php endif; ?>

		<?php if (!empty($this->link_items)) : ?>
			<div class="items-more">
			<?php echo $this->loadTemplate('links'); ?>
		</div>
		<?php endif; ?>
		<?php if ($this->params->def('show_car_pagination', 2) == 1  OR ($this->params->get('show_car_pagination') == 2 AND $this->pagination->get('pages.total') > 1)) : ?>
		<div class="pagination">

				<?php if ($this->params->def('show_car_pagination_results', 1)) : ?>
					<p class="counter">
						<?php echo $this->pagination->getPagesCounter(); ?>
					</p>
				<?php  endif; ?>
						<?php echo $this->pagination->getPagesLinks(); ?>
			</div>
		<?php endif; ?>
	<?php endif; ?>
</div>

