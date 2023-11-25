<?php
ob_start();
include 'models/model.session.php';
$session = new Session();
$session->setSessionVar('language_id', '2'); // 1 = English
include 'models/model.connection.php';
include 'classes/class.debugExceptions.php'; // class.myExceptions.php = public
setlocale( LC_MONETARY, 'fr_CH' );
$active_profiler  	= ( $_GET['page'] == 'profiler' ) ? 'class="active"' : '';
$active_uploader  	= ( $_GET['page'] == 'uploader' ) ? 'class="active"' : '';
$active_extender  	= ( $_GET['page'] == 'extender' ) ? 'class="active"' : '';
$active_writer    	= ( $_GET['page'] == 'writer'   ) ? 'class="active"' : '';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/zclip.js"></script>
		<script type="text/javascript" src="js/popup.js"></script>
		<script type="text/javascript" src="js/menuswapper.js"></script>	
		<script type="text/javascript" src="js/smoothscroll.js" ></script>
		<link rel="stylesheet" href="css/admin.css" type="text/css" />
	</head>
	<body>
		<div id="container">	
			<a name="top"></a>
				<div id="maincontent">
					<span style="float:left;">
					<a href="?page=home"><img src="img/burling.png" alt="burling" /></a>
					</span>
			
						<?php
						if ( $session->getSessionVar( 'login_status' ) == 1 ) {
								print '<span style="color:#999; font-size: 10px; float:right; text-align: right;">'.date('l').','. date('d-m-Y').'<br/>
								Logged in as <strong>'.$session->getSessionVar('username').'</strong> | <a href="?page=home&amp;action=logout">Log out?</a></span>';
						?>
						<div id="navigator">
							<ol>
								<li <?php print $active_extender; ?> >
									<a href="?page=extender&amp;action=category_list">
									PREFS
									</a>
								</li>
								<li <?php print $active_profiler; ?> >
									<a href="?page=profiler&amp;action=profile_list">
									ARTISTES
									</a>
								</li>
							
								<li <?php print $active_uploader; ?> >
									<a href="?page=uploader&amp;action=list">
									MEDIA
									</a>
								</li>
								<li <?php print $active_writer; ?> >
									<a href="?page=writer&amp;action=writing_list">
									TEXTES
									</a>
								</li>
							</ol>
						</div>
					<?php
				}
					?>
					<div id="content">
						<?php include 'switches/switch.'.$_GET['page'].'.php'; ?>
					</div>		
			</div>
				<div id="footer">
					<span style="color:#E7E7E7;"><strong>societe ecran</strong> media</span><br/><?php include 'txts/version.html'; ?>
					
					<a href="#top">page top</a>
				</div>
				
		</div>
	</body>
</html>