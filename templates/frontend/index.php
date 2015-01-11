<?php defined( '_JEXEC' ) or die; 

$view = JRequest::getVar("view");
$db = JFactory::getDBO();

$title_sufix = "";

if( $view == "car" ){
	$car = JRequest::getVar("car");

	$sql = 'select * from #__geocars_cars where id='.(int)$car.' limit 1';
	$db->setQuery( $sql );
	$car = $db->loadObject();
	
	$sql = 'select * from #__categories where id='.$car->catid = 'limit 1';
	$db->setQuery( $sql );	
	$category = $db->loadObject();	

	if( !empty( $category ) || !empty( $car ) )

	$title_sufix = " - ";
	$title_sufix .= $category->title." ".$car->name;

}

include_once JPATH_THEMES.'/'.$this->template.'/logic.php';

?><!doctype html>
<html>
<head lang="en">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	
	<title>შეაფასე ავტომობილი <?php echo $title_sufix ?> </title> 
	<meta name="description" content="გამოთქვი შენი მოსაზრება, მიეცი ხმა და დაეხმარე სხვებს სასურველი ავტომობილის შერჩევაში" />	    
	<meta name="keywords" content="ავტომობილი, საქართველო, შეფასება, კმაყოფილი, დისკუსია, კომენტარი">
	<meta property="og:title" content="">



	<link rel="stylesheet" type="text/css" href="<?php echo $tpath; ?>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<?php echo $tpath; ?>/fancybox/jquery.fancybox-v=2.1.5.css" type="text/css" media="screen">
    <link rel="stylesheet" href="<?php echo $tpath; ?>/css/font-awesome.min.css" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="<?php echo $tpath; ?>/css/style.css">	
	<link rel="stylesheet" type="text/css" href="<?php echo $tpath; ?>/css/custom.css">


	<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,600,300,200&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
	
	
	<link rel="prefetch" href="<?php echo $tpath; ?>/images/zoom.png">
	
		
	<meta property='fb:app_id' content='1499926956949411' />
	<meta property="fb:admins" content="100003158703394"/>
</head>

