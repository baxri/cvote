<?php
/**
 * @version 		$Id: edit.php 411 2014-10-19 18:39:07Z BrianWade $
 * @name			Component Architect (Release 1.1.3)
 * @author			Component Architect (www.componentarchitect.com)
 * @package			com_componentarchitect
 * @subpackage		com_componentarchitect.admin
 * @copyright		Copyright (c)2013 - 2014 Simply Open Source Ltd. (trading as Component Architect). All Rights Reserved
 * @license			GNU General Public License version 3 or later; See http://www.gnu.org/copyleft/gpl.html 
 * 
 * The following Component Architect header section must remain in any distribution of this file
 *
 * @CAversion		Id: edit.php 34 2014-03-12 12:11:19Z BrianWade $
 * @CAauthor		Component Architect (www.componentarchitect.com)
 * @CApackage		architectcomp
 * @CAsubpackage	architectcomp.admin
 * @CAtemplate		joomla_3_x_enhanced (Release 1.0.0)
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
$max_file_size = (string) ComponentArchitectHelper::convert_max_file_size($params->get('default_max_upload_size', '2mb'));

$app = JFactory::getApplication();
$input = $app->input;

?>
<noscript>
<p style="color: red;"><?php echo JText::_('COM_COMPONENTARCHITECT_WARNING_NOSCRIPT'); ?><p>
</noscript>
<?php if (version_compare(JVERSION, '3.0', 'lt')) : ?>
<div id="nojquerywarning">
	<p style="color: red;"><?php echo JText::_('COM_COMPONENTARCHITECT_WARNING_NOJQUERY'); ?><p>
</div>
<script type="text/javascript">
	if(jQuery)
	{
		jQuery('#nojquerywarning').css('display','none');
	}
</script>
<?php endif; ?>
<form action="<?php echo JRoute::_('index.php?option=com_componentarchitect&view=component&layout=edit&id='.(int) $this->item->id); ?>" enctype="multipart/form-data" method="post" name="adminForm" id="adminForm" class="form-validate">
	<input type="hidden" name="MAX_FILE_SIZE" value="<?php echo $max_file_size; ?>" />
	<?php if (version_compare(JVERSION, '3.0', 'ge')) : ?>
		<div class="form-inline form-inline-header">	
	<?php else: ?>
		<fieldset class="adminform">
	<?php endif; ?>		
			<div class="control-group" id="field_name">
				<div class="control-label">
					<?php echo $this->form->getLabel('name'); ?>
				</div>
				<div class="controls">
					<?php echo $this->form->getInput('name'); ?>
				</div>
			</div>
	<?php if (version_compare(JVERSION, '3.0', 'ge')) : ?>
		</div>
	<?php else: ?>
		</fieldset>
	<?php endif; ?>

	<?php if (version_compare(JVERSION, '3.0', 'ge')) : ?>
		<div class="form-horizontal">
	<?php else: ?>
		<fieldset class="adminform">
	<?php endif; ?>
		<?php if (version_compare(JVERSION, '3.0', 'ge')) : ?>
			<?php echo JHtml::_('bootstrap.startTabSet', 'component-tabs', array('active' => 'component-details')); ?>
			<?php echo JHtml::_('bootstrap.addTab', 'component-tabs', 'component-details', JText::_('COM_COMPONENTARCHITECT_COMPONENTS_FIELDSET_DETAILS_LABEL', true)); ?>
		<?php else: ?>
			<?php echo JHtml::_('tabs.start','component-tabs', array('useCookie'=>1)); ?>
			<?php echo JHtml::_('tabs.panel',JText::_('COM_COMPONENTARCHITECT_COMPONENTS_FIELDSET_DETAILS_LABEL'), 'component-details');?>
			<fieldset class="panelform">
		<?php endif; ?>		
			<div class="row-fluid">
				<div class="span9">
					<fieldset class="adminform">
						<?php echo $this->form->getInput('description'); ?>
					</fieldset>
				</div>
				<div class="span3">
					<fieldset class="form-vertical">
						<div class="control-group" id="field_code_name">
							<div class="control-label">
								<?php echo $this->form->getLabel('code_name'); ?>
							</div>
							<div class="controls">
								<?php echo $this->form->getInput('code_name'); ?>
							</div>
						</div>					
						<div class="control-group" id="field_author">
							<div class="control-label">
								<?php echo $this->form->getLabel('author'); ?>
							</div>
							<div class="controls">
								<?php echo $this->form->getInput('author'); ?>
							</div>
						</div>
						<div class="control-group" id="field_start_version">
							<div class="control-label">
								<?php echo $this->form->getLabel('start_version'); ?>
							</div>
							<div class="controls">
								<?php echo $this->form->getInput('start_version'); ?>
							</div>
						</div>
						<div class="control-group" id="field_web_address">
							<div class="control-label">
								<?php echo $this->form->getLabel('web_address'); ?>
							</div>
							<div class="controls">
								<?php echo $this->form->getInput('web_address'); ?>
							</div>
						</div>
						<div class="control-group" id="field_email">
							<div class="control-label">
								<?php echo $this->form->getLabel('email'); ?>
							</div>
							<div class="controls">
								<?php echo $this->form->getInput('email'); ?>
							</div>
						</div>
						<div class="control-group" id="field_copyright">
							<div class="control-label">
								<?php echo $this->form->getLabel('copyright'); ?>
							</div>
							<div class="controls">
								<?php echo $this->form->getInput('copyright'); ?>
							</div>
						</div>
						<div class="control-group" id="field_default_object_id">
							<div class="control-label">
								<?php echo $this->form->getLabel('default_object_id'); ?>
							</div>
							<div class="controls">
								<?php echo $this->form->getInput('default_object_id'); ?>
							</div>
						</div>
						<div class="control-group" id="field_icon_16px">
							<div class="control-label">
								<?php echo $this->form->getLabel('icon_16px'); ?>
							</div>
							<div class="controls">
								<?php echo $this->form->getInput('icon_16px'); ?>
								<?php if (trim($this->item->icon_16px) != '') : ?>
									<div class="file" style="display: inline; padding-left: 10px;">
										<img src="<?php echo JUri::root().trim($this->item->icon_16px); ?>"/>
									</div>
								<?php endif; ?>									
							</div>
						</div>
						<div class="control-group" id="field_icon_48px">
							<div class="control-label">
								<?php echo $this->form->getLabel('icon_48px'); ?>
							</div>
							<div class="controls">
								<?php echo $this->form->getInput('icon_48px'); ?>
								<?php if (trim($this->item->icon_48px) != '') : ?>
									<div class="file" style="display: inline; padding-left: 10px;">
										<img src="<?php echo JUri::root().trim($this->item->icon_48px); ?>"/>
									</div>
								<?php endif; ?>									
							</div>
						</div>
						<div class="control-group" id="field_categories_icon_16px">
							<div class="control-label">
								<?php echo $this->form->getLabel('categories_icon_16px'); ?>
							</div>
							<div class="controls">
								<?php echo $this->form->getInput('categories_icon_16px'); ?>
								<?php if (trim($this->item->categories_icon_16px) != '') : ?>
									<div class="file" style="display: inline; padding-left: 10px;">
										<img src="<?php echo JUri::root().trim($this->item->categories_icon_16px); ?>"/>
									</div>
								<?php endif; ?>									
							</div>
						</div>
						<div class="control-group" id="field_categories_icon_48px">
							<div class="control-label">
								<?php echo $this->form->getLabel('categories_icon_48px'); ?>
							</div>
							<div class="controls">
								<?php echo $this->form->getInput('categories_icon_48px'); ?>
								<?php if (trim($this->item->categories_icon_48px) != '') : ?>
									<div class="file" style="display: inline; padding-left: 10px;">
										<img src="<?php echo JUri::root().trim($this->item->categories_icon_48px); ?>"/>
									</div>
								<?php endif; ?>									
							</div>
						</div>
						<div class="control-group" id="field_ordering">
							<div class="control-label">
								<?php echo $this->form->getLabel('ordering'); ?>
							</div>
							<div class="controls">
								<?php echo $this->form->getInput('ordering'); ?>
							</div>
						</div>
						<div class="control-group" id="field_id">
							<div class="control-label">
								<?php echo $this->form->getLabel('id'); ?>
							</div>
							<div class="controls">
								<?php echo $this->form->getInput('id'); ?>
							</div>
						</div>
					</fieldset>
				</div>				
			</div>
	<?php if (version_compare(JVERSION, '3.0', 'ge')) : ?>
		<?php echo JHtml::_('bootstrap.endTab'); ?>
	<?php else: ?>
		</fieldset>
	<?php endif; ?>
			<?php if (version_compare(JVERSION, '3.0', 'ge')) : ?>
				<?php echo JHtml::_('bootstrap.addTab', 'component-tabs', 'component-joomla_parts', JText::_('COM_COMPONENTARCHITECT_COMPONENTS_FIELD_JOOMLA_PARTS_LABEL', true)); ?>
			<?php else: ?>
				<?php echo JHtml::_('tabs.panel',JText::_('COM_COMPONENTARCHITECT_COMPONENTS_FIELD_JOOMLA_PARTS_LABEL'), 'component-joomla_parts');?>
				<fieldset class="panelform">
			<?php endif; ?>	
			<?php $fieldsets = $this->form->getFieldsets('joomla_parts');?>
			<?php foreach ($fieldsets as $name => $fieldset) :?>
				<?php
					if (isset($fieldset->description) AND trim($fieldset->description)) :
						echo JText::_($fieldset->description);
					endif;
				?>
				<!-- //[%%START_CUSTOM_CODE%%] -->
				<br /><br />
				<?php 
					$count = count($this->form->getFieldset($name));
					$i = 0;
				?>				
				<div style="float:left; width: 50%; min-width: 600px;">
				<!-- //[%%END_CUSTOM_CODE%%] -->
				<?php foreach ($this->form->getFieldset($name) as $field) : ?>
					<?php if (!$field->hidden) : ?>
						<?php $fieldname = (string) $field->fieldname; ?>
						<div class="control-group" id="field_<?php echo $fieldname; ?>">
							<!-- //[%%START_CUSTOM_CODE%%] -->
							<div class="control-label" style="width: 265px;">
							<!-- //[%%END_CUSTOM_CODE%%] -->				
								<?php echo $field->label; ?>
							</div>
							<div class="controls">
								<?php echo $field->input; ?>
								<?php if (strtolower($field->type) == 'file' AND isset($this->item->$name[$fieldname]) AND trim($this->item->$name[$fieldname]) != '') : ?>
									<div class="file" style="display: inline; padding-left: 10px;">
										<img src="<?php echo JUri::root().trim($this->item->$name[$fieldname]); ?>"/>
									</div>
								<?php endif; ?>	
							</div>	
						</div>
						<!-- //[%%START_CUSTOM_CODE%%] -->
						<?php if ($i >= (($count)/2) - 1 AND $count > 0): ?>
							<?php $count = $i > 0 ? 0: $count;?>
							</div>
							<div style="float:left; width: 50%; min-width: 600px;">
						<?php endif; ?>	
						<?php $i++; ?>	
						<!-- //[%%END_CUSTOM_CODE%%] -->
					<?php endif; ?>	
				<?php endforeach; ?>
				<!-- //[%%START_CUSTOM_CODE%%] -->
				</div>
				<!-- //[%%END_CUSTOM_CODE%%] -->
			<?php endforeach; ?>
			<?php if (version_compare(JVERSION, '3.0', 'ge')) : ?>
				<?php echo JHtml::_('bootstrap.endTab'); ?>
			<?php else: ?>
				</fieldset>
			<?php endif; ?>
			<?php if (version_compare(JVERSION, '3.0', 'ge')) : ?>
				<?php echo JHtml::_('bootstrap.addTab', 'component-tabs', 'component-joomla_features', JText::_('COM_COMPONENTARCHITECT_COMPONENTS_FIELD_JOOMLA_FEATURES_LABEL', true)); ?>
			<?php else: ?>
				<?php echo JHtml::_('tabs.panel',JText::_('COM_COMPONENTARCHITECT_COMPONENTS_FIELD_JOOMLA_FEATURES_LABEL'), 'component-joomla_features');?>
				<fieldset class="panelform">
			<?php endif; ?>	
			<?php $fieldsets = $this->form->getFieldsets('joomla_features');?>
			<?php foreach ($fieldsets as $name => $fieldset) :?>
				<?php
					if (isset($fieldset->description) AND trim($fieldset->description)) :
						echo JText::_($fieldset->description);
					endif;
				?>
				<!-- //[%%START_CUSTOM_CODE%%] -->
				<br /><br />
				<?php 
					$count = count($this->form->getFieldset($name));
					$i = 0;
				?>				
				<div style="float:left; width: 50%; min-width: 600px;">
				<!-- //[%%END_CUSTOM_CODE%%] -->
				<?php foreach ($this->form->getFieldset($name) as $field) : ?>
					<?php if (!$field->hidden) : ?>
						<?php $fieldname = (string) $field->fieldname; ?>
						<div class="control-group" id="field_<?php echo $fieldname; ?>">
							<!-- //[%%START_CUSTOM_CODE%%] -->
							<div class="control-label" style="width: 200px;">
							<!-- //[%%END_CUSTOM_CODE%%] -->				
								<?php echo $field->label; ?>
							</div>
							<div class="controls">
								<?php echo $field->input; ?>
								<?php if (strtolower($field->type) == 'file' AND isset($this->item->$name[$fieldname]) AND trim($this->item->$name[$fieldname]) != '') : ?>
									<div class="file" style="display: inline; padding-left: 10px;">
										<img src="<?php echo JUri::root().trim($this->item->$name[$fieldname]); ?>"/>
									</div>
								<?php endif; ?>	
							</div>	
						</div>
						<!-- //[%%START_CUSTOM_CODE%%] -->
						<?php if ($i >= (($count)/2) - 1 AND $count > 0): ?>
							<?php $count = $i > 0 ? 0: $count;?>
							</div>
							<div style="float:left; width: 50%; min-width: 600px;">
						<?php endif; ?>	
						<?php $i++; ?>	
						<!-- //[%%END_CUSTOM_CODE%%] -->
					<?php endif; ?>	
				<?php endforeach; ?>
				<!-- //[%%START_CUSTOM_CODE%%] -->
				</div>
				<!-- //[%%END_CUSTOM_CODE%%] -->
			<?php endforeach; ?>
			<?php if (version_compare(JVERSION, '3.0', 'ge')) : ?>
				<?php echo JHtml::_('bootstrap.endTab'); ?>
			<?php else: ?>
				</fieldset>
			<?php endif; ?>



		
		<?php if (version_compare(JVERSION, '3.0', 'ge')) : ?>
			<?php echo JHtml::_('bootstrap.addTab', 'component-tabs', 'component-publishing', JText::_('COM_COMPONENTARCHITECT_FIELDSET_PUBLISHING_LABEL', true)); ?>
		<?php else: ?>
			<?php echo JHtml::_('tabs.panel',JText::_('COM_COMPONENTARCHITECT_FIELDSET_PUBLISHING_LABEL'), 'component-publishing');?>
			<fieldset class="panelform">
		<?php endif; ?>				
			<div class="control-group" id="field_created_by">
				<div class="control-label">
					<?php echo $this->form->getLabel('created_by'); ?>
				</div>
				<div class="controls">
					<?php echo $this->form->getInput('created_by'); ?>
				</div>
			</div>
			<div class="control-group" id="field_created_by_alias">
				<div class="control-label">
					<?php echo $this->form->getLabel('created_by_alias'); ?>
				</div>
				<div class="controls">
					<?php echo $this->form->getInput('created_by_alias'); ?>
				</div>
			</div>
			<div class="control-group" id="field_created">
				<div class="control-label">
					<?php echo $this->form->getLabel('created'); ?>
				</div>
				<div class="controls">
					<?php echo $this->form->getInput('created'); ?>
				</div>
			</div>
			<?php if ($this->item->modified_by) : ?>
				<div class="control-group" id="field_modified_by">
					<div class="control-label">
						<?php echo $this->form->getLabel('modified_by'); ?>
					</div>
					<div class="controls">
						<?php echo $this->form->getInput('modified_by'); ?>
					</div>
				</div>
				<div class="control-group" id="field_modified">
					<div class="control-label">
						<?php echo $this->form->getLabel('modified'); ?>
					</div>
					<div class="controls">
						<?php echo $this->form->getInput('modified'); ?>
					</div>
				</div>
			<?php endif; ?>
			<?php if (version_compare(JVERSION, '3.0', 'ge')) : ?>
				<?php echo JHtml::_('bootstrap.endTab'); ?>
			<?php else: ?>
				</fieldset>
			<?php endif; ?>

		<?php if (version_compare(JVERSION, '3.0', 'ge')) : ?>
			<?php echo JHtml::_('bootstrap.endTabSet'); ?>
		<?php else: ?>
			<?php echo JHtml::_('tabs.end'); ?>
		<?php endif; ?>	
	<?php if (version_compare(JVERSION, '3.0', 'ge')) : ?>
	</div>
	<?php else: ?>
	</fieldset>
	<?php endif; ?>
	<input type="hidden" name="task" value="" />
	<input type="hidden" name="form_id" id="form_id" value="adminForm" />
	<input type="hidden" name="return" value="<?php echo $input->getCmd('return');?>" />
	<?php echo JHtml::_('form.token'); ?>
	<!-- End Content -->

</form>
