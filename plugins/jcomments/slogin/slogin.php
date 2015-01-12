<?php
/**
 * JComments - Joomla Comment System
 *
 * Integrates JComments with SocialLogin extension (http://joomline.ru/rasshirenija/komponenty/slogin.html)
 *
 * @version 1.0
 * @package JComments
 * @author Sergey M. Litvinov (smart@joomlatune.ru)
 * @copyright (C) 2009-2012 by Sergey M. Litvinov (http://www.joomlatune.ru)
 * @license GNU/GPL: http://www.gnu.org/copyleft/gpl.html
 *
 **/

defined('_JEXEC') or die;

class plgJCommentsSLogin extends JPlugin
{
	function __construct(&$subject, $config)
	{
		parent::__construct($subject, $config);
		JPlugin::loadLanguage('plg_jcomments_slogin', JPATH_ADMINISTRATOR);
	}

	function onJCommentsFormBeforeDisplay()
	{
		$content = '';
		$componentPath = JPATH_SITE . '/components/com_slogin/slogin.php';
		
		if (JFile::exists($componentPath)) {
			$user = JFactory::getUser();

			if (!$user->id) {
				$document = JFactory::getDocument();
				$document->addScript(JURI::root() . 'media/plg_jcomments_slogin/js/slogin.js');
				$document->addStyleSheet(JURI::root() . 'media/plg_jcomments_slogin/css/slogin.css');

				JHTML::_('behavior.mootools');

				JPluginHelper::importPlugin('slogin_auth');

				$plugins = array();
				$return = '&return=' . base64_encode(JRequest::getURI());

				$dispatcher = JDispatcher::getInstance();
				$dispatcher->trigger('onCreateLink', array(&$plugins, $return));

				if (count($plugins)) {
					ob_start();
					require_once(dirname(__FILE__) . '/tmpl/default.php');
					$content = ob_get_clean();
				}
			}
		}

		return $content;
	}
}
