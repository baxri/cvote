<?php
/**
 * @tempversion
 * @name			[%%ArchitectComp_name%%] (Release [%%COMPONENTSTARTVERSION%%])
 * @author			[%%COMPONENTAUTHOR%%] ([%%COMPONENTWEBSITE%%])
 * @package			[%%com_architectcomp%%]
 * @subpackage		[%%com_architectcomp%%].vote
 * @copyright		[%%COMPONENTCOPYRIGHT%%]
 * @license			GNU General Public License version 3 or later; See http://www.gnu.org/copyleft/gpl.html 
 * 
 * The following Component Architect header section must remain in any distribution of this file
 * 
 * @version			$Id: vote.php 418 2014-10-22 14:42:36Z BrianWade $
 * @CAauthor		Component Architect (www.componentarchitect.com)
 * @CApackage		architectcomp
 * @CAsubpackage	architectcomp.vote
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
 *
 * [%%ArchitectComp%%] vote plugin class.
 */
class plg[%%ArchitectComp%%]Vote extends JPlugin
{
	/**
	 * Constructor
	 *
	 * @access      protected
	 * @param       object  $subject The object to observe
	 * @param       array   $config  An array that holds the plugin configuration
	 */
	public function __construct(&$subject, $config)
	{
		parent::__construct($subject, $config);
		$this->loadLanguage();
	}



[%%FOREACH COMPONENT_OBJECT%%]
	[%%IF GENERATE_PLUGINS%%]
		[%%IF GENERATE_PLUGINS_VOTE%%]
	public function on[%%CompObject%%]BeforeDisplay($context, &$row, &$params, $page=0)
	{
		$html = '';

		if ($params->get('show_[%%compobject%%]_vote') AND $this->params->get('[%%compobject%%]_position', '1') == '0')
		{
			$html = $this->_OutputRating($context, $row, $params, $page=0,'[%%compobject%%]');
		}

		return $html;
	}
	public function on[%%CompObject%%]AfterDisplay($context, &$row, &$params, $page=0)
	{
		$html = '';

		if ($params->get('show_[%%compobject%%]_vote') AND $this->params->get('[%%compobject%%]_position', '1') == '1')
		{
			$html = $this->_OutputRating($context, $row, $params, $page=0,'[%%compobject%%]');
		}

		return $html;
	}	
		[%%ENDIF GENERATE_PLUGINS_VOTE%%]
	[%%ENDIF GENERATE_PLUGINS%%]
[%%ENDFOR COMPONENT_OBJECT%%]
	protected function _OutputRating($context, &$row, &$params, $page=0, $object)
	{
		$html = '';
		if ($object <> '')
		{
			$rating = intval(@$row->rating);
			$rating_count = intval(@$row->rating_count);

			$view = JRequest::getString('view', '');
			$img = '';

			// look for images in template if available
			$star_image_on = JHtml::_('image','system/rating_star.png', NULL, NULL, true);
			$star_image_off = JHtml::_('image','system/rating_star_blank.png', NULL, NULL, true);

			for ($i=0; $i < $rating; $i++)
			{
				$img .= $star_image_on;
			}
			for ($i=$rating; $i < 5; $i++)
			{
				$img .= $star_image_off;
			}
			$html .= '<span class="'.$object.'_rating">';
			$html .= JText::sprintf( 'PLG_[%%ARCHITECTCOMP%%]_VOTE_USER_RATING', $img, $rating_count );
			$html .= "</span>\n<br />\n";

			[%%IF INCLUDE_STATUS%%]
			if ( ($view == $object) AND isset($row->state) AND $row->state == 1)
			[%%ELSE INCLUDE_STATUS%%]	
			if ( ($view == $object))
			[%%ENDIF INCLUDE_STATUS%%]	
			{
				$uri = JFactory::getURI();
				$uri->setQuery($uri->getQuery().'&hitcount=0');

				$html .= '<form method="post" action="' . $uri->toString() . '">';
				$html .= '<div class="'.$object.'_vote">';
				$html .= JText::_( 'PLG_[%%ARCHITECTCOMP%%]_VOTE_POOR' );
				$html .= '<input type="radio" title="'.JText::sprintf('PLG_[%%ARCHITECTCOMP%%]_VOTE_VOTE', '1').'" name="user_rating" value="1" />';
				$html .= '<input type="radio" title="'.JText::sprintf('PLG_[%%ARCHITECTCOMP%%]_VOTE_VOTE', '2').'" name="user_rating" value="2" />';
				$html .= '<input type="radio" title="'.JText::sprintf('PLG_[%%ARCHITECTCOMP%%]_VOTE_VOTE', '3').'" name="user_rating" value="3" />';
				$html .= '<input type="radio" title="'.JText::sprintf('PLG_[%%ARCHITECTCOMP%%]_VOTE_VOTE', '4').'" name="user_rating" value="4" />';
				$html .= '<input type="radio" title="'.JText::sprintf('PLG_[%%ARCHITECTCOMP%%]_VOTE_VOTE', '5').'" name="user_rating" value="5" checked="checked" />';
				$html .= JText::_( 'PLG_[%%ARCHITECTCOMP%%]_VOTE_BEST' );
				$html .= '&#160;<input class="button" type="submit" name="submit_vote" value="'. JText::_( 'PLG_[%%ARCHITECTCOMP%%]_VOTE_RATE' ) .'" />';
				$html .= '<input type="hidden" name="task" value="'.$object.'.vote" />';
				$html .= '<input type="hidden" name="hitcount" value="0" />';
				$html .= '<input type="hidden" name="url" value="'.  $uri->toString() .'" />';
				$html .= JHtml::_('form.token');
				$html .= '</div>';
				$html .= '</form>';
			}
		}
		return $html;
	}
}