<body onselectstart="return false;" style="-moz-user-select: none;">
	<div class="navbar navbar-fixed-top" data-activeslide="1" style="border-bottom: solid 3px white;">
				
		<div class="container">
		
			<!-- .navbar-toggle is used as the toggle for collapsed navbar content -->
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			
			
			<div class="nav-collapse collapse navbar-responsive-collapse">
				<ul class="nav row">
					<li style="margin-right: 50px;" data-slide="1" class="col-12 col-sm-2"><a id="menu-link-1" href="#slide-1" title="Next Section"><span class="icon icon-home"></span> <span class="text">გვერდის საწყისი</span></a></li>
					<li style="margin-right: 120px;" data-slide="2" class="col-12 col-sm-2"><a id="menu-link-2" href="#slide-2" title="Next Section"><span class="icon icon-user"></span> <span class="text">როგორ გამოვიყენო აპლიკაცია?</span></a></li>
					
					<?php /* ?>
					<li data-slide="4" class="col-12 col-sm-2"><a id="menu-link-4" href="#slide-4" title="Next Section"><span class="icon icon-gears"></span> <span class="text">პროცესი</span></a></li>
					<li data-slide="5" class="col-12 col-sm-2"><a id="menu-link-5" href="#slide-5" title="Next Section"><span class="icon icon-heart"></span> <span class="text">კლიენტები</span></a></li>
					<?php */ ?>
					<li data-slide="6" class="col-12 col-sm-2"><a id="menu-link-6" href="#slide-6" title="Next Section"><span class="icon icon-envelope"></span> <span class="text">კონტაქტი</span></a></li>
				

				</ul>
				<div class="row">
					<div class="col-sm-2 active-menu"></div>
				</div>
			</div><!-- /.nav-collapse -->




		</div><!-- /.container -->
	</div><!-- /.navbar -->
	
	<?php /* ?>
	<!-- === Arrows === -->
	<div id="arrows">
		<div id="arrow-up" class="disabled"></div>
		<div id="arrow-down"></div>
		<div id="arrow-left" class="disabled visible-lg"></div>
		<div id="arrow-right" class="disabled visible-lg"></div>
	</div><!-- /.arrows -->
	<?php */ ?>
	
	<jdoc:include type="component" />

	<!-- === Slide 2 === -->
	<div class="slide story" id="slide-2" data-slide="2" style="border-top: 5px solid white;">
		<div class="container">
			<div class="row title-row">
				<div class="col-12 font-thin">კმაყოფილი ხართ, <span class="font-semibold">თქვენი ავტომობილით</span> შეაფასე და დაეხმარე სხვას სასურველი ავტომობილის შერჩევაში.</div>
			</div><!-- /row -->
			<div class="row line-row">
				<div class="hr">&nbsp;</div>
			</div><!-- /row -->
			
			<?php /* ?>
			<div class="row subtitle-row">
				<div class="col-12 font-thin">რაში გვეხმარება ეს <span class="font-semibold">აპლიკაცია</span></div>
			</div><!-- /row -->
			<?php */ ?>

			<div class="row content-row">
				<div class="col-12 col-lg-3 col-sm-6">
					<p><i class="icon icon-eye-open"></i></p>
					<h2 class="font-thin">  <span class="font-semibold">? ? ?</span></h2>
					<h4 class="font-thin">თუ თქვენ გყავთ ავტომობილი და ფრიად კმაყოფილი ხართ ან გყავთ და არ ხართ კმაყოფილი მაშინ...</h4>
				</div><!-- /col12 -->
				<div class="col-12 col-lg-3 col-sm-6">
					<p><i class="icon icon-laptop"></i></p>
					<h2 class="font-thin">ვებ <span class="font-semibold">აპლიკაცია</span></h2>
					<h4 class="font-thin">ჩვენი აპლიკაცია ზუსტად თქვენთვისა, დააფიქსირე შენი აქრი ამ ავტომობილზე და დაეხმარე სხვას გადაწყვეტილების მიღებაში</h4>
				</div><!-- /col12 -->
				<div class="col-12 col-lg-3 col-sm-6">
					<p><i class="icon icon-tablet"></i></p>
					<h2 class="font-thin">მობილური <span class="font-semibold">აპლიკაცია</span></h2>
					<h4 class="font-thin">აპლიკაციის მობილური ვერსია წარმოდგენილი იქნება მალე... :)</h4>
				</div><!-- /col12 -->
				<div class="col-12 col-lg-3 col-sm-6">
					<p><i class="icon icon-pencil"></i></p>
					<h2 class="font-semibold">განვითარება</h2>
					<h4 class="font-thin">გვადევნეთ თვალყური და საიტს დაემატება კიდევ ბევრი საინტერესო ფუნქცია რომელიც კიდევ უფრო გამოყენებადს და საინტერესოს გახდის აპლიკაციას.</h4>
				</div><!-- /col12 -->
			</div><!-- /row -->
		</div><!-- /container -->
	</div><!-- /slide2 -->
	
	
	<?php /* ?>
	<!-- === Slide 4 - Process 
	<div class="slide story" id="slide-4" data-slide="4">
		<div class="container">
			<div class="row title-row">
				<div class="col-12 font-thin">See us <span class="font-semibold">at work</span></div>
			</div><!-- /row -->
			<div class="row line-row">
				<div class="hr">&nbsp;</div>
			</div><!-- /row -->
			<div class="row subtitle-row">
				<div class="col-sm-1 hidden-sm">&nbsp;</div>
				<div class="col-12 col-sm-10 font-light">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</div>
				<div class="col-sm-1 hidden-sm">&nbsp;</div>
			</div><!-- /row -->
			<div class="row content-row">
				<div class="col-sm-1 hidden-sm">&nbsp;</div>
				<div class="col-12 col-sm-2">
					<p><i class="icon icon-bolt"></i></p>
					<h2 class="font-thin">Listening to<br><span class="font-semibold" >your needs</span></h2>
					<h4 class="font-thin">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</h4>
				</div><!-- /col12 -->
				<div class="col-12 col-sm-2">
					<p><i class="icon icon-cog"></i></p>
					<h2 class="font-thin">Project<br><span class="font-semibold">discovery</span></h2>
					<h4 class="font-thin">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</h4>
				</div><!-- /col12 -->
				<div class="col-12 col-sm-2">
					<p><i class="icon icon-cloud"></i></p>
					<h2 class="font-thin">Storming<br><span class="font-semibold">our brains</span></h2>
					<h4 class="font-thin">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</h4>
				</div><!-- /col12 -->
				<div class="col-12 col-sm-2">
					<p><i class="icon icon-map-marker"></i></p>
					<h2 class="font-thin">Getting<br><span class="font-semibold">there</span></h2>
					<h4 class="font-thin">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</h4>
				</div><!-- /col12 -->
				<div class="col-12 col-sm-2">
					<p><i class="icon icon-gift"></i></p>
					<h2 class="font-thin">Delivering<br><span class="font-semibold">the product</span></h2>
					<h4 class="font-thin">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</h4>
				</div><!-- /col12 -->
				<div class="col-sm-1 hidden-sm">&nbsp;</div>
			</div><!-- /row -->
		</div><!-- /container -->
	</div><!-- /slide4 -->
	
	<!-- === Slide 5 === -->
	<div class="slide story" id="slide-5" data-slide="5">
		<div class="container">
			<div class="row title-row">
				<div class="col-12 font-thin"><span class="font-semibold">Clients</span> we’ve worked with</div>
			</div><!-- /row -->
			<div class="row line-row">
				<div class="hr">&nbsp;</div>
			</div><!-- /row -->
			<div class="row subtitle-row">
				<div class="col-sm-1 hidden-sm">&nbsp;</div>
				<div class="col-12 col-sm-10 font-light">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. <br/><br/> The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero.</div>
				<div class="col-sm-1 hidden-sm">&nbsp;</div>
			</div><!-- /row -->
			<div class="row content-row">
				<div class="col-1 col-sm-1 hidden-sm">&nbsp;</div>
				<div class="col-12 col-sm-2"><img src="<?php echo $tpath; ?>/images/client01.png" alt=""></div>
				<div class="col-12 col-sm-2"><img src="<?php echo $tpath; ?>/images/client02.png" alt=""></div>
				<div class="col-12 col-sm-2"><img src="<?php echo $tpath; ?>/images/client03.png" alt=""></div>
				<div class="col-12 col-sm-2"><img src="<?php echo $tpath; ?>/images/client04.png" alt=""></div>
				<div class="col-12 col-sm-2"><img src="<?php echo $tpath; ?>/images/client05.png" alt=""></div>
				<div class="col-1 col-sm-1 hidden-sm">&nbsp;</div>
			</div><!-- /row -->
		</div><!-- /container -->
	</div><!-- /slide5 -->
	
	<?php */ ?>

	<!-- === Slide 6 / Contact === -->
	<div class="slide story" id="slide-6" data-slide="6">
		<div class="container">
			


		<jdoc:include type="modules" name="login_module_position" />


			<div class="row title-row">
				<div class="col-12 font-light"საკონტაქტო  <span class="font-semibold">ინფორმაცია</span></div>
			</div><!-- /row -->
			<div class="row line-row">
				<div class="hr">&nbsp;</div>
			</div><!-- /row -->
			<div class="row subtitle-row">
				<div class="col-sm-1 hidden-sm">&nbsp;</div>
				<div class="col-12 col-sm-10 font-light">თქვენ შეგიძლიათ გვიპოვოთ აქ</div>
				<div class="col-sm-1 hidden-sm">&nbsp;</div>
			</div><!-- /row -->
			<div id="contact-row-4" class="row">
				<div class="col-sm-1 hidden-sm">&nbsp;</div>
				<div class="col-12 col-sm-2 with-hover-text">
					<p><a target="_blank" href="#"><i class="icon icon-phone"></i></a></p>
					<span class="hover-text font-light ">ვმალავთ :D</span></a>
				</div><!-- /col12 -->
				<div class="col-12 col-sm-2 with-hover-text">
					<p><a target="_blank" href="#"><i class="icon icon-envelope"></i></a></p>
					<span class="hover-text font-light ">contact.giorgi@gmail.com</span></a>
				</div><!-- /col12 -->
				<div class="col-12 col-sm-2 with-hover-text">
					<p><a target="_blank" href="#"><i class="icon icon-home"></i></a></p>
					<span class="hover-text font-light ">თბილისი :)</span></a>
				</div><!-- /col12 -->
				<div class="col-12 col-sm-2 with-hover-text">
					<p><a target="_blank" href="#"><i class="icon icon-facebook"></i></a></p>
					<span class="hover-text font-light ">facebook/blacktie_co</span></a>
				</div><!-- /col12 -->
				<div class="col-12 col-sm-2 with-hover-text">
					<p><a target="_blank" href="#"><i class="icon icon-twitter"></i></a></p>
					<span class="hover-text font-light ">არ არის წარმოდგენილი</span></a>
				</div><!-- /col12 -->
				<div class="col-sm-1 hidden-sm">&nbsp;</div>
			</div><!-- /row -->
		</div><!-- /container -->
	</div><!-- /Slide 6 -->
	
	<!-- TOP.GE COUNTER CODE -->
	<script language="JavaScript" type="text/javascript" src="http://counter.top.ge/cgi-bin/cod?100+98312"></script>
	<noscript>
	<a target="_top" href="http://counter.top.ge/cgi-bin/showtop?98312">
	<img src="http://counter.top.ge/cgi-bin/count?ID:98312+JS:false" border="0" alt="TOP.GE" /></a>
	</noscript>
	<!-- / END OF COUNTER CODE -->

	

