<?php
/**
 * @version		$Id: category.php 1273 2011-10-27 16:12:32Z lefteris.kavadas $
 * @package		K2
 * @author		JoomlaWorks http://www.joomlaworks.gr
 * @copyright	Copyright (c) 2006 - 2011 JoomlaWorks Ltd. All rights reserved.
 * @license		GNU/GPL license: http://www.gnu.org/copyleft/gpl.html
 */

// no direct access
defined('_JEXEC') or die('Restricted access');
	$num_leading_columns = $this->params->get('num_leading_columns');
	$num_primary_columns = $this->params->get('num_primary_columns');
	$num_secondary_columns = $this->params->get('num_secondary_columns');
	$num_links_columns = $this->params->get('num_links_columns');


$K2ModelItem = new K2ModelItem;

$K2ModelItemlist = new K2ModelItemlist;
$categoryData = $K2ModelItemlist->getData();
	foreach ($categoryData as $catItem) {
		$catItems[] = $catItem->id;
		$catItemTitles[] = $catItem->title;
		$catItemDate[] = $catItem->created;
	}

$K2ModelItem = new K2ModelItem;

	foreach ($catItems as $catItem) {
		$catTags[] = $K2ModelItem->getItemTags($catItem);
	}

	foreach ($catTags as $catTag) {
		foreach ($catTag as $tag) {
			$allTags[] = $tag->name;
		}
	}

if(!empty($tag)){
	$tags = array_unique($allTags);
	natcasesort($tags);
};

?>

<!-- Start K2 Category Layout -->
<div id="k2Container" class="itemListView<?php if($this->params->get('pageclass_sfx')) echo ' '.$this->params->get('pageclass_sfx'); ?>">

<!-- Page title -->
	<?php if($this->params->get('show_page_title')): ?>
		<div class="componentheading <?php echo $this->params->get('pageclass_sfx')?>">
			<h2><?php echo $this->escape($this->params->get('page_title')); ?></h2>
		</div>
	<?php endif; ?>

<!-- RSS feed icon -->
	<?php if($this->params->get('catFeedIcon')): ?>
		<div class="k2FeedIcon">
			<a href="<?php echo $this->feed; ?>" title="<?php echo JText::_('K2_SUBSCRIBE_TO_THIS_RSS_FEED'); ?>">
				<span><?php echo JText::_('K2_SUBSCRIBE_TO_THIS_RSS_FEED'); ?></span>
			</a>
			<div class="clr"></div>
		</div>
	<?php endif; ?>


<div id="isotopeOptions">
		<?php if(!empty($tags)){ ?>
			<span><strong><?php echo JText::_('GALLERY_FILTER'); ?></strong></span>
	    	<ul id="filters" class="option-set">
					<li><a href="#" data-filter="*" class="selected">All</a></li>
					<?php
						foreach ($tags as $tag) {
							echo "<li><a href='#' data-filter='.".strtolower(str_replace(" ","_",$tag))."'>".$tag."</a></li>";
						}
			        ?>
	        </ul>
        <?php } ?>

        <div class="clr"></div>

        <?php if(!empty($catItems) || !empty($catItemTitles) || !empty($catItemDate)): ?>
	        <span><strong><?php echo JText::_('GALLERY_SORT'); ?></strong></span>
	        <ul id="sort" data-option-key="sortBy" class="option-set">
				<li><a href="#sortBy=#title" data-option-value="title" class="selected">title</a></li>
				<li><a href="#sortBy=#date" data-option-value="date">date</a></li>
				<li><a href="#sortBy=#views" data-option-value="views">views</a></li>
  	        </ul>

  	        <span><strong><?php echo JText::_('GALLERY_SORT_DIRECTION'); ?></strong></span>
  	        <ul id="sort_direction" data-option-key="sortAscending"  class="option-set">
		      <li><a href="#sortAscending=true" data-option-value="true" class="selected">sort ascending</a></li>
		      <li><a href="#sortAscending=false" data-option-value="false">sort descending</a></li>
    		</ul>

        <?php endif; ?>

</div>

<div class="clr"></div>


