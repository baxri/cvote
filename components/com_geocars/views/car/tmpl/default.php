<?php defined('_JEXEC') or die; 

require_once JPATH_SITE.DS.'modules/mod_login/helper.php';

?>

<div class="car-page">

	<div class="main_container">

		<div class="inner_div">
			<div>
				<h3 ><?php echo $this->item->category_title ?> <?php echo $this->item->name ?></h3>
			</div>

			<div class="info_block car-float-block">

				<div class="share-button fb-share-button"
				data-href="<?php echo $this->page_url ?>"
				data-layout="button_count"
				></div>

			
				<div class="write_your_comment">
					<div class="vote-text"><span id="plus-vote-result"><?php echo $this->item->plus ?></span> ადამიანი კმაყოფილია ამ ავტომობილით</div>
				</div>

				<div>
					<div class="vote-text"><span id="minus-vote-result"><?php echo $this->item->minus ?></span> ადამიანი არ არის კმაყოფილი ამ ავტომობილით</div>
				</div>

				<p>თქვენ კმაყოფილი ხართ ამ ავტომობილით?</p>

				<div class="votting-buttons btn-group" role="group" aria-label="...">
				  <button type="button" data-carid="<?php echo $this->item->id ?>" id="success-vote" class="btn btn-primary <?php echo !empty($this->voted->id) ? 'disabled' : '' ?>">კმაყოფილი ვარ</button>
				  <button type="button" data-carid="<?php echo $this->item->id ?>" id="danger-vote" class="btn btn-danger <?php echo !empty($this->voted->id) ? 'disabled' : '' ?>">არ ვარ კმაყოფილი</button>

				</div>


				<div class="like_button_div">
					<iframe src="http://www.facebook.com/plugins/like.php?href=<?php echo $this->page_url ?>&amp;layout=button_count&amp;show_faces=true&amp;action=like&amp;colorscheme=light&amp" style="overflow:hidden;width:100%;height:80px;" scrolling="no" frameborder="0" allowTransparency="true"><a href="http://www.staubsauger-test.biz" class="fbook">www.staubsauger-test.biz</a></iframe>
				</div>

				

			</div>

			<div class="car-float-block car-right-block">
				<?php if( !empty( $this->item->description ) ): ?>
					<?php echo $this->item->description ?>
				<?php else: ?>
					დეტალური ინფორმაცია ამ ავტომობილზე არ მოიძებნა
				<?php endif; ?>
			</div>
			
			<div class="cls"></div>


		</div>


		<div class="add-opinion-block">
			<?php if( !empty( $this->user->id ) ): ?>
				<a id="open_add_opinion_dialog" href="javascript:void(0)">დაამატე</a> მოსაზრება მომხმარებლით: <?php echo $this->user->name ?>
			
				<div class="add_opinion_block" id="add_opinion_block">
		
					<form action="index.php" method="post" id="add_opinion_form">
						
						<div class="allow-symbols"> დასაშვებია მაქსიმუმ 1000 სიმბოლო </div>

						<div>
							<?php echo $this->year_from ?>
							<?php echo $this->year_to ?>
							<?php echo $this->type ?>
						</div>

						<div>
							<textarea class="opinion-textarea" name="opinion" id="opinion"></textarea>
						</div>

						<div>
							<button class="btn btn-primary" id="add_opinion_but">დაამატე შენი მოსაზრება</button>	
						</div>


						<input type="hidden" name="car_id" value="<?php echo $this->item->id ?>" />
						<input type="hidden" name="task" value="addOpinion" />
						<input type="hidden" name="option" value="<?php echo $this->option ?>" />
						
					</form>
				
				</div>

			<?php else: ?>
				მოსაზრების გამოსათქმელად გაიარეთ ავტორიზაცია
			<?php endif; ?>
		</div>
	
	
	<div>
		<form action="?" method="get">
			<div>ფილტრაციის პარამეტრები</div>
			<?php echo $this->year_from_filter; ?>
			<?php echo $this->year_to_filter; ?>
			<?php echo $this->type_filter; ?>
			<div>
				<button class="btn">გაფილტრე</button>
			</div>
		</form>
	</div>

	<div class="opinions-list" id="opinions">
		<?php if( !empty( $this->opinions ) ): ?>
			
			<?php foreach( $this->opinions as $key=>$value ): ?>
				<div class="opinion_row <?php echo $value->type == 1 ? 'good-row' : 'bad-row' ?>" >
					<div class="opinion-float-block">
						<img width="30" height="30" class="img-circle" src="<?php echo modLoginHelper::getAvatarUrl( $value->slogin_id, $value->provider ); ?>" />
  					</div>
  					<div class="opinion-float-block opinion-text">
  						<div><?php echo $value->name ?> <?php echo ucfirst($value->provider) ?> - დან</div>
  						<div><?php echo $value->opinion ?></div>
  					</div>
  					<div class="cls"></div>
				</div>
			<?php endforeach; ?>

			<div>
				<?php echo $this->pagination->getPagesLinks(); ?>
			</div>

		<?php else: ?>
			<div>არც ერთი მომხარებლის მოსაზრება არმოიძებნა</div>
		<?php endif; ?>
	</div>			
		
		
		<?php /* ?>
		<div id="fb-root"></div>	
		<fb:comments href="<?php echo $this->page_url ?>" data-width="100%"></fb:comments>
		<?php */ ?>
	</div>

</div><!-- /slide1 -->

<?php

$this->doc->addScriptDeclaration('

	$(document).ready( function(){		
		$.get("index.php?option=com_geocars&view=opinions&car='.$this->item->id.'", function( data ){			
			$("#opinions_block").html("").html( data );			
		});	
		
		
		$("#open_add_opinion_dialog").bind( "click", function(){		
			$( "#add_opinion_block" ).toggle();		
			return false;		
		} );
	});

');


