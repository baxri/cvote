<?php
/**
 * @package Gantry Template Framework - RocketTheme
 * @version 3.2.8 August 1, 2011
 * @author RocketTheme http://www.rockettheme.com
 * @copyright Copyright (C) 2007 - 2011 RocketTheme, LLC
 * @license http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
 *
 * Gantry uses the Joomla Framework (http://www.joomla.org), a GNU/GPLv2 content management system
 *
 */
// no direct access
defined( '_JEXEC' ) or die( 'Restricted index access' );

// load and inititialize gantry class
require_once('lib/gantry/gantry.php');
?>
<?php if (JRequest::getString('type')=='raw'):?>
	<jdoc:include type="component" />
<?php else: ?>

	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $gantry->language; ?>" lang="<?php echo $gantry->language;?>" >
		<head>
			<?php 

					$view = JRequest::getVar('view'); /*Current page view. K2 related pages*/
					$option = $_GET['option']; /*Current page view. Joomla related pages*/
					$task = '';
					$task =& $_GET['task'];
					$template="";
					$template=& $_GET['tmpl'];

				$gantry->displayHead();

				if($task !== "edit" && $template !== 'component'){
					$gantry->addStyles(array('default.css','normalize.css','template.css'));
				}


			?>
		</head>
		<body <?php echo $gantry->displayBodyTag(); ?>>
			<div id="rt-main" class="<?Php echo $view .' '. $task .' '. $option;?>">
				<div class="rt-container">
					<div class="rt-block">
						<div id="rt-mainbody">
					    	<jdoc:include type="component" />
						</div>
					</div>
				</div>
			</div>
		</body>
	</html>
<?php endif; ?>
<?php
$gantry->finalize();
?>