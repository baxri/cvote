<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_users
 *
 * @copyright   Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
?>
<div class="page-registration__complete page-registration__complete__<?php echo $this->pageclass_sfx;?>">
	<?php if ($this->params->get('show_page_heading')) : ?>
	<div class="page_header">
    <h1>
      <?php echo $this->escape($this->params->get('page_heading')); ?>
    </h1>
  </div>
	<?php endif; ?>
</div>
