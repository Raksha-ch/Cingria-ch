		
		
		   <div id="main" class="eightcol">
 		
				<h1><span>Accueil & Présentation du site</span></h1>

                <p>
				<strong><?php print $txts[0]['writing_content'];?></strong>
				
				<br/><br/>
				 <?php print $txts[1]['writing_content'];?>
 			</div>
	                 		 <div id="intro" class="fourcol last">
		  						<?php
		  						foreach ($citations as $key => $value) {
		  							print '<blockquote><p>'.$value['writing_content'].'</p><cite>'.$value['writing_description'].'.</cite></blockquote>';
		  						}
		  						?>
							
							 </div>
							
							
					   <div class="fourcol"> 	
				    <p>
					
					
					
					
					
					
					

					<h2><span><?php print $notice_bio[0]['writing_title']; ?></span></h2>
				   <br/>
					<?php print $notice_bio[0]['writing_content']; ?>
					<br/><br/><a class="pink_link" id="show_more">lire la suite de la notice</a>

				
					

					<br/>
					</p>
				</div>