<?php
/**
 * @tempversion
 * @name			[%%ArchitectComp_name%%] (Release [%%COMPONENTSTARTVERSION%%])
 * @author			[%%COMPONENTAUTHOR%%] ([%%COMPONENTWEBSITE%%])
 * @package			[%%com_architectcomp%%]
 * @subpackage		[%%com_architectcomp%%].site
 * @copyright		[%%COMPONENTCOPYRIGHT%%]
 * @license			GNU General Public License version 3 or later; See http://www.gnu.org/copyleft/gpl.html 
 * 
 * The following Component Architect header section must remain in any distribution of this file
 *
 * @version			$Id: modal.php 408 2014-10-19 18:31:00Z BrianWade $
 * @CAauthor		Component Architect (www.componentarchitect.com)
 * @CApackage		architectcomp
 * @CAsubpackage	architectcomp.site
 * @CAtemplate		joomla_3_3_standard (Release 1.0.3)
 * @CAcopyright		Copyright (c)2013 - 2014  Simply Open Source Ltd. (trading as Component Architect). All Rights Reserved
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

/*
 *	Add style sheets, javascript and behaviours here in the layout so they can be overridden, if required, in a template override 
 */

// Add css files for the [%%architectcomp%%] component and categories if they exist
$this->document->addStyleSheet(JUri::root().'media/[%%com_architectcomp%%]/css/site_[%%architectcomp%%].css');
$this->document->addStyleSheet(JUri::root().'media/[%%com_architectcomp%%]/css/site_[%%compobjectplural%%].css');

if ($lang->isRTL())
{
	$this->document->addStyleSheet(JUri::root().'media/[%%com_architectcomp%%]/css/site_[%%architectcomp%%]-rtl.css');
	$this->document->addStyleSheet(JUri::root().'media/[%%com_architectcomp%%]/css/site_[%%compobjectplural%%]-rtl.css');
}

// Add Javscript functions for field display
[%%IF INCLUDE_IMAGE%%]
JHtml::_('behavior.caption');
[%%ENDIF INCLUDE_IMAGE%%]				
JHtml::_('bootstrap.tooltip');
JHtml::_('behavior.multiselect');
JHtml::_('dropdown.init');
JHtml::_('formbehavior.chosen', 'select');	

/*
 *	Initialise values for the layout 
 */	
 
$app = JFactory::getApplication();

$function	= $app->input->get('function', 'jSelect[%%CompObject%%]');
$list_order	= $this->escape($this->state->get('list.ordering'));
$list_dirn	= $this->escape($this->state->get('list.direction'));
// Get from global settings the text to use for an empty field
$component = JComponentHelper::getComponent( '[%%com_architectcomp%%]' );
$empty = $component->params->get('default_empty_field', '');

/*
 *	Layout HTML
 */
