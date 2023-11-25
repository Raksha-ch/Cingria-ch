		
		
		   <div id="main" class="eightcol">
 		
				<h1><span>L'Association des Amis de Charles-Albert Cingria</span></h1>
                
                <p>
				<strong><?php print $txts[0]['writing_content'];?></strong>
				<!-- <img src="img/test.jpg" style="float:left; width: 120px; padding: 2% 2% 2% 0"> -->
				<br/><br/>  
				
				<div id="main_text">
				<?php print $txts[1]['writing_content'];?>
			    </div>
			   
			</div> 
	                 		 <div id="intro" class="fourcol last">  
								<div id="yellow_box">
									<span style="font-style: italic; margin-bottom: 12px; display: block;">Association des Amis de Charles-Albert Cingria</span>
									<strong>Date de création :</strong> 11 mai 1963<br/> 
									<strong>Cotisation annuelle :</strong> CHF 30.-<br/> 
									<strong>Nombre d'adhérents :</strong> 200 personnes<br/><br/> 
									<strong>Présidente :</strong> Mme Maryke de Courten<br/>
									<strong>Vice-président :</strong> M. Pierre-Marie Joris<br/> 
									<strong>Trésorier :</strong> M. Jean-Claude Maurer<br/> 
									<strong>Secrétaire :</strong> Mme Suzy Assal<br/>  
								</div>
							 </div>
							
							
					   <div class="fourcol"> 	
				
		  
					<h2><span>Adhérer à l'Association</span></h2>
				   <br/>
				<div id="bulletin">
				Devenez membre de l’Association et soyez régulièrement informé(e) de ses activités. Vous recevrez également les Petites Feuilles chez vous.
				<br/><br/> 
				<?php
				 foreach($documents as $row) {
					$file_url  = $row['dir_name'].'/'.$row['upload_file_name'].$row['upload_file_ext'];	
					print '<a href="http://www.cingria.ch/'.$file_url.'" class="pink_link">Télécharger le bulletin d\'adhésion</a>';
				    }
				 ?>
			   					
					</div>
                
				</div>