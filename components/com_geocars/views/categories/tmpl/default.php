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
<div class="inner_div slide " style="margin-bottom: 0px; padding-bottom: 70px; padding-top: 100px;"  data-slide="1">
	
	
		<div id="home-row-1" class=" clearfix" style="text-align: center;">
			
			<div class="selects_block" style="margin: 0px auto; btext-align: center;">
			
				<div class="default_search">
					<?php echo $this->category_list; ?>
				</div>
				
				<div class="default_search">
					<div id="search-result"><?php echo $this->model_list; ?></div>
					<div id="search-loader" style="height: 34px; display: none; text-align: center; padding-top: 5px; padding-left: 60px;">იტვირთება ... </div>
				</div>

				<div id="fb-root"></div>

			</div>

			<div style="clear: both;"></div>
			<br />

			<div class="submit_div" style="margin: 0px auto;">
				<input style="border: solid 2px white !important;" type="submit" class="btn btn-lg btn-primary disabled" id="geocars_default_submit" value="ძებნა"/>
			</div>

			<input type="hidden" id="option" name="option" value="com_geocars" />
			<input type="hidden" id="task" name="task" value="goToModelPage" />
		

				<div style="height: 200px; padding-top: 1px; margin-bottom: 50px;" class="col-12">
					<h1 class="font-semibold">ავტომობილები <span class="font-thin">საქართველოში</span></h1>
					<br /><br /><br />
					<h4 class="font-thin">შეაფასეთ <span class="font-semibold">თქვენი ავტომობილი</span> და გაუზიარეთ სხვებს.</h4>
				</div><!-- /col-12 -->

			<div class="home_votting_examples" style="margin: 0px auto; width: 320px;">
				<div style="float: left;"><div c data-slide="4"><img src="images/s02.png"></div><span>უარყოფითი შეფასება</span></div>
				<div style="margin-left: 10px;float: left;"><div data-slide="5"><img src="images/s03.png"></div><span>დადებითი შეფასება</span></div>
			</div><!-- /row -->



		</div><!-- /row -->
		
	
</div><!-- /slide1 -->

</form>
