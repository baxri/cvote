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

defined('_JEXEC') or die;
?>


<!-- === MAIN Background === -->
<div class="car-page">

	<div class="main_container" style="width: auto; padding: 20px; padding-top: 60px;">

		<?php if( $this->item->plus >= $this->item->minus ): ?>
			<div class="inner_div2" style="background-color: #428bca; height: 5px;"></div>
		<?php else: ?>
			<div class="inner_div2" style="background-color: #d9534f; height: 5px;"></div>
		<?php endif; ?>

		<div class="inner_div">
			<div>
				<h3><?php echo $this->item->category_title ?> <?php echo $this->item->name ?></h3>
			</div>
			
			
			<?php /* ?>
			<div class="image_block">	
				<?php if( !empty( $this->item->image_1 ) ): ?><img class="img-responsive img-circle" src="<?php echo $this->item->image_1 ?>" id="car_image" /><?php endif; ?>
			</div>
			<?php */ ?>

			<div class="info_block">

				<div class="write_your_comment">
					<div class="vote-text"><span style="color: lightblue; font-weight: bold;" id="plus-vote-result"><?php echo $this->item->plus ?></span> ადამიანი კმაყოფილია ამ ავტომობილით</div>
				</div>

				<div style="margin-bottom: 1px;">
					<div class="vote-text"><span style="color: #d9534f; font-weight: bold;" id="minus-vote-result"><?php echo $this->item->minus ?></span> ადამიანი არ არის კმაყოფილი ამ ავტომობილით</div>
				</div>

				
				<p>თქვენ კმაყოფილი ხართ ამ ავტომობილით?</p>



				<div class="votting-buttons btn-group" role="group" aria-label="...">
				  <button type="button" data-carid="<?php echo $this->item->id ?>" id="danger-vote" class="btn btn-danger <?php echo !empty($this->voted->id) ? 'disabled' : '' ?>">არ ვარ კმაყოფილი</button>
				  <button type="button" data-carid="<?php echo $this->item->id ?>" id="success-vote" class="btn btn-primary <?php echo !empty($this->voted->id) ? 'disabled' : '' ?>">კმაყოფილი ვარ</button>
				</div>

				<script>(function(d, s, id) {
				  var js, fjs = d.getElementsByTagName(s)[0];
				  if (d.getElementById(id)) return;
				  js = d.createElement(s); js.id = id;
				  js.src = "//connect.facebook.net/ka_GE/sdk.js#xfbml=1&appId=1499926956949411&version=v2.0";
				  fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));</script>

				<div  style="padding-top: 10px; margin: 0px auto; display: table; text-align: center;">
					<iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Flocalhost&amp;layout=button_count&amp;show_faces=true&amp;action=like&amp;colorscheme=light&amp" style="overflow:hidden;width:100%;height:80px;" scrolling="no" frameborder="0" allowTransparency="true"><a href="http://www.staubsauger-test.biz" class="fbook">www.staubsauger-test.biz</a></iframe>
				</div>

				<br />
				<br />
				<div class="fb-share-button" data-href="https://localhost" data-layout="button"></div>


				
			</div>
			
			<div class="cls"></div>


		</div>

		<div style="text-align: left; margin-bottom: 10px; margin-top: -10px;">
			<a href="javascript:void(0)" id="detail_info" style="font-size: 9pt;">დეტალური</a>
			<div id="detail_info_body" style="display: none;">
				<?php if(!empty( $this->item->description )): ?>
					<?php echo $this->item->description; ?>
				<?php else: ?>
					ინფორმაცია ჯერ არ არის წარმოდგენილი
				<?php endif; ?>
			</div>
		</div>
		

		<div id="fb-root"></div>
		<script src="http://connect.facebook.net/ka_GE/all.js#xfbml=1"></script>
		<fb:comments href="http://www.geocars.ge" data-width="100%"></fb:comments>

	</div>

</div><!-- /slide1 -->




