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
 * @CAsubpackage	architectcomp.admin
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
$component = JComponentHelper::getComponent( 'com_geocars' );
$params = new JParameter( $component->params );

?>
<noscript>
<p style="color: red;"><?php echo JText::_('COM_GEOCARS_WARNING_NOSCRIPT'); ?><p>
</noscript>
<form action="<?php echo JRoute::_('index.php?option=com_geocars&view=car&layout=edit&id='.(int) $this->item->id); ?>" method="post" name="adminForm" id="car-form" class="form-validate">
	<div class="width-60 fltlft">
		<fieldset class="adminform">
			<legend><?php echo JText::_('COM_GEOCARS_FIELDSET_DETAILS_LABEL'); ?></legend>
			<ul class="adminformlist">
				<li><?php echo $this->form->getLabel('name'); ?>
				<?php echo $this->form->getInput('name'); ?></li>
				<li><?php echo $this->form->getLabel('alias'); ?>
				<?php echo $this->form->getInput('alias'); ?></li>

				<li><?php echo $this->form->getLabel('catid'); ?>
				<?php echo $this->form->getInput('catid'); ?></li>				
				<li><?php echo $this->form->getLabel('state'); ?>
				<?php echo $this->form->getInput('state'); ?></li>
				<li><?php echo $this->form->getLabel('ordering'); ?>
				<?php echo $this->form->getInput('ordering'); ?></li>
				<li><?php echo $this->form->getLabel('language'); ?>
				<?php echo $this->form->getInput('language'); ?></li>
				<li>
					<?php echo $this->form->getLabel('image_5'); ?>
					<?php echo $this->form->getInput('image_5'); ?>
				</li>
				<li>
					<?php echo $this->form->getLabel('image_4'); ?>
					<?php echo $this->form->getInput('image_4'); ?>
				</li>
				<li>
					<?php echo $this->form->getLabel('image_3'); ?>
					<?php echo $this->form->getInput('image_3'); ?>
				</li>
				<li>
					<?php echo $this->form->getLabel('image_2'); ?>
					<?php echo $this->form->getInput('image_2'); ?>
				</li>
				<li>
					<?php echo $this->form->getLabel('image_1'); ?>
					<?php echo $this->form->getInput('image_1'); ?>
				</li>
				
				<li><?php echo $this->form->getLabel('id'); ?>
				<?php echo $this->form->getInput('id'); ?></li>
				
				<li>
					<?php echo $this->form->getLabel('description'); ?>
					<div class="clr"></div>
					<?php echo $this->form->getInput('description'); ?>
				</li>

			</ul>
			<div class="clr"> </div>

		</fieldset>
	</div>

	<div class="width-40 fltrt">
		<?php echo JHtml::_('sliders.start','car_sliders_'.$this->item->id, array('useCookie'=>1)); ?>
		<!--- ??? For the moment alwaysshow the published fieldset but it may be empty if no publish fields set for inclusion ??? -->
		<!--- ??? When mark-up improved make this conditional ??? -->
		<?php echo JHtml::_('sliders.panel',JText::_('COM_GEOCARS_FIELDSET_PUBLISHING_DETAILS_LABEL'), 'publishing'); ?>
			<fieldset class="panelform">
				<ul class="adminformlist">
					<?php foreach($this->form->getFieldset('publishing') as $field): ?>
						<li>
							<?php if (!$field->hidden): ?>
								<?php echo $field->label; ?>
							<?php endif; ?>
							<?php echo $field->input; ?>
						</li>
					<?php endforeach; ?>
				</ul>

			</fieldset>
							
       
        
		<?php echo JHtml::_('sliders.end'); ?>
	</div>
	<div class="clr"></div>
	<div>	
		<input type="hidden" name="task" value="" />
		<?php echo JHtml::_('form.token'); ?>
	</div>

</form>