<!-- Blocks for current category and subcategories -->
	<?php if(isset($this->category) || ( $this->params->get('subCategories') && isset($this->subCategories) && count($this->subCategories) )): ?>
		<div class="itemListCategoriesBlock">
		
	<!-- Category block -->
			<?php if(isset($this->category) && ( $this->params->get('catImage') || $this->params->get('catTitle') || $this->params->get('catDescription') || $this->category->event->K2CategoryDisplay )): ?>
	
				<div class="itemListCategory">

			<!-- Item add link -->
					<?php if(isset($this->addLink)): ?>
						<span class="catItemAddLink">
							<a class="modal" rel="{handler:'iframe',size:{x:990,y:650}}" href="<?php echo $this->addLink; ?>">
								<?php echo JText::_('K2_ADD_A_NEW_ITEM_IN_THIS_CATEGORY'); ?>
							</a>
						</span>
					<?php endif; ?>
					
			<!-- Category image -->
					<?php if($this->params->get('catImage') && $this->category->image): ?>
						<img alt="<?php echo K2HelperUtilities::cleanHtml($this->category->name); ?>" src="<?php echo $this->category->image; ?>"/>
					<?php endif; ?>
					
			<!-- Category title -->
					<?php if($this->params->get('catTitle')): ?>
						<h2><?php echo $this->category->name; ?><?php if($this->params->get('catTitleItemCounter')) echo ' ('.$this->pagination->total.')'; ?></h2>
					<?php endif; ?>
					
			<!-- Category description -->
					<?php if($this->params->get('catDescription')): ?>
						<?php echo $this->category->description; ?>
					<?php endif; ?>

					<!-- K2 Plugins: K2CategoryDisplay -->
					<?php echo $this->category->event->K2CategoryDisplay; ?>

					<div class="clr"></div>
				</div>
			<?php endif; ?>
			

	<!-- Subcategories -->
			<?php if($this->params->get('subCategories') && isset($this->subCategories) && count($this->subCategories)): ?>
			<div class="itemListSubCategories">
				<h3><?php echo JText::_('K2_CHILDREN_CATEGORIES'); ?></h3>
					<?php foreach($this->subCategories as $key=>$subCategory): ?>
						<?php
						// Define a CSS class for the last container on each row
						if( (($key+1)%($this->params->get('subCatColumns'))==0) || count($this->subCategories)<$this->params->get('subCatColumns') )
							$lastContainer= ' subCategoryContainerLast';
						else
							$lastContainer='';
						?>

						<div class="subCategoryContainer<?php echo $lastContainer; ?>"<?php echo (count($this->subCategories)==1) ? '' : ' style="width:'.number_format(100/$this->params->get('subCatColumns'), 1).'%;"'; ?>>
							<div class="subCategory">
								<?php if($this->params->get('subCatImage') && $subCategory->image): ?>
						<!-- Subcategory image -->
								<a class="subCategoryImage" href="<?php echo $subCategory->link; ?>">
									<img alt="<?php echo K2HelperUtilities::cleanHtml($subCategory->name); ?>" src="<?php echo $subCategory->image; ?>" />
								</a>
								<?php endif; ?>

								<?php if($this->params->get('subCatTitle')): ?>
						<!-- Subcategory title -->
								<h2>
									<a href="<?php echo $subCategory->link; ?>">
										<?php echo $subCategory->name; ?><?php if($this->params->get('subCatTitleItemCounter')) echo ' ('.$subCategory->numOfItems.')'; ?>
									</a>
								</h2>
								<?php endif; ?>

								<?php if($this->params->get('subCatDescription')): ?>
						<!-- Subcategory description -->
									<?php echo $subCategory->description; ?>
								<?php endif; ?>

						<!-- Subcategory more... -->
								<a class="subCategoryMore" href="<?php echo $subCategory->link; ?>">
									<?php echo JText::_('K2_VIEW_ITEMS'); ?>
								</a>

								<div class="clr"></div>
							</div>
						</div>
							<?php if(($key+1)%($this->params->get('subCatColumns'))==0): ?>
								<div class="clr"></div>
							<?php endif; ?>
						<?php endforeach; ?>

				<div class="clr"></div>
			</div>
			<?php endif; ?>
		</div>					
	<?php endif; ?>


