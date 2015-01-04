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
 * @CAversion		Id: default.php 418 2014-10-22 14:42:36Z BrianWade $
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

defined('_JEXEC') or die; ?>

<form class="form-asd" role="form" action="" method="post" id="geocars_default_form">

<!-- === MAIN Background === -->
<div class="slide story" id="slide-1" data-slide="1">
	<div class="container">
	
		<div id="home-row-1" class="row clearfix" style="text-align: center;">
			
			<div>
			<?php echo $this->category_list; ?>
			<br />
			<?php echo $this->model_list; ?>
			</div>

			<input type="submit" class="btn btn-lg btn-primary disabled" id="geocars_default_submit" value="ძებნა"/>


			<input type="hidden" id="option" name="option" value="com_geocars" />
			<input type="hidden" id="task" name="task" value="goToModelPage" />
		

				<div class="col-12">
				<h1 class="font-semibold">ავტომობილები <span class="font-thin">საქართველოში</span></h1>
				<h4 class="font-thin">შეაფასეთ <span class="font-semibold">თქვენი ავტომობილი</span> და გაუზიარეთ სხვებს.</h4>
				
			</div><!-- /col-12 -->
		</div><!-- /row -->
		<div id="home-row-2" class="row clearfix">
			<div class="col-12 col-sm-4"><div class="home-hover navigation-slide" data-slide="4"><img src="images/s02.png"></div><span>უარყოფითი შეფასება</span></div>
			<div class="col-12 col-sm-4"><div class="home-hover navigation-slide" data-slide="5"><img src="images/s03.png"></div><span>დადებითი შეფასება</span></div>
		</div><!-- /row -->
	</div><!-- /container -->
</div><!-- /slide1 -->

</form>
