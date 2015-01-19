<?php
defined('_JEXEC') or die; ?>
fff
<form class="form-asd" role="form" action="" method="post" id="geocars_default_form">

<div class="search-block">

	<div class="default_search_text">
		აირჩიეთ ავტომობილის  მწრმოებელი და მოდელი
	</div>

	<div class="default_search">
		<?php echo $this->category_list; ?>
	</div>

	<div class="default_search">
		<div id="search-result"><?php echo $this->model_list; ?></div>
		<div id="search-loader">იტვირთება ... </div>
	</div>	

	<div class="default_search">
		<input type="submit" class="primary-search-btn btn btn-lg btn-primary disabled" id="geocars_default_submit" value="ძებნა"/>
	</div>

</div>


<input type="hidden" id="option" name="option" value="com_geocars" />
<input type="hidden" id="task" name="task" value="goToModelPage" />

</form>