</body>

	<!-- SCRIPTS -->
	<script src="<?php echo $tpath; ?>/js/html5shiv.js"></script>
	<script src="<?php echo $tpath; ?>/js/jquery-1.10.2.min.js"></script>
	<script src="<?php echo $tpath; ?>/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="<?php echo $tpath; ?>/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="<?php echo $tpath; ?>/fancybox/jquery.fancybox.pack-v=2.1.5.js"></script>
	<script src="<?php echo $tpath; ?>/js/script.js"></script>
	<script src="<?php echo $tpath; ?>/js/custom.js"></script>
	<script src="<?php echo $tpath; ?>/js/bootstrap.min.js"></script>

	<!-- fancybox init -->
	<script>
	$(document).ready(function(e) {
		var lis = $('.nav > li');
		menu_focus( lis[0], 1 );
		
		$(".fancybox").fancybox({
			padding: 10,
			helpers: {
				overlay: {
					locked: false
				}
			}
		});
	
	});
	</script>

	


	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-58459928-1', 'auto');
	  ga('send', 'pageview');

	</script>

	<script>
		window.fbAsyncInit = function() {
		FB.init({appId: '1499926956949411', status: true, cookie: true,
		xfbml: true});
		};
		(function() {
		var e = document.createElement('script'); e.async = true;
		e.src = document.location.protocol +
		'//connect.facebook.net/ka_GE/all.js';
		document.getElementById('fb-root').appendChild(e);
		}());
	</script>


	

</html>