?>
<div class="[%%compobjectplural%%]-modal<?php echo $this->params->get('pageclass_sfx');?>">
	<h3><?php echo JText::_('[%%COM_ARCHITECTCOMP%%]_[%%COMPOBJECTPLURAL%%]_SELECT_ITEM_LABEL'); ?></h3>
	<form action="<?php echo JRoute::_('index.php?option=[%%com_architectcomp%%]&view=[%%compobjectplural%%]&layout=modal&tmpl=component');?>" method="post" name="adminForm" id="adminForm">
		<div class="filter_search">
			<input type="text" name="filter_search" id="filter_search" value="<?php echo $this->escape($this->state->get('filter.search')); ?>"  onchange="document.adminForm.submit();" title="<?php echo JText::_('[%%COM_ARCHITECTCOMP%%]_FILTER_SEARCH_DESC'); ?>" placeholder="<?php echo JText::_('JSEARCH_FILTER_LABEL'); ?>" />
			[%%IF GENERATE_CATEGORIES%%]
			<select name="filter_category_id" onchange="this.form.submit()">
				<option value=""><?php echo JText::_('JOPTION_SELECT_CATEGORY');?></option>
				<?php echo JHtml::_('select.options', JHtml::_('category.options', '[%%com_architectcomp%%]'), 'value', 'text', $this->state->get('filter.category_id'));?>
			</select>
			[%%ENDIF GENERATE_CATEGORIES%%]				
			[%%FOREACH FILTER_FIELD%%]
			<select name="filter_[%%FIELD_CODE_NAME%%]" onchange="this.form.submit()">
				[%%IF FIELD_LINK%%]
				<option value=""><?php echo JText::_('[%%COM_ARCHITECTCOMP%%]_[%%COMPOBJECTPLURAL%%]_SELECT_[%%FIELD_FOREIGN_OBJECT_ACRONYM_UPPER%%]_[%%FIELD_FOREIGN_OBJECT_UPPER%%]');?></option>
				<?php echo JHtml::_('select.options', $this->[%%FIELD_FOREIGN_OBJECT_PLURAL%%], 'value', 'text', $this->state->get('filter.[%%FIELD_CODE_NAME%%]'));?>
				[%%ELSE FIELD_LINK%%]
				<option value=""><?php echo JText::_('[%%COM_ARCHITECTCOMP%%]_[%%COMPOBJECTPLURAL%%]_SELECT_[%%FIELD_CODE_NAME_UPPER%%]');?></option>
				<?php echo JHtml::_('select.options', $this->[%%FIELD_CODE_NAME%%]_values, 'value', 'text', $this->state->get('filter.[%%FIELD_CODE_NAME%%]'));?>
				[%%ENDIF FIELD_LINK%%]
			</select>	
			[%%ENDFOR FILTER_FIELD%%]		
			<div class="display-limit">
				<?php echo $this->pagination->getLimitBox(); ?>
			</div>
		</div>

		<table class="[%%compobjectplural%%]">
			<thead>
				<tr>
					[%%IF INCLUDE_NAME%%]
					<th>
						<?php echo JHtml::_('grid.sort',  '[%%COM_ARCHITECTCOMP%%]_HEADING_NAME', 'a.name', $list_dirn, $list_order); ?>
					</th>
					[%%ENDIF INCLUDE_NAME%%]
					[%%FOREACH FILTER_FIELD%%]
					<th width="10%">
						[%%IF FIELD_ORDER%%]
							[%%IF FIELD_LINK%%]
						<?php echo JHtml::_('grid.sort', '[%%COM_ARCHITECTCOMP%%]_[%%COMPOBJECTPLURAL%%]_HEADING_[%%FIELD_CODE_NAME_UPPER%%]', '[%%FIELD_FOREIGN_OBJECT_ACRONYM%%]_[%%FIELD_FOREIGN_OBJECT_CODE_NAME%%]_[%%FIELD_FOREIGN_OBJECT_LABEL_FIELD%%]', $list_dirn, $list_order); ?>
							[%%ELSE FIELD_LINK%%]
						<?php echo JHtml::_('grid.sort', '[%%COM_ARCHITECTCOMP%%]_[%%COMPOBJECTPLURAL%%]_HEADING_[%%FIELD_CODE_NAME_UPPER%%]', 'a.[%%FIELD_CODE_NAME%%]', $list_dirn, $list_order); ?>
							[%%ENDIF FIELD_LINK%%]					
						[%%ELSE FIELD_ORDER%%]
						<?php echo JTEXT::_('[%%COM_ARCHITECTCOMP%%]_[%%COMPOBJECTPLURAL%%]_HEADING_[%%FIELD_CODE_NAME_UPPER%%]'); ?>
						[%%ENDIF FIELD_ORDER%%]	
					</th>	
					[%%ENDFOR FILTER_FIELD%%]					
					[%%IF GENERATE_CATEGORIES%%]
					<th width="10%">
						<?php echo JHtml::_('grid.sort', 'JCATEGORY', 'category_title', $list_dirn, $list_order); ?>
					</th>
					[%%ENDIF GENERATE_CATEGORIES%%]			
						
					<th width="1%" class="nowrap" style="display: none;">
						<?php echo JHtml::_('grid.sort', 'JGRID_HEADING_ID', 'a.id', $list_dirn, $list_order); ?>
					</th>
				</tr>
			</thead>
			<tbody>
			<?php foreach ($this->items as $i => $item) : ?>
				<tr class="row<?php echo $i % 2; ?>">
					[%%IF INCLUDE_NAME%%]
					<td>
						<a class="pointer" onclick="if (window.parent) window.parent.<?php echo $this->escape($function);?>('<?php echo $item->id; ?>', '<?php echo $this->escape(addslashes($item->name)); ?>');">
							<?php echo $this->escape($item->name); ?>
						</a>	
					</td>
					[%%ENDIF INCLUDE_NAME%%]
					[%%FOREACH FILTER_FIELD%%]
					<td class="center">
						[%%IF INCLUDE_NAME%%]
						<a class="pointer" onclick="if (window.parent) window.parent.<?php echo $this->escape($function);?>('<?php echo $item->id; ?>', '<?php echo $this->escape(addslashes($item->name)); ?>');">
						[%%ELSE INCLUDE_NAME%%]
						<a class="pointer" onclick="if (window.parent) window.parent.<?php echo $this->escape($function);?>('<?php echo $item->id; ?>');">
						[%%ENDIF INCLUDE_NAME%%]						
							<?php 
								[%%FIELD_SITE_LIST_VALUE%%] 
							?>
						</a>	
					</td>	
					[%%ENDFOR FILTER_FIELD%%]					
					[%%IF GENERATE_CATEGORIES%%]				
					<td class="center">
						[%%IF INCLUDE_NAME%%]
						<a class="pointer" onclick="if (window.parent) window.parent.<?php echo $this->escape($function);?>('<?php echo $item->id; ?>', '<?php echo $this->escape(addslashes($item->name)); ?>');">
						[%%ELSE INCLUDE_NAME%%]
						<a class="pointer" onclick="if (window.parent) window.parent.<?php echo $this->escape($function);?>('<?php echo $item->id; ?>');">
						[%%ENDIF INCLUDE_NAME%%]						
							<?php echo $this->escape($item->category_title); ?>
						</a>	
					</td>	
					[%%ENDIF GENERATE_CATEGORIES%%]							

					<td class="center" style="display: none;">
							<?php echo $item->id; ?>
						</a>	
					</td>
				</tr>
				<?php endforeach; ?>
			</tbody>
		</table>
		<div class="pagination">

			<?php if ($this->params->def('show_[%%compobject%%]_pagination_results', 0)) : ?>
			<p class="counter">
					<?php echo $this->pagination->getPagesCounter(); ?>
			</p>
			<?php endif; ?>

			<?php echo $this->pagination->getPagesLinks(); ?>
		</div>
		<input type="hidden" name="task" value="" />
		<input type="hidden" name="filter_order" value="<?php echo $list_order; ?>" />
		<input type="hidden" name="filter_order_Dir" value="<?php echo $list_dirn; ?>" />
		<?php echo JHtml::_('form.token'); ?>
	</form>
</div>
