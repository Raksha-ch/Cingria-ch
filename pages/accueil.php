 <?php setlocale(LC_TIME , "fr_FR"); ?>   	

       <div id="main" class="eightcol">

        <h1><span>Accueil</span></h1>

                <p>
        <strong><?php print $txts[0]['writing_content'];?></strong>

        <br/><br/>
         <?php print $txts[1]['writing_content'];?>

        <div>

        <p><br/>
        <span class="pseudo_pink_link">Pour citer cette page :</span><br/>
        <em>Charles-Albert Cingria</em>. (2 mars 2012). L'Association des Amis de Charles-Albert Cingria. Page consultée le <?php print date(j); ?> <?php
        $mois = array('','janvier', 'février', 'mars', 'avril', 'mai', 'juin', 'juillet', 'août', 'septembre', 'octobre', 'novembre', 'décembre');
        print $mois[date(n)]; ?> <?php print date(Y); ?> à <?php print date("H:i") ?> à partir de <a href="https://<?php print $_SERVER['HTTP_HOST'] ?>/accueil"><?php print $_SERVER['HTTP_HOST'] ?>/accueil</a></p>
          </div>


         <div class="elevencol">
         <br/><br/>
         <p>
          <h2><span>Vagabondages avec Charles-Albert Cingria</h2></span><br/>
               Un film réalisé par Natalia Gadzina, produit par le Centre de recherches sur les lettres romandes, en partenariat avec Unicom, Université de Lausanne.
            <br/><br/>
             <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" poster="img/cingria-1500.png" data-setup="{}">
             <source src="videos/cingria-1500.mp4" type='video/mp4' />
                 <source src="videos/cingria-1500.webm" type='video/mp4' />
               </video>
               <br/>
               <em>Il faut bien avouer que son style, à première vue, paraissait un peu baroque. On aurait dit l’une de ces mosaïques qui sont faites d’un assemblage de petites pierres de toutes les couleurs, mais c’était des pierres - pas du tout immobiles - qui n’arrêtaient pas de bouger, de tourner, de donner tous leurs éclairs.</em> (Jean Paulhan)
               <br/> <br/>
               Vagabondages avec Charles-Albert Cingria est à l’image de cette évocation. Sa structure fragmentée qui entremêle images et courtes citations, l’utilisation des couleurs, le recours à des images d’archives et à des manuscrits de l’écrivain, reflètent la « mosaïque » d’une œuvre éclatée. Le discours de la narratrice est entrecoupé d’interventions de Cingria – auquel le comédien Jean-Paul Favre prête sa voix – qui le complètent, l’illustrent ou le nuancent. Le récit avance en toute liberté, empruntant des chemins de traverse ponctués – sur le plan visuel – par des clins d’œil au style et aux thèmes de prédilection de Cingria.

        </p>	
      </div>

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
          <br/>
          <h2><span><?php print $notice_bio[0]['writing_title']; ?></span></h2>
           <br/>
        <span id="bio">
          <?php print $notice_bio[0]['writing_content']; ?>
          </span>
          <br/>
          <span><a class="pink_link" id="show_more">lire la suite de la notice</a></span>
          <br/> <br/>
          <br/><br/>
          </p>



          <p>
          <div id="jacob_container">

          <h2><span><?php print $notice_jacob[0]['writing_title']; ?></span></h2>
           <br/>
          <span id="jacob">
          <?php print $notice_jacob[0]['writing_content']; ?>
          </span>

          </div>
          <br/><br/>
          </p>

        </div>
