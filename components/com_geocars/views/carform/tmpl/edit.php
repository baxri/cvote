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
 * @CAversion		Id: edit.php 418 2014-10-22 14:42:36Z BrianWade $
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

// Create shortcut to parameters.
$params = $this->state->get('params');
?>
<noscript>
<p style="color: red;"><?php echo JText::_('COM_GEOCARS_WARNING_NOSCRIPT'); ?><p>
</noscript>
<div class="geocars car-edit<?php echo $this->escape($params->get('pageclass_sfx')); ?>">
	<?php if ($params->get('show_page_heading')) : ?>
	<h1>
		<?php echo $this->escape($params->get('page_heading')); ?>
	</h1>
	<?php endif; ?>
	<?php if ($params->get('show_car_name')) : ?>
		<div style="float: left;">
		<h2>
			<?php  
				if (!is_null($this->item->id)) :
					echo JText::sprintf('COM_GEOCARS_EDIT_ITEM', $this->escape($this->item->name)); 
				else :
					echo JText::_('COM_GEOCARS_CARS_CREATE_ITEM');
				endif;
			?>
		</h2>
		</div>
		<div style="clear:both;"></div>
	<?php endif; ?>
	<form action="<?php echo JRoute::_('index.php?option=com_geocars&view=carform&layout=edit&id='.(int) $this->item->id); ?>" method="post" name="adminForm" id="adminForm" class="form-validate">
		<div class="formelm-buttons" style="float: right;width: 40%;">
			<div class="formelm-buttons">
				<button type="button" onclick="Joomla.submitbutton('car.save')">
					<?php echo JText::_('JSAVE') ?>
				</button>
				<button type="button" onclick="Joomla.submitbutton('car.cancel')">
					<?php echo JText::_('JCANCEL') ?>
				</button>
			</div>
		</div>
		<div style="clear:both;padding-top: 10px;"></div>
		<fieldset>
			<div>
				<div class="formelm">
					<?php echo $this->form->getLabel('name'); ?>
					<?php echo $this->form->getInput('name'); ?>
				</div>
				<?php if (is_null($this->item->id)):?>
					<div class="formelm">
						<?php echo $this->form->getLabel('alias'); ?>
						<?php echo $this->form->getInput('alias'); ?>
					</div>
				<?php endif; ?>
				
				<div class="formelm">
				<?php echo $this->form->getLabel('catid'); ?>
				<span class="category">
					<?php   echo $this->form->getInput('catid'); ?>
				</span>
				</div>		
			</div>
			<div style="padding-top: 10px;">
				<?php echo $this->form->getLabel('description'); ?>
				<?php echo $this->form->getInput('description'); ?>
			</div>

		</fieldset>
	
		<fieldset>
			<legend><?php echo JText::_('COM_GEOCARS_CARS_FIELDSET_BASIC_DETAILS_LABEL'); ?></legend>

			<div class="formelm">
				<?php echo $this->form->getLabel('image_5'); ?>
				<?php echo $this->form->getInput('image_5'); ?>
			</div>		
			<div class="formelm">
				<?php echo $this->form->getLabel('image_4'); ?>
				<?php echo $this->form->getInput('image_4'); ?>
			</div>		
			<div class="formelm">
				<?php echo $this->form->getLabel('image_3'); ?>
				<?php echo $this->form->getInput('image_3'); ?>
			</div>		
			<div class="formelm">
				<?php echo $this->form->getLabel('image_2'); ?>
				<?php echo $this->form->getInput('image_2'); ?>
			</div>		
			<div class="formelm">
				<?php echo $this->form->getLabel('image_1'); ?>
				<?php echo $this->form->getInput('image_1'); ?>
			</div>		
		</fieldset>	
		<fieldset>
			<legend><?php echo JText::_('COM_GEOCARS_FIELDSET_PUBLISHING_LABEL'); ?></legend>						
				<div class="formelm">
				<?php echo $this->form->getLabel('language'); ?>
				<?php echo $this->form->getInput('language'); ?>
				</div>
			<div class="formelm">
				<?php echo $this->form->getLabel('state'); ?>
				<?php echo $this->form->getInput('state'); ?>
			</div>
			<?php if (!is_null($this->item->id)):?>
				<div class="formelm">
					<label>
						<?php echo JText::_('JFIELD_ORDERING_LABEL'); ?>
					</label>
					<span>
						<?php echo $this->item->ordering; ?>
					</span>
				</div>	
			<?php endif; ?>
		</fieldset>			
		<input type="hidden" name="task" value="" />
		<input type="hidden" name="return" value="<?php echo $this->return_page;?>" />
		<?php if($this->params->get('enable_category', 0) == 1) :?>
			<input type="hidden" name="jform[catid]" value="<?php echo $this->params->get('catid', 1);?>"/>
		<?php endif;?>
		<?php echo JHtml::_( 'form.token' ); ?>
		<?php if (is_null($this->item->id)):?>
			<div class="form-note">
			<p><?php echo JText::_('COM_GEOCARS_CARS_ORDERING'); ?></p>
			</div>
		<?php endif; ?>
	</form>
</div>