<!-- Item list -->
	<?php if((isset($this->leading) || isset($this->primary) || isset($this->secondary) || isset($this->links)) && (count($this->leading) || count($this->primary) || count($this->secondary) || count($this->links))): ?>
	
		<div class="itemList">
		
	<!-- Leading items -->
			<?php if(isset($this->leading) && count($this->leading)): 
				$column_number = $this->params->get('num_leading_columns');	// get columns number
			?>
	
			<div id="isotopeContainer" class="itemListLeading">
				<?php 
				$item_number = count($this->leading);	
				foreach($this->leading as $key=>$item): ?>

						<?php $tag_name = "";
							foreach ($K2ModelItem->getItemTags($this->leading[$key]->id) as $itm=>$tag_item) {
								$tName = str_replace(" ", "_", $tag_item->name);
								$tag_name[] = strtolower($tName);
							}
							$classes="";
							if(!empty($tag_name)){
								$classes = implode(" ", $tag_name);
						};

						$dataCreate = strtotime(JHTML::_('date', $item->created , JText::_('K2_DATE_FORMAT_LC5')));?>

				
						<div class="itemContainer all <?php echo $classes; ?>" style="width:<?php echo number_format((100/$num_leading_columns),1).'%'; ?>"data-title="<?php echo str_replace(' ', '', $item->title); ?>" data-create="<?php echo $dataCreate; ?>">
							<?php
								// Load category_item.php by default
								$this->item=$item;
								echo $this->loadTemplate('item');
							?>
							<div class="clr"></div>
						</div>

				<?php endforeach; ?>
			</div>
			<div class="clr"></div>
			<?php endif; ?>

			
			<?php if(isset($this->primary) && count($this->primary)): 
			$column_number = $this->params->get('num_primary_columns');	// get columns number  
			?>
            
	<!-- Primary items -->
			<div id="isotopeContainer" class="itemListPrimary">
				<?php 
				$item_number = count($this->primary);						// get items number  
					foreach($this->primary as $key=>$item): ?>

						<?php $tag_name = "";
							foreach ($K2ModelItem->getItemTags($this->primary[$key]->id) as $itm=>$tag_item) {
								$tName = str_replace(" ", "_", $tag_item->name);
								$tag_name[] = strtolower($tName);
							}
							$classes="";
							if(!empty($tag_name)){
								$classes = implode(" ", $tag_name);
						} 

						$dataCreate = strtotime(JHTML::_('date', $item->created , JText::_('K2_DATE_FORMAT_LC5')));
						 ?>

						<div class="itemContainer all <?php echo $classes; ?>" style="width:<?php echo number_format((100/$num_primary_columns),1).'%'; ?>" data-title="<?php echo str_replace(' ', '', $item->title); ?>" data-create="<?php echo $dataCreate; ?>">
							<?php
								// Load category_item.php by default
								$this->item=$item;
								echo $this->loadTemplate('item');
							?>
							<div class="clr"></div>
						</div>
				                
					<?php endforeach; ?>
			</div>
			<div class="clr"></div>
			<?php endif; ?>
			
	<!-- Secondary items -->
			<?php if(isset($this->secondary) && count($this->secondary)): 
			$column_number = $this->params->get('num_secondary_columns');	// get columns number?>
			<div id="isotopeContainer" class="itemListSecondary">
				<?php 
				$item_number = count($this->secondary);						// get items number  
				foreach($this->secondary as $key=>$item): ?>
				
						<?php $tag_name = "";
							foreach ($K2ModelItem->getItemTags($this->secondary[$key]->id) as $itm=>$tag_item) {
								$tName = str_replace(" ", "_", $tag_item->name);
								$tag_name[] = strtolower($tName);
							}
							$classes="";
							if(!empty($tag_name)){
								$classes = implode(" ", $tag_name);
						};
						$dataCreate = strtotime(JHTML::_('date', $item->created , JText::_('K2_DATE_FORMAT_LC5'))); ?>
				
						<div class="itemContainer all <?php echo $classes; ?>" style="width:<?php echo number_format((100/$num_secondary_columns),1).'%'; ?>"data-title="<?php echo str_replace(' ', '', $item->title); ?>" data-create="<?php echo $dataCreate; ?>">
					<?php
						// Load category_item.php by default
						$this->item=$item;
						echo $this->loadTemplate('item');
					?>
					<div class="clr"></div>
				</div>
				

				<?php endforeach; ?>
			</div>
			<div class="clr"></div>
			<?php endif; ?>
			

			<?php if(isset($this->links) && count($this->links)): ?>

	<!-- Link items -->
			<div id="isotopeContainer" class="itemListLinks">
				<h4><?php echo JText::_('K2_MORE'); ?></h4>
				<?php foreach($this->links as $key=>$item): ?>

						<?php $tag_name = "";
							foreach ($K2ModelItem->getItemTags($this->links[$key]->id) as $itm=>$tag_item) {
								$tName = str_replace(" ", "_", $tag_item->name);
								$tag_name[] = strtolower($tName);
							}
							$classes="";
							if(!empty($tag_name)){
								$classes = implode(" ", $tag_name);
						};
						$dataCreate = strtotime(JHTML::_('date', $item->created , JText::_('K2_DATE_FORMAT_LC5'))); ?>


						<div class="itemContainer all <?php echo $classes; ?>" style="width:<?php echo number_format((100/$num_links_columns),1).'%'; ?>"data-title="<?php echo str_replace(' ', '', $item->title); ?>" data-create="<?php echo $dataCreate; ?>">
							<?php
								// Load category_item_links.php by default
								$this->item=$item;
								echo $this->loadTemplate('item_links');
							?>
							<div class="clr"></div>
						</div>
				<?php endforeach; ?>
			</div>
			<?php endif; ?>

			<div class="clr"></div>
		</div>
		

		<!-- Pagination -->
		<?php if($this->params->get('catPagination') || $this->params->get('catPaginationResults')): ?>
			<div class="k2Pagination">
				<?php if($this->params->get('catPagination')) echo $this->pagination->getPagesLinks(); ?>
				<div class="clr"></div>
				<?php if($this->params->get('catPaginationResults')): ?>
					<p class="pagination-results"><?php if($this->params->get('catPaginationResults')) echo $this->pagination->getPagesCounter(); ?></p>
				<?php endif; ?>
			</div>
		<?php endif; ?>

	<?php endif; ?>
</div>
<!-- End K2 Category Layout -->


<script type="text/javascript">

(function($){ 
   $(window).load(function(){

   	$(window).resize(function(){
   		$windowWidth = $(window).width();
   	});

   	var $container = $('#isotopeContainer');

		$container.isotope({
			animationEngine: 'best-available',
			animationOptions: {
		      queue: false,
		      duration: 800
		    },
		    containerClass : 'isotope',
		    containerStyle: {
		      position: 'relative',
		      overflow: 'hidden'
		    },
		    hiddenClass : 'isotope-hidden',
		    itemClass : 'isotope-item',
		    itemPositionDataEnabled: false,
		    layoutMode : 'fitRows',
		    resizable: true,
		    resizesContainer : true,
		    sortBy : 'title',
  			sortAscending : true,
		    getSortData : {
			    title : function ( $elem ) {
			    	return $elem.attr('data-title');
			    },
			    date : function ( $elem ) {
			    	return $elem.attr('data-create');
			    },
			    views : function ( $elem ) {
			    	return parseInt( $elem.find('.catItemHits').text(), 10 );
			    }
			  },
		    transformsEnabled: !$.browser.opera // disable transforms in Opera
		});

		// filter items when filter link is clicked
		$('#filters a').click(function(){
			var selector = $(this).attr('data-filter');
			$container.isotope({ filter: selector });
			return false;
		});

		var $optionSets = $('#isotopeOptions .option-set'),
		    $optionLinks = $optionSets.find('a');

		    $optionLinks.click(function(){
		        var $this = $(this);
		        // don't proceed if already selected
		        if ( $this.hasClass('selected') ) {
		          return false;
		        }
		        var $optionSet = $this.parents('.option-set');
		        $optionSet.find('.selected').removeClass('selected');
		        $this.addClass('selected');
		  
		        // make option object dynamically, i.e. { filter: '.my-filter-class' }
		        var options = {},
		            key = $optionSet.attr('data-option-key'),
		            value = $this.attr('data-option-value');
		        // parse 'false' as false boolean
		        value = value === 'false' ? false : value;
		        options[ key ] = value;
		        if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
		          // changes in layout modes need extra logic
		          changeLayoutMode( $this, options )
		        } else {
		          // otherwise, apply new options
		          $container.isotope( options );
		        }
		        
		        return false;
		    });
	});
})(jQuery);

</script>