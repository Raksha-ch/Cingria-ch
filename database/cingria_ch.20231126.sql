SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--
-- Database: `cingria`
--




DROP TABLE `admin`;CREATE TABLE `admin` (
  `admin_id` int(55) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `admin_surname` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `admin_email` varchar(55) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `admin_password` varchar(55) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `admin_group` tinyint(2) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


INSERT INTO admin VALUES
("19","Yannick","Saraillon","yansar","Ear4Rek0aiphee5e","1"),
("20","Admin","","chabert_13","Ear4Rek0aiphee5e","0"),
("21","Thierry","Raboud","thierry@raboud.com","eimeec4tu9Ahha5i","1");



DROP TABLE `bibliography`;CREATE TABLE `bibliography` (
  `bibliography_id` smallint(15) NOT NULL AUTO_INCREMENT,
  `bibliography_title` varchar(55) NOT NULL,
  PRIMARY KEY (`bibliography_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


INSERT INTO bibliography VALUES
("2","Hirundo Maris"),
("7","Ensemble Daedalus"),
("8","Marquis de Saxe"),
("9","Schola"),
("10","Trio Nota Bene");




DROP TABLE `bibliography_item`;CREATE TABLE `bibliography_item` (
  `bibliography_item_id` int(55) NOT NULL AUTO_INCREMENT,
  `bibliography_id` smallint(15) NOT NULL,
  `category_id` tinyint(3) NOT NULL,
  `upload_file_id` int(255) NOT NULL,
  `bibliography_item_title` varchar(255) NOT NULL,
  `bibliography_item_content` text NOT NULL,
  `bibliography_editor` varchar(255) NOT NULL,
  `bibliography_release` int(25) NOT NULL,
  `bibliography_item_rank` smallint(15) NOT NULL,
  PRIMARY KEY (`bibliography_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


INSERT INTO bibliography_item VALUES
("1","2","0","180","SAPPHO AND HER TIME","<p><strong>Arianna Savall</strong><br/>
\nsoprano et harpe<br/>
\n<strong>Giovanni Cantarini</strong><br/>
\nt�nor et cithare<br/>
\n<strong>Massimo Cialfi</strong><br/>
\nsalpinx, tympanon et k�mbala<br/>
\n<strong>Conrad Steinmann</strong><br/>
\naulos, k�mbala, se�stron et direction</p>","Deutsche Harmonie Mundi, 88697 671742","2010","0"),
("2","2","0","181","KLANG DER STAUFFER","<p><strong>Capella Antiqua Bambergensis<br/>Arianna Savall</strong><br/>soprano et harpe gothique<br/><strong>Petter Udland Johansen</strong><br/>t�nor et hardingfele</p>","CAB Records, CAB 12","2010","0"),
("3","2","0","182","CHANTS DU SUD ET DU NORD","<p>Sortie au printemps 2012<br/><br/>
\n<strong>Arianna Savall</strong><br/>
\nsoprano et harpe gothique<br/>
\n<strong>Petter Udland Johansen</strong><br/>
\nt�nor et hardingfele</p>","ECM New Series","2012","0"),
("4","2","0","184","PEIWOH","<p><strong>Arianna Savall</strong><br/>
\nsoprano, harpe triple, harpe gothique,<br/> harpe celtique et bol tib�tain<br/>
\n<strong>Petter Udland Johansen</strong><br/>
\nt�nor et hardingfele<br/>
\n<strong>Ferran Savall</strong><br/>
\nt�nor et luth<br/>
\n<strong>Javier Mas</strong><br/>
\nguitare acoustique<br/>
\n<strong>Mario Mas</strong><br/>
\nguitare espagnole<br/>
\n<strong>Bj�rn Kjellemyr</strong><br/>
\ncontrebasse<br/>
\n<strong>Dimitri Psonis</strong><br/>
\nsantur et lyre cr�te<br/>
\n<strong>Pedro Estevan</strong><br/>
\npercussions<br/>
\n<strong>David Mayoral</strong><br/>
\npercussions</p>","Alia Vox, AV 9869","2009","0"),
("8","2","0","185","BELLMANN","<p><strong>Petter Udland Johansen</strong><br/>
\nt�nor<br/><br/>
\n<strong>Ensemble Pratum Musicum</strong><br/>
\n<strong>Stefano Lai</strong><br/>
\nfl�te baroque<br/>
\n<strong>Nicole Hitz</strong><br/>
\nviole baroque<br/>
\n<strong>Jakob Ruppel</strong><br/>
\nluth<br/>
\n<strong>Christian Niedling</strong><br/>
\nvioloncelle baroque et gambe</p>","Swiss Pan, SP 51718","2005","0"),
("9","2","0","186","BELLA TERRA","<p><strong>Arianna Savall</strong><br/>
\nsoprano et harpe<br/>
\n<strong>Dimitris Psonis</strong><br/>
\nbendir, saz, bouzouki et oud<br/>
\n<strong>Pedro Estevan</strong><br/>
\nbendir, b�ton de pluie et caxixi<br/>
\n<strong>Julio Andrade</strong><br/>
\ncontrebasse</p>","AliaVox, AV 9833","2005","0"),
("10","2","0","187","NUOVE MUSICHE","<p><strong>Rolf Lislevand</strong><br/>
\narchiluth, guitare baroque et th�orbe<br/>
\n<strong>Arianna Savall</strong><br/>
\nsoprano et harpe triple<br/>
\n<strong>Pedro Estevan</strong><br/>
\npercussions<br/>
\n<strong>Bj�rn Kjellemyr</strong><br/>
\ncolachon et contrebasse<br/>
\n<strong>Guido Morini</strong><br/>
\norgue, clavecin<br/>
\n<strong>Marco Ambrosini</strong><br/>
\nnyckelharpa <br/>
\n<strong>Thor-Harald Johnsen</strong><br/>
\nchitarra battente </p>","ECM New Series, ECM 1922","2004","0"),
("11","2","0","188","JOYSSANCE VOUS DONNERAY","<p><strong>Arianna Savall</strong><br/>
\nsoprano et harpe<br/>
\n<strong>Thomas K�gler, </strong><br/>
\nfl�te et direction<br/>
\n<br/>
\n<strong>Il Desiderio</strong><br/>
\n<strong>Hans-Jakob Bolllinger,</strong><br/>
\ncornet<br/>
\n<strong>Agathe Gautschi</strong><br/>
\ncornet<br/>
\n<strong>Markus Bertsch</strong><br/>
\nsacqueboute<br/>
\n<strong>Susann Landert</strong><br/>
\ndulciane<br/>
\n<strong>Emanuele Forni</strong><br/>
\nth�orbe<br/>
\n<strong>Daniel R�egg</strong><br/>
\norgue</p>","Aeolus Music, AE-10066","2003","0"),
("12","7","0","189","MUSA LATINA","<p>Coproduction Festival du Haut Jura<br/>
\nPrix Classic Voice, Muse du Mois, 5 Diapason<br/></p>","Alpha 144","2009","0"),
("13","7","0","190","ROLAND DE LASSUS: ORACULA","<p>Coproduction Festival de la Semaine Sainte de Perpignan<br/>
\nChoc de la Musique - Choc de la Musique de l\'Ann�e 2006<br/>
\nCoup de Coeur de l\'Acad�mie Charles Cros - 5 Diapason</p>","Alpha, 095","2006","0"),
("14","7","0","191","SATURN AND POLYPHONY","<p>Coproduction Festival de Fontevraud, Radio 3 Belge,<br/>
\nCentre de Musique Ancienne de Tours<br/>
\nPrix Goldberg - Prix CD Compact Espagne - 5 Diapason</p>","Accent, 98130 D","1999","0"),
("15","7","0","192","THE ANATOMY OF MELANCHOLY","<p>Coproduction Festival de Fontevraud<br/>
\nffff Telerama - Prix CD Compact Espagne</p>","Accent, 98128 D","1998","0"),
("16","7","0","193","LES DEUX AMES DE SALOMON","<p>Coproduction Radio 3 Belge et Festival des Flandres 1996<br/>
\nDisque de l\'ann�e  1998, Le Monde - 5 Diapason</p>","Accent, 6119 D","1996","0"),
("17","7","0","194","LA FAVOLA DI ORLANDO","<p><i>Il primo, il secondo ed il terzo libro del Capriccio di Jachet Berchem</i><br/>
\nCoproduction Radio Suisse Romande - Espace 2 et RTB 3 Belge</p>","Accent, 95112 D","1995","0"),
("18","7","0","195","CANZONI VILLANESCHE ALLA NAPOLITANA","<p>Coproduction Festival de Beaune<br/>
\n10 de R�pertoire - 5 Diapason</p>","Accent, 9289 D","1994","0"),
("19","7","0","196","O VERGIN SANTA NON M\'ABBANDONARE","<p>5 Diapason</p>","Accent, 9289 D","1992","0"),
("20","7","0","197","EL CANCIONERO DE LA CATEDRAL DE SEGOVIA","<p>Coproduction Radio 3 Belge et Festival Antwerpen 1993<br/>
\nPrix Goldberg</p>","Accent, 9176 D","1991","0"),
("21","7","0","198","IL CANTAR MODERNO","<p>Diapason d\'Or - Coup de Coeur</p>","Accent, 9068 D","1990","0"),
("22","7","0","199","JOHANNES PRIORIS","<p>Coproduction Festival de la Semaine Sainte de Perpignan<br/>
\nPrix CD Compact Espagne - ffff Telerama - 5 Diapason</p>","Accent, 23153","1990","0"),
("23","7","0","200","DELIZIE NAPOLETANE OVVERO IN LODE DELLA VILLANELLA","<p>Coproduction Festival Estivoce de Pigna<br/>
\nPrix CD Compact Espagne - 5 Diapason</p>","Accent, 23159","1990","0"),
("24","7","0","202","RESONANZEN \'99","<p>Compilation</p>","ORF Production","1999","0"),
("25","7","0","203","MILLENNIUM OF MUSIC VOL. 3","<p>Millenium of Music Production</p>","Polystar ","2002","0"),
("26","7","0","204","FESTIVOCE FLORILEGIUM","<p>Compilation</p>","\'a Casa - Pigna","2008","0"),
("27","8","0","208","VARIATIONS GOLDBERG, BWV 988","<table>
\n<tr>
\n<td>J.S. Bach</td>
\n<td><i>����������������������Airs & 30 Variations</i></td>
\n</tr>
\n</table>
\n
\n<p><br/>Miruna Coca-Cozma, lecture de po�mes</p>","ARTLAB 09524","2009","0"),
("28","8","0","206","BONUS TRACK","<table>
\n<tr>
\n<td>G.F. H�ndel</td>
\n<td><i>Arriv�e de la Reine Saba</i></td>
\n</tr>
\n<tr>
\n<td>A. Borodin</td>
\n<td><i>Danses Polovtsiennes</i> Nr. 1 & 8</td>
\n</tr>
\n<tr>
\n<td>Traditionnel ha�tien��</td>
\n<td><i>Berceuse Cr�ole</i></td>
\n</tr>
\n<tr>
\n<td>M. Nyman</td>
\n<td><i>Songs for Tony Nr. 1</i></td>
\n</tr>
\n<tr>
\n<td>R. Widoeft</td>
\n<td><i>Valse Erica</i></td>
\n</tr>
\n<tr>
\n<td>A. Piazzolla</td>
\n<td>Extraits de <i>Maria de Buona Aires</i></td>
\n</tr>
\n<tr>
\n<td></td>
\n<td>avec Marielle Dubosson, chant</td>
\n</tr>
\n<tr>
\n<td>B. Peign�</td>
\n<td><i>Spirit of Highland</i></td>
\n</tr>
\n<tr>
\n<td>D. Schostakovitch</td>
\n<td><i>Valse Nr. 1</i></td>
\n</tr>
\n<tr>
\n<td>Ph. Collet</td>
\n<td><i>Poor Elise</i></td>
\n</tr>
\n<tr>
\n<td>E. Gillioz</td>
\n<td><i>Saxy Zap</i></td>
\n</tr>
\n<tr>
\n<td>J. Matitia</td>
\n<td><i>Chinese Rag</i></td>
\n</tr>
\n<tr>
\n<td>L. Caillet</td>
\n<td><i>Carnaval</i></td>
\n</tr>
\n</table>","ARTLAB 05501","2005","0"),
("30","8","0","207","MARQUIS DE SAXE","<table>
\n<tr>
\n<td>J.B. Singel�e����������������</td>
\n<td><i>Premier Quatuor op. 53</i></td>
\n</tr>
\n<tr>
\n<td>A. Kovach</td>
\n<td><i>Dualit�</i></td>
\n</tr>
\n<tr>
\n<td>E. Satie</td>
\n<td><i>Sports et divertissements</i></td>
\n</tr>
\n<tr>
\n<td>P. Itturalde</td>
\n<td><i>Suite hell�nique</i></td>
\n</tr>
\n</table>","GPP, CORIOLAN","1994","0"),
("29","8","0","205","ANGE & DEMON","<table>
\n<tr>
\n<td>A. Romero       �����������������            </td>
\n<td><i>Cuarteto latinoamericano</i></td> 
\n</tr>
\n<tr>
\n<td>E. Carter</td>
\n<td><i>Canonic Suite</i></td> 
\n</tr>
\n<tr>
\n<td>I. Albeniz</td>
\n<td><i>Trois Pi�ces</i></td> 
\n</tr>
\n<tr>
\n<td>P. Itturalde����������</td>
\n<td><i>Pequena Czarda</i></td> 
\n</tr>
\n<tr>
\n<td>A. Piazzolla</td>
\n<td><i>Suite de l\'Ange</i></td>
\n</tr>
\n<tr>
\n<td>C. Macy</td>
\n<td><i>Faust</i></td>
\n</tr>
\n</table>","ARTLAB 01988","2001","0"),
("31","9","0","210","ETOILES, ETOILES RESPLENDISSEZ!","<p>Disque de chants de No�l enregistr� � l\'occasion <br/>
\ndu 80e anniversaire de la Schola de Sion</p>","Schola de Sion","2010","0"),
("32","9","0","209","MUSIQUE SACREE A CAPPELLA","<p>En 2007, la Schola de Sion a r�alis� un enregistrement<br/>
\n en studio r�unissant tous ses coeurs.</p>","ARTLAB 07571","2007","0"),
("33","10","0","228","100% RUSSIAN","<p><strong>Lionel Monnet</strong><br/>
\npiano<br/>
\n<strong>Julien Zuffrey</strong><br/>
\nviolon<br/>
\n<strong>Xavier Pignat</strong><br/>
\nvioloncelle</p>","Claves, CD 2720","2007","0"),
("34","10","0","225","SWISS PERSPECTIVE","<p><strong>Lionel Monnet</strong><br/>
\npiano<br/>
\n<strong>Julien Zuffrey</strong><br/>
\nviolon<br/>
\n<strong>Xavier Pignat</strong><br/>
\nvioloncelle</p>","Claves, CD 2912","2009","0"),
("35","10","0","226","JEAN DAETWYLER TRIOS","<p>Concerto pour violon, violoncelle et piano<br/>
\n<br/>
\n<strong>Julien Zufferey</strong><br/>
\nviolon<br/>
\n<strong>Xavier Pignat</strong><br/>
\nvioloncelle<br/>
\n<strong>Lionel Monnet</strong><br/>
\npiano<br>
\n<strong>Caroline Delessert</strong><br/>
\nfl�te<br/>
\n<strong>Sarah Chardonnens</strong><br/>
\nclarinette<br/>
\n<strong>Laurent Galliano</strong><br/>
\nalto</p>","Gallo, CD 1216","2006","0");




DROP TABLE `books`;CREATE TABLE `books` (
  `book_id` int(55) NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(55) NOT NULL,
  `book_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `book_author` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `book_editor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `book_detail_1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `book_detail_2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `place` varchar(115) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `original_edition_date` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `re_edition_date` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_of_pages` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `book_category` tinyint(2) NOT NULL,
  `book_description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


INSERT INTO books VALUES
("1","108","<em>Bois sec Bois vert</em>","Charles-Albert Cingria","Gallimard","","collection ��L\'Imaginaire��","Paris","1983","","286","1","En 1933, Jean Paulhan �crivait � Andr� Gide : ��Je ne serais pas loin de voir dans Cingria un grand �crivain.�� C\'�tait aussi l\'avis de Claudel, de Ramuz, de Cocteau, de Max Jacob et de quelques autres. Quinze ans plus tard paraissait <em>Bois sec Bois vert</em> qui, aujourd\'hui encore, est comme le microcosme d\'une oeuvre que son auteur dispersait autant par n�cessit� que par insouciance, mais qui s\'est r�v�l�e avec le temps consid�rable, et d\'une rare coh�sion dans sa diversit�. Si plusieurs textes que r�unit <em>Bois sec Bois vert</em> semblent ainsi relever plus ou moins du genre de la nouvelle (��X�nia et le diamant��), du conte fantasmagorique (��Hyppolite hippocampe��), de l\'�tude litt�raire historique (��Lou Sordel��) ou arch�ologique (��Le Compte des formes��), ils appartiennent en fait comme les six autres au genre unique et ind�finissable que s\'est cr�� le g�nie vadrouilleur de Cingria. Captant l\'extraordinaire acuit� de sensations d\'un �tre qui n\'ignora que l\'indiff�rence, c\'est la langue elle-m�me ici qui voit, fait voir, et prom�ne d�lectablement le lecteur. Avec son m�lange d\'�laboration fastueuse et de spontan�it� d�flagrante, elle nous restitue de la m�me fa�on le suc des temps anciens o� d�ambulait l\'�rudition imaginative de l\'�crivain, et la vibration des instants de ce monde que son regard toujours neuf et libre enregistrait pour les magnifier. ��Je ne suis pas un nom��, a-t-il not�, ��il n\'y a que la vie qui m\'int�resse.�� En retour la vie �clate dans tout ce qui demeure sous le nom de Cingria. (Jacques R�da)"),
("2","137","<em>La Reine Berthe</em>","Charles-Albert Cingria","L\'Age d\'Homme","","collection ��Poche Suisse�� n��115","Lausanne","1992","","208","1","Fille de Burkhard de Souabe, Berthe fut reine de 922 � 937, ayant �pous� Rodolphe II, roi de la Bourgogne transjurane, lequel devint �galement roi de l\'Italie franque, ce qui laisse supposer que sa femme le suivit � Pavie, � superbe antique ville �, alors sa capitale. Mais il en fut d�log�, comme il �tait d\'usage, par Hugues, comte d\'Arles et de Provence, qui se fit couronner � Pavie en 926 et qui, pour avoir la paix, abandonna � Rodolf ses terres de Provence et des Bouches-du-Rh�ne. D\'o� un accroissement prodigieux de la Bourgogne helv�tique, dont Arles devenait la seconde capitale. A la mort de son mari, Berthe �pousa d\'ailleurs cet Hugues d\'Italie, mais elle le quitta vers 940 pour retrouver avec d�lectation son Pays de Vaud et ses habitations rustiques.<br/>D�s lors commence sa vie mythique. � Ses moutons lui donnant de la laine. Elle file et tient cette quenouille qu\'on lui voit sur les images. � Elle est devenue une sorte de bonne f�e, protectrice des humbles, qui appara�t �� et l�, de Soleure � Payerne, semant derri�re elle les tours, les �glises et les couvents.<br/>Charles-Albert Cingria est merveilleusement � son aise dans une histoire de ce genre o� il s\'agit d\'exalter les pouvoirs d\'une f�e (Berthe) et les vertus d\'une sainte (Ad�la�de, la fille de Berthe, �pouse d\'Othon, premier des empereurs romains germaniques). Il fallait sa passion du Haut Moyen Age pour �clairer l\'admirable fouillis des intrigues politico-familiales entre les rois et ducs romains germains bourguignons souabes et autres qui forment le tissu habituel de ce stup�fiant X<sup>e</sup> si�cle. Naturellement, il a lu ce qu\'il fallait lire, Liutprand, l\'abb� Dey, Muret, Poupardin, Mais il r�siste de toute la force de son imagination aux tentatives d�po�tisantes des historiographes du XIX<sup>e</sup> si�cle qui ne pensent qu\'� jeter le discr�dit sur les l�gendes et les traditions. Il faut au contraire profiter des marges obscures d\'un sujet pour lui inventer des structures pittoresques et lui donner les couleurs vraies de la vie. C\'est pourquoi, sous la plume de Cingria, ici comme dans son <em>Saint-Gall</em>, comme dans son <em>P�trarque</em>, l\'histoire devient une succulente chronique aux libres contrastes, aux d�veloppements inattendus entra�n�s par un g�n�reux d�sir de conter, o� il entre un peu de science, beaucoup de franche humeur, et une solide dose de po�sie."),
("3","162","<em>Portraits</em>","Charles-Albert Cingria","L\'Age d\'Homme","pr�face de Maryke de Courten","collection ��Poche suisse�� n� 135","Lausanne","1994","","132","1","\"De tous les talents de Charles-Albert Cingria, l\'un des plus singuliers est sans doute son art du portrait.<br/>Car s\'il excelle � peindre un paysage, � d�tailler l\'atmosph�re d\'une rue, � d�crire une maison ou � conter n\'importe quelle histoire pourvu qu\'elle d�passe la plate r�alit�. Charles-Albert est avant tout portraitiste.<br/> Il proc�de comme un peintre. Il isole son sujet jusqu\'� ce qu\'il soit si vivant que le cadre se reconstitue autour de lui. Il le sculpte, le colore, et tout � coup Ramuz est l� Strawinsky. Ansermet ou Modigliani refont surface.<br/><br/><br/>Tous les proc�d�s sont bons. Charles-Albert simule la distraction. Il parle d\'autre chose. Et tout � coup, il revient sur son sujet. Jamais auteur n\'aura autant rus�. Avec les conventions, les habitudes, les r�p�titions. Tout doit �tre neuf, surprenant. Il cherche l\'effet de surprise. Le choc. Et � chaque fois il r�ussit. Et chaque fois diff�remment.<br/>Bien entendu, il m�lange tout. Il y a, parmi ses sujets trait�s &mdash; on parlerait d\'eux comme d\'une nature morte &mdash; une chanoinesse du Bas-Hainaut. Monsieur Pitt et Alfred Jarry. Son ami Erik Satie, probablement l\'artiste qui lui ressembla le plus. Et puis, dans le d�sordre, les Parisiens de Montparnasse et les Suisses romands les plus terriens.<br/>Il fallait isoler ces portraits, leur donner toute leur saveur et leur relief. Le charme Cingria op�re � l\'�tat pur. Cela se termine par ��Moi et mon fr�re��. Alexandre et Charles-Albert. ��Je veux dire la diff�rence qu\'il y a entre moi et mon fr�re. Mais c\'est un peu �sot�rique, un peu thib�tain cette distinction��. Toute cette galerie pourrait s\'appeler moi et Ramuz, moi et Auberjonois, moi et L�autaud, moi et Max Jacob. Et, bien entendu, tout serait alors un peu thib�tain�!\""),
("4","128","<em>La Fourmi rouge et autres textes</em>","Charles-Albert Cingria","L\'Age d\'Homme","","collection ��Poche suisse�� n� 1","Lausanne","1995","1978, 1987","221","1","Au fur et � mesure qu\'elle se purifie des scories du temps, l\'oeuvre de Charles-Albert Cingria se r�v�le plus vivante dans son nimbe d\'�ternit�. On a dit le personnage l�gendaire que fut celui qu\'on appelle famili�rement Charles-Albert (1883-1954), ses fac�ties et ses esclandres, son entretien pittoresque et ses vagabondages, et les meilleurs esprits de ce temps ont c�l�br� l\'originalit� et la fra�cheur lustrale de son art d\'�crivain.<br/>Or il reste encore � d�couvrir l\'unit� et la profondeur d\'une pens�e r�fractaire � tous les syst�mes, mais tenue ensemble par une ��incessante joie po�tique�� et une �nergie spirituelle cristallisant dans une dorme qui a l\'�clat, la consistance et la structure myst�rieuse du diamant.<br/>Par o� qu\'on entre dans le <em>Labyrinthe harmonique</em> de son oeuvre, on est saisi par la m�me imm�diate jubilation, qui tient � la mani�re de tout ��infinitiser�� de Charles-Albert, capable de s\'�mouvoir devant un ��chat tout petit�� au nez���tatou� de macadam�� aussit�t apr�s s\'�tre livr� � la m�ditation la plus profonde sur le sens de la vie. C\'est que le po�te ne cesse d\'unifier l\'�tre, par le truchement de son verbe de cristal.<br/><br/>L\'on a dit que l\'oeuvre de Ramuz sugg�rait l\'id�e de grandeur. Quant � celle de Charles-Albert Cingria, c\'est au sceau du g�nie po�tique qu\'elle est marqu�e, qui, comme nous le rappelle Pierre-Olivier Walzer dans sa remarquable pr�face, a pour vertu premi�re de nous r�concilier avec l\'univers."),
("5","146","<em>Lettre au v�rificateur des eaux. Chroniques</em>","Charles-Albert Cingria","La Diff�rence","pr�face de Yves Scheller","","Paris","1995","","189","1","Charles-Albert Cingria surgit en f�vrier 1883 dans une famille de r�cente bourgeoisie genevoise, arriv�e de Dubrovnik (anciennement Raguse) et, en de��, de Constantinople. G�n�reusement dispos�s envers les arts et l\'imagination, extr�mement combustibles, les Cingria offrent un contraste �clatant avec la compacte bourgeoisie genevoise qui les traite en rastaquou�res. Mais aux rigueurs du dandysme succ�dent peu � peu celles de la d�che. Quand sa m�re d�c�de en 1913, Charles-Albert Cingria se fixe chichement � Paris, vend des objets, donne quelques cours r�tribu�s au cachet. Son mode de transport ordinaire est une bicyclette qu\'il porte jusqu\'� son cinqui�me �tage. On en fera ult�rieurement l\'accessoire principal des clich�s r�pandus sur sa m�moire. Ce volume recueille quelques chroniques de ses musardises. Il parle de tout et de rien : de l\'�ternit� et des chats, du bitume et de Dante. Bien qu\'il ait �t� trait� en �gal par les plus grands, en d�pit des efforts de Chessex, de R�da et de tant d\'autres, empaill� par les journalistes, ignor� des universitaires, Cingria a longtemps �t� rel�gu�. Il est pourtant outrageusement faux de faire de lui un marginal atypique, un exil� de l\'histoire enferm� dans sa Lotharingie mythique. Car enfin tout ce dont il nous parle appartient au domaine s�culier. Ce qu\'il a vu, lui l\'ami de Cocteau et de Dubuffet, est bien de ce temps et pleinement."),
("6","159","<em>Petites Feuilles</em>","Charles-Albert Cingria","L\'Age d\'Homme","pr�face de Pierre-Olivier Walzer","collection ��Poche Suisse�� n� 161","Lausanne","1997","","61","1","Certes les textes de Charles-Albert Cingria publi�s dans les cinq num�ros des <em>Petites Feuilles</em> ont �t� recueillis dans les <em>Oeuvres compl�tes</em>. Mais certaines contributions, non sign�es et non reprises, sont-elles peut-�tre �galement de lui. Sans compter que le contexte, l\'entourage dans lesquels ces morceaux sont ins�r�s contribuent � leur donner une couleur particuli�re, souhait�e par Cingria qui porte en l\'occasion le titre mirifique de ��R�dacteur en chef�� &mdash; son ami, le dessinateur, et en l\'occasion metteur en page, portant celui de ��Directeur��. Il �tait donc justifi� de reproduire une fois dans leur int�gralit� les cinq num�ros historiques n�s de cette amicale collaboration.<br/>Les m�rites conjugu�s de ces deux vaillants journalistes, soutenus et aid�s dans l\'occasion par quelques collaborateurs de fortune, ont fait de ces cinq fascicules une oeuvre de haute fantaisie dont le charme n\'est pas pr�s d\'�tre �vent�."),
("7","126","<em>Florides helv�tes et autres textes</em>","Charles-Albert Cingria","L\'Age d\'Homme","","collection ��Poche suisse�� n� 24","Lausanne","1997","1983-1993","197","1","Ce volume rassemble les �crits les plus importants de Charles-Albert Cingria consacr�s � la Suisse. Que ces textes soient si nombreux est une esp�ce de paradoxe. Quoique n� � Gen�ve, C.-A. Cingria d�testait qu\'on f�t de lui un �crivain prisonnier de fronti�res nationales. En 1910, dans la grande querelle qui mit fin � <em>La Voile latine</em>, la revue qui r�unissait les espoirs de la nouvelle litt�rature romande, C.-A. Cingria et son fr�re Alexandre, fervents lecteurs de <em>L\'Action fran�aise</em>, appartenaient au camp des Romains, universalistes, oppos� � celui des Suisses (Robert de Traz, Gonzague de Reynold), qui luttaient pour la renaissance d\'une culture helv�tique. Un peu plus tard, toute id�ologie oubli�e, Charles-Albert savoure tout le plaisir d\'exister en n\'importe quel endroit du monde. Partout il exerce avec une passion amus�e sa facult� de sentir. Alors, les hasards de sa vie le ramenant souvent en Suisse, pourquoi pas Lausanne, Berne, Gen�ve, Fribourg, tous lieux charg�s de pittoresque ou d\'impr�vu ? ��Je ne puis vous dire ce que j\'aime les rues, s\'exclame-t-il. Dans toutes les villes, mais surtout celle-ci.�� Celle-ci, c\'est Gen�ve ; mais aussi toute ville, toute campagne, tout pays r�el ou r�v� ou un certain tonus de vie lui permet de se r�concilier avec son �tre dans le monde. Les circonstances firent que ce fut souvent le cas en Suisse, ainsi qu\'en t�moignent les textes majeurs ici r�unis : <em>Impressions d\'un passant � Lausanne</em>, ��Ce pays qui est une vall�e��, <em>Musiques de Fribourg</em>, <em>Le Parcours du Haut-Rh�ne </em>et <em>Florides helv�tes</em>.<br/><br/>Charles-Albert Cingria (1883-1954), n� et mort � Gen�ve, v�cut en �crivain marginal, notamment � Paris o� il �tait tenu pour leur �gal par des �crivains comme Claudel, Cocteau, Jouhandeau, Tzara. Gr�ce � la protection de Ramuz, il collabora r�guli�rement � <em>Aujourd\'hui</em>. Gr�ce � celle de Paulhan, il donna d\'�tincelantes chroniques � <em>La Nouvelle Revue fran�aise</em> qui firent sa r�putation en France. Passionn� de Haut Moyen Age, il a donn� des livres d\'une vivante �rudition sur des th�mes difficiles : le rythme des neumes, la famille de la reine Berthe, les troubadours, la musique m�di�vale, l\'influence de Notker le B�gue. Passionn� de vie, il a �crit quelques petits livres d\'impressions sur tous sujets (<em>Stalactites</em>, <em>Bois sec Bois vert</em>) d\'une merveilleuse fantaisie."),
("8","111","<em>Les Autobiographies de Brunon Pomposo</em>","Charles-Albert Cingria","Editions des Lettres de Lausanne","","","","1928","","99","3","<em>Les Autobiographies de Brunon Pomposo</em> occupent une place de pr�dilection dans l\'oeuvre de Charles-Albert Cingria, car ce texte, aussi mince soit-il constitue en fait, au terme d\'une longue maturation, son premier r�cit d\'envergure.<br/>On ne connaissait jusque-l� de Cingria qu\'une palette de textes �parpill�s principalement dans <em>Les P�nates d\'Argile</em>, <em>La Voile latine</em> ou encore <em>La Voix cl�mentine</em>, tous textes dat�s des premi�res ann�es du si�cle. Rien ne semble presser Charles-Albert Cingria d\'�crire avant et apr�s la Premi�re Guerre mondiale. Il voyage, musarde � sa guise, cherche sa pente. Ce n\'est qu\'en 1927 qu\'il sortira de cette l�thargie avec un texte consacr� � la peinture et, enfin, date inaugurale, 1928, car il n\'arr�tera plus d\'�crire, la parution des <em>Autobiographies</em> aux Editions des Lettres de Lausanne pour le compte des <em>Cahiers vaudois</em>.<br/>Certaines ressemblances entre Brunon et Charles-Albert indiquent que ces <em>Autobiographies</em> sont aussi une autobiographie. Avec les transpositions les plus fantaisistes dont ses lecteurs feront post�rieurement leur r�gal. Tout est vrai et rien n\'est vrai dans Cingria. On reconna�t les paysages favoris qui d�fileront dans son oeuvre�: Gen�ve, les Etats sardes, de Douvaine � Turin en passant par Aoste et la vraie Sardaigne, celle des r�cifs de Serpentera. Le charme des <em>Autobiographies</em> tient en grande part de retrouver dans ce premier r�cit tout ce qui constituera par la suite l\'univers intimiste, et la saveur inimitable de Cingria. N\'est-ce pas lui, en pr�lude � toute son oeuvre, qui confiait � son ami Adrien Bovy�en 1903�: ��Il n\'y a gu�re que les paroles qui semblent d\'abord inutiles qui comptent dans une oeuvre���?"),
("9","113","<em>Le Carnet du chat sauvage</em>","Charles-Albert Cingria","Fata Morgana","","","Fontfroide-le-Haut","2000","","43","1","��Je pense qu\'il faudrait redonner sa juste importance au chat.�� On n\'en finit pas de d�couvrir Cingria. En grand admirateur, Pierre Alechinsky a eu envie d\'illustrer ce ��carnet��, bien entendu autobiographique, o� c\'est le Cingria vagabond qui transpara�t dans la figure f�line. Compos� en ��description ambulatoire��, le r�cit se perd en digressions, surgit brusquement, ronronne placidement ou sort ses griffes, pour finalement ne plus avoir d\'importance, tant c\'est le charme du style qui s\'impose, l�ger ou grave, s�rieux ou badin. Inimitable. (Neuf illustrations en deux couleurs par Pierre Alechinsky.)"),
("10","134","<em>La Grande Ourse</em>","Charles-Albert Cingria","Gallimard","","","Paris","2000","","90","1","In�dit, <em>La Grande Ourse</em> t�moigne � la perfection de ce qui fut, beaucoup plus qu\'un th�me litt�raire des �crits de Cingria, l\'un des ressorts de sa vie vou�e par les astres � un perp�tuel besoin de partir et de repartir.<br/>C\'est presque un r�cit de fiction pure (comme ��<em>d�mantibul�</em>��, pour reprendre un de ses mots favoris), genre assez rare illustr� par son oeuvre si riche en impr�vus. Autrement que dans ses chroniques, mais avec la m�me libert�, le m�me g�nie verbal, s\'y donne libre cours par bonds, virages, caprices, coups de th��tre, un sens � la fois mystique, humoristique, pratique et sans doute autobiographique du merveilleux."),
("11","156","<em>Pendeloques alpestres</em>","Charles-Albert Cingria","Zo�","postface de Anne Marie Jaton","collection ��Minizo頻 n� 51","Carouge-Gen�ve","2001","","41","1","Dans ce texte libre et renversant, la montagne et la plaine, le r�el et le fantastique, les inqui�tantes hauteurs et la plaine �tale, rassurante et stable, l\'homme et le chien, le vivant et le mort se r�pondent, se compl�tent et �changent leurs voix. Monter et descendre repr�sentent, dans l\'oeuvre de Cingria (1883-1954), la fusion jubilatoire des contraires, l\'extraordinaire �quilibre de l\'univers, tout ce qui sonne juste, tout ce qui est, comme la montagne, joyau du monde."),
("12","168","<em>Correspondance avec Igor Strawinski</em>","Charles-Albert Cingria","L\'Age d\'Homme","�dition Pierre-Olivier Walzer","collection ��Nouvelles correspondances de Charles-Albert Cingria�� n�1","Lausanne","2001","","89","1","Pendant son s�jour en Suisse, dans les ann�es 1914-1920, Igor Strawinsky, qui �tait d�j� l\'auteur remarqu� du <em>Sacre du printemps</em> et de <em>Petrouchka</em>, avait nou� des relations amicales avec l\'intelligentsia romande de l\'�poque, group�e sous l\'�gide des <em>Cahiers vaudois</em>, avec Ramuz en particulier avec qui il composera bient�t la fameuse <em>Histoire du soldat</em>. Mais il fut tout de suite attentif �galement � la pr�sence, dans le groupe, du jeune musicologue Charles-Albert Cingria, qui nourrissait sur la musique des id�es parall�les aux siennes. Il avait du plaisir � le retrouver, entre Morges et Vevey, et � discuter avec lui de la th�orie, d�j� d�velopp�e dans un article de <em>La Voile latine</em> (��Essai de d�finition d\'une musique lib�r�e des moyens de la raison discursive��), selon laquelle est condamnable la musique illustration de sentiments, et seule d�fendable la musique non sentimentale visant � une ��d�lectation sup�rieure��. D�s lors se noua entre les deux hommes une solide amiti� qui dura autant que leur vie, et qui se traduisit par une correspondance, certes assez d�cousure, �tant donn� la vie fort agit�e et vagabonde du musicien, mais toujours franche et pleine d\'int�r�t. En 1932, quelques passages du <em>P�trarque</em> de Charles-Albert enchant�rent Strawinsky et valurent � leur auteur une grande citation �logieuse dans le second volume des <em>Chroniques de ma vie</em>. A Paris, Charles-Albert est l\'invit� de la plupart des premi�res de musicien, il est aussi son invit� dans sa loge, � sa table, dans les divers refuges savoyards o� l\'am�nent les maladies de sa femme et de sa fille. Et Charles-Albert sera encore de la premi�re du <em>Rake\'s Progress</em>, � Venise, en septembre 1951.<br/>Rien de plus passionnant que les �changes amicaux entre un esprit aussi original que celui de Cingria avec l\'un des plus grands cr�ateurs de son �poque."),
("13","147","<em>Lettres � Henry-Louis Mermod</em>","Charles-Albert Cingria","L\'Age d\'Homme","�dition Marie-Th�r�se Lathion et Jean-Christophe Curtet","collection ��Nouvelles correspondances de Charles-Albert Cingria�� n��2","Lausanne","2001","","187","1","Henry-Louis Mermod s\'est assur� le m�rite devant la post�rit� d\'avoir �t� un merveilleux �diteur, m�c�ne et collectionneur, � une �poque qui suivait l\'�panouissement de la litt�rature romande gr�ce au groupe des <em>Cahiers vaudois</em>. Il fut en particulier l\'�diteur de C. F. Ramuz dont il publia, par conviction et amiti�, presque tous les titres � partir de 1927, et surtout la splendide &mdash; par le format, la couleur, la typographie, le papier &mdash; �dition des <em>Oeuvres compl�tes</em>. Il s\'int�ressa �galement � Charles-Albert Cingria, tout en comprenant qu\'il n\'�tait pas possible d\'en faire un �crivain grand public. Il le publia donc sous forme de plaquettes fort soign�es, <em>Pendeloques alpestres</em>, <em>Le Seize Juillet</em>, <em>Le Canal exutoire</em>, <em>Impressions d\'un passant � Lausanne</em>, <em>L\'Eau de la dixi�me milliaire</em>, mais tir�es � un nombre tr�s restreint d\'exemplaires. Ces diverses publications, et d\'autres qui rest�rent � l\'�tat de projets, donn�rent lieu, entre l\'�diteur et l\'�dit�, durant vingt ans, � des tractations infinies dont on trouve heureusement l\'�cho dans les pittoresques lettres ici rassembl�es. Pittoresques, mais souvent aussi r�fl�chies et p�n�trantes quand Charles-Albert prend vis-�-vis de son �diteur la d�fense de son texte et de son �criture. Mermod se montre presque toujours grand seigneur, d\'une bienveillance � toute �preuve, constamment dispos� � pousser Charles-Albert � lui fournir des pages � publier ou � collectionner constamment ouvert et g�n�reux. Charles-Albert de son c�t� tergiverse, promet, oublie de tenir, prend du retard, se r�pand en excuses ou en r�criminations, cherche un difficile �quilibre entre la mauvaise foi et la sinc�re gratitude, d�couvrant une fois de plus l\'humeur et les humeurs, parfois aussi la conscience et le s�rieux, que ses lecteurs, pour leur plus grand plaisir, ont appris � conna�tre et � admirer. (P.-O. Walzer)"),
("14","129","<em>G�ographie vraie</em>","Charles-Albert Cingria","Fata Morgana","postface de Jacques R�da","","Fontfroide-le-Haut","2003","","42","1","D�couvrir un nouveau texte de Cingria, c\'est faire, toujours, l\'exp�rience de l\'�tonnement pur, � mille lieues du spectacle et des ��pseudo-modernit�s�� qu\'il fustige en ces lignes, d\'un �tonnement dont le seul ressort est une vision singuli�re et puissante. Les sangliers ��tr�s mosa�que romaine�� qui traversent ce texte, entre cent choses, tiennent dans le bestiaire cingriesque une place essentielle. Ils sont l\'image de la force et de la sauvagerie, celle de cet ��homme pal�olithique�� que l\'auteur se plaisait � revendiquer. Dans sa postface � ce texte totalement in�dit, Jacques R�da �lucide certains points de ce riche rapport de Cingria au monde animal, et, cons�quemment, � celui des hommes. (Contient aussi un portrait de l\'auteur par Glieb Eristavi. Dessins de sangliers et postface par Jacques R�da. Notes de Jean-Christophe Curtet.)"),
("15","117","<em>Florides helv�tes de Charles-Albert Cingria</em>","Alain Corbellari, Pierre-Marie Joris","ACEL","","Gollion, Infolio","Bienne","2011","","109","2","<em>Florides helv�tes</em> recueille les principaux textes que Cingria a consacr�s � la Suisse. Un pays qui l\'a vu na�tre, mais qu\'il aime � refa�onner en le d�paysant. Le cosmopolitisme affich� de l\'�crivain (il se dit ��Constantinopolitain c\'est-�-dire Italo-franc levantin��), l\'acuit� de sa perception, l\'ivresse des impressions qu\'il nous fait �prouver devant � simplement ce qui existe �, sa dr�lerie d�sar�onnante et son style sid�rant, tout chez lui concourt � renouveler notre vision des choses et � nous transporter dans un monde nouveau. A la fois m�di�val et ultra-moderne, Cingria est l\'homme libre par excellence. Il ne nous fait pas seulement visiter la Suisse�; il nous entra�ne dans un voyage � travers le temps et nous fait partager l\'exp�rience d\'un homme qui r�invente le monde en po�te.<br/>Les auteurs, m�di�vistes, ont trouv� en Cingria un formidable stimulant, un auteur dont l\'�criture est d\'une modernit� qui ne le c�de en rien � la litt�rature la plus neuve."),
("16","158","<em>Le Persil</em>","","journal litt�raire","","n� sp�cial 48-49-50","Lausanne","2011","","48","2","\"A l\'occasion du lancement, aux Editions de l\'Age d\'Homme, des nouvelles Oeuvres compl�tes du ��fantasque amateur��, le journal Le Persil a souhait� faire revivre l\'�crivain, son style et son oeuvre, au travers des mots de ceux qui le connaissent le mieux�: ses lecteurs�! Anecdotes, premiers �blouissements, t�moignages, conseils de lectures, br�viaires, images, souvenirs, analyses ou simples �vocations composent ce num�ro.<br/>Pour donner corps � cette p�r�grination en forme d\'hommage, Le Persil, comme � son habitude, a ratiss� large�: sp�cialistes, professeurs, collectionneurs, �crivains, journalistes, c�toines, amateurs, bouquinistes, critiques, chemisiers de luxe...<br/>Contient des collaborations de Philippe Jaccottet, Pierre-Alain T�che, Corinne Desarzens, Pierre Vo�lin, Jean-Louis Kuffer, Fran�ois Deblu�, Patrick Amstutz, Jean-Dominique Humbert, Claude Tabarini, Alain Corbellari, Bruno Ackermann, Alain Herv�, Isabelle R�f, Anne Marie Jaton, Cyrille Fran�ois, Nicolas Lambert, Laurence Chauvy, Agn�s Dargent et Daniel Vuataz. Contient dix in�dits de Cingria�: ��Chronique carapac�e��, ��[Le D�sert n\'est pas infini...]��, ��[Un trois-m�ts en perdition...]��, ��[Quelquefois on aime �perdument un livre...]��, ��Les Chats en vacance��, ��Chronique caniculaire��, ��Copyright by...��, ��Grimoire��, ��Nombres intersid�raux�� et ��La Femme qui chante��.<br/><br/><em>Le Persil</em> peut �tre command� par courrier �lectronique � Lausanne, aupr�s de son directeur Marius Daniel Popescu (mdpecrivain@yahoo.fr).\""),
("17","118","<em>La Civilisation de Saint-Gall</em>","Charles-Albert Cingria","Payot","","collection des ��Cahiers romands�� n� 5","Lausanne","1929","","","3","A plus d\'une reprise, M. Charles-Albert Cingria s\'est occup� des s�quences latines modul�es au IX<sup>e</sup> si�cle, par Notker, moine de Saint-Gall. Non seulement, il leur attribue toute une nouvelle po�sie franque mais il juge qu\'elles sont les anc�tres de la litt�rature de Ramuz et de Cendrars. Il n\'est donc pas surprenant que, m�lomane �pris de la renaissance rythmique qui rayonna de Saint-Gall du VIII<sup>e</sup> au X<sup>e</sup> si�cle, il lui consacre maintenant un livre o� l\'imagination divinatrice se joue � travers la science et le document. Artiste mais �rudit, �rudit mais artiste, tel nous appara�t l\'auteur de La Civilisation de Saint-Gall, commentateur passionn� du g�nie gr�gorien, homme dont la musique est la nourriture au moins autant que le voyage. (Jean Nicollier, <em>Gazette de Lausanne</em>, 20 octobre 1929, p. 1.)<br/><br/><br/>A lire le volume que M. Charles-Albert Cingria vient de publier, vous recevez l\'impression d\'une farouche originalit�, impression � laquelle concourent diverses remarques sugg�r�es par votre lecture�: la premi�re, que l\'auteur poss�de une �rudition in�branlable et d\'une richesse inou�e�; la deuxi�me, qu\'il �crit d�licieusement�; la troisi�me, qu\'il go�te parfois un solide plaisir � se moquer des gens�; la quatri�me, qu\'il sait parfaitement que le public ne lui en saura pas moins gr�. J\'arr�te cette liste�; vous la continuerez fort bien sans moi. En total, les initi�s rendront hommage � l\'admirable documentation, � la science de M. Cingria�; et les non initi�s, en se tenant un peu plus loin, flaireront la valeur de ce livre pour peu qu\'ils aient le nez fin.<br/>br/>C\'est l� un ouvrage de pal�ographie musicale, �crit par un savant gourmand, spirituel, � l\'enthousiasme vibrant, � la critique pr�cise, s�rieux sans �tre cuistre, farceur � ses heures. L\'auteur nous montre, dans le couvent de Saint-Gall, le centre de l\'activit� musicale occidentale, du VIIIe au Xe si�cle. A Saint-Gall, venant d\'Irlande, arrivaient  de g�n�ration en g�n�ration des hommes admirablement z�l�s et cultiv�s, musiciens, peintres, po�tes. Ainsi, de cette abbaye �mana la grande renaissance rythmique qui donna le branle � la France, � l\'Italie, � l\'Angleterre, � l\'Allemagne, et sans laquelle on ne saurait comprendre la musique et la po�sie europ�enne. Cette vieille musique de la liturgie, dont Mozart disait qu\'il aurait donn� tout son oeuvre pour en avoir fait trois notes, M. Cingria se penche sure elle avec des gestes d\'amoureux�; puis il nous conduit par la main, nous initiant � toutes les d�couvertes dans les tropaires et les graduels, aux s�quences de Notker le B�gue, aux tropes de Tutilon. Si vous ne comprenez pas ce qu\'il vous explique &mdash; avec cette candeur des �rudits qui ne supportent jamais la somme que peut receler un regard interrogateur &mdash; et bien�! voyez le vivre ces neumes et ces rythmes, les respirer, leur insuffler sa vie propre. Le spectacle en vaut la peine�; vous aurez l\'image du savant, de l\'artiste qui se donne totalement � l\'objet de ses admirations. Son �merveillement m�me vous �merveillera. Jusqu\'au moment o�, vous observant du coin de l\'oeil, il vous fera donner dans un panneau que vous prenez pour une porte de sortie.<br/>Une bonne pr�face de M. Stelling Michaud pr�c�de ce petit livre fort bien pr�sent�, comme tous ceux que publient les Cahiers romands et illustr� de nombreuses planches hors texte, �vocations na�ves d\'un pass� int�gralement d�vou� aux int�r�ts sup�rieurs de la vie. (P. C., <em>Journal de Gen�ve</em>, 7 septembre 1929, p. 2.)"),
("18","160","<em>P�trarque</em>","Charles-Albert Cingria","Payot","","collection des ��Cahiers romands�� n� 8","Lausanne","1932","","","3","M. Charles-Albert Cingria donne d\'abord � ses lecteurs une courte introduction historique et biographique. Il conte la naissance de P�trarque � Arezzo, son d�part avec sa famille pour Avignon o� r�sident les papes, ses �tudes faites sans enthousiasme � Montpellier et � Bologne, ses voyages, la rencontre de Laure. Les chapitres qui suivent sont consacr�s � l\'oeuvre du po�te et � l\'�tude de son �poque. M. Cingria distingue en P�trarque deux po�tes : le po�te lyrique � rattach� encore � une �cole proven�ale � et le po�te imitateur des anciens qui composa les �glogues latines.<br/>L\'auteur ne cache pas sa pr�f�rence pour le premier. Et fait valoir son point de vue avec esprit. (<em>Gazette de Lausanne</em>, 7 mars 1933, p. 4.)"),
("19","167","<em>Stalactites</em>","Charles-Albert Cingria","Guilde du Livre","","vol. 37","Lausanne","1941","","","3","Le prestigieux fantaisiste Ch.-A. Cingria donne toute la mesure de son talent dans ce recueil de textes. De <em>Pendeloques alpestres</em> � � Graffiti � et � � Lou Sordel �, l\'auteur nous conduit myst�rieusement par les m�andres nostalgiques du macadam � la po�sie et au fantastique des sommets et enfin � la fantaisie des troubadours. Les huit dessins de Ren� Auberjonois qui illustrent ce volume en donnent un ensemble de grande valeur artistique et litt�raire. (<em>Bulletin mensuel de la Guilde du Livre</em>, n� 10, octobre 1947, p. 2.)<br/><br/>La lecture des Stalactites de Ch.-A. Cingria me donne un plaisir si vif que je m\'�tonne de ne pas le voir �prouver par tout le monde. Je me pose la question : Pourquoi des �tres humains, b�tis � peu pr�s comme moi, ne go�tent-ils pas la m�me jubilation � ces textes �tonnants : <em>Pendeloques alpestres</em>, <em>Seize juillet</em>, � Recensement �, � Lou Sordel �, � Rue des Canettes �, � Brumaire savoisien �, � Graffiti � ? Est-ce peut-�tre, justement, parce qu\'ils sont �tonnants ? [...] Charles-Albert Cingria est un guide incomparable. Il ne prendra pas le plus court chemin pour vous mener le plus vite possible o� vous appellent vos � affaires �, soyez-en s�r. Mais il vous fera observer mille merveilles que vous c�toyez chaque jour sans les voir. [...] Surtout ne prenez pas Cingria pour un humoriste qui cherche des � mots piquants � � la fa�on de Jules Renard. Cingria est constamment ravi par la splendeur des choses les plus communes, dont l\'habitude nous cache la signification et la beaut� ; ce qu\'il d�couvre � chaque pas, ce n\'est pas une pitrerie, c\'est... disons, le doigt du Cr�ateur. Car, vous l\'avez bien senti, Cingria pense en philosophe autant qu\'en po�te, mais il refuse de jamais disjoindre ces deux modes de contemplation. [...] Il existe assez de romans, assez de drames, d\'intrigues et d\'histoires. Quel autre que Cingria vous invite r�ellement � une promenade dans la vie et dans l\'univers, avec tout ce qu\'une promenade �voque de d�couverte, d\'�merveillement et de radieuse fra�cheur ? (Elie Gagnebin, <em>Bulletin mensuel de la Guilde du Livre</em>, n� 11, novembre 1944, pp. 183-184.)"),
("20","136","<em>La Reine Berthe et sa famille</em>","Charles-Albert Cingria","Trois Collines","","collection ��Po�tique de l\'Histoire��","Gen�ve","1947","","","3","M. Charles-Albert Cingria a une mani�re � lui de traiter l\'histoire. C\'en est d\'ailleurs une excellente. Il la consid�re non pas seulement comme le r�cit de tout ce qui s\'est pass�, mais comme un �l�ment de construction, de f�condation, pour les g�n�rations � venir. C\'est-�-dire qu\'� ses yeux l\'histoire doit donner le go�t de l\'histoire � ceux qui la lisent, et par cons�quent le go�t de vivre aussi pleinement et largement que ceux dont on suit la vie. Source d\'inspiration, de beaut� confortante et de ferveur g�n�reuse, telle il la voit. � Il n\'y a que ce qui est beau qui soit vrai �, dit Charles-Albert Cingria. Et il nous persuade que c\'est vrai, ce qui est d�j� bien beau.<br/>Le sujet qu\'il a choisi, <em>La Reine Berthe et sa famille</em> �tait propre � unir d\'heureuse mani�re les donn�es historiques et les tableaux qu\'inspirent les traditions et les l�gendes. Les premiers sont rares : quelques t�moignages contemporains situant Berthe dans l\'ancien royaume burgonde. D\'autre part, c\'�tait une f�e que la reine fileuse, et sa fille Ad�la�de, imp�ratrice romaine du Saint-Empire, �tait une sainte. Et c\'est bien pour cela qu\'elles ont charm� Charles-Albert Cingria, en lui ouvrant un monde o� se pouvaient donner libre cours sa fantaisie, sa ferveur, et aussi son attachement aux textes.<br/>Car vous ne trouverez pas plus strict observateur des documents que ce po�te capricieux, vagabond dans l\'�me et sans cesse �merveill�, que passionnent �galement des histoires d\'enl�vement et les chapiteaux de Payerne, les cartes de g�ographie, les vases d\'or et les tuniques peintes. Charles-Albert Cingria trouve du plaisir � transcrire, � classer, autant qu\'� colorier ou � imaginer ; il se livre � son travail de b�n�dictin aussi joyeusement qu\'� son invention verbale. Il recr�e les �v�nements et les personnages du pass� dans un pr�sent dont il d�sarticule les fatales r�gles, et prenant un point d\'appui solide sur les passages dont il �tablit l\'authenticit� et la valeur avec une rare �rudition, il bondit soudain dans les nu�es.<br/>D\'o� une harmonie �trange, mais heureuse, entre les cadres de l\'histoire et les boutades qui permettent de s\'en �vader, l\'int�gralit� des textes et les variations qui en d�coulent. Cet historien est un po�te pour lequel le temps n\'existe pas. (P.C., <em>Journal de Gen�ve</em>, 12 d�cembre 1947, p. 1.)"),
("21","107","<em>Bois sec Bois vert</em>","Charles-Albert Cingria","Gallimard","","","Paris","1948","","","3","A part � Hippolyte hippocampe � (qui n\'est que <em>Ph�dre</em> � rebours) et � Le Haut Bief � qui ont paru dans La <em>NRF</em> et dans <em>Mesures</em> en l\'esp�ce d\'articles, ces textes ont d�j� vu le jour sous forme de petits livres. [...] Peut-�tre alors serait-il n�cessaire de dire quelques mots d\'introduction aux pages qui vont suivre. J\'en serais incapable, ne les ayant pas regard�es. Non par pr�somption ou pour �viter une fatigue : pour me conformer au tr�s haut enseignement d\'un de mes amis de cette terre que j\'admire le plus et dont le conseil est le plus � �couter : Max Jacob ; disant : � Ne jamais revoir, la plume en main, un texte qui n\'est pas de l\'ann�e m�me, autrement tout est en bas. � J\'eusse bien pr�f�r� que tout f�t en bas, mais tel n\'�tait pas l\'avis de ceux qui voulaient cette �dition, et j\'ai bien d� m\'y soumettre. (Charles-Albert Cingria, � avant-propos � in�dit au projet d\'<em>oeuvre compl�te</em>, vers 1936.)"),
("22","144","<em>Le Novellino. Les Cent nouvelles antiques ou le livre du beau parler gentil</em>","traduit, pr�sent� et enrichi de gloses par Charles-Albert Cingria","Club des Libraires de France","","","Paris","1955","","","3","Cette premi�re traduction fran�aise du <em>Novellino</em> devait para�tre aux Editions des Portes de France en 1946. La mort de Charles-Albert Cingria interrompit ce projet et c\'est finalement aux Libraires Associ�s que revient l\'honneur de publier l\'�dition originale d\'un texte qui restera comme l\'exceptionnelle rencontre d\'un grand temp�rament d\'artiste et d\'une verdeur populaire de haute tradition.<br/>Les premi�res �ditions italiennes du <em>Novellino</em> ayant paru sans illustrations, nous avons suivi ce qui est d�j� une tradition des Libraires Associ�s : accompagner un texte d\'images du temps qui remettent le lecteur dans l\'atmosph�re, sans reproduire pr�cis�ment tel ou tel �pisode du r�cit."),
("23","132","<em>Impressions d\'un passant � Lausanne</em>","Charles-Albert Cingria","L\'Age d\'Homme","pr�face de Jacques Chessex","��La Merveilleuse collection��","Lausanne","1966","","99","3","Henry-Louis Mermod a �dit� les <em>Impressions d\'un passant � Lausanne</em> en 1932, dans la collection des cahiers d\'<em>Aujourd\'hui</em>. Douze exemplaires sur vieux Japon, quatre cents exemplaires sur v�lin teint�, trois exemplaire sur Chine &mdash; en tout quatre cent quinze exemplaires maintenant introuvables. Au moment o� nous ouvrons cette collection, il nous para�t naturel de nous souvenir de Mermod : faisant �crire, faisant para�tre des livres � pour son plaisir �, ce Barnabooth vaudois aura publi� Ramuz, Larbaud, Claudel, Val�ry, Ponge, Michaux... Mermod aimait la po�sie. R��ditant les <em>Impressions</em> trente-quatre ans apr�s lui, nous pla�ons notre collection &mdash; qui publiera prochainement des jeunes auteurs, des po�mes in�dits, des r�cits, des raret�s &mdash; sous le double signe de la reconnaissance et de la recherche. (Extrait de la pr�face de Jacques Chessex.)"),
("24","100","<em>Vingt-cinq lettres � Adrien Bovy (1902-1908)</em>","Charles-Albert Cingria","L\'Age d\'Homme","pr�face de Gilbert Guisan","��La Merveilleuse collection��","Lausanne","1967","","92","3","En 1901, date de la premi�re lettre (connue) de Charles-Albert Cingria � Adrien Bovy, celui-ci a vingt et un ans, celui-l� dix-huit. Trois ans de diff�rence, c\'est beaucoup � cet �ge o� la vingti�me ann�e est g�n�ralement barri�re et non charni�re. Pourquoi Charles-Albert �crit-il � l\'ami de son fr�re Alexandre, de Gen�ve � Gen�ve, sinon, sans doute, pour se m�nager aupr�s de lui une existence personnelle, un peu plus que cette pr�sence qui lui est consentie quand se r�unissent ses a�n�s ? Il ne tardera pas d\'ailleurs � la voir reconnue ; et bient�t trait� comme un �gal, davantage, admir� quand interviendront des ambitions litt�raires, il ne manquera pas de se rendre parfois insupportable. Mais nous n\'en sommes encore pas l�. (Extrait de la pr�face de Gilbert Guisan.)"),
("25","149","<em>Musiques de Fribourg</em>","Charles-Albert Cingria","L\'Age d\'Homme","","��La Merveilleuse collection��","Lausanne","1968","","87","1","Ecrit en 1945, le livre le plus tendre, dr�le et merveilleux sur une ville ici bien vivante. "),
("26","141","<em>Le Canal exutoire</em>","Charles-Albert Cingria","Mermod","","","Lausanne","1931","","143","3","Un condens� du r�cit fa�on Cingria. Voil� ce que pourrait exemplairement repr�senter <em>Le Canal exutoire</em>, \"un des plus beaux textes\" de l\'�crivain, au dire de Nicolas Bouvier. Et en m�me temps un des plus d�routants, tant est grande sa singularit� d\'allure."),
("27","172","<em>Oeuvres compl�tes</em> et <em>Correspondance g�n�rale</em>","Charles-Albert Cingria","L\'Age d\'Homme","","17 volumes","Lausanne","1967-1981","","","3","Treize ans apr�s sa mort, 1967 aura �t� une ann�e faste pour Cahrles-Albert Cingria. L\'�t� dernier, Gilbert Guisan publiait, aux �ditions de L\'Age d\'Homme, un choix de Vingt-cinq lettres � Adrien Bovy. Et voici que le m�me �diteur lausannois nous donne enfin ces Oeuvres compl�tes qu\'on d�sesp�rait de voir para�tre, et dont les deux premiers volumes (sur dix en tout) vont sortir incessamment. (Georges Anex, Journal de Gen�ve, 25 novembre 1967, p. 15.) "),
("28","142","<em>Le Carnet du chat sauvage</em>, suivi de <em>X�nia</em> et de <em>Pendeloques alpestres</em>","Charles-Albert Cingria","Le Nouveau Commerce","","","Paris","1992","","63","3","N� � Gen�ve d\'un p�re venu de Raguse et d\'une m�re polonaise, Charles-Albert Cingria est mort en 1954. Il appartient � la premi�re moiti� de ce si�cle, le n�tre, m�me si, � la lire, il nous para�t contemporain.<br/>Ceux qui furent ses amis, de Max Jacob � Jean Paulhan, de Jean Cocteau � Igor Strawinsky, d\'Erik Satie � A. Modigliani, se r�jouissaient de l\'entendre�: son discours �blouissait. Lui, qui aimait l\'�criture (dix volumes r�unis par les soins de L\'Age d\'Homme � Lausanne en t�moignent), aurait pr�f�r� �tre lu.<br/>Ce petit livre est un hommage, donc, rendu � cet �crivain &mdash; dit-on, suisse &mdash; de langue fran�aise, laquelle, � travers l\'oeuvre de son auteur, deveint toute fra�che et d�concertante. Tout le contraire de ce qu\'on lit de nos jours. (M. F.)"),
("29","102","<em>Anthologie de Charles-Albert Cingria</em>","Charles-Albert Cingria","L\'Escampette","pr�face de Jean-Louis Kuffer","","Bordeaux","1995","","154","3","Il est tr�s peu d\'�crivains contemporains qui semblent plus �trangers que Charles-Albert Cingria aux tumultes de ce qu\'on appelle l\'actualit�, et qui nous propulsent � la fois, avec autant d\'�nergie, au coeur m�me du pr�sent. Cingria aura travers� la moiti� de notre si�cle ponctu� de r�volutions locales et de guerres mondiales sans que ses �crits n\'en conservent de traces significatives, et pourtant on se tromperait en affirmant qu\'il a ignor� son �poque. Ce n\'est pas qu\'il se voile la face ou qu\'il pr�ne le d�gagement. Simplement il vit � un autre �tage. Ce n\'est pas qu\'il soit coup� de la r�alit�. Au contraire il l\'investit avec une intensit� particuli�re, mais d\'une mani�re qui lui est propre. Ce n\'est pas qu\'il fuie la terre des hommes. C\'est qu\'il l\'arpente et l\'habite � sa fa�on. Son temps n\'est pas celui des grands �v�nements et des grandes questions du jour, dont, relevait Jean Paulhan, il se ��foutait compl�tement��. (Jean-Louis Kuffer) <br/><br/>Contient vingt-sept textes de Charles-Albert Cingria parus en p�riodiques�: ��Question importante��, ��An�mie��, ��Quinze novembre��, ��Moderne voulu moderne��, ��Ciel de Paris��, ��Petit car�me a�rien��, ��<em>Two questions</em>��, ��La Lettre��, ��Truculence��, ��Sonate��, ��Rois fain�ants��, ��Eloge du cycle��, ��Veill�e rurale��, ��Propos sur l\'information��, Tapisserie de triomphe��, ��Le Pain et le Sel��, ��Auteurs et �diteurs I��, ��Auteurs et �diteurs II��, ��Auteurs, �diteurs et... lecteurs III��, ��D\'un jeudi � l\'autre��, ��L\'Hiver��, ��Une semaine��, ��Peindre��, ��Les Petits Monstres��, ��Salut aux lacs��, ��Rendre les livres�� et ��Faire apprendre par coeur��."),
("30","152","��Couronne de Charles-Albert Cingria��","","<em>La Nouvelle Nouvelle Revue fran�aise</em>","","n��27","Paris","mars 1955","","427-484","2","Avec des contributions de Paul Claudel, Igor Strawinsky, Jean Cocteau, Marcel Jouhandeau, Andr� Pieyre de Mandiargues, Fran�ois Michel, Etiemble, Jean Starobinski, Georges Borgeaud, Fernand Auberjonois, Constant Rey-Millet, Pierre Gui�guen, Jean Follain, Alo�s-Jean Battaillard et Henri Noverraz. Contient aussi deux textes in�dits de Charles-Albert Cingria (��Portrait de Paul L�autaud�� et ��Lettre � Adrien Bovy��)."),
("31","105","<em>Revue de Belles-Lettres</em>","","Soci�t� de Belles-Lettres","","n� 3","Lausanne, Gen�ve, Neuch�tel, Fribourg","1966","","","2","Qui �tes-vous, Cingria ? Question absurde &mdash; car qui ne vous conna�t ? N\'�tes-vous pas pour chacun Charles-Albert &mdash; le seul �crivain de langue fran�aise que l\'on appelle par son pr�nom &mdash; non point pour vous distinguer de votre fr�re, mais bien plut�t pour proclamer une sorte de familiarit� privil�gi�e &mdash; ou pour en faire accroire ? Qui ne parle de vous comme s\'il vous avait suivi dans vos p�r�grinations, avait bu � votre table et re�u la confidence de ces histoires qui sont devenues l�gendes, vous y enferment, ont fait de vous un personnage ?<br/>Personnage, vous �tes-vous plu � le para�tre, l\'�tiez-vous � votre indu ? Quelles furent chez vous la part du jeu et celle de l\'innocence, celle de la provocation et celle de la fatalit�, celle du r�el et celle de l\'imaginaire ? (Gilbert Guisan)<br/><br/>Avec des contributions de Jacques Chessex, Pierre-Alain T�che, Bernard Christoff, Georges Borgeaud, Dick Aeschlimann, Pierre-Olivier Walzer, Roger Nordmann, Isabelle et Robert Melley-Cingria."),
("32","115","<em>Charles-Albert Cingria</em>","Jacques Chessex","Pierre Seghers","","��Po�tes d\'aujourd\'hui�� n��170","Paris","1967","","190","2","Charles-Albert Cingria (1883-1954). G�nial vagabond de l\'Europe latine, il a port� ses pas, avec une d�sinvolture de grande race dans les contr�es les plus singuli�res de l\'esprit. Il a ramen� de ses voyages un carnet de route o� la po�sie reste � jamais prisonni�re. D\'une intransigeance hautaine, Charles-Albert Cingria, entour� d\'une l�gende de pauvre p�lerin, revit gr�ce � Jacques Chessex, po�te et romancier suisse, nourri aux m�mes sources."),
("33","112","<em>Cahiers bleus</em>","","",""," n� 24","Troyes","�t� 1982","","","2","Avec des contributions de Edmond Humeau, Jacques R�da, Andr� Dh�tel, Jean-Marie Dunoyer, Georges Borgeaud, G�a Augsbourg, Yoki, Pierre Olivier Walzer, Christian Noorbergen et Dominique Daguet, et des textes in�dits de Cingria�: ��Retour au cadastre��, ��Lettre � Germain Paulhan��, ��Petite mise au point��, ��Faire le malin��, ��Retour aux jupes��, ��Morale murale��, ��Six petites lettres�� et ��Chine��."),
("34","106","<em>Le Bitume est exquis</em>","Jacques R�da","Fata Morgana","","","Montpellier","1984","","84","2","Rassemble les principaux articles que l\'auteur a consacr�s � Charles-Albert Cingria."),
("35","101","<em>Cahiers de l\'Alliance culturelle romande</em>","","","","n� 29","Gen�ve","novembre 1983","","","2","Ce cahier est consacr� � Alexandre et Charles-Albert Cingria, � l\'occasion du centi�me anniversaire de la naissance de ce dernier. C\'est la raison qui nous fait commencer par le cadet. De nombreuses �tudes pr�sentent l\'un et l\'autre. Elles ne doivent pas nous faire oublier ce qu\'ils ont de commun, d\'une intensit� rare chez deux fr�res, ma�tres dans des arts diff�rents. (Weber-Perret, extrait de l\'�ditorial).<br/><br/>Contient des contributions de (pour la partie consacr�e � Charles-Albert) Jacques Chessex, Jean-Louis Kuffer, Pierre-Olivier Walzer, Georges Anex, Jacques R�da. Andr� Desponds, Richard Garzarolli, Bruno Ackermann, Doris Jakubec, Jean-Claude Genoud, Philippe Jaccottet, Philippe Kaenel, Gabrielle Faure, Jil Silbenstein, Charles-F. Sunier, Alain Rochat, Dominique Monnin, Olivier Goy, Roger Guignard, Isabelle Melley-Cingria, Edmond Humeau, Sven Stelling-Michaud, Victor Desarzens, Georges Borgeaud, Maurice Chappaz, Henri Noverraz, Georges Duplain et Henri Perrochon. Contient des textes et des extraits de Cingria�: ��D�placement��, ��L\'Ame antique��, ��A l\'inventeur de l\'esperanto��, ��Odeur de roseaux��, ��Les Ann�es 33 sq.��, <em>L\'Eau de la dixi�me milliaire</em> ��<em>Aria del mese</em>��, ��Grand questionnaire��, ��Recensement��, ��Eloge du cycle��, ��Images de la Suisse��, ��Baignade fluviale��, ��Arriv�e � Paris��, ��Novalaise��, ��La Fameuse �toile��, ��Dialogue par la pluie�� et ��Les Ch�vres��."),
("36","122","<em>Ecriture</em>","","","","n� 21","Lausanne","1983","","","2",""),
("37","123","<em>Ecriture</em>","","","","n� 29","Lausanne","1987","","","2",""),
("38","153","��Nouvelle couronne de Charles-Albert Cingria��","","La Nouvelle Revue fran�aise","","n��491","Paris","d�cembre 1993","","1-120","2","Avec des contributions de Pierre-Olivier Walzer, Jacques Chessex, Philippe Barthelet, Pierre Bergounioux, Richard Blin, Nicolas Bouvier, Gil Jouanard, Jean-Louis Kuffer, Yves Leclair, Pierre Michon, Dominique Pagnier, Claude-Pierre P�rez, Jacques R�da et Guy Goffette."),
("39","148","<em>Trois auteurs</em>","Pierre Michon","Lagrasse","","","Verdier","1997","","87","2","��On entre dans un mort comme dans un moulin.�� Pour peut que ce mort soit un auteur, et qu\'on se m�le soi-m�me d\'�crire, alors c\'est un moulin � vent avec lequel on doit d�coudre, ou passer son chemin. Le critique, qui accepte bravement le combat, est le Don Quichotte du texte, dont le moindre coup d\'aile l\'envoie au tapis. Je suis moins audacieux�: dans l\'ombre bienveillante de trois grands moulins, j\'ai mis trois machines r�duites, en miroir, en offrande. Voici ces petits moulins � vent. (Pierre Michon) <br/><br/>��La Danseuse��, deuxi�me partie du livre, est consacr�e � Charles-Albert Cingria (entre Balzac et Faulkner).\""),
("40","130","<em>L\'Hebdo litt�raire</em>","","","","n� 6","Lausanne","1999","","","2","\"C\'est l\'un de nos plus grands artistes, un g�nie. Et pourtant si m�connu. A-t-il seulement franchi la porte de nos �coles�? Longtemps, il a train� l\'image d\'une esp�ce de toqu� � bicyclette, ��loufoque��, enturbann�, inclassable. Une ascendance semi-levantine, dans nos esprits orthonorm�s � Greenwich, bien que sa famille ne v�nt que de Raguse, ce qui n\'est, au fond, pas si loin.�Mais cette com�te litt�raire semblait jaillie d\'un Orient compliqu�, d\'une J�rusalem enfouie sous les sables, d\'une intemporelle ��Antiquit頻, qui pouvait �tre hier aussi bien que demain. Raguse�? Syracuse, si �a vous arrange mieux�: le chemin po�tique est-il affaire de bornes g�ographiques ou de syllabes enchant�es�? (Pascal D�caillet, extrait de l\'�ditorial.)<br/><br/>Contient des contributions de Pierre-Andr� Stauffer, Jacques Chessex, Jean Ammann, Pascal D�caillet, Michel Aud�tat, Pierre-Dominique Bourgknecht et Pierre-Marie Joris.\""),
("41","103","<em>Th�odore Balmoral</em>","","","","n� 37-38","Orl�ans","automne-hiver 2000","","","42",""),
("42","104","<em>Th�odore Balmoral</em>","","","","n� 48","Orl�ans","hiver 2004-2005","","","2",""),
("43","175","<em>Th�odore Balmoral</em>","","","","n� 52-53","Orl�ans","�t�-automne 2006","","","2",""),
("44","175","<em>Th�odore Balmoral</em>","","","","n� 59-60","Orl�ans","printemps-�t� 2009","","","2",""),
("45","175","<em>Th�odore Balmoral</em>","","","","n� 66-67","Orl�ans","hiver 2011-2012","","","2",""),
("46","120","<em>Corona nova : bulletin de la Bibliotheca Bodmeriana</em>","","Cologny","","n� 1","Munich","2001","","","2",""),
("47","175","<em>Conf�rence</em>","","","","n� 20","","printemps 2005","","","2",""),
("48","175","<em>Conf�rence</em>","","","","n� 24","","printemps 2007","","","2",""),
("49","175","<em>Fario</em>","","","","n� 1","","printemps-�t� 2005","","","2",""),
("50","175","<em>Fario</em>","","","","n� 2","","automne-hiver 2005","","","2",""),
("51","175","<em>Fario</em>","","","","n� 3","","�t� 2006","","","2",""),
("52","175","<em>Fario</em>","","","","n� 6","","�t�-automne 2008","","","2",""),
("53","175","<em>La Nouvelle Revue fran�aise</em>","","Paris","","n� 553","","mars 2000","","","2",""),
("54","161","<em>P�trarque</em>","Charles-Albert Cingria","L\'Age d\'Homme","notice de Christophe Calame","collection ��Poche suisse�� n�203","Lausanne","2003","","140","1","Voici le texte qui enchanta Strawinsky et valut � C.-A. Cingria des pages �logieuses dans les m�moires du Ma�tre... Po�te chantant un autre po�te, Cingria donne libre cours ici � son �rudition, son amour des mots, s\'immergeant avec d�lices dans une �poque qu\'il aima entre toutes. Parmi les innombrables articles, chroniques, notes et correspondances o� fourmillent les allusions et les mentions du Moyen Age, trois ��massifs�� litt�raires se d�tachent nettement, <em>La Reine Berthe</em> (��Poche suisse�� n��115) sur les origines m�rovingiennes, <em>La Civilisation de Saint-Gall</em> (� para�tre ult�rieurement) sur la culture et la musique gr�gorienne, et enfin la monographie sur P�trarque, dans les <em>Cahiers romands</em>, consacr�e � la fin du Moyen Age, c\'est-�-dire � une certaine imitation de l\'Antiquit� consid�r�e par Cingria comme la v�ritable perte de la mesure romaine et de l\'ampleur antique. Avec la Renaissance, c\'est donc pour l\'auteur tr�s pr�cis�ment la culture elle-m�me qui dispara�t. Il ne fallait pas �tre moins que Cingria pour assumer le paradoxe."),
("55","151","<em>Le Novellino. Les Cent nouvelles antiques ou le livre du beau parler gentil</em>","Charles-Albert Cingria","L\'Age d\'Homme","","collection ��Poche suisse�� n� 211","Lausanne","2004","","209","1","La <em>Vita nuova</em> de Dante, c\'est 1292. Le <em>Novellino</em> peut lui �tre ant�rieur d\'une trentaine d\'ann�es. ��Dugentesco�� (mille-deux-centesque), qui est l\'�pith�te d\'�valuation consacr�e par la critique italienne actuelle, est alors bien ce qu\'il convient pour fixer l\'�ge de composition de ce capital monument de la pr�-Renaissance. <br/>L\'auteur est anonyme. Aucune des conjectures auxquelles on s\'est livr� n\'a r�ussi � l\'identifier. Ce n\'est ni Francesco da Barberino, ni Brunetto Latini, ni Andrea Lancia, ni non plus Dante da Maiano. Il n\'en demeure pas moins que c\'est un �crit d\'une robuste et belle fra�cheur, et si ce n\'est pas, comme on l\'a dit, un auteur qui parle, c\'est &mdash; et c\'en bien pr�f�rable &mdash; son si�cle entier dans toute sa finesse dans sa vieille sagesse et sa force qui s\'exprime par lui."),
("56","163","<em>Propos animaliers</em>","Charles-Albert Cingria","L\'Age d\'Homme","pr�face de Maryke de Courten","collection ��Poche suisse�� n� 210","Lausanne","2004","","176","1","Vous vous d�lecterez de ces arr�ts sur image, de l\'expression contrari�e du chat ou de sa d�marche d�licate sur le gravier br�lant�; de la panique des vaches et de la malice des cygnes�; de la rage des serpents et du cr�pitement des crabes�; du ronflement des porcs-�pics et du ricanement des boucs�; de la crispation d\'un oiseau saisi de crainte�; de la remuante gaiet� des saint-bernard roulant de grands yeux roses�; de la douleur des mules que l\'on bastonne, du cafard des gorilles, de la furibonde arm�e de hautes chenilles processionnaires�; des anguilles embrouill�es et sifflantes, des crapauds pythagoriciens�; de l\'�ne qui a une id�e fixe derri�re les oreilles, de l\'ours qui embrasse sa bien-aim�e avec tant de passion qu\'elle en demeure inanim�e�; du cheval manifestant par �-coups le sentiment lancinant d\'�tre isol� de la conversation, et de l\'assombrissement des b�ufs lorsqu\'ils comprennent qu\'ils vont � l\'abattoir... Chaque animal a sa sp�cificit�, saisie par Cingria avec humour et respect. Il arrive qu\'une connaissance ou un ami soit d�crit par r�f�rence � l\'animal qui le caract�rise. <br/>Malgr� l\'attrait de ces �vocations, nous sommes tr�s �loign�s d\'un d�fil� pittoresque. Chez Cingria, les animaux signifient. De par leur aspect et leur comportement, chaque animal, aussi petit soit-il, t�moigne d\'une continuit� mill�naire dans un paysage qui ne l\'est pas moins. Souvent, l\'�motion est � son comble parce que la nature et les animaux, par leur simple ���tre l࠻, font partie de cette grande s�quence ab�c�daire qu\'est le monde..."),
("57","135","<em>La Jongleresse</em>","Charles-Albert Cingria","H�ros-Limite","�dition Daniel Maggetti","Enregistrement sonore, 62 min 48 sec + livret 60 pp.","Gen�ve","2006","","","1","��Tant pis pour ceux qui n\'ont point de sens ni non plus d\'oreille. Car il est tr�s important d\'avoir de l\'oreille, non aux accents &mdash; qu\'est-ce que cela peut faire que l\'on parle ainsi ou ainsi &mdash; mais aux voix. Oui, aux voix quand s\'�l�ve un son et qu\'on reconna�t qu\'il est pur. Il faut beaucoup de temps pour en arriver l�, mais j\'y suis, je crois, et rien ne me ravit autant qu\'une voix diast�matique non trembl�e &mdash; pos�e de par son origine humble, rac�e &mdash; qui �meut des places dans notre cerveau li� � notre chair et � nos tendons dans une capacit� de reconna�tre juste en vertu des nombres.��<br/><br/>Textes in�dits, entretiens et lectures de l\'auteur. Daniel Maggetti�: ��Les syllabes argent�es��. Coffret comprenant un livret de 64 pages et un disque compact d\'extraits des archives de la Radio Suisse Romande."),
("58","119","<em>Col�res et antidotes</em>","Charles-Albert Cingria","L\'Age d\'Homme","�dition Maryke de Courten, pr�face de Daniel Maggetti","collection ��Poche suisse�� n� 251","Lausanne","2009","","179","1","\"��Charles-Albert Cingria�? Un sujet r�v� pour les amateurs de qualificatifs rares, d\'expressions recherch�es, d\'images cocasses. Capricant pour les uns, coruscant pour les autres�; <em>lutin insaisissable</em> et <em>papillon de biblioth�que</em>, selon Claudel�; <em>phosphorescence qui court</em>, rench�rit Cocteau�; <em>ayant l\'air d\'un clown, ou d\'un pr�tre d�froqu�</em>, aux yeux de Henry Miller�; pratiquant <em>un style gras et onctueux avec quelque chose de monacal</em>, Paulhan dixit ; et je vous �pargne les occurrences du fantasque, du v�locip�diste, du vagabond, <em>e che diavolo ne so io</em>. Maurrassien et troubadour�; �rudit et pique-assiette�; Turc et Genevois�; raffin� et SDF. Tout ce qu\'il faut, en somme, pour �tre un <em>cas�</em>: et un <em>cas</em> litt�raire, ce n\'est jamais tr�s loin du domaine des <em>curiosit�s</em> &mdash; d\'o� le constat que, hors d\'un cercle plut�t �troit d\'inconditionnels, eux-m�mes �crivains pour la plupart, on a volontiers tendance � ne pas le prendre au s�rieux. Si on ajoute au tableau son go�t du paradoxe et sa biographie atypique, on comprend que Cingria soit identifi� au mieux � un original, au pire, � un ludion ou � une girouette.�� (Extrait de la pr�face de Daniel Maggetti)<br/><br/>Son oeuvre touffue, dense, construite, forte, se pr�sente sous la forme de brefs r�cits et de propos dont la coh�sion est de plus en plus �vidente. Apr�s avoir �t� un marginal, Charles-Albert Cingria entre aujourd\'hui dans la constellation des grands �crivains du XX<sup>e</sup> si�cle. Le lecteur d�couvrira dans ce volume un choix de col�res et de ravissements encore inconnus du grand public, qui illustrent les multiples facettes de sa paradoxale nature. (Maryke de Courten)\""),
("59","154","<em>Oeuvres compl�tes</em>","Charles-Albert Cingria","L\'Age d\'Homme","2 volumes (R�cits)","collection ��Caryatides��","Lausanne","2012","","2142","1","Conduite par une �quipe internationale de chercheurs, la nouvelle �dition des <em>Oeuvres compl�tes</em> de Charles-Albert Cingria a �t� r�alis�e dans le cadre du Centre de recherches sur les lettres romandes de l\'Universit� de Lausanne, o� est justement conserv�e la plus grande partie des manuscrits de l\'illustre �crivain.<br/>Par sa rigueur, son exhaustivit�, sa volont� d\'aider le lecteur dans sa d�couverte, son souci constant de lisibilit�, cette nouvelle �dition est une r�alisation qui r�pond aux crit�res scientifiques que l\'on attend d\'une entreprise de cette nature, tout en restant accessible � un public non sp�cialis�. Elle est donc � m�me de mieux faire conna�tre un des plus grands �crivains suisses du XX<sup>e</sup> si�cle, dont elle permet de mesurer la qualit� esth�tique, la richesse des contenus et des sujets, ainsi que l\'ampleur de l\'�criture."),
("60","175","<em>Le Sabordage de </em>La Voile latine","Pierre-Olivier Walzer","L\'Age d\'Homme","","collection ��Vies de Charles-Albert Cingria�� [1]","Lausanne","1993","","106","2","Pourquoi Vies�? Parce que la connaissance que nous avons de Charles-Albert Cingria comporte encore des lacunes si consid�rables qu\'il ne nous a pas paru possible de consacrer � ce merveilleux �crivain et multiforme personnage &mdash; genevois, dalmate, dandy, voyageur, vagabond, cycliste, po�te, historien, chartiste &mdash; une biographie pleine et �quilibr�e. En attendant que les chercheurs fassent les d�couvertes qui permettront d\'embrasser sous tous ses aspects cette personnalit� si riche et parfois si d�routante, on se contentera, dans cette suite de petits volumes, de faire le point sur certaines phases de son existence qu\'une documentations nourrissante et originale permet de nous rendre suffisamment proches.<br/>br/><em>Pierre-Olivier Walzer fut titulaire de la chaire de litt�rature fran�aise � l\'Universit� de Berne durant trente ans, pendant lesquels il collabora au</em> Journal de Gen�ve <em>comme critique litt�raire. Auteur d\'ouvrages sur Toulet, Mallarm�, Val�ry, �diteur des oeuvres de Cros, Corbi�re, Lautr�amont, Nouveau dans la Biblioth�que de la Pl�iade, directeur de l\'</em>Anthologie jurassienne <em>et du</em> Dictionnaire des litt�ratures suisses <em>publi� pour le 700e anniversaire de la Conf�d�ration. Il dirige � L\'Age d\'Homme la collection ��Poche suisse��.</em><br/><em>Pr�sident durant de nombreuses ann�es des ��Amis de Charles-Albert Cingria��, il est aujourd\'hui, avec Jean-Louis Kuffer, � la t�te des </em>Petites Feuilles<em>, dont Cingria fut le premier ��r�dacteur en chef��.</em>"),
("61","171","<em>Les Prisons de Charles-Albert</em>","Pierre-Olivier Walzer","L\'Age d\'Homme","","collection ��Vies de Charles-Albert Cingria�� [2]","Lausanne","1993","","100","2","Pourquoi Vies�? Parce que la connaissance que nous avons de Charles-Albert Cingria comporte encore des lacunes si consid�rables qu\'il ne nous a pas paru possible de consacrer � ce merveilleux �crivain et multiforme personnage &mdash; genevois, dalmate, dandy, voyageur, vagabond, cycliste, po�te, historien, chartiste &mdash; une biographie pleine et �quilibr�e. En attendant que les chercheurs fassent les d�couvertes qui permettront d\'embrasser sous tous ses aspects cette personnalit� si riche et parfois si d�routante, on se contentera, dans cette suite de petits volumes, de faire le point sur certaines phases de son existence qu\'une documentations nourrissante et originale permet de nous rendre suffisamment proches.<br/><br/><em>Pierre-Olivier Walzer fut titulaire de la chaire de litt�rature fran�aise � l\'Universit� de Berne durant trente ans, pendant lesquels il collabora au</em> Journal de Gen�ve <em>comme critique litt�raire. Auteur d\'ouvrages sur Toulet, Mallarm�, Val�ry, �diteur des oeuvres de Cros, Corbi�re, Lautr�amont, Nouveau dans la Biblioth�que de la Pl�iade, directeur de l\'</em>Anthologie jurassienne <em>et du</em> Dictionnaire des litt�ratures suisses <em>publi� pour le 700e anniversaire de la Conf�d�ration. Il dirige � L\'Age d\'Homme la collection � Poche suisse �.</em><br/><em>Pr�sident durant de nombreuses ann�es des ��Amis de Charles-Albert Cingria��, il est aujourd\'hui, avec Jean-Louis Kuffer, � la t�te des </em>Petites Feuilles<em>, dont Cingria fut le premier ��r�dacteur en chef��.</em>"),
("62","170","<em>L\'Ame antique</em>","Pierre-Olivier Walzer","L\'Age d\'Homme","","collection ��Vies de Charles-Albert Cingria�� [3]","Lausanne","1997","","185","2","Pourquoi Vies�? Parce que la connaissance que nous avons de Charles-Albert Cingria comporte encore des lacunes si consid�rables qu\'il ne nous a pas paru possible de consacrer � ce merveilleux �crivain et multiforme personnage &mdash; genevois, dalmate, dandy, voyageur, vagabond, cycliste, po�te, historien, chartiste &mdash; une biographie pleine et �quilibr�e. En attendant que les chercheurs fassent les d�couvertes qui permettront d\'embrasser sous tous ses aspects cette personnalit� si riche et parfois si d�routante, on se contentera, dans cette suite de petits volumes, de faire le point sur certaines phases de son existence qu\'une documentations nourrissante et originale permet de nous rendre suffisamment proches.<br/>br/><em>Pierre-Olivier Walzer fut titulaire de la chaire de litt�rature fran�aise � l\'Universit� de Berne durant trente ans, pendant lesquels il collabora au</em> Journal de Gen�ve <em>comme critique litt�raire. Auteur d\'ouvrages sur Toulet, Mallarm�, Val�ry, �diteur des oeuvres de Cros, Corbi�re, Lautr�amont, Nouveau dans la Biblioth�que de la Pl�iade, directeur de l\'</em>Anthologie jurassienne <em>et du</em> Dictionnaire des litt�ratures suisses <em>publi� pour le 700e anniversaire de la Conf�d�ration. Il dirige � L\'Age d\'Homme la collection ��Poche suisse��.</em><br/><em>Pr�sident durant de nombreuses ann�es des ��Amis de Charles-Albert Cingria��, il est aujourd\'hui, avec Jean-Louis Kuffer, � la t�te des </em>Petites Feuilles<em>, dont Cingria fut le premier ��r�dacteur en chef��.</em>"),
("63","124","<em>Erudition et libert�. L\'Univers de Charles-Albert Cingria</em>","Actes du colloque de l\'Universit� de Lausanne [16 et 17 octobre 1997]  r�unis par Maryke de Courten et Doris Jakubec","Gallimard",""," ��Cahiers de la NRF��","Paris","2000","","502","2","\"Le lecteur de l\'an 2000 sera fascin� par Charles-Albert Cingria, par ses textes sans projets, sans points d\'orgue, prolifiques dans leur d�sinvolture et leur fier inach�vement. Le <em>talking</em> de Cingria serait-il le style de l\'avenir�? O� cohabitent sans s\'opposer le bon sens et l\'�rudition, l\'imperceptible vibration et la passion coruscante, un ludisme �berluant et une v�h�mente d�nonciation. Sur le rythme joyeux propre � la jongleresse au milieu des neumes, Cingria livre ses observations ��<em>d\'homme humain�</em>� (l\'expression est emprunt�e par lui � la culture chinoise) dans une �blouissante polyphonie.<br/>Nous avons voulu, en r�unissant professeurs et chercheurs de plusieurs g�n�rations et de formations diverses, entreprendre un parcours critique de l\'univers entier de l\'�crivain. C\'est pourquoi nous ne leur avons donn� aucune directive particuli�re et avons accept� le foisonnement et l\'abondance.<br/><em>Erudition et libert�</em> abonde en �clairages divers et en observations nouvelles qui se composent, s\'embo�tent ou se prolongent et commencent � faire �merger le vaste champ d\'une vision dont les ma�tres mots seraient universalit�, mobilit�, finesse des notations, succulence verbale. Insensiblement apparaissent la coh�rence de Cingria, une remarquable force, qu\'un prochain colloque tentera, nous l\'esp�rons, de pr�ciser. (Maryke de Courten)<br/><br/><em>Actes du premier colloque international organis� conjointement par le Centre de recherches sur les lettres romandes et l\'Association des Amis de Charles-Albert Cingria (Universit� de Lausanne, 16-17 octobre 1997).</em>"),
("64","165","<em>Chiens &amp; chats litt�raires chez Cingria, Rousseau et Cendrars</em>","Jacques R�da, Jacques Berchtold, Jean-Carlo Fl�ckiger","La Dogana","","","Gen�ve","2002","","135","2","� Les chats ont d\'autres id�es que les chiens sur la vie �, notait Octave Mirbeau &mdash; et sans doute d\'autres lectures, serait-on tent� d\'ajouter. Chiens et chats, en tout cas, ont litt�ralement investi le territoire litt�raire, y imprimant les plus visibles et lisibles des empreintes. Ils ont aussi divis� l\'humanit� (et plus particuli�rement les �crivains) en deux clans souvent peu aimables l\'un envers l\'autre. � Comme chiens et chats � dit la sagesse des nations... et � li chien soun dou bou Dieu et li cat soun dou diable � ne craint pas d\'affirmer un proverbe proven�al.<br/>Embl�me de la fid�lit�, le chien ne s\'alarme que de l\'abandon de ses ma�tres ; le chat, pour sa part, jaloux de son ind�pendance, h�doniste et libertaire, saura s\'attacher &mdash; mine de rien &mdash; des �crivains comme Baudelaire, Mallarm� ou L�autaud. Dans cet ouvrage, c\'est � Rousseau, Cendrars et Cingria d\'�voquer pour nous leurs compagnons chiens &amp; chats..."),
("65","164","<em>Pycniques et leptosomes (sur C.-A. Cingria)</em>","Pierre Bergounioux","Fata Morgana","","","Fontfroide-le-Haut","2005","","40","2","<em>Une des particularit�s de Cingria, qui n\'est pas la moindre, est d\'agiter la question la plus vaste qui soit, celle de la r�alit�</em>. On con�oit facilement d�s cet abord l\'ampleur de la t�che que s\'est assign�e Pierre Bergounioux en s\'attachant � saisir cet �tre infiniment mouvant, d�finitivement inclassable. Po�te, philosophe, Cingria le fut tout � la fois, et sans jamais c�der aux exc�s de l\'une ou l\'autre position. Fut-il un ti�de pour autant? Quelques lignes de sa plume suffisent � le d�mentir.<br/>Le portrait qui nous est ici livr� est � la mesure de cette complexit�, s\'attachant au texte pour le prolonger, saisissant la r�verie par un bout pour mieux en go�ter la fuite l�g�re. Pierre Bergounioux, au fil de deux courtes proses excelle, avec �rudition parfois, toujours avec passion, � saisir l\'essence de cet insaisissable que fut C.-A. Cingria.<br/>Ce volume fait �cho au texte de Jacques R�da &mdash; qui fut l\'initiateur de Bergounioux en la mati�re &mdash; <em>Le Bitume est exquis</em> que nous publiions il y a plus de trente ans, et aux textes de Cingria que nous avons eu le plaisir de publier depuis : <em>Le Carnet du chat sauvage</em> et <em>G�ographie vraie</em>."),
("66","109","<em>Charles-Albert Cingria en roue libre</em>","Nicolas Bouvier","Zo�","�dition Doris Jakubec","","Carouge-Gen�ve","2005","","172","2","Nicolas Bouvier (1929-1998), voyageur ouvert au monde entier et aux langues inconnues gr�ce � son oreille musicienne, n\'a pas crois� Charles-Albert Cingria (1883-1954) sur les routes et les chemins, autour de Gen�ve, de Paris ou de Rome, ni n\'a fait halte dans les m�mes biblioth�ques � la recherche des m�mes manuscrits. Mais il a lu ses chroniques, ses proses, ses r�cits fantastiques ou fantasmagoriques, ses traductions des ma�tres anciens, entrant ainsi en dialogue avec lui, cherchant les raisons de ces instants magiques o� le monde d�voile son secret, son sens lumineux, sa beaut� l�g�re. Ce qui int�resse Nicolas Bouvier lisant Cingria, homme au charisme �pique, c\'est la mani�re d\'�crire le voyage, l\'art de circuler et d\'aller et venir tout en observant le proche comme s\'il �tait neuf et inconnu. <br/>��Un m�tre carr�, et l\'univers��, c\'est la formule de Cingria pour d�ambuler, s\'�tonner, vivre, m�diter, �crire.<br/>Le titre de ce livre, choisi par Nicolas Bouvier, souligne le rapport tr�s libre qu\'il entretient avec Cingria: l�cher prise et rouler sans entrave."),
("67","121","<em>Charles-Albert Cingria</em>","","L\'Age d\'Homme","dossier coordonn� par Alain Corbellari","��Les Dossiers H��","Lausanne","2004","","490","2","��Constantinopolitain, c\'est-�-dire Italo-franc levantin��, comme il aimait � le dire lui-m�me, Charles-Albert Cingria (1883-1954) est l\'un des �crivains les plus inclassables du XX<sup>e</sup> si�cle. Natif de Gen�ve, mais farouche catholique, dandy ruin�, il promena sa silhouette de clochard v�locip�diste entre Paris, o� il garda longtemps un pied-�-terre, et la Suisse romande, dont il fut, aux c�t�s de Ramuz, de Gilliard, de Gonzague de Reynold, l\'un des promoteurs du renouveau litt�raire avant d\'�tre l\'un des mentors de la g�n�ration des Jaccottet, Chessex et Borgeaud. Collaborateur r�gulier de la <em>NRF</em>, ami de Max Jacob, de Claudel, de Paulhan, Cingria reste victime d\'une l�gende d\'un pittoresque trompeur et de l\'apparent �clatement de son oeuvre, o� l\'�rudition donne la main � la fantaisie dans un irr�pressible �lan de libert� cr�atrice qui bouleverse les fronti�res des genres. Pour les cinquante ans de sa mort, ce ��Dossier H�� fait le point sur sa fortune critique et brosse de lui un portrait t�moignant de l\'actualit� de son oeuvre et de la s�duction qu\'elle op�re sur un lectorat de plus en plus nombreux."),
("68","169","<em>Vies parall�les de Blaise Cendrars et de Charles-Albert Cingria</em>","Bernard Delvaille","La Biblioth�que","pr�face de G�rard-Julien Salvy","","Paris","2007","","79","2","A travers les voyages, le latin m�di�val, la musique, Bernard Delvaille trace le portrait de deux po�tes prosateurs suisses, Cendrars, le plus connu, et Cingria, �crivain aim� des �crivains. Ils seront amis, puis s�par�s. Truff� de citations, ce double portrait ressemble � une tapisserie cousue de fil d\'or, de brocard, dans laquelle l\'attention s\'enchante. Un amoureux de la langue tisse ses arabesques, �merveill� par deux complices."),
("69","133","<em>Charles-Albert Cingria. Verbe de cristal dans les �toiles</em>","Anne Marie Jaton","Presses polytechniques et universitaires romandes","","��Le savoir suisse��","Lausanne","2007","","135","2","Sans cesse on voit ressurgir l\'oeuvre inclassable de Charles-Albert Cingria. Les petites feuilles que dispersait l\'�rudit vagabond ont �t� converties en oeuvres compl�tes et ses lettres sont recueillies comme des perles. Mais comment lire ses livres d�routants, aux titres �tranges�? Cette �tude r�v�le ces classiques comme un monument de fra�cheur. L\'�crivain lie ses fid�les comme dans une soci�t� secr�te avec leur ferveur et leurs marottes cingriesques. De cette ���pop�e des petits riens��, Anne Marie Jaton d�gage la science, cach�e sous les gr�ces de la d�sinvolture. La libert� de pens�e y est souveraine et capte la vie. Amoureux du latin, du Moyen Age, des chats et de la musique, Cingria a pratiqu� en v�rit� les grandes audaces de la modernit�: temps d�sarticul�, folie des d�tails, narration rebondissant par les surprises enchanteresses et continues de l\'�criture."),
("70","114","<em>Charles-Albert Cingria. L\'Instant intemporel</em>","Jacques Chessex","L\'Age d\'Homme","","��Poche suisse n�240��","Lausanne","2008","","89","2","Contemporain de Claudel et de Strawinsky, Charles-Albert Cingria va son chemin dans le Moyen Age des antiphonaires et la plus libre invention moderne. C\'est qu\'il vit comme personne l\'instant et l\'intemporel, soucieux de Dieu, de style, d\'images, de stupeur inspir�e au choc des figures et des choses.<br/>Prosateur au g�nie dru, conteur d\'histoires enlumin�es comme autant de miracles quotidiens, il pratique la digression du chat et la halte du p�lerin combl� par la gr�ce d\'�tre l�. Ecrivain sauvage, mondain, intransigeant, et l\'un des styles les plus �labor�s et printaniers du vingti�me si�cle. (Jacques Chessex)"),
("71","116","<em>Cippe � Charles-Albert Cingria. Un recueil d\'hommages</em>","","ACEL","","Gollion, Infolio","Bienne","2011","","154","2","Ce cippe ��hors s�rie�� accompagne le cippe ��normal�� consacr� � Cingria � l\'occasion de la sortie des nouvelles Oeuvres compl�tes de Charles-Albert Cingria qui paraissent cet automne � L\'Age d\'Homme. Ce ��cippe � Charles-Albert Cingria�� est r�alis� dans l\'esprit qui avait pr�valu � la composition de la ��Couronne de Charles-Albert Cingria�� (NRF, 1955) et � la � Nouvelle couronne de Charles-Albert Cingria � (<em>NRF</em>, 1993). Une anthologie, ici, compos�e en pensant aux fameuses <em>Petites Feuilles</em>, avec de tr�s courts textes d\'amis et d\'auteurs ayant une certaine dilection pour Cingria.<br/>Parmi lesquels, Pierre Alechinsky, Pascal Comm�re, Philippe Delaveau, Alain Duault, Guy Goffette, Philippe H�l�non, Patrick K�chichian, Jean-Georges Lossier, Jean-Ren� Moeschler, Gilles Ortlieb, Jacques R�da, Jean Starobinski, Pierre Vo�lin ou Alexandre Voisard."),
("72","178","<em>Le Camp de C�sar</em>","Charles-Albert Cingria","Au Lys rouge","assorti de 4 lithographies de G�a Augsbourg et d�une postface de Robert T�lin","","Lausanne","1945","","","3","Un Cingria classique, amateur de belles architectures antiques, ou imit�es de l�antique, n�est pas exclusif d�un Cingria baroque, explorant les for�ts et la vase des grenouilles. C�est le second surtout que pr�sente <em>Le Camp de C�sar</em>. L�auteur puise aux souvenirs de ses balades dans quelques recoins de l�Oise, alors qu�il rendait visite � son ami Alo�s-Jean Bataillard autour de 1940. Plac�e sous le signe de la surprise, son exploration adopte la m�thode du ��Chat sauvage���: on ne trouve que ce qu�on ne cherche pas."),
("73","150","<em>Musiques de Fribourg</em>","Charles-Albert Cingria","Belles-Lettres","illustrations de Bernard Schorderet","","Fribourg","1945","","","3","Vers la fin de son s�jour fribourgeois, en mars 1945, Cingria publie un article ��Fribourg vu par un h�te�� qui se termine ainsi�: ��Ainsi est Fribourg. Mais ces notes sont bien incompl�tes. C��tait un livre que je voulais faire. Je le ferai... mais, au nom du Ciel, pas tout de suite.�� Le livre para�t � la fin de la m�me ann�e, sur la commande du journaliste et publiciste Roger Nordmann, pr�sident de la Soci�t� de Belles-Lettres."),
("74","180","<em>Le Bey de Pergame, suivi d\'une r��dition du Canal exutoire </em>","Charles-Albert Cingria","Mermod","","","Lausanne","1947","","","3","On sait aujourd�hui que Le Bey germa dans les marges de ��La Grande Ourse��, � la fin des ann�es 1920. C�est en effet des premiers grands r�cits de l�auteur qu�il faut rapprocher l�histoire du Bey � la couleur orientale en plus.<br/>Progressant par contigu�t� ou par inventaires � on y trouvera la plus c�l�bre liste de l��uvre cingrienne�: celle des dix-neuf petits-fils ��d�une dame semi-troglodyte mais fi�re, d�tentrice de coquillages, de pianos et de fauteuils�� �, le r�cit n�est pas un fil�: un arbre g�n�alogique plut�t, dont on suivrait quelques ramifications. Plus proche d�un long po�me de Rimbaud que d�un petit roman, <em>Le Bey de Pergame</em> s�apparente m�me � un art po�tique antiromanesque, d�jouant, explicitement parfois, la facticit� de l�anecdote et du suspens. ��Je pourrais faire l�-dessus des d�veloppements � l�infini, mais ils seraient faux.��"),
("75","166","<em>Le Seize juillet</em>","Charles-Albert Cingria","Mermod","","","Lausanne","1929","","","3","Au <em>Quinze juillet</em> paru dans une revue hollandaise en 1925, Cingria ajouta en janvier 1929 le r�cit d�une course nocturne � bicyclette qu�il publia chez Mermod en mars suivant, sous le titre Le Seize juillet. Parce que c�est la suite du Quinze�? Non assure l��diteur, ��parce que je lui disais que je f�tais des anniversaires familiaux les 13, 14 et 15 juillet��. ��Rien le 16�? lui demande Cingria. Ce sera le titre de ma plaquette.��<br/>M�content de ce texte, Cingria en fera para�tre une autre mouture, plus proche de ses intentions, dans la nouvelle revue surr�aliste <em>Bifur</em>�: il s�intitule alors ��Petit labyrinthe harmonique��."),
("76","138","<em> L\'Eau de la dixi�me milliaire. (Pages sur Rome) </em>","Charles-Albert Cingria","Mermod","","Aujourd�hui, n� 120","Lausanne","1932","","","3","Cingria garde des ��souvenirs sinistres�� de la r�daction de l\'un de ses chefs-d\'oe�uvre qu\'il a �crit � la commande de son �diteur et m�c�ne Henry-Louis Mermod quelques mois avant sa parution. Ces ��pages sur Rome�� illustrent id�alement l\'alliage propre � l\'auteur de promenades vigilantes et d\'�rudition galopante, d\'observations et de dissertations, de guide touristique et de r�cit fantastique. Le texte est un aqueduc. Son parcours des eaux � ��qui furent ici le d�but de tout comme elles furent le d�but de la terre�� � r�v�le une Rome � la fois ville historique et ville �ternelle."),
("77","145","<em>Le Parcours du Haut-Rh�ne ou la Julienne et l\'Ail sauvage</em>","Charles-Albert Cingria","LUF/Egloff","Textes et Croquis pris sur la Route par Charles-Albert Cingria et Paul Monnier","","Fribourg","1944","","","3","Moins baroque, plus incisif que d�autres itin�raires de l�auteur, <em>Le Parcours du Haut-Rh�ne</em> relate l�excursion de Cingria et du peintre Paul Monnier de Sierre au col du Simplon. Les deux cyclicistes observent le particulier et l�universel de la r�gion, le Haut-Valais. Ce pays ��de langue de <em>jo</em> (comme disait Dante, qui divisait l�univers connu en pays o� pour affirmer l�on dit <em>oc</em>, ou <em>oil</em>, ou <em>si</em>, ou encore l�on dit <em>jo</em>)�� alimente encore une r�flexion sur la fronti�re des langues.<br/>La publication du livre sera pour l��crivain une nouvelle occasion de fulminer contre son �diteur�: ��A ce livre, il ne comprenait rien � d�autant plus qu�il ne l�a pas lu � et les illustrations, qui en �taient l�id�e premi�re, lui paraissaient superf�tatoires.��"),
("78","182","<em>La Voile latine</em>","Charles-Albert Cingria","","","3e ann�e, n� 4","","mai-juin 1907","","","3","Apr�s avoir contribu� au premier ��essai de litt�rature romande�� (<em>Les P�nates d\'argile</em>, 1904), Cingria et son fr�re Alexandre participent � la fondation de <em>La Voile latine</em> (1904-1910). Le jeune auteur publie dans la revue son premier r�cit�: ��Lettre � Henri Spiess��. L\'�pistolaire (dont l\'auteur fera l�une de ses principales veines d\'�criture) n�est pas ici qu\'une forme litt�raire�: la lettre �tait bien � l\'origine une lettre�; elle fut publi�e � l\'insu de son auteur par ses compagnons de <em>La Voile latine</em>, car ��nous ne devons pas nous priver de l\'amusant quand il est de cette qualit頻 justifiera Ramuz.<br/>
\nLa revue s\'est finie sur un �change de baffes. Elle donna n�anmoins une claque salutaire � la litt�rature romande."),
("79","143","<em>Le Comte des formes</em>","Charles-Albert Cingria","Librairie des Trois Magots","Soci�t� des Amis de C.-A. Cingria","","Paris","1939","","","3","Cingria r��crit et r��dite L\'Eau de la dixi�me milliaire, paru 7 ans auparavant chez Mermod. Le nouveau titre est ancien�: l\'auteur y songeait d�j� en 1932. Sa r�vision prend une certaine ampleur. Il ins�re notamment, en guise de pr�ambule, une longue r�f�rence � saint Jacques de Nisibe�: la description cingrienne de la ville �ternelle s\'inscrit d�sormais sous le signe de la f�roce exactitude de l\'antique �v�que historien."),
("80","188","<em>Les P�nates d\'argile</em> ","Charles-Albert Cingria","Ch. Eggiman et Cie","","","Gen�ve","1904","","","3","Sous une couverture dessin�e par son fr�re Alexandre et repr�sentant les quatre jeunes auteurs � une table, Adalbert d\'Aigues-Belles, alias Cingria, associe ses premiers vers publi�s � ceux de son fr�re, de C. F. Ramuz et d\'Adrien Bovy. L\'ensemble, d\'inspiration symboliste et marqu� par des r�f�rences antiques et florentines, est accueilli fra�chement par la critique. Le collectif n\'en provoquera pas moins un �lan litt�raire nouveau que portera bient�t <em>La Voile latine</em>.    "),
("81","125","<em>A propos de la langue esp�ranto dite langue universelle</em>","Charles-Albert Cingria","Editons de La Voile latine","","","Gen�ve","1906","","","3","La premi�re plaquette de Cingria fut un pamphlet � ceux qui connaissent l\'homme ne s\'en surprendront gu�re. L\'�crit s\'en prend � l\'invention du Dr Zamenhof � qui le tout Gen�ve fait un concert de louanges lors du deuxi�me congr�s internationnal consacr� � l\'esp�ranto. Nous sommes � la fin du moins d\'ao�t 1906.
\nPar un subterfuge �ditorial dont il a le secret, le jeune �crivain r�agit quelques semaines � peine apr�s l\'�v�nement�; il d�nonce la ��vivisection naus�abonde�� d\'une langue faite de bric latin et de broc germanique, et l\'hybris d\'un ��monsieur � redingote et � lunettes d\'or�� qui pr�tend � cr�er une langue, alors qu\'une langue est la vie d\'un peuple. Par l�, Cingria s\'inscrit dans le d�bat sur la nature, organique ou institutionnelle, du langage qui divise les linguistes. En m�me temps que son int�r�t vif pour ces questions, il d�montre son sens de la pol�mique et son don du rythme."),
("82","184","<em>Les Limbes</em>","Charles-Albert Cingria","Jeanne Bucher","Orn� de 9 pointes s�ches de Jean Lur�at","","Paris","1930","","","3","Selon certains, Cingria et Lur�at auraient fait ensemble le voyage des �les �g�ennes qui servent de cadre � la prose po�tique des Limbes�; rien n\'est moins s�r. Pour d\'autres, il s\'agirait d\'une oeuvre de commande de l\'�ditrice et galeriste Jeann Bucher.
\nDans un explicite manuscrit �cart� par l\'auteur, celui-ci d�voile l�g�rement ses intentions�: cette po�sie narrative de l\'�tranget� repr�sente un �tat�: ��l\'�tre aux Limbes��."),
("83","186","<em>La Voix cl�mentine</em>","Charles-Albert Cingria","","1�re ann�e","n� 2","","Avril 1911","","","3","<em>La Voile latine</em> s�ach�ve dans une dissidence�: aux Feuillets qui r�unissent les ��Helv�tistes��, Charles-Albert oppose � lui seul ou presque <em>La Voix cl�mentine</em>, qui ne conna�tra que deux num�ros. Sous le patronage du pape Cl�ment VII dont le bourdon offert � Saint-Pierre de Gen�ve figure en couverture de la revue, Cingria fait r�sonner la voix de bronze.");




DROP TABLE `category`;CREATE TABLE `category` (
  `category_id` mediumint(3) NOT NULL AUTO_INCREMENT,
  `category_parent_id` mediumint(3) NOT NULL,
  `category_name` varchar(55) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


INSERT INTO category VALUES
("56","0","editions_originales"),
("57","0","en_bouquinerie"),
("58","0","en_librairie"),
("59","57","de_cingria"),
("60","57","sur_cingria"),
("61","58","de_cingria"),
("62","58","sur_cingria");




DROP TABLE `chronology`;CREATE TABLE `chronology` (
  `chronology_id` int(55) NOT NULL AUTO_INCREMENT,
  `chronology_year` int(6) NOT NULL,
  `chronology_description` text NOT NULL,
  `book_id_1` int(55) NOT NULL,
  `book_id_2` int(55) NOT NULL,
  `book_id_3` int(5) NOT NULL,
  PRIMARY KEY (`chronology_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO chronology VALUES
("1","1883","Naissance de Charles-Albert Cingria le 10 f�vrier � Ch�ne, en banlieue de Gen�ve. Son p�re, Albert Cingria (1842-1891), r�cemment naturalis�, a des racines � Raguse et � Constantinople, et occupe � Gen�ve le poste de codirecteur de la fabrique d\'horlogerie Patek-Philippe. Sa m�re, Caroline Stryienska (1846-1913), peintre, est d\'origine polonaise. Elle est la soeur de Casimir Stryienski (1853-1912), le sp�cialiste de Stendhal. Charles-Albert a un fr�re a�n�, Alexandre (1879-1945), qui deviendra l\'un des peintres et verriers les plus influents de l\'art religieux en Suisse romande. Trois ans apr�s Charles-Albert na�t Anne, sa petite soeur (1886-1974).","0","0","0"),
("2","1891","Mort d\'Albert Cingria � quarante-neuf ans.","0","0","0"),
("3","1893","Charles-Albert Cingria entre au Conservatoire de Musique de Gen�ve, pour un an.","0","0","0"),
("4","1895","Entr�e au Coll�ge de Gen�ve ; il a dans sa classe Charles Zanello, son futur beau-fr�re.","0","0","0"),
("5","1896","Vacances � Constantinople dans la famille paternelle. Retour en catastrophe avec les Arm�niens fuyant les massacres turcs. En automne, Charles-Albert Cingria est inscrit � l\'internat de l\'abbaye de Saint-Maurice, en Valais, pour deux ann�es scolaires qui le marqueront.","0","0","0"),
("6","1898","Charles-Albert Cingria est plac� � l\'internat d\'Engelberg, dans le canton d\'Obwald, qu\'il quitte en f�vrier de l\'ann�e suivante. Il s\'initie � l\'orgue et int�gre le Conservatoire de Gen�ve, pour trois ans et demi, dans la classe d\'orgue du compositeur Otto Barblan.","0","0","0"),
("7","1900","A Gen�ve, les fr�res Cingria ont pour amis les jeunes po�tes Adrien Bovy, Henry Spiess et Charles Ferdinand Ramuz, qu\'Alexandre a rencontr� � l\'arm�e.","0","0","0"),
("8","1902","A presque dix-neuf ans, Charles-Albert Cingria abandonne le Coll�ge. Il passe ses examens du Conservatoire, sauf celui d\'orgue, auquel il ne se pr�sente pas. En octobre, il s\'installe pour six mois en Italie, � Rome ; il y �tudie la musique avec Sgambati et lit Platon en latin � la biblioth�que du palais Farn�se.","0","0","0"),
("9","1903","Apr�s avoir renonc� � la composition musicale, Cingria se tourne vers les lettres. A son retour d\'Italie, au printemps, il compose ��Pecus infectum ou Parth�nias et le troupeau atteint de maladies contagieuses��, dont la lecture divise ses amis. Le texte ne sera jamais publi� ; il est aujourd\'hui perdu. Le 27 juin para�t le premier article sign� C.-A. C., dans la Gazette de Lausanne, � Les vitraux de Saint-Fran�ois�, plaidoyer en faveur de l\'oeuvre de son fr�re Alexandre. Apr�s un passage de plusieurs mois en Espagne, Cingria se rend au Maroc en octobre.","0","0","0"),
("10","1904","D�but de l\'ann�e en Italie (Sienne, Rome, Naples). En f�vrier paraissent <em><span class=\"pink\">Les P�nates d\'argile</span></em>�(��essai de litt�rature romande��). L\'ouvrage rassemble des textes de C. F. Ramuz, Adrien Bovy, Alexandre et Charles-Albert Cingria (qui signe Adalbert d\'Aigues-Belles). En mars, nouveau s�jour � Constantinople. En octobre para�t le premier num�ro de la revue La Voile latine, � laquelle collaborent notamment C. F. Ramuz, Adrien Bovy, Maurice Baud, Robert de Traz, Gonzague de Reynold et les fr�res Cingria. Charles-Albert y ins�rera dix textes jusqu\'en avril 1910. Le premier article de Cingria, � A propos du centenaire de P�trarque �, sign� A. D. Aigbessis, concerne d�j� un auteur qui l\'occupera toute sa vie. A la mi-octobre, Cingria s\'installe � Paris, 8 rue des Beaux-Arts, o� Ramuz vient le rejoindre. Ils partagent l\'appartement un mois environ, apr�s quoi Ramuz d�m�nage. ","80","0","0"),
("11","1905","Nouveaux s�jours en Italie, � Sienne (mai) et � Florence (octobre-novembre) o� r�sident son fr�re et sa belle-soeur. Cingria y fr�quente Adolfo de Carolis, le peintre et illustrateur des oeuvres de Gabriele D\'Annunzio, et compose ��La Fille du pa�en��.","0","0","0"),
("12","1906","En f�vrier, Charles-Albert Cingria visite Marseille et la Corse. Contribution unique � la revue <em>Leonardo</em> de Giovanni Papini. Il s�journe � Paris jusqu\'en avril. Cingria publie un compte rendu virulent du congr�s esp�rantiste qui se tient � Gen�ve du 28 ao�t au 1er septembre. Le pamphlet <em><span class=\"pink\">A propos de la langue esperanto, dite langue universelle</span></em>, qui para�t en septembre, constitue la premi�re publication monographique de l\'auteur. Cingria repart pour Paris en automne, et passe la fin de l\'ann�e dans le Maghreb.","81","0","0"),
("13","1907","En f�vrier, Charles-Albert Cingria est pris dans les inondations de B�ne (ancienne Hippone, Alg�rie). Il y perd une bonne partie de ses manuscrits, mais raconte l\'�pisode avec dr�lerie : la ��Lettre � Henry Spiess�� sera publi�e � son insu par ses amis dans <em><span class=\"pink\">La Voile latine</span></em> en juin. Cingria revient � Gen�ve par Florence, puis est � Paris en septembre. Nouveau s�jour � Rome en octobre.","78","0","0"),
("14","1908","En mars, Charles-Albert Cingria retrouve l\'Alg�rie. Il est de retour � Gen�ve en mai, puis se rend � Venise et � Rimini en juillet, d\'o� il s\'embarque pour Constantinople. En automne, retour � Paris. Il se brouille avec Ramuz pour une affaire de citations latines, fr�quente son oncle, le stendhalien Casimir Stryienski et fait du v�lo au Bois. Puis il retourne � Rome pour passer l\'hiver.","0","0","0"),
("15","1909","Nouveau s�jour prolong� � Constantinople, en septembre, o� il assiste � la fin du Ramadan. Retour en novembre par l\'Autriche, l\'Allemagne et Nancy, avant de faire halte � Paris. Cingria passe les f�tes � Gen�ve.","0","0","0"),
("16","1910","Retour � Paris en janvier, o� Cingria est t�moin des inondations de la Seine. Il s\'enthousiasme pour la lecture d\'Alfred Jarry, <em>Les Jours et les Nuits</em>. Conflits, � la fin de l\'ann�e, avec Robert de Traz et Gonzague de Reynold au sujet de l\'orientation de <em>La Voile latine</em>.","0","0","0"),
("17","1911","<em>La Voile latine</em>, en janvier, est ��sabord�e�� par les dissensions entre le clan ��latin�catholique�� (les Cingria et Adrien Bovy) et le clan ��Suisse protestant�� (Gonzague de Reynold et les fr�res de Traz). Sur les d�combres de la revue, Cingria fonde <em>La Voix cl�mentine</em>�; Robert de Traz Les Feuillets. Les uns et les autres se disputent les bonnes gr�ces de l\'Action fran�aise. A la suite d\'un article qu\'il juge injurieux, la situation s\'envenime entre Gonzague de Reynold et Cingria, qui gifle ce dernier sur la voie publique le 19 mars. Il en co�te cent francs d\'amendes � Cingria, qui doit en outre payer des dommages et int�r�ts � son adversaire. En avril para�t le deuxi�me (et dernier) num�ro de <em>La Voix cl�mentine</em>. Charles-Albert Cingria collabore, et pour sept publications, aux <em>Id�es de demain</em>, organe maurrassien de la Suisse fran�aise. ","0","0","0"),
("18","1912","Cingria passe l\'�t� � Gen�ve.","0","0","0"),
("19","1913","Caroline Stryienska, la m�re de Charles-Albert, dernier �l�ment stable du cercle familial, meurt le 4 f�vrier. Edmond Gilliard et Paul Budry fondent les Cahiers vaudois. Les fr�res Cingria se joignent � eux. Dans le sillage de l\'Action fran�aise, Cingria fait la connaissance du po�te Sylvain Pitt. Il fr�quente les milieux russes de Gen�ve.","0","0","0"),
("20","1914","Au printemps, Charles-Albert Cingria fait la connaissance de Max Jacob qui lui ouvre les milieux litt�raires parisiens et le met en rapport avec Cocteau, Jouhandeau, Pierre-Albert Birot, Marinetti, Tzara, Georges Hugnet. Il rencontre �galement Paul Claudel, alors consul � Hambourg. Conf�rence � Hanovre (30 mars) et � Hambourg (du 1er au 6 avril) sur la chanson fran�aise, comme accompagnateur de Sylvain Pitt, et s�jour chez Claudel. Dans la seconde quinzaine de mai, Cingria rencontre Igor Strawinsky qui, le 26 juillet suivant, lui d�die ses Trois pi�ces pour quatuor � cordes�; leur amiti� ne se d�mentira jamais.","0","0","0"),
("21","1915","Il est � Paris. Il habite Clichy, travaille, fait des promenades � bicyclette, consulte les manuscrits de la biblioth�que Sainte-Genevi�ve et fr�quente Sylvain Pitt. Cingria contribue en f�vrier et en mai aux Cahiers vaudois, avec les ��Extraits des notes de garage du neveu aux billettes��, et la ��Profession de foi d\'un embusqu� savoyard��. En automne, Cingria d�m�nage et s\'installe au num�ro 1, rue Gabrielle (XVIIIe arrondissement).","0","0","0"),
("22","1916","Ernest Ansermet d�die � Charles-Albert Cingria sa Complainte pour piano et chant. ","0","0","0"),
("23","1917","Nouveau d�m�nagement au 41, boulevard Victor, chez la soeur de son ami Vladimir P�clard (le ��Monsieur Demitri�� des <em>Autobiographies de Brunon Pomposo</em>). En mai, il assiste � Parade d\' Erik Satie. En ao�t, il rend visite � Blaise Cendrars, � Courcelles, dans la Beauce.","0","0","0"),
("24","1918","Charles-Albert Cingria enseigne pour subsister. La guerre ayant an�anti les ressources financi�res de sa famille, il fait l\'apprentissage de la pauvret�. En juin, il s\'installe au 59, rue Bonaparte, � Paris, o� il restera trente-six ans.","0","0","0"),
("25","1919","Mort de Sylvain Pitt, le 7 mai � Paris. Charles-Albert Cingria lui consacre un important article n�crologique dans <em>La Revue romande</em>. Le ��Prologue du jeu de saint Gervais et Protais�� para�t dans la revue <em>Schweizerland</em> (Zurich). Cingria passe l\'�t� � Gen�ve. Il lit Quinte-Curce. En automne, La Revue romande publie ��Le Grand Rythme ou mon nationalisme surint�gral��. ","0","0","0"),
("26","1920","Charles-Albert Cingria enseigne et fait ��des remplacements de cin�ma�� dont on ne sait rien, �crit et compose ���norm�ment��. Il passe le printemps � Muralto (Tessin), chez son fr�re absent. Il fr�quente Jacques Maritain et met en rapport Paul Budry et Blaise Cendrars.","0","0","0"),
("27","1921","A Paris, Charles-Albert Cingria vit la mis�re pire qu\'en 1917-1918. En janvier, premier article publi� en France�: ��Le Plain-chant romain�� para�t dans <em>Les Ecrits nouveaux</em> de Paul Budry et Andr� Germain. Il travaille au ��Temps premier indivisible�� qu\'il ne fera jamais para�tre. Voyage en Italie en mars (Chiari et Rome). En d�cembre, Cingria poursuit ses recherches musicologiques en Allemagne (Bamberg et Berlin) et en Autriche (Innsbruck).","0","0","0"),
("28","1922","Charles-Albert Cingria est en Italie en janvier (V�rone, Chiari et Bologne), en mars � Avignon et � Marseille, dans les pr�paratifs de l\'Exposition coloniale. Son premier s�jour � l\'Abbaye de Saint-Beno�t-sur-Loire, o� Max Jacob r�side depuis un peu plus d\'un an, a lieu en septembre. Il fr�quente � Paris les r�unions organis�es par Daniel-Henry Kahnweiler o� se rencontrent Antonin Artaud, Armand Salacrou, Erik Satie, Max Jacob, Tristan Tzara ou Robert Desnos. En novembre, il apprend � �crire � la machine.","0","0","0"),
("29","1923","En mai ou juin, premier voyage � Saint-Gall pour des recherches musicologiques. Il annonce � Paul Budry, alors �diteur � Paris avec son fr�re, un ��trait� sur le rythme�� � venir dans quelques mois. <em>La Civilisation de Saint-Gall</em> ne paraitra toutefois qu\'en 1929, aux Editions Payot. Cingria passe l\'�t� en Suisse. Il tente de r�gler les questions pendantes au sujet des propri�t�s familiales en Turquie (disputes avec son fr�re Alexandre). Parution en novembre de la premi�re notice de dictionnaire consacr�e � Charles-Albert Cingria, par Paul-Edmond�Martin dans le <em>Dictionnaire historique et biographique de la Suisse</em>.","0","0","0"),
("30","1924","Publication du ��Secret de l\'art palestrin�en�� dans <em>The Transatlantic Review</em>, �ph�m�re revue des Am�ricains de Paris, � la r�daction de laquelle travaille Ernest Hemingway. En octobre et novembre, Cingria voyage en Belgique et en Hollande pour ses recherches musicologiques.","0","0","0"),
("31","1925","<em>L\'Histoire du soldat</em> de Ramuz et Strawinsky est repr�sent�e � Paris (article de Cingria dans <em>Les Chroniques du jour</em>). Apr�s la repr�sentation, r�union avec Jean Villard Gilles, G�a Augsbourg et Ren� Morax. Cingria, en avril et mai, est � Saint-Beno�t-sur-Loire chez Max Jacob. En novembre, � Milan, son fr�re Alexandre est incarc�r� � la prison San Vittore � la suite de circonstances �tranges. Sur intervention d\'un conseiller d\'Etat genevois, il est lib�r� apr�s cinq jours, sans explications ni excuses. Cingria rencontre en Hollande le peintre Otto van Rees, son gendre l\'�crivain Albert Kuyle et le m�decin-peintre Hendrik Wiegersma�; il contribue � la revue catholique <em>De Gemeenschap</em> avec ��Le Quinze Juillet�� notamment. Contributions �galement aux Chroniques du jour de Gualtieri di San Lazzaro et contacts avec les Italiens anti-fascistes de Paris.","0","0","0"),
("32","1926","Parution de ��Oceanus sociabilis�� dans <em>Les Chroniques du jour</em>, devan�ant la condamnation de l\'Action fran�aise par Rome en d�cembre et l\'excommunication de ses adh�rents en mars suivant. En juin, il prend part � la publication de Pour ou contre C. F. Ramuz, avec l\'article ��Ramuz chez lui et ailleurs��. En novembre, Cingria est emprisonn� pour trois mois � la prison Regina Coeli � Rome. C\'est un d�lit de moeurs qui l\'am�ne l�, aggrav� peut-�tre d\'insultes � Mussolini. Il sortira au d�but de 1927 sur l\'intervention de Jacques Maritain, ambassadeur pr�s le Saint-Si�ge, de Paul Claudel et de Gonzague de Reynold.","0","0","0"),
("33","1927","Au matin du 4 f�vier, apr�s trois mois de d�tention, Charles-Albert Cingria est rel�ch� et reconduit � la fronti�re suisse. Dans ses affaires confisqu�es se trouvent deux manuscrits in�dits qu\'il ne r�cup�rera jamais�: ��La Politique en un seul grand livre�� et ��La Grande Ti�deur herbeuse��. Cingria s�journe en Suisse chez diff�rents amis, entre Gen�ve, Berne, Fribourg et Lausanne. Il compose ��Le D�part du th��tre en flammes�� et ��La Grande Ourse�� entre f�vrier et juin, dont seuls cinq fragments para�tront en 1929 dans l\'hebdomadaire <em>Aujourd\'hui</em>. Publication, fin d�cembre, de <em>Lur�at ou la peinture avec des phares</em> (��Aux Editions Bladzvranckx, Amsterdam��), tir� � 41 exemplaires.","0","0","0"),
("34","1928","Charles-Albert Cingria s�journe � Saint-Beno�t-sur-Loire, apr�s une visite au docteur Tch�koff, � Briare. <em> <span class=\"pink\">Les Autobiographies de Brunon Pomposo</span></em> paraissent en juillet, � l\'enseigne des Editions des Lettres de Lausanne. Cingria s�journe en Valais, en ao�t, � Muraz-sur-Sierre o� il compose Pendeloques alpestres qu\'il ach�vera en d�cembre, � Hermance (Gen�ve). Entr�e en contact avec l\'�diteur Henry-Louis Mermod.","8","0","0"),
("35","1929","Ann�e riche en publications�: <em> <span class=\"pink\">Pendeloques alpestres</span></em> et <em><span class=\"pink\">Le Seize Juillet</span></em> paraissent chez Mermod, � Lausanne, en janvier et en mars. Charles-Albert Cingria publie une seconde version du <em>Seize Juillet</em> en mai dans Bifur, la revue que viennent de fonder Pierre L�vy et Georges Ribemont-Dessaignes�: il l\'intitule Petit labyrinthe harmonique. <em><span class=\"pink\">La Civilisation de Saint-Gall</span></em>, esquisse d\'un fulgurant d�veloppement de la s�quence po�tique, de Notker le B�gue � Blaise Cendrars, para�t en juin chez Payot dans la s�rie des Cahiers romands (r�compens� par un prix de la Fondation Schiller en 1932). En d�cembre, Charles-Albert Cingria entame sa collaboration � l\'hebdomadaire Aujourd\'hui que viennent de fonder Mermod, Ramuz et Gustave Roud. Il y publiera quelque soixante-dix textes jusqu\'en 1932.","11","17","75"),
("36","1930","D�but janvier, Charles-Albert Cingria est en Belgique, en Allemagne et en Hollande. En mars il fait para�tre <em>Les Limbes</em>, illustr� par Jean Lur�at. Les eaux-fortes de l\'artiste sont expos�es � Paris, dans la galerie de Jeanne Bucher. En mai et en juin, Cingria voyage avec Max Jacob et Pierre Minet en Bretagne, � la recherche du hameau o� avait d�barqu� saint Colomban au VIe si�cle�: il en fera le r�cit dans <em>Le Canal exutoire</em>. Cingria est � B�le en d�cembre.","0","0","0"),
("37","1931","En f�vrier, il est � Paris. <em><span class=\"pink\">Le Canal exutoire</span></em> para�t en avril chez Mermod. Ramuz s\'�tant cass� le bras gauche � la fin de l\'hiver et l\'ayant racont� dans Une main, Charles-Albert Cingria l\'imite en juin, y ajoutant la clavicule droite, lors d\'une chute � bicyclette. ��Ce pays qui est une vall�e�� est publi� en novembre dans Aujourd\'hui. Cingria passe No�l chez le po�te Bravig Imbs qui lui pr�sente Henry Miller.","26","0","0"),
("38","1932","En janvier, Charles-Albert Cingria jette le manuscrit de son P�trarque au feu, d�sesp�rant de parvenir � le faire �diter. Il est � Lausanne en mars, et, au printemps, il reconstitue le livre d\'apr�s son brouillon. Voyage au Mont Ventoux sur les traces de P�trarque. En mai, probablement, Mermod publie les <em><span class=\"pink\">Impressions d\'un passant � Lausanne</span></em>. Cingria passe l\'�t� � Arlesheim (B�le-Campagne) chez Robert Hess. En d�cembre, les Editions Payot publient <em><span class=\"pink\">P�trarque</span></em>.","23","18","0"),
("39","1933","Parution en mars de <em><span class=\"pink\">L\'Eau de la dixi�me milliaire</span></em> chez Mermod. En juin, Cingria publie pour la premi�re fois un article dans <em>La Nouvelle Revue fran�aise</em>�; Claudel demande � Jean Paulhan d\'assurer � Cingria une collaboration r�guli�re�: elle durera jusqu\'en 1940, et s\'�tendra sur quelque soixante-dix articles, dont une moiti� sont des comptes rendus d\'oeuvres. Cingria, en ao�t, est au Tessin. Le 28 novembre, il signe avec Henry-Louis Mermod un contrat de cinq ans (le ��contrat du Pavillon��)�: pour cent francs suisses par mois, l\'auteur s\'engage � fournir annuellement � l\'�diteur cent vingt pages de copie.","76","0","0"),
("40","1934","Plusieurs articles dans <em>La Revue musicale</em> d\'Henry Pruni�res, entre janvier et avril. ��Hippolyte hippocampe��, d\'apr�s Euripide, para�t dans <em>La Nouvelle Revue fran�aise</em> en juin. Cingria passe la seconde partie de l\'ann�e en Haute-Savoie et en Suisse, notamment � Ouchy. En septembre, il livre le premier ��Air du mois�� dans <em>La Nouvelle Revue fran�aise</em>.","0","0","0"),
("41","1935","Charles-Albert Cingria re�oit le Prix Rambert pour <em>P�trarque</em>, en juin. Rencontre avec l\'�crivain et critique d\'art Jean Dunoyer.","0","0","0"),
("42","1936","En avril, Charles-Albert Cingria passe � la radio�: il gagne mille francs en parlant six minutes au Poste parisien. Il collabore � <em>Mesures</em> et � <em>Arts et m�tiers graphiques</em>. Il rencontre le peintre Paul Monnier. Sous la direction de son fr�re Alexandre, il collabore � la restauration du temple de Crans-sur-Nyon, puis donne des conf�rences � Nyon, Lausanne, Fribourg, Zurich, B�le et Berne.","0","0","0"),
("43","1937","Charles-Albert Cingria passe pour la quatri�me fois cons�cutive les six derniers mois de l\'ann�e en Suisse et en Haute-Savoie, notamment � Monthoux. En �t�, il compose ��G�ographie vraie�� pour Mermod, qui le gardera in�dit. D�but octobre, Cingria rencontre Gertrude Stein � Bilignin, dans l\'Ain, par l\'entremise de Pierre Leyris. En d�cembre para�t � la Guilde du Livre <em>Notre terre et ses gens</em>, recueil de dessins de G�a Augsbourg dont Cingria signe la pr�face.","0","0","0"),
("44","1938","Charles-Albert Cingria collabore � diff�rentes revues�: <em>XXe si�cle</em>, <em>Le Point</em>, <em>Vendredi</em>... Il assiste en septembre au soixanti�me anniversaire de Ramuz, � Chexbres, et participe � l\'Hommage � Ramuz qui para�t � cette occasion.","0","0","0"),
("45","1939","Voyage � Berne, chez son ami Paul Rosset. Au printemps, le po�te Alo�s-Jean Bataillard cr�e � Paris une �ph�m�re association des ��Amis de Charles-Albert Cingria��, qui publie <em><span class=\"pink\">Le Comte des formes</span></em>, version retouch�e de <em>L\'Eau de la dixi�me milliaire</em>. Excursion dans l\'Ain avec Balthus. A la veille de la guerre, Charles-Albert Cingria quitte Paris pour la Suisse. A No�l para�t son premier article dans la revue <em>Formes et Couleurs</em>.","79","0","0"),
("46","1940","Charles-Albert Cingria est � Gen�ve et Lausanne. Il conna�t des jours sombres, vit d\'articles mal pay�s. En mai para�t son dernier article dans La Nouvelle Revue fran�aise, bient�t musel�e par l\'occupation allemande. Conf�rence-causerie � Ascona en �t�. En octobre, il publie son premier article dans l\'hebdomadaire neuch�telois <em>Curieux</em>, qui en donnera quinze jusqu\'� la fin de la guerre. Cingria passe l\'�t� chez des amis, les Chevalley, � Pr�verenges dans le canton de Vaud.","0","0","0"),
("47","1941","Fribourg, Lausanne, Ouchy, Valais. En juillet, conf�rence dans les locaux lausannois de la Guilde du Livre, intitul�e ��Vingt et un ans � Paris��. Il la r�p�te � Fribourg, puis � Gen�ve. En ao�t para�t le recueil <em><span class=\"pink\">Stalactites</span></em>, publi� � grand tirage et illustr� par Auberjonois. Cingria fait une premi�re excursion avec Paul Monnier en Valais. En novembre il fonde � Saint-Saphorin, avec G�a Augsbourg, les <em>Petites Feuilles</em>, publi�es gr�ce au soutien de la maison Veillon. Cinq num�ros para�tront jusqu\'en 1942.","19","0","0"),
("48","1942","Collaboration � <em>Po�sie 42</em>, <em>Confluences</em> et <em>Formes et Couleurs</em>. En septembre para�t son premier article dans le journal lausannois L\'Action, qui en publiera pr�s d\'une trentaine jusqu\'� la fin de la guerre. En automne, il b�n�ficie de l\'action f�d�rale de secours en faveur des artistes et intellectuels, qui lui alloue une aide financi�re.","0","0","0"),
("49","1943","Accident de v�lo � Montricher, o� il avait assist� au mariage de G�rard Buchet. Au printemps, Charles-Albert Cingria se rend pour une seconde excursion en Valais avec Paul Monnier. Ils en donneront le r�cit illustr� dans <em>Le Parcours du Haut-Rh�ne</em> l\'ann�e suivante. C\'est � Fribourg que Cingria trouve alors refuge, au 5 de la Grand-Rue. Ses voisins sont Alo�s-Jean Bataillard, Georges Borgeaud et Pierre-Olivier Walzer. En juillet para�t <em>Enveloppes</em>, chez Gonin�: treize courts textes d\'apr�s vingt lithographies d\'Auberjonois, luxueusement imprim�s. Cingria donne une conf�rence en novembre, � Fribourg. Parution de <em>La Complainte de Venus d\'Othon de Grandson</em> avec des gloses marginales de Cingria.","0","0","0"),
("50","1944","Max Jacob meurt le 5 mars. Cingria lui rend hommage dans <em>Curieux</em> et <em>Labyrinthe</em>. A la m�me �poque, il termine son livre sur la reine Berthe, mais ��aucun �diteur ne s\'y int�resse��. D�but de la collaboration � la <em>Revue de la Maison Charles Veillon</em> et au <em>Journal de la Maison Charles Veillon</em>. Le <em><span class=\"pink\">Parcours du Haut-Rh�ne, ou la Julienne et l\'ail sauvage</span></em> est publi� en septembre aux Editions Egloff. En d�cembre, <em>Florides helv�tes</em> para�t aux Editions des Portes de France, � Porrentruy, aux bons soins de Pierre-Olivier Walzer.","77","0","0"),
("51","1945","De janvier � mars, Charles-Albert Cingria donne une s�rie de huit conf�rences musicologiques au Conservatoire de Lausanne, et une conf�rence en mai sur l\'Histoire du soldat au Cercle des Arts de Gen�ve. <em><span class=\"pink\">Le Camp de C�sar</span></em>, illustr� par G�a Augsbourg, para�t en mai aux Editions Michod et Cie. Blaise Cendrars, dans son <em>Homme foudroy�</em> paru en ao�t, insulte Charles-Albert Cingria, brouillant les deux hommes � vie. Cingria lui r�pondra dans <em>Bois sec Bois vert</em>, en 1948. ��Le Carnet du chat sauvage�� para�t dans <em>Labyrinthe</em> entre ao�t et octobre. Mort d\'Alexandre Cingria le 8 novembre. Deux jours plus tard para�t <em><span class=\"pink\">Musiques de Fribourg</span></em> aux Editions de Belles-Lettres, avec des croquis de Bernard Schorderet. A la fin de l\'ann�e, Charles-Albert Cingria quitte Zurich, o� il travaille � une pr�sentation du sculpteur B�nninger, et retrouve, � Paris apr�s sept ans d\'absence, son logement de la rue Bonaparte. Le 13 d�cembre, il assiste pour la premi�re fois � un des fameux ��Jeudis�� de la m�c�ne Florence Gould, avenue Malakoff, en compagnie de Paulhan, Jouhandeau, Marcel Arland, Marie Laurencin, Paul L�autaud...","72","25","0"),
("52","1946","Charles-Albert Cingria pr�sente au Th��tre des Champs-Elys�es la reprise de l\'<em>Histoire du soldat</em>. <em>Enveloppes</em> est repris par Mermod � Lausanne dans sa collection du ��Bouquet��.","0","0","0"),
("53","1947","En janvier, il donne des conf�rences � Paris sur P�trarque et Philippe de Vitry, avec la cantatrice Gis�le Peyron. En avril, Jean Dubuffet et Arman Robin prennent publiquement sa d�fense�: Cingria est accus� de tenir des propos ��collaborationnistes��. Ramuz meurt le 23 mai. En avril, Charles-Albert Cingria contribue pour la premi�re fois aux <em>Cahiers de la Pl�iade</em>, succ�dan� de <em>La Nouvelle Revue fran�aise</em> alors en ���puration��. Parution, en mai chez Mermod, du <em>Bey de Pergame</em> (suivi d\'une r��dition du <em>Canal exutoire</em>). Cingria s�journe en �t� chez Suzanne T�zenas, pr�s d\'Annecy. Il passe ensuite quelque temps � Aix-en-Provence chez le couple de peintres Meraud et Chili Guevara. <em><span class=\"pink\">La Reine Berthe et sa famille</span></em> para�t en novembre aux Editions des Trois Collines. C\'est le dernier de ses livres publi� de son vivant. L\'ouvrage est r�compens� par la Fondation Schiller.","20","0","0"),
("54","1948","S�ance de signature, en f�vrier, de <em>La Reine Berthe et sa famille</em> � la librairie du Cam�e, puis d�ner � la Brasserie Marty avec une cinquantaine de personnes, dont Paulhan, Strawinsky, Michaux, Dubuffet, L�ger, Follain, Fran�ois Michel. Charles-Albert Cingria retourne � Aix en mai, chez les Guevara, puis en septembre. Passage � Annecy chez Suzanne T�zenas. <em><span class=\"pink\">Bois sec Bois vert</span></em>, premier volume de l\'Oeuvre compl�te initi�e par Paulhan, para�t chez Gallimard � la fin du mois de septembre. Les ventes sont d�sasteuses et une partie du tirage est pilonn�. Les autres volumes pr�vus ne verront pas le jour.","21","0","0"),
("55","1949","Cingria passe plusieurs mois, entre juillet et octobre, � Aix chez les Guevara, et � Annecy chez Suzanne T�zenas. Pr�face � <em>Chiens</em>, album de la photographe Ylla (Kamilla Koffler) et publication d\'Otto B�nninger, sur le sculpteur zurichois, avec l\'introduction de Cingria.","0","0","0"),
("56","1950","En f�vrier, premi�re contribution de Charles-Albert Cingria � <em>Carreau</em>, la revue de Freddy Buache, qui en publiera une douzaine jusqu\'en 1952. Cingria partage son temps entre Paris et le Ch�teau de Rubelles, pr�s de Melun, chez le peintre Cosme de Scorailles et le musicien Fran�ois Michel. Visite � Nicolas Nabokov en juillet, � Recloses. Second semestre � Aix chez les Guevara. Conf�rence sur � Le Musical pur � chez Suzanne T�zenas, � Paris.","0","0","0"),
("57","1951","Charles-Albert Cingria est � Aix en juillet, chez les Guevara. Il retrouve Strawinsky � Venise en septembre, pour la premi�re du <em>Rake\'s progress</em>. S�jour chez Brigitte et Jean Gros, � Malagny. Cingria deviendra le parrain de leur petit-fils l\'ann�e suivante. Chili Guevara meurt en octobre. Cingria collabore en octobre � Pr�sence de Ramuz, un recueil d\'hommages publi� par la Guilde du Livre.","0","0","0"),
("58","1952","En mars, Charles-Albert Cingria donne une conf�rence chez Suzanne T�zenas�: ��Le lait de la louve, ou de la nationalit� de la civilisation��. Charles-Albert Cingria assiste en mai au festival ��L\'oeuvre du XXe si�cle��, � Paris, o� il retrouve Nicolas Nabokov et Igor Strawinsky. Il passe l\'�t� � Saint-Tropez, le d�but de l\'automne chez Brigitte et Jean Gros. En octobre, un accident de v�lo le m�ne � l\'h�pital, en Suisse. Il est bless� � la cage thoracique. Cingria fausse compagnie � ses m�decins de Gen�ve (parmi lesquels le jeune Jean Starobinski) pour rejoindre Meraud Guevara � Aix�; il passe les f�tes de fin d\'ann�e � Saint-Tropez.","0","0","0"),
("59","1953","<em>Le Bey de Pergame</em> est publi� dans <em>La Parisienne</em> de Jacques Laurent. Reprise en f�vrier de sa collaboration � <em>La Nouvelle Nouvelle Revue fran�aise</em>, qui vient de rena�tre. Charles-Albert Cingria passe l\'�t� � Saint-Tropez chez Cosme de Scorailles, puis � Aix chez Meraud Guevara. Entre ao�t et octobre, il est � Malagny chez Brigitte et Jean Gros. En septembre il est trait� � l\'h�pital de Gen�ve. Sa sant� se d�grade rapidement. Il donne la conf�rence � Retour et volte-face �  � Sion et � Gen�ve en octobre et novembre.","0","0","0"),
("60","1954","A la mi f�vrier, Meraud Guevara recueille Cingria � Lille, puis, d�s le mois de juillet, chez elle � Aix. Cingria se d�bat avec une cirrhose du foie avanc�e. Le Dictionnaire intuitif de Chili Guevara est publi� en mai, avec le ��T�moignage-pr�face�� de Cingria. Le 29 juillet� Cingria est ramen� � Gen�ve en ambulance, par sa ni�ce Isabelle Melley. Il meurt � l\'h�pital le 1er ao�t, � l\'�ge de soixante et onze ans. Les obs�ques ont lieu le 3 ao�t � V�senaz, son village d\'enfance. A la porte de son appartement de la rue Bonaparte, on trouve affich� le billet suivant�: ��Absent probablement jusqu\'� la fin du mois��. Une messe solennelle est c�l�br�e � Paris, en son honneur, le 11 novembre � Saint-Sulpice.","0","0","0");




DROP TABLE `language`;CREATE TABLE `language` (
  `language_id` smallint(3) NOT NULL,
  `language_name` varchar(55) NOT NULL,
  `language_short_name` varchar(25) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO language VALUES
("1","English","EN"),
("2","Fran?�ais","FR"),
("3","Deutsch","DE"),
("4","Italiano","IT");




DROP TABLE `news`;CREATE TABLE `news` (
  `news_id` int(255) NOT NULL AUTO_INCREMENT,
  `news_category_id` int(255) NOT NULL,
  `subcategory_id` int(55) NOT NULL,
  `news_time` time NOT NULL,
  `language_id` smallint(3) NOT NULL,
  `news_title` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `news_title_2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `news_title_3` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `news_subtitle` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `news_short_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pool_list_2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `news_content` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `upload_file_id` int(55) NOT NULL,
  `dir_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sound_dir_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bio_dir_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `news_public_date` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `admin_id` tinyint(3) NOT NULL,
  `news_status` tinyint(1) NOT NULL DEFAULT 1,
  `news_rank` tinyint(3) NOT NULL DEFAULT 1,
  `news_publication_start_date` date NOT NULL,
  `news_publication_end_date` date NOT NULL,
  `news_creation_date` date NOT NULL,
  `news_modification_date` date NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


INSERT INTO news VALUES
("4","2","9","20:00:00","2","Stile Antico","Ensemble vocal","Palestrina, Lassus, Victoria...<br/><em>Cantique des cantiques</em>","Palestrina, Lassus, Victoria� Cantique des cantiques","Stile Antico","a:1:{i:0;s:1:\"1\";}","<p><strong>Dimanche 24 avril 2011</strong> (P�ques)
\n17h00, Eglise des J�suites, Sion
\n(gratuit avec collecte)</p>
\n
\n<p><strong>Jeunes artistes valaisans</strong>
\nMarie-Marthe Claivaz, soprano
\nQuatuor Fratres</p>
\n
\n<p><em>Stabat Mater, Luigi Boccherini (1743-1805)</em></p>","1","uploads/images_concerts/stile_antico","0","uploads/biographies_concert/biographie_stile_antico","28.05.2011","1","1","2","2011-03-17","2012-03-17","2011-03-17","2011-04-29"),
("14","1","10","17:00:00","2","Jeunes artistes","Ensemble Fratres & M.M. Claivaz","Luigi Boccherini<br/><em>Stabat Mater</em> G 332","Ensemble Fratres & Marie-Marthe Claivaz / Luigi Boccherini, Stabat Mater","Jeunes artistes","a:2:{i:0;s:2:\"10\";i:1;s:2:\"11\";}","<p><strong>Jeunes Artistes</strong>
\nMarie-Marthe Claivaz, soprano
\nQuatuor Fratres</p>
\n
\n<p><em>Stabat Mater, Luigi Boccherini (1743-1805)</em></p>","30","uploads/images_concerts/jeunes_artistes_valaisans_2011","0","uploads/biographies_concert/biographie_jeunes_artistes","24.04.2011","1","1","1","2011-03-19","2021-03-19","2011-03-19","2011-06-08"),
("15","2","9","17:00:00","2","Ensemble Daedalus","Roberto Festa","<em>O Vergin Santa non m\'abbandonare</em>","O Vergin Santa non m�abandonare","Daedalus","a:1:{i:0;s:1:\"4\";}","","46","uploads/images_concerts/daedalus","0","uploads/biographies_concert/biographie_daedalus","12.06.2011","1","1","3","2011-03-19","2021-03-19","2011-03-19","2011-06-08"),
("16","2","9","17:00:00","2","Musica Fiorita","Daniela Dolci","Barbara Strozzi <em>Nascente Maria</em>","Barbara Strozzi, Nascente Maria","Musica Fiorita","a:1:{i:0;s:1:\"5\";}","","6","uploads/images_concerts/musica_fiorita","0","uploads/biographies_concert/biographie_musica_fiorita","25.09.2011","1","1","4","2011-03-19","2021-03-19","2011-03-19","2011-04-18"),
("17","2","10","20:00:00","2","Concerto Soave","J.-M. Aymes<br/>Mar�a C. Kiehr","<em>Il Canto delle Dame</em>","Il Canto delle Dame","Concerto Soave","a:1:{i:0;s:1:\"7\";}","<p>N� de la rencontre de Mar�a Cristina Kiehr et Jean-Marc Aymes, Concerto Soave fut au d�part con�u comme un �crin de solistes ench�ssant la voix unique de la soprano. Plus particuli�rement vou� � la musique italienne du seicento, ses concerts � travers le monde et ses enregistrements marquent immanquablement le paysage musical baroque.</p>","3","uploads/images_concerts/concerto_soave","0","uploads/biographies_concert/biographie_concerto_soave","18.11.2011","1","1","6","2011-03-22","2021-03-22","2011-03-22","2011-04-18"),
("18","2","9","17:00:00","2","Huelgas Ensemble","Paul Van Nevel","Palestrina, White & Lassus<br/><em>Apog�e de la polyphonie sacr�e</em>","Palestrina, White et Lassus, Apog�e de la polyphonie sacr�e","Huelgas Ensemble","a:1:{i:0;s:1:\"6\";}","","5","uploads/images_concerts/huelgas","0","uploads/biographies_concert/biographie_huelgas","16.10.2011","1","1","5","2011-03-30","2021-03-30","2011-03-30","2011-04-18");




DROP TABLE `news_category`;CREATE TABLE `news_category` (
  `news_category_id` int(55) NOT NULL AUTO_INCREMENT,
  `news_category_parent_id` smallint(3) NOT NULL,
  `news_category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`news_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO news_category VALUES
("1","0","Ouverture"),
("2","0","Saison"),
("3","0","Soutien");




DROP TABLE `pages`;CREATE TABLE `pages` (
  `page_id` mediumint(55) NOT NULL AUTO_INCREMENT,
  `profile_id` mediumint(55) NOT NULL,
  `page_type` tinyint(3) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_content` text NOT NULL,
  `dir_name` varchar(55) NOT NULL,
  `media_url` varchar(55) NOT NULL,
  `discography_id` int(55) NOT NULL,
  `page_rank` tinyint(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO pages VALUES
("5","12","1","Engagement de l\'agence","<p>Diffusion et gestion administrative</p>","0","","0","4"),
("6","15","1","Engagement de l\'agence","<p>Diffusion et gestion administrative</p>","0","","0","6"),
("7","4","1","Engagement de l\'agence","<p>Diffusion, gestions administrative et financi�re</p>","0","","0","5"),
("8","13","1","Engagement de l\'agence","<p>Diffusion en Suisse et en Autriche</p>","0","","0","8"),
("9","12","1","Bertrand Bochud","<p>D�s l\'�ge de huit ans, Bertrand Bochud suit d�s des cours de piano, de chant et d\'orgue au Conservatoire de Fribourg. Apr�s l\'obtention du dipl�me d\'enseignement en 2004, pour lequel il a re�u le prix de la Fondation Max et Axelle Koch de Lucerne, il termine sa formation par la virtuosit� \"mention excellente avec f�licitations du jury\" aupr�s de Michel Brodard �la Musikhochschule de Lucerne. Il se perfectionne actuellement aupr�s de Tiny Westendorp.</p>
\n
\n<p><br/></p>
\n
\n<p>Dans le domaine du r�cital, son r�pertoire comprend plusieurs cycles de Lieder romantiques allemands : <i>Winterreise</i> de Schubert ou <i>Dichterliebe</i> de Schumann ainsi que des m�lodies fran�aises de Faur�, Bizet, Duparc et Poulenc. Bertrand Bochud a pr�sent� r�cemment un r�cital de musique russe au c�t� de la mezzo-soprano Brigitte Balleys. Cette collaboration se poursuit avec la pr�paration d\'un programme autour du compositeur fran�ais Emmanuel Chabrier. Le duo sera accompagn� par le pianiste Laurent Martin.</p>
\n
\n<p><br/></p>
\n
\n<p>Bertrand Bochud aborde �galement volontiers des pages de musique contemporaine dont r�cemment une cr�ation pour t�nor et quatuor �cordes de Dominique Gesseney-Rappo : le <i>Nunc Dimitis</i> interpr�t� en collaboration avec le Quatuor Sine Nomine.</p>
\n
\n<p><br/></p>
\n
\n<p>Durant l\'�t� 2008, il tient le r�le de Rodolphe dans la production de <i>La Boh�me</i> de Puccini pour l\'Association Ouverture-Op�ra �la Ferme Asile de Sion.</p>
\n
\n<p><br/></p>
\n
\n<p>D�s la rentr�e 2010, il enseigne au Conservatoire de Lausanne.</p>
\n
\n<p><br/><br/>
\n<a href=\"http://www.bertrandbochud.ch\" onclick=\"window.open(this.href, \'_blank\'); return false;\">www.bertrandbochud.ch</a></p>","uploads/img_bertrand_bochud","","0","1"),
("10","4","1","Ensemble Daedalus","<p>Fond� �Gen�ve en 1986 par Roberto Festa, Daedalus consacre les deux premi�res ann�es de son activit� �la recherche. Les programmes qui virent les d�buts de l\'ensemble, lors du prestigieux Festival des Flandres, et � Milan, lors de Musica e poesia a San Maurizio, sont le r�sultat concret de cette p�riode d\'�tude. Le succ�s rencontr� � Bruges ouvre la voie � deux collaborations essentielles dans le parcours du groupe : avec Accent, tout d\'abord, la maison de disques qui a enregistr� 10 de ses CDs, et RTB 3, la cha�ne culturelle de la radio belge, coproductrice de 4 d\'entre eux. </p>
\n
\n<p><br/></p>
\n
\n<p>En 1994, Daedalus r�alise la repr�sentation int�grale de <i>La Purpura de la Rosa</i>, de Tom�s Torrejon y Velasco, en collaboration avec le Teatro Lirico della Citt�di Messina et le Teatro Comunale di Bologna. Pour Bologne 2000, capitale europ�enne de la culture, l\'Ensemble Daedalus monte <i>L\'Aurora Ingannata</i> de Girolamo Giacobbi. La presse sp�cialis�e prime l\'originalit� des enregistrements de l\'ensemble. Les 12 CDs sont salu�s avec enthousiasme par la critique et se voient gratifi�s de 19 prix.</p>","uploads/img_ensemble_daedalus","","0","1"),
("11","13","1","Hirundo Maris","<p>Arianna Savall et Petter Udland Johansen cr�ent Hirundo Maris en 2009. Leur souhait est de se sp�cialiser tout d\'abord dans la musique ancienne tout en gardant une place importante pour des cr�ations contemporaines de leur composition.</p>
\n
\n<p><br/></p>
\n
\n<p>Leur projet porte principalement sur la musique m�diterran�enne et nordique. A l\'image de l\'hirundo maris, un oiseau migrateur, les musiciens retrouvent, gr�ce � un travail men� conjointement, les chemins de la mer et de la musique qui, depuis la nuit des temps, unissent les pays scandinaves � la p�ninsule ib�rique. Il ne s\'agit pas seulement d\'un voyage musical unique entre les pays civilis�s, l\'Espagne et la Norv�ge, ou encore entre le Sud et le Nord, mais �galement d\'un parcours � travers les si�cles.</p>
\n
\n<p><br/></p>
\n
\n<p>Hirundo Maris, ensemble � g�om�trie variable rassemblant diff�rents solistes, enchante les amateurs de musique par sa diversit� sonore. Son premier disque sera disponible au printemps 2012 sous le prestigieux label ECM.</p>","uploads/img_hirundo_maris","","0","1"),
("12","15","1","Marquis de Saxe","<p>Fond� en automne 1988 au Conservatoire de Lausanne et apr�s avoir connu divers changements, Marquis de Saxe est constitu� depuis 2000 de saxophonistes tous en possession d\'un 1er prix de virtuosit�. Ils travaillent comme p�dagogues dans les Conservatoires de Sion, Lausanne, Fribourg et Morges (COV), ainsi qu\'� la HEM de Lausanne et � l\'Ecole de Musique de Lucerne.</p>
\n
\n<p><br/></p>
\n
\n<p>En 1990, Marquis de Saxe remporte un 2�me prix au Concours National de Musique Contemporaine de la fondation B.A.T.; � cette occasion, il interpr�tait entre autres la premi�re pi�ce �crite sp�cialement � son intention par Alexis Chalier. Depuis, le quatuor entretient diverses collaborations avec les compositeurs Jean-Fran�ois Bovard, Andor Kovach, Jean-Fran�ois Michel, Claude Ferrier, Claude Prior ou encore avec Dominique Gesseney Rappo � qui le quatuor a command� un concerto pour quatuor de saxophones et orchestre symphonique qui est cr�� lors d\'une tourn�e de concerts en novembre 2011.</p></p>
\n
\n<p><br/></p>
\n
\n<p>
\nLes succ�s obtenus en concerts dans toute la Suisse mais aussi en France, en Roumanie, en Slov�nie et en Autriche encouragent le quatuor � partir � la recherche de nouvelles couleurs � travers des r�pertoires �clectiques m�lant les grandes oeuvres du r�pertoire � la musique contemporaine et au rire.</p>
\n
\n<p><br/></p>
\n
\n<p>
\nEn 2004, il obtient le droit exceptionnel d\'arrangement et d\'interpr�tation de <i>L\'histoire de Babar</i> de Francis Poulenc. Dans une mise en sc�ne de Sylviane Tille, ce concert/spectacle continue de conna�tre un succ�s sans pr�c�dent. Parall�lement, Marquis de Saxe initie les �coles � l\'univers du saxophone � travers son spectacle maison <i>Sax and the city</i>. En 2007, il collabore avec le quatuor Clair-Obscur de Berlin pour une s�rie de concerts en Suisse et dans la capitale allemande avec au programme un arrangement de <i>Pierre et le Loup</i> de Prokofiev pour huit saxophones. Ces deux derni�res ann�es, les <i>Variations Goldberg</i> de Jean-S�bastien Bach ont repr�sent� le pilier de son activit� dont le dernier concert a �t� donn� en ao�t 2011 au Festival Bach en Combrailles (Auvergne).</p>
\n
\n<p><br/></p>
\n
\n<p>
\nMarquis de Saxe a, jusqu\'� ce jour, produit quatre disques.</p>
\n
\n<p><br/></p>
\n
\n<p>
\nActuellement, Marquis de Saxe travaille sur plusieurs nouveaux projets en collaboration avec des artistes de renom et tous sp�cialis�s dans leur art. Une tourn�e de plusieurs concerts est pr�vue en ao�t 2012 avec le quatuor allemand Clair-Obscur pour pr�senter <i>L\'Apprenti Sorcier</i> de Paul Dukas et <i>Les Plan�tes</i> de Gustav Holst. Accompagn� de la soprano Carmela Konrad et l\'alto Lilian Glanzmann, il fera un nouveau passage dans le r�pertoire baroque avec l\'interpr�tation du <i>Stabat Mater</i> de Pergolesi. Enfin, Marquis de Saxe souhaite faire revivre <i>Le Carnaval des Animaux</i> de Saint-Sa�ns avec des textes de Sandra Korol et sur une mise en sc�ne de Sylviane Tille.</p>
\n
\n<p><br/></p>
\n
\n<p>
\n<a href=\"http://www.marquisdesaxe.ch\" onclick=\"window.open(this.href, \'_blank\'); return false;\">www.marquisdesaxe.ch</a></p>","uploads/img_marquis_de_saxe","","0","1"),
("13","16","1","Festival de l\'Orgue Ancien","<p>Chaque samedi d\'�t�, depuis plus de 40 ans, le Festival International de l\'Orgue Ancien et de la Musique Ancienne de Val�re convie le public � entendre en concert le plus ancien orgue encore jouable au monde (1435 env.).</p>
\n
\n<p><br/></p>
\n
\n<p>Des concertistes de renom pr�sentent aux auditeurs des programmes vari�s et originaux et ils font vivre cet instrument v�n�rable install� � Val�re depuis bient�t 600 ans.</p>
\n
\n<p><br/></p>
\n
\n<p>Durant les mois de juillet et ao�t, ce haut-lieu s\'anime. Lors de ces r�citals, c\'est tout le vaisseau de pierre qui r�sonne et qui vibre : la musique magnifie loeuvre des b�tisseurs m�di�vaux. Les musiciens invit�s se r�jouissent de jouer sur cet orgue unique. Ils s\'ing�nient � pr�senter un r�pertoire destin� � mettre en valeur les possibilit�s �tonnantes de cet orgue historique de Val�re.</p>
\n
\n<p><br/></p>
\n
\n<p><a href=\"http://www.orgueancien-valere.ch\" onclick=\"window.open(this.href, \'_blank\'); return false;\">www.orgueancien-valere.ch</a></p>","uploads/img_orgue_ancien","","0","1"),
("14","14","1","Les Riches Heures de Val�re","<p>Cr��e en 2008, l\'Association Les Riches Heures de Val�re a pour ambition, gr�ce � une programmation sp�cifique visant un niveau d\'excellence, de mettre en valeur le site exceptionnel de Val�re et de la vieille ville de Sion par l\'organisation de concerts de musique ancienne et baroque.<br/></p>
\n
\n<p><br/></p>
\n
\n<p>Les premi�res saisons ont notamment vu se produire � Sion Jordi Savall (<i>Temps retrouv�</i>), l\'Ensemble Vocal de Lausanne & Michel Corboz (<i>Missa a quattro voci da cappella</i> de Claudio Monteverdi), le Hilliard Ensemble (<i>In Paradisum</i>), le Quatuor Sine Nomine (<i>Les sept derni�res paroles du Christ en croix</i>, Joseph Haydn), Arianna Savall & Petter Udland Johansen (<i>Il viaggio d\'Amore</i>), Stile Antico (<i>Song of songs</i>), l\'Ensemble Daedalus & Roberto Festa (<i>O Vergin Santa non m\'abbandonare</i>), l\'Ensemble Musica Fiorita (<i>Nascente Maria</i>, Barbara Strozzi) ou encore le Huelgas Ensemble & Paul van Nevel (<i>Apog�e de la polyphonie sacr�e</i>). Concerto Soave, accompagn� de Maria Cristina Kiehr et de Jean-Marc Aymes (<i>Il Canto delle Dame</i>), s\'est produit en novembre dernier.<br/></p>
\n
\n<p><br/></p>
\n
\n<p><p><a href=\"http://www.lesrichesheuresdevalere.ch/\" onclick=\"window.open(this.href, \'_blank\'); return false;\">www.lesrichesheuresdevalere.ch</a></p>","uploads/img_les_riches_heures_de_valere","","0","1"),
("15","17","1","Ouverture-Op�ra","<p>L\'association Ouverture-Op�ra oeuvre depuis 2006 � la cr�ation et � la promotion de spectacles lyriques.</p>
\n
\n<p><br/></p>
\n
\n<p>Elle vise essentiellement deux buts: d\'une part de favoriser, dans un encadrement professionnel, le d�veloppement de jeunes talents valaisans, principalement de chanteurs, mais �galement de tout cr�ateur dont l\'art peut contribuer � la r�alisation d\'un op�ra, et d\'autre part de r�pondre � l\'attente d\'un public valaisan amateur de chant et d\'art lyrique en lui offrant des productions originales et inhabituelles d\'un r�pertoire � traditionnel �.</p>
\n
\n<p><br/></p>
\n
\n<p>Sous la direction musicale de Jean-Luc Follonier et dans des mises en sc�nes exceptionnelles de Julie Beauvais, Ouverture-Op�ra a pr�sent�, � la Ferme-Asile de Sion, <i>Les Noces de Figaro</i> de Mozart (2006), <i>La Boh�me</i> de Puccini (2008) et <i>Don Giovanni</i> de Mozart (2010). La troupe pr�sentera <i>Alcina</i> de Haendel du 22 ao�t au 12 septembre 2012.</p>
\n
\n<p><br/></p>
\n
\n<p><a href=\"http://www.ouverture-opera.ch/\" onclick=\"window.open(this.href, \'_blank\'); return false;\">www.ouverture-opera.ch</a></p>","uploads/img_ouverture_opera","","0","1"),
("16","19","1","Schola de Sion","<p>Depuis plus de 80 ans, la Schola de Sion initie des jeunes valaisans au chant choral (solf�ge, travail vocal, travail du r�pertoire, prestations musicales publiques).</p>
\n
\n<p><br/></p>
\n
\n<p>Elle forme actuellement pr�s de 150 chanteuses et chanteurs r�partis en diff�rents choeurs : le Choeur des Petits Nouveaux et le Choeur des Petites Nouvelles (6 � 9 ans), le Petit Choeur de filles (9 � 11 ans), le Grand Choeur de filles (d�s 12 ans), les Petits Chanteurs (d�s 9 ans), le Choeur d\'hommes (d�s la mue) et l\'Ensemble vocal.</p>
\n
\n<p><br/></p>
\n
\n<p>La Schola de Sion pr�sente environ 45 prestations publiques par ann�e (concerts et offices) et assure plus de 20 heures de formation musicale hebdomadaire.</p>
\n
\n<p><br/></p>
\n
\n<p><p><a href=\"http://www.schola-sion.ch/\" onclick=\"window.open(this.href, \'_blank\'); return false;\">www.schola-sion.ch</a></br><a href=\"https://www.facebook.com/scholadesion\">facebook</a></p>","uploads/img_schola","","0","1"),
("17","12","2","Extraits musicaux","","uploads/sound_bertrand_bochud","","0","2"),
("18","13","2","Extraits musicaux","","uploads/sound_hirundo_maris","","0","4"),
("21","17","1","Productions pass�es","<p>
\n<strong>2010</strong> <i>Don Giovanni</i>, Wolfgang Amadeus Mozart
\n<br/><br/>
\n<strong>2008</strong> <i>La Boh�me</i>, Giacomo Puccini
\n<br/><br/>
\n<strong>2006</strong> <i>Les Noces de Figaro</i>, Wolfgang Amadeus Mozart
\n</p>","0","","0","2"),
("23","14","1","Concerts","<p><strong>Edition 2011</strong><br/><br/>
\n18 novembre<br/>
\n<strong>Concerto Soave</strong><br/>
\nJean-Marc Aymes et Maria Cristina Kiehr<br/>
\n<i>Il Canto delle Dame</i>
\n<br/><br/>
\n16 octobre<br/>
\n<strong>Huelgas Ensemble</strong><br/>
\nPaul Van Nevel<br/>
\n<i>Apog�e de la polyphonie sacr�e</i><br/>
\nGiovanni Pierluigi da Palestrina, Robert White et Orlando deLassus
\n<br/><br/>
\n25 septembre<br/>
\n<strong>Ensemble Musica Fiorita</strong><br/>
\nDaniela Dolci<br/>
\n<i>Nascente Maria</i><br/>
\nBarbara Strozzi<br/>
\n<br/>
\n12 juin<br/>
\n<strong>Ensemble Daedalus</strong><br/>
\nRoberto Festa<br/>
\n<i>O Vergin Santa non m\'abbandonare</i><br/>
\n<br/>
\n28 mai<br/>
\n<strong>Ensemble vocal Stile Antico</strong><br/>
\n<i>Cantique des cantiques</i><br/>
\nGiovanni Pierluigi da Palestrina, Orlano de Lassus, Tom�s Luis de Victoria...<br/>
\n<br/>
\n24 avril<br/>
\n<strong>Jeunes artistes professionnels valaisans</strong><br/>
\nEnsemble Fratres et Marie-Marthe Claivaz<br/>
\n<i>Stabat Mater</i><br/>
\nLuigi Boccherini<br/>
\n<br/>
\n<br/>
\n<strong>Edition 2010</strong>
\n<br/><br/>
\n24 octobre<br/>
\n<strong>Jordi Savall, Ferran Savall et Pedro Estevan</strong><br/>
\n<i>Le Temps Retrouv�</i><br/><br/>
\n17 octobre<br/>
\n<strong>Ensemble Vocal de Lausanne</strong><br/>
\nMichel Corboz<br/>
\nMesse & motets<br/>
\nClaudio Monteverdi <br/>
\n<br/>
\n28 mai<br/>
\n<strong>Ensemble Hirundo Maris</strong><br/>
\nArianna Savall<br/>
\nHeinrich Sch�tz, Johann Sebastian Bach et Dietrich Buxtehude<br/>
\n<br/>
\n4 avril<br/>
\n<strong>Jeunes artistes professionnels valaisans</strong><br/>
\nCarole Rey, Sylviane Bourban, Julien Zufferey, Hiroko Yamamoto-Croisier,<br/>Laurent Galliano, Matthias Walpen et Lionel Monnet<br/>
\n<i>Stabat Mater</i><br/>
\nGiovanni Battista Pergolesi<br/>
\n<br/>
\n<br/>
\n<strong>Edition 2009</strong>
\n<br/><br/>
\n18 octobre<br/>
\n<strong>Ensemble Vocal de Lausanne</strong><br/>
\nMichel Corboz<br/>
\n<i>Laudate Dominum</i>, <i>Gloria</i> a 7, <i>Magnificat</i> a 6<br/>
\nClaudio Monteverdi<br/>
\n<i>Jephte</i><br/>
\nGiacomo Carissimi<br/><br/>
\n12 juin<br/>
\n<strong>Hilliard Ensemble</strong><br/>
\n<i>In Paradisum</i><br/>
\nTom�s Luis de Victoria et Giovanni Pierluigi da Palestrina<br/><br/>
\n30 mai<br/>
\n<strong>Quatuor Sine Nomine</strong><br/>
\n<i>Les sept derni�res paroles du Christ en croix</i> (Hob. III/50-56)<br/>
\nJoseph Haydn<br/>
\n<br/>
\n12 avril<br/>
\n<strong>Marquis de Saxe</strong><br/>
\nConcert pour les enfants: <i>L\'histoire de Babar</i><br/>
\n<i>Variations Goldberg</i><br/>
\nJohan Sebastian Bach<br/><br/>
\n<br/>
\n<strong>Edition 2008</strong><br/><br/>
\n13 et 14 septembre<br/>
\n<strong>Brigitte Balleys, Michel Brodard</strong><br/>
\nMatthias Spaeter, Hager Spaeter, Daniela Numico<br/>
\nOeuvres de Claudio Monteverdi et Heinrich Sch�rz</p></p></p></p>","0","","0","2"),
("25","13","1","Petter Udland Johansen, t�nor","<p>N� � Oslo o� il re�oit sa premi�re formation vocale et instrumentale, Petter Udland Johansen obtient un dipl�me de chant � la Musikh�yskole Norges. Il se perfectionne ensuite avec Ingrid Bjoner et Svein Bj�rk�y, puis � la Schola Cantorum Basiliensis avec Richard Levitt. Le t�nor Hans Peter Blochwitz lui apporte un suppl�ment de formation vocale.</p>
\n
\n<p><br/></p>
\n
\n<p>Son r�pertoire d\'op�ra et de concerts comprend les oeuvres majeures de compositeurs tels que J.S. Bach, C. Monteverdi, W.A Mozart, F. Mendelssohn ou encore des pi�ces de F. Schubert, E. Grieg, H. Wolf, G. Mahler, E. Grieg et J. Brahms. Petter Udland Johansen a travaill� avec les chefs Rinaldo Alessandrini, Jordi Savall, Pep Prats, Christer L�vold, Tom et Tobias Kjellum Gossmann.</p>
\n
\n<p><br/></p>
\n
\n<p>Petter Udland Johansen a particip� � des concerts et des enregistrements de CD avec de nombreux ensembles, notamment Hirundo Maris, Pechrima, Sagene anneau, Capella Antiqua Bambergensis, Pratum Musicum, La Morra, Ferarra et Lucidarium.
\nEn 2009, il fonde avec sa partenaire, Arianna Savall, l\'ensemble Hirundo Maris. Cette formation a une activit� r�guli�re de concerts dans la plupart des pays d\'Europe. Le premier CD, Chants du Sud et du Nord, de l\'ensemble sera disponible au printemps 2012, sous le prestigieux label ECM.</p>
\n
\n<p><br/></p>
\n
\n<p>Petter Udland Johansen fonde, en collaboration avec Christer L�vold et Mark B. Lay, le trio vocal Pechrima dont les programmes allient compositions personnelles et r�pertoire traditionnel. Leur premier disque sort en 2011.</p>
\n
\n<p>Petter Udland Johansen est �galement reconnu comme compositeur et arrangeur. Il donne r�guli�rement des cours de chant choral et de soliste.</p>
\n
\n<p><br/></p>
\n
\n<p><a href=\"http://petterudland.com\">www.petterudland.com</a> </p>","0","","0","3"),
("26","13","3","Extrait vid�o","<iframe width=\"420\" height=\"315\" src=\"http://www.youtube.com/embed/v3Xptfn2DnA?rel=0\" frameborder=\"0\" allowfullscreen></iframe>","0","v3Xptfn2DnA","0","5"),
("28","15","2","Extraits musicaux","","uploads/sound_marquis_de_saxe","","0","3"),
("30","19","1","Prestations","<p>Bas� sur un r�pertoire de qualit�, ce patient travail de formation se concr�tise, tout au long de l\'ann�e, dans une riche activit� d\'animation liturgique, avant tout dans la Paroisse du Sacr�-Coeur ainsi que lors des offices �piscopaux � la Cath�drale de Sion. Divers concerts a cappella ou avec orchestre constituent en outre une part essentielle des prestations des diff�rents choeurs de la Schola.</p>
\n
\n<p><br/><p>
\n<p>A ces activit�s s\'ajoutent de fr�quents contacts avec d\'autres formations similaires. Camps et voyages (France, Italie, Espagne, Gr�ce, Isra�l, Belgique, Russie, Canada), permettent � tous les chanteuses et chanteurs de la Schola de vivre une exp�rience humaine profond�ment originale, qui associe enfants, adolescents et adultes autour d\'un id�al commun.</p>","0","","0","2"),
("32","16","1","Concerts","<p><strong>Edition 2011</strong>
\n<br/></p>
\n
\n<table>
\n<tr>
\n<td>9 juin</td> 
\n<td>Maurizio Croci</td>
\n<td>Var�se, Italie</td>
\n</tr>
\n<tr>
\n<td>16 juillet</td>
\n<td>Sander van Marion</td>
\n<td>Schevenigen, Pays-Bas</td>
\n</tr>
\n<tr>
\n<td>23 juillet</td>
\n<td>Daniel Meylan</td>
\n<td>Le Brassus, Suisse</td>
\n</tr>
\n<tr>
\n<td>30 juillet�����</td>
\n<td>Dimitri Goldobine</td>
\n<td>Cannes, France</td>
\n</tr>
\n<tr>
\n<td>6 ao�t</td>
\n<td>Carolyn Shuster Fournier</td>
\n<td>Paris, France</td>
\n</tr>
\n<tr>
\n<td>13 ao�t</td>
\n<td>Luigi Celeghin</td>
\n<td>Frascati Roma, talie</td>
\n</tr>
\n<tr>
\n<td>20 ao�t</td>
\n<td>Juan Maria Pedrero Encabo�����</td>
\n<td>Zamora, Espagne</td>
\n</tr>
\n</table><br/>
\n<br/>
\n<strong>Edition 2010</strong>
\n<br/>
\n<table>
\n<tr>
\n<td>10 juillet�����</td>
\n<td>Mario Duella</td>
\n<td>Pray, Italie</td>
\n</tr>
\n<tr>
\n<td>17 juillet</td>
\n<td>Pierre Thimus</td>
\n<td>Li�ge, Belgique</td>
\n</tr>
\n<tr>
\n<td>24 juillet</td>
\n<td>Gwendolyn Toth</td>
\n<td>New York, USA</td>
\n</tr>
\n<tr>
\n<td>31 juillet</td>
\n<td>Thilo Muster</td>
\n<td>B�le, Suisse</td>
\n</tr>
\n<tr>
\n<td>7 ao�t</td>
\n<td>Maurizio Pergelier</td>
\n<td>Klagenfurt, Autriche</td>
\n</tr>
\n<tr>
\n<td>14 ao�t</td>
\n<td>Josep Marie Mas I Bonet����������</td>
\n<td>Reus-Tarragona, Espagne</td>
\n</tr>
\n<tr>
\n<td>21 ao�t</td>
\n<td>Silvano Rodi</td>
\n<td>Ventimiglia, Italie</td>
\n</tr>
\n<tr>
\n<td> </td>
\n<td>Fran�ois Dujardin</td>
\n</tr>
\n</table>
\n
\n<p><br/>
\n<br/>
\n<strong>Edition 2009</strong>
\n<br/></p>
\n
\n<table>
\n<tr>
\n<td>4 juillet</td>
\n<td>Ensemble vocal de la Schola���</td>
\n<td>Sion, Suisse</td>
\n</tr>
\n<tr>
\n<td> </td>
\n<td>Marc Bochud<td>
\n</tr>
\n<tr>
\n<td> </td>
\n<td>Philippe Despont</td>
\n<td>Lausanne, Suisse</td>
\n</tr>
\n<tr>
\n<td>11 juillet�����</td>
\n<td>Wijnand van de Pool</td>
\n<td>Amelia, Italie</td>
\n</tr>
\n<tr>
\n<td>18 juillet</td>
\n<td>Josef Stolz</td>
\n<td>Vienne, Autriche</td>
\n</tr>
\n<tr>
\n<td>25 juillet</td>
\n<td>Zsigmund Szathmary</td>
\n<td>Ehrenkirchen, Allemagne</td>
\n</tr>
\n<tr>
\n<td>1<sup>er</sup> ao�t</td>
\n<td>Guy Bovet</td>
\n<td>Neuch�tel, Suisse</td>
\n</tr>
\n<tr>
\n<td>8 ao�t</td>
\n<td>Georges Athanasiad�s</td>
\n<td>St-Maurice, Suisse</td>
\n</tr>
\n<tr>
\n<td>15 ao�t </td>
\n<td>Fran�ois Seydoux</td>
\n<td>Fribourg, Suisse</td>
\n</tr>
\n<tr>
\n<td>22 ao�t</td>
\n<td>Schola Cantorum di Santa</td>
\n<td>Belluno, Italie</td>
\n</tr>
\n<tr>
\n<td> </td>
\n<td>Simone Gheller</td>
\n</tr>
\n<tr>
\n<td> </td>
\n<td>Fabrizio Da Ros</td>
\n</tr>
\n</table>","0","","0","2"),
("33","16","1","Le Festival racont� par son fondateur","<p><i>L\'orgue de Val�re, une histoire parfum�e comme du bon vin vieilli en f�t de ch�ne. J\'y ai go�t�. Sa musicalit�, l\'attrait de sa lumi�re, de son bois, ont marqu� d\'abord mon enfance puis ma vie toute enti�re.</i></p>
\n
\n<p><br/></p>
\n
\n<p>N� � Val�re o� ma famille est au service de l\'Etat et du V�n�rable Chapitre depuis 1871, j\'ai eu le privil�ge de d�couvrir tr�s t�t les tr�sors fabuleux du Ch�teau et de son Eglise. Je fus ainsi interpell� et troubl� par le silence du vieil instrument de Val�re. </p>
\n
\n<p><br/></p>
\n
\n<p>En 1948, date de ma nomination � Val�re, je m\'engageai � chercher le meilleur moyen pour rendre la voix � ce vieil orgue devenu aphone depuis le transfert du Chapitre � la R�sidence des Glariers au d�but du XIXe si�cle. Cinq ans plus tard, la visite du professeur anglais Babington Smith du Eton College de Windsor, constitua l\'amorce d\'un important changement en faveur de la r�novation de l\'orgue de Val�re. C\'est gr�ce au d�vouement, � l\'inlassable opini�tret� et, il faut bien le pr�ciser, � la haute comp�tence de l\'expert bernois bien connu Ernst Schiess que l\'orgue de Val�re doit d\'avoir retrouv� sa voix d\'antan, � nulle autre pareille. Avec l\'aide non moins enthousiaste du conservateur des monuments historiques de B�le, le Dr Rudolf Riggenbach, M. Schiess parvint � mettre � ex�cution son plan de restauration. En la maison Th. Kuhn de M�nnedorf, on avait trouv� les sp�cialistes qui r�veilleraient l\'instrument de son sommeil maladif. Le V�n�rable Chapitre de la Cath�drale de Sion � la t�te duquel se d�pensait sans compter son Doyen, Mgr Clemens Schnyder, n\'avait tout de m�me pas des ressources suffisantes pour garantir en totalit� le paiement de l\'important devis. La g�n�rosit� du Dr Riggenbach, ainsi que de quelques m�c�nes, permit le financement des travaux de restauration des orgues de Val�re, sans oublier �videmment le don priv� du professeur Babington Smith, modeste il est vrai, mais fait de bon coeur ; son geste �mouvant n\'a pas �t� oubli�...</p>
\n
\n<p><br/></p>
\n
\n<p>Un beau jour donc, l\'orgue fut d�mont� pi�ce par pi�ce, instant o� le � suspense � devint quotidien, car l\'op�ration �tait d�licate, vu l\'�tat v�tuste des volets du buffet notamment, avec lesquels on croyait un moment ne jamais pouvoir arriver � destination, tant les toiles du XVe si�cle �taient endommag�es et d�compos�es... Je fis le long voyage au Kunstmuseum de B�le en train. Etant donn� la grande valeur de ces oeuvres, et la crainte qu\'elles soient endommag�es au cours du voyage, je me d�cidai � les accompagner dans la soute du wagon-marchandise pour les garder � port�e de vue. Dr�le de p�riple ! Enfin... Le Dr Paulo Cadorin, restaurateur en chef du Kunstmuseum de B�le, les a efficacement restaur�es, cela gr�ce � une connaissance parfaite et un d�vouement total. Quant � l\'orgue, il avait pris le chemin de M�nnedorf o� tout a �t� revu. Bient�t, l\'ensemble de cette oeuvre d\'art picturale et musicale �tait remont� � Sion. L\'orgue �tait sauv� et on pouvait s\'appr�ter � f�ter sa r�surrection. </p>
\n
\n<p><br/></p>
\n
\n<p>Mon r�ve se r�alisait ! Apr�s plus d\'un si�cle de silence, les vo�tes de l\'Eglise-Cath�drale de Val�re r�percut�rent � nouveau le son des orgues dans leur puret� originelle. Quel �v�nement ! D�s ce moment, une id�e fit son chemin dans mon esprit : partager cette richesse avec d\'autres amateurs d\'orgue et de musique ancienne. C\'est ainsi que, avec ma femme et mes enfants, en collaboration �troite avec mon ami Jean-Jacques Gramm (fondateur et directeur du Mus�e suisse de l\'orgue � Roche), nous nous sommes lanc�s, en 1969, dans l\'organisation de concerts, que nous annoncions simplement par le moyen de pancartes appos�es � l\'entr�e de l\'�glise o� passaient tous les visiteurs. Lors du premier concert, nous avons �t� stup�faits par le nombre d\'auditeurs venus assister � l\'inauguration sonore de ce vieil instrument. Encourag�s, nous avons renouvel� l\'exp�rience quelques samedis plus tard, puis, devant l\'int�r�t grandissant accord� � ces manifestations, nous avons d�cid� d\'entreprendre l\'organisation d\'un Festival de l\'orgue ancien, avec un programme structur� pour chaque saison estivale. Ne disposant pas de moyens financiers pour l\'achat de mobilier fixe � l\'�glise de Val�re, pendant plusieurs ann�es, � l\'occasion du Festival, chaque vendredi soir, nous nous rendions, mes deux fils et moi, au Mus�e de la Majorie, pour y chercher cent chaises, que nous portions � dos d\'homme jusqu\'� l\'�glise de Val�re, ceci afin que le public puisse s\'asseoir durant le concert. De surcro�t, rappelons qu\'aucune finance d\'entr�e n\'�tait pr�lev�e. Une simple collecte permettait tout juste � payer le soliste du jour. Quant � la gestion du Festival, aux frais d\'organisation y incombant, l\'argent du m�nage en assurait la continuit�. </p>
\n
\n<p><br/></p>
\n
\n<p>Au cours des conversations avec d\'�minents organologues et organistes, j\'apprenais l\'existence d\'une abondante et pr�cieuse litt�rature musicale, oubli�e dans des archives de nombreux pays : des partitions soigneusement ficel�es comportant souvent la mention � injouable �. A Val�re, ces chefs-d\'oeuvres compos�s d�s le XIIe si�cle, pouvaient enfin revivre dans leur tonalit� originelle. Ce qui n\'�tait plus possible sur un instrument de facture post�rieure � la seconde moiti� du XVIIe si�cle, le redevenait sur les quatre jeux gothiques, et surtout, sur le clavier archa�que des orgues de Val�re. Rappelons pour m�moire que, vers 1687, le v�n�rable Chapitre demanda au facteur d\'orgues Christopher Aeby de Soleure, de restaurer l\'orgue, qui fut alors agrandi de quelques jeux. </p>
\n
\n<p><br/></p>
\n
\n<p>Le Festival International de l\'Orgue Ancien c�l�bra en 1989 son 20e anniversaire. A cette occasion, une association des amis du Festival fut cr��e afin de m\'aider � pr�parer et soutenir l\'organisation des saisons estivales et en garantir la p�rennit�. </p>
\n
\n<p><br/></p>
\n
\n<p>Depuis le d�but, la priorit� a toujours �t� accord�e � des oeuvres de caract�re spirituel. Les organistes s�lectionn�s ont pour la plupart respect� cette demande, soit pour l\'�tablissement de leur programme, soit pour l\'interpr�tation des oeuvres retenues. Mon voeu le plus cher est que cette tradition soit maintenue puisque le caract�re sacr� des lieux le recommande.</p>
\n
\n<p><br/></p>
\n
\n<p>L\'�dition 2009 du Festival est la 40e du nom !!! J\'esp�re vivement que Val�re restera un haut lieu de rencontre pour les personnes d�sireuses de continuer � vivre cette aventure...</p>
\n
\n<p><br/>Maurice Wenger<br/>
\nMai 2009</p>","0","","0","4"),
("34","16","1","L\'�glise de Val�re et son orgue","<p>Jusqu\'� la fin du XVIIIe si�cle, Val�re servit de r�sidence au v�n�rable chapitre de la cath�drale de Sion. L\'�glise coll�giale, centre spirituel du bourg capitulaire rev�tit son architecture gothique au XIIIe si�cle tout en conservant nombre d\'�l�ments ant�rieurs de style roman. Une vaste campagne de d�coration (peintures murales, orgue) fut entreprise sous Guillaume de Rarogne, doyen du chapitre et futur �v�que de Sion, dans les ann�es 1430. Le XVIIe si�cle adapta l\'ensemble (nouvelles stalles, r�fection de l\'orgue, etc.) aux exigences de la contre-r�forme. Peu � peu d�laiss� ensuite, le site parvint d�labr� mais pr�serv� aux restaurateurs de la fin du XIXe si�cle.
\n<br/><br/>
\n
\nEn 1883 d�j�, l\'organologue anglais Arthur George Hill attira l\'attention sur l\'orgue, l\'un des plus anciens ayant conserv� une grande partie de son mat�riel sonore. Les soufflets �tant crev�s, il fallut cependant attendre la restauration de 1954 pour que l\'instrument retrouve sa voix. Des probl�mes d\'�tanch�it� conduisirent � une nouvelle r�novation d�s 2004.
\n<br/></p>
\n
\n<p><br/></p>
\n
\n<p>Le progr�s des connaissances historiques sur Val�re, les recherches du Dr. Friedrich Jakob (Die Valeria-Orgel, Verlag der Fachvereine Z�rich, 1991) et quelques �clairages nouveaux apport�s par la r�cente restauration ont permis d\'�carter les nombreuses l�gendes entourant l\'origine de l\'instrument et de pr�ciser les diff�rentes interventions jalonnant le cours de sa longue histoire. D�s lors, on peut �tablir la chronologie suivante :<br/><br/></p>
\n
\n<p><strong>1435 environ</strong> : construction de l\'orgue par un artisan inconnu pour l\'�glise de Val�re avec des volets peints par Peter Maggenberg. <br/>
\n<br/>
\n
\n<strong>1630 environ</strong> : �dification de la tribune en nid d\'hirondelle fix�e � la paroi ouest (on ignore la situation originelle de l\'instrument dans l\'�glise).<br><br/>
\n
\n<strong>1687</strong> : Christoph Aebi de Soleure r�alise le sommier actuel � registres et modifie l\'instrument en conservant cependant un maximum de mat�riel ancien. Le clavier s\'�largit d\'une octave et trouve son ambitus d�finitif.<br><br/>
\n
\n<strong>1786</strong> : Felix Carlen r�alise quelques travaux dont la r�fection totale de la soufflerie.<br><br/>
\n
\n<strong>1812</strong> : Johann Baptist Carlen ajoute les gros tuyaux de p�dale que l\'on voit derri�re l\'orgue et r�pare les soufflets.<br><br/>
\n
\n<strong>1954</strong> : Installation d\'une soufflerie �lectrique. Remise en fonction de l\'orgue par la maison Th. Kuhn de Maennedorf (Ernst Schiess, expert). Restauration des peintures des volets au mus�e d\'art de B�les (Dr. Rudolf Riggenbach et Dr. Paolo Cadorin).<br><br/>
\n
\n<strong>2004</strong> : D�montage total de l\'instrument pour restauration par la manufacture F�glister S�rl de Grimisuat (Norbert Julier contrema�tre). Remise en fonction de l\'ancienne soufflerie � bras (un moteur �lectrique gonfle d�sormais les anciens soufflets cun�iformes au cas o� l\'on n\'a pas de souffleur). Au cours de ces travaux, des analyses scientifiques ont permis de prouver que certaines pi�ces que l\'on croyait du XVIIe si�cle remontent en fait aux origines de l\'instrument (bois de nombreuses touches du clavier, tuyaux de la Copel 4\', barrages du sommier).<br><br/>
\nEdmond Voeffray</p>","0","","0","5"),
("35","16","1","Engagement de l\'agence","<p><p>Gestions administrative, organisationnelle, promotionnelle et financi�re en collaboration avec le comit� du festval.
\n<br/><br/>
\n<strong>Comit� de l\'association</strong><br/><br/></p>
\n
\n<table>
\n<tr>
\n<td><strong>Pr�sident</strong></td>
\n<td>�&nbspMaurice Wenger, directeur et fondateur</td>
\n</tr>
\n<tr>
\n<td><strong>Administrateur</strong></td>
\n<td>�&nbspFr�d�ric Studer</td>
\n</tr>
\n<tr>
\n<td><strong>Secr�taire</strong></td>
\n<td>�&nbspBerthy Wenger</td>
\n</tr>
\n<tr>
\n<td><strong>Membres</strong></td>
\n<td>�&nbspJean-Marc Aymon</td>
\n</tr>
\n<tr>
\n<td></td>
\n<td>�&nbspV�ronique Dubuis</td>
\n</tr>
\n<tr>
\n<td></td>
\n<td>�&nbspJean-Pascal Fournier</td>
\n</tr>
\n<tr>
\n<td></td>
\n<td>�&nbspJean-Jacques Gramm</td>
\n</tr>
\n<tr>
\n<td></td>
\n<td>&nbsp�Chne Erwin Jossen</td>
\n</tr>
\n<tr>
\n<td></td>
\n<td>�&nbspChristian Studer</td>
\n</tr>
\n<tr>
\n<td></td>
\n<td>�&nbspEdmond Voeffray</td>
\n</tr>
\n<tr>
\n<td></td>
\n<td>&nbsp�Roland Wenger</tr>
\n<tr>
\n<td><strong>Comptable</strong></td>
\n<td>�&nbspRosemarie Studer</td>
\n</tr>
\n<tr>
\n<td><strong>Preneur de son</strong></td>
\n<td>�&nbspJean-Pierre Rosset</td>
\n</tr>
\n</table>","0","","0","6"),
("36","14","1","Engagement de l\'agence","<p><p><p>Gestions administrative, organisationnelle, promotionnelle et financi�re en collaboration avec le comit� de l\'association.
\n<br/><br/>
\n<strong>Comit� de l\'association</strong><br/><br/></p>
\n
\n<table>
\n<tr>
\n<td><strong>Pr�sident</strong></td>
\n<td>&nbsp&nbspPhilippe Varone</td>
\n</tr>
\n<tr>
\n<td><strong>Administrateur</strong></td>
\n<td>&nbsp&nbspFr�d�ric Studer</td>
\n</tr>
\n<tr>
\n<td><strong>Membres</strong></td>
\n<td>&nbsp&nbspAndr� Gillioz</td>
\n</tr>
\n<td></td>
\n<td>&nbsp&nbspPierre Gillioz</td>
\n</tr>
\n</table>","0","","0","3"),
("37","17","1","Engagement de l\'agence","<p><p>Gestions administrative, organisationnelle, promotionnelle et financi�re en collaboration avec le comit� de l\'association.
\n<br/><br/>
\n<strong>Comit� de l\'association</strong><br/><br/></p>
\n
\n<table>
\n<tr>
\n<td><strong>Pr�sident</strong></td>
\n<td>��Jacques de Lavallaz</td>
\n</tr>
\n<tr>
\n<td><strong>Directeur musical</strong></td>
\n<td>��Jean-Luc Follonier</td>
\n</tr>
\n<tr>
\n<td><strong>Metteur en sc�ne</strong></td>
\n<td>��Julie Beauvais</td>
\n</tr>
\n<tr>
\n<td><strong>Administrateur</strong></td>
\n<td>��Fr�d�ric Studer</td>
\n</tr>
\n<tr>
\n<td><strong>Membres</strong></td>
\n<td>��Christian Bitchnau</td>
\n</tr>
\n<td></td>
\n<td>��Pierre Gillioz</td>
\n</tr>
\n</table>","0","","0","4"),
("38","19","1","Engagement de l\'agence","<p><p><p><p>Gestions administrative, organisationnelle, promotionnelle et financi�re en collaboration avec le bureau et le comit�.
\n<br/><br/></p>
\n
\n<table>
\n<tr>
\n<td><strong>Bureau</strong>
\n<tr>
\n<td><strong>Pr�sident</strong></td>
\n<td>&nbsp&nbspAndr� Gillioz</td>
\n</tr>
\n<tr>
\n<td><strong>Directeur musical</strong></td>
\n<td>&nbsp&nbspMarc Bochud</td>
\n</tr>
\n<tr>
\n<td><strong>Administrateur</strong></td>
\n<td>&nbsp&nbspFr�d�ric Studer</td>
\n</tr>
\n</table>","0","","0","5"),
("40","15","1","Les musiciens","<p><strong>Elie Fumeaux - saxophone soprano</strong><br/>
\nN� en 1962, Elie Fumeaux fait ses classes de saxophone chez Andr� Vivian, Michel Surget puis Jean-Georges Koerper, au Conservatoire de Lausanne. Il obtient en 1990 un 1er prix de virtuosit� avec f�licitations du Jury. En 1991, il obtient plusieurs prix au concours U.F.A.M. � Paris ainsi qu\'au M�morial St�phane Clivaz en Suisse. Membre fondateur de l\'ensemble de saxophone Saxophilie ainsi que du quatuor Marquis de Saxe, Elie Fumeaux a par ailleurs enregistr� un CD en soliste avec l\'orchestre de Cra�ova (Roumanie). Il enseigne le saxophone aux Conservatoires de Sion et Lausanne. Depuis septembre 2007, il est nomm� professeur de p�dagogie didactique � la HEM de Lausanne. Il dirige diverses formations instrumentales.![alt text][1]<br/>
\n<br/>
\n<strong>Philippe Savoy - saxophone alto</strong><br/>
\nN� en 1976, Philippe Savoy obtient son dipl�me de concert en 2000 � la Musikhochschule de Z�rich dans la classe de J.-G. Koerper. Il obtient ensuite des 1ers prix au C.J.M.S., au Concours National d\'Ex�cution Musicale � Riddes ainsi qu\'au Concours L�opold Bellan � Paris. Depuis, Philippe Savoy a donn� de nombreux concerts (r�citals, tourn�es,...) en Suisse et � l\'�tranger (Colombie, Canada, Maroc, Br�sil, Chine, Japon, Australie,...) et est r�guli�rement engag� comme soliste. � deux reprises, il a obtenu le prix des coop�ratives Migros ainsi que la bourse Friedl-Wald Stiftung. Il enseigne le saxophone au Conservatoire de Fribourg (Bulle) et collabore avec de nombreux orchestres (OCL, OSR, Orchestre de Verbier,...). Philippe Savoy dirige �galement des formations chorales (Choeur St-Michel de Fribourg, Chanson du Moulin de Neyruz) et instrumentales.<br/>
\n<br/>
\n<strong>Alain Dobler - saxophone t�nor</strong><br/>
\nN� en 1974 � Lucerne, Alain Dobler obtient en 1999 son dipl�me d\'enseignement avec distinction dans la classe de Beat Hofstetter (Lucerne). Il poursuit ses �tudes � la Hochschule de B�le dans la classe de Marcus Weiss et cl�t ces derni�res avec un dipl�me de Concert. En 1999, il obtient le 2e prix du Concours National d\'Ex�cution Musicale � Riddes et re�oit en 2000 le prix de la Friedl Wald Stiftung. Sa formation de saxophoniste est �galement ponctu�e par des master-class aupr�s de Claude Delangle (Paris), Jean-Yves Fourmeau (Paris), Kyle Horch (London) et Johannes Ernst (Berlin). Alain Dobler collabore avec l\'orchestre symphonique de Lucerne (LSO), le 21st Century Orchestra et l\'Ensemble Beaufort. Il enseigne � l\'�cole de musique de Lucerne.<br/>
\n<br/>
\n<strong>Nicolas Logoz - saxophone baryton</strong><br/>
\nN� en 1968, Nicolas Logoz b�n�ficie des cours de Michel Surget et Jean-Georges Koerper au Conservatoire de Lausanne. Il cl�t brillamment ses �tudes avec un 1er prix de virtuosit� et f�licitations du Jury en 1997. Membre fondateur du quatuor Marquis de Saxe, Nicolas Logoz obtient, en 1994, le Brevet de ma�tre de musique. Il est actuellement professeur de saxophone dans les �coles de musique de la r�gion l�manique.</p>","uploads/img_marquis_de_saxe","","0","2"),
("41","4","1","Roberto Festa","<p>Roberto Festa, fl�tiste, s\'est form� au Conservatoire G. B. Martini de Bologna (Italie) dans la classe de Giorgio Pacchioni avant d\'�tre l\'�l�ve de Gabriel Garrido au Centre de Musique Ancienne de Gen�ve. Il se perfectionne � la Schola Cantorum Basiliensis aupr�s de Michel Piguet. <br/><br/></p>
\n
\n<p>Sa participation � de nombreux stages conduits par Frans Bruggen, Kees Boeke, Sigiswald Kuijken, et les cours tenus par Nikolaus Harnoncourt au Mozarteum de Salzburg, l\'orientent vers le r�pertoire baroque de musique de chambre. Il se produit en soliste avec le Collegio Italiano (dir. Gustav LeonharDt) et l\'orchestre de la R.A.I.<br/><br/></p>
\n
\n<p>Il aborde, ensuite, le r�pertoire m�di�val et renaissance gr�ce aux rencontres et aux collaborations avec Paul van Nevel et Dominique Vellard, figures d�terminantes dans son �volution. Roberto Festa fonde en 1986 l\'Ensemble Daedalus. Celui-ci se produit dans les plus prestigieux festivals europ�ens et enregistre 12 disques. D�s 2009, Roberto Festa est le directeur artistique du Festival Muse Salentine (Specchia, Italie) et en 2011 est nomm� Artiste invit� au Festival du Haut-Jura (France).</p>","0","","0","2"),
("42","4","1","Concerts ","<p><p>L\'Ensemble Daedalus s\'est produit, entre autres, dans les Festivals suivants:<br/><br/></p>
\n
\n<table>
\n<tr>
\n<th align=left><strong>AUTRICHE</strong></th>
\n</tr>
\n<tr>
\n<td>Graz</td>
\n<td>Festival Eurograz \'93</td>
\n<td>1993</td>
\n</tr>
\n<tr>
\n<td>Wien</td>
\n<td>Resonanzen</td>
\n<td>1999-2000-2002</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n</tr>
\n<tr>
\n<th align=left><STRONG>BELGIQUE</STRONG></th>
\n</tr>
\n<tr>
\n<td>Alst</td>
\n<td>Festival Radio 3 in de Stad</td>
\n<td>1992</td>
\n</tr>
\n<tr>
\n<td>Antwerpen</td>
\n<td>Antwerpen \'93</td>
\n<td>1993-1998</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>Festival Laus Poliphonie</td>
\n<td>1996</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>Festival van Vlaanderen (AMUZ)</td>
\n<td>2011</td>
\n</tr>
\n<tr>
\n<td>Bruxelles</td>
\n<td>BoZar</td>
\n<td>2002-2004</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>Bozart</td>
\n<td>2007</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>Festival du Sablon</td>
\n<td>2004</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>Soci�t� Philarmonique de Bruxelles</td>
\n<td>1999</td>
\n</tr>
\n<tr>
\n<td>Brugge</td>
\n<td>Festival van Vlaanderen</td>
\n<td>1989-1991-1993-1995</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>�</td>
\n<td>1996-1999-2006</td>
\n<tr>
\n<td>�</td>
\n<td>Festival de l\'Ile de France</td>
\n<td>1997-2000</td>
\n</tr>
\n<tr>
\n<td>Gent</td>
\n<td>Festival Van Vlaanderen</td>
\n<td>1997</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>De Bijloke</td>
\n<td>2002-2003-2004</td>
\n</tr>
\n<tr>
\n<td>Li�ge</td>
\n<td>Festival de Wallonie</td>
\n<td>1997-1998</td>
\n</tr>
\n<tr>
\n<td>Lowen</td>
\n<td>Festival van Vlaanderen</td>
\n<td>1997</td>
\n</tr>
\n<tr>
\n<td>St-Niklaas</td>
\n<td>Festival van Vlaanderen</td>
\n<td>1996</td>
\n</tr>
\n<tr>
\n<td>Ypres</td>
\n<td>Festival van Vlaanderen</td>
\n<td>1996</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n</tr>
\n<th align=left><STRONG>ESPAGNE</STRONG></th>
\n</tr>
\n<tr>
\n<td>Barcelona</td>
\n<td>La Caixa Festival</td>
\n<td>2003</td>
\n</tr>
\n<tr>
\n<td>Gran Canaria</td>
\n<td>Conciertos de Semana Santa</td>
\n<td>2002</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n</tr>
\n<tr>
\n<th align=left><STRONG>FRANCE</STRONG></th>
\n</tr>
\n<tr>
\n<td>Ambronay</td>
\n<td>Festival d\'Ambronay</td>
\n<td>1994-2005</td>
\n</tr>
\n<tr>
\n<td>Amiens</td>
\n<td>Festival des Cath�drales</td>
\n<td>1999-2000-2001-2002</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>�</td>
\n<td>2003-2004-2005-2006</td>
\n</tr>
\n<tr>
\n<td>Arques la Bataille</td>
\n<td>Acad�mie Bach</td>
\n<td>2005-2006-2010</td>
\n</tr>
\n<tr>
\n<td>Beaune</td>
\n<td>Festival de Beaune</td>
\n<td>1994</td>
\n</tr>
\n<tr>
\n<td>Ecuen</td>
\n<td>Festival d\'Ecuen</td>
\n<td>1998</td>
\n</tr>
\n<tr>
\n<td>Erignac</td>
\n<td>Festival du P�rigord Noir</td>
\n<td>2007</td>
\n</tr>
\n<tr>
\n<td>Fontainebleau</td>
\n<td>Institut National de l\'Histoire de l\'Art</td>
\n<td>2011</td>
\n</tr>
\n<tr>
\n<td>Fontevraud</td>
\n<td>Festival de l\'Abbaye de Fontevraud</td>
\n<td>1998-1999</td>
\n</tr>
\n<tr>
\n<td>Lille</td>
\n<td>Archives d�partementales du Nord</td>
\n<td>2010</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>Festival Guillaume Dufay</td>
\n<td>2002</td>
\n</tr>
\n<tr>
\n<td>Nantes</td>
\n<td>La Folle Journ�e</td>
\n<td>2003</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>Les Printemps Baroques</td>
\n<td>2005</td>
\n</tr>
\n<tr>
\n<td>Perpignan</td>
\n<td>Festival de Musique Sacr�e</td>
\n<td>2003-2005</td>
\n</tr>
\n<tr>
\n<td>Pigna</td>
\n<td>Estivoce</td>
\n<td>2001-2003</td>
\n</tr>
\n<tr>
\n<td>Ribeauvill�</td>
\n<td>Rencontres de Musique Ancienne</td>
\n<td>1992-1994-2003-2010</td>
\n</tr>
\n<tr>
\n<td>Royaumont</td>
\n<td>Festival de l\'Abbaye de Royaumont</td>
\n<td>1993</td>
\n</tr>
\n<tr>
\n<td>Saintes</td>
\n<td>Acad�mies Musicales</td>
\n<td>1996-1998-2001-2004</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>�</td>
\n<td>2006</td>
\n</tr>
\n<tr>
\n<td>Savoie</td>
\n<td>Musique et Patrimoine en Tarentaise</td>
\n<td>2009</td>
\n</tr>
\n<tr>
\n<td>St-Claude</td>
\n<td>Festival du Haut-Jura</td>
\n<td>1996-2011</td>
\n</tr>
\n<tr>
\n<td>St-Philibert</td>
\n<td>Musique Vagabonde</td>
\n<td>2003</td>
\n</tr>
\n<tr>
\n<td>Thoronet</td>
\n<td>Festival du Thoronet</td>
\n<td>1997-2001</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n</tr>
\n<tr>
\n<th align=left><strong>HOLLANDE</strong></th>
\n</tr>
\n<tr>
\n<td>Alden-Biesen</td>
\n<td>Internazionale Tage van de Oude Musick</td>
\n<td>1992-1994-1996</td>
\n</tr>
\n<tr>
\n<td>Rotterdam</td>
\n<td>De Doelen</td>
\n<td>2003</td>
\n</tr>
\n<tr>
\n<td>Utrecht</td>
\n<td>Concerts Spirituels</td>
\n<td>2006</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>Oude Muziek</td>
\n<td>2011</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n</tr>
\n<tr>
\n<th align=left><STRONG>ITALIE</STRONG></th>
\n</tr>
\n<tr>
\n<td>Arezzo</td>
\n<td>Settembre Musicale</td>
\n<td>2003-2004</td>
\n</tr>
\n<tr>
\n<td>Bologna</td>
\n<td>Feste Musicali Bolognesi</td>
\n<td>1994-1997</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>Festival di Musica Antica</td>
\n<td>1988</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>Teatro Comunale</td>
\n<td>1994-2000</td>
\n</tr>
\n<tr>
\n<td>Erice</td>
\n<td>Musica Medievale e Rinascimentale</td>
\n<td>1991-1994</td>
\n</tr>
\n<tr>
\n<td>Messina</td>
\n<td>Teatro Vittorio Emmanuele</td>
\n<td>1994</td>
\n</tr>
\n<tr>
\n<td>Milano</td>
\n<td>Musica e Poesia a San Maurizio</td>
\n<td>1988-1990-1992</td>
\n</tr>
\n<tr>
\n<td>Napoli</td>
\n<td>Centro di Musica Antica Piet� de Turchini</td>
\n<td>2009</td>
\n</tr>
\n<tr>
\n<td>Lucca</td>
\n<td>Sagra Musica Lucchese</td>
\n<td>1991</td>
\n</tr>
\n<tr>
\n<td>Rome</td>
\n<td>Villa Medici</td>
\n<td>2003</td>
\n</tr>
\n<tr>
\n<td>Segovia</td>
\n<td>Festival de Segovia</td>
\n<td>1994</td>
\n</tr>
\n<tr>
\n<td>Specchia</td>
\n<td>Muse Salentine</td>
\n<td>2010</td>
\n</tr>
\n<tr>
\n<td>Trento</td>
\n<td>Trento Musica Antica</td>
\n<td>1994</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n</tr>
\n<tr>
\n<th align=left><strong>SUISSE</strong></th>
\n</tr>
\n<tr>
\n<td>Biasca e Ascoli</td>
\n<td>Il Canto delle Pietre</td>
\n<td>1992</td>
\n</tr>
\n<tr>
\n<td>Fribourg</td>
\n<td>Festival de Musique Sacr�e</td>
\n<td>1994-2000</td>
\n</tr>
\n<tr>
\n<td>Gen�ve</td>
\n<td>Festival Amadeus</td>
\n<td>2001</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>Les Concerts Baroques</td>
\n<td>1995</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>Les concerts de Saint-Germain</td>
\n<td>2007</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>Les Concerts du Centre de Musique Ancienne</td>
\n<td>1990-2003</td>
\n</tr>
\n<tr>
\n<td>Lausanne</td>
\n<td>Les Concerts de l\'�v�ch�</td>
\n<td>1988</td>
\n</tr>
\n<tr>
\n<td>Rougemont</td>
\n<td>La Folia</td>
\n<td>2005-2006-2007</td>
\n</tr>
\n<tr>
\n<td>Sion</td>
\n<td>Festival Tibor Varga</td>
\n<td>1997-2000</td>
\n</tr>
\n<tr>
\n<td>�</td>
\n<td>Les Riches Heures de Val�re</td>
\n<td>2011</td>
\n</tr>
\n</table>","0","","0","3"),
("44","12","1","Programmes","<p><strong>DIE SCH�NE M�LLERIN</strong><br/>
\nFranz Schubert<br/>
\n<br/>
\n<strong>BALADES EN FRANCE AVEC EMMANUEL CHABRIER</strong><br/>
\nM�lodies et duos d\'Emmanuel Chabrier, Charles Gounod, Gabriel Faur�, Mel Bonis, C�cile Chaminade et autres tr�sors � la fran�aise.<br/>
\n<br/>
\n<strong>ECHOS ET AMBIANCES DE RUSSIE</strong><br/>
\nS�r�nades, romances, M�lodies et Airs d\'op�ra russes des XIXe et XXe si�cles.<br/><br/>
\n<br/>
\nDe plus amples infromations sont diponibles sur demande.</p>","0","","0","3"),
("45","13","1","Programmes","<p><p><strong>PEIWOH</strong><br/>
\nCr�ation m�diterran�enne et nordique inspir�e de la l�gende tao�ste sur une ancienne harpe orientale.<br/>
\n<br/>
\n<strong>KLANG DER STAUFER</strong><br/>
\nVoyage musical dans l\'Orient et l\'Occident du moyen-�ge.<br/>
\n<br/>
\n<strong>IL VIAGGIO D\'AMORE</strong><br/>
\nUn voyage d\'Amour de la Renaissance � nos jours.<br/>
\n<br/>
\n<strong>SCHAFFE IN MIR, GOTT, EIN REINES HERZ</strong><br/>
\nMusique sacr�e germanique<br/>
\n<br/>
\n<strong>LE P�LERINAGE, UN CHEMIN RITUEL DE PURIFICATION</STRONG><BR/>
\nAlfonso X El Sabino Cantigas de Santa Maria, Llibre Vermell de Monserrat<br/>
\n<br/>
\n<strong>DIE SCH�NE M�LLERIN</strong> et <strong>DIE WINTEREISE</strong><br/>
\nInterpr�t�s par Petter Udland Johansen (t�nor) et David Casanova (piano).<br/>
\n<br/>
\n<strong>MUSIQUES D\'ARVO P�RT ET HELENA TULVE</strong><br/>
\nAvec Arianna Savall (soprano) et Vox Camantis.<br/>
\nSortie d\'un disque d�but 2012 (ECM New Series).<br/>
\n<br/>
\n<strong>MELPOMEN</strong><br/>
\nInterpr�t� avec l\'Ensemble de Conrad Steinmann.<br/>
\n<br/>
\n<STRONG>CHANTS DU NORD ET DU SUD</STRONG><br/>
\nVoyage entre la Mer M�diterran�e et la Mer du Nord.<br/>
\n<br/>
\n<STRONG>BELLA TERRA</STRONG><br/>
\n<br/>
\n<STRONG>LIEDER DE BELLMAN</STRONG><BR/>
\n<BR/>
\n<BR/>
\nDe plus amples informations sont disponibles sur demande.</p>","0","","0","7"),
("46","19","2","Extraits musicaux","","uploads/sound_schola","","0","3"),
("47","16","2","Extraits musicaux","","uploads/sound_orgue_ancien","","0","3"),
("48","17","3","Extrait vid�o","<iframe width=\"420\" height=\"315\" src=\"http://www.youtube.com/embed/r9BZSG4joJQ?rel=0\" frameborder=\"0\" allowfullscreen></iframe>","0","r9BZSG4joJQ","0","3"),
("49","13","4","Discographie","","0","","2","6"),
("50","4","4","Discographie","","0","","7","4"),
("51","15","4","Discographie","","uploads/discographies","","8","4"),
("52","15","1","Programmes","<p><strong>CLAIR-OBSCUR</strong><br/>
\nLes quatuors de saxophones Clair-Obscur (Allemagne) et Marquis de Saxe (Suisse) s\'unissent pour pr�senter deux oeuvres symphoniques majeures dans l\'histoire de la musique et adapt�es pour une formation en octuor:<br/>
\n<br/>
\n<i>L\'Apprenti Sorcier</i> de Paul Dukas<br/>
\n<i>Les Plan�tes</i> de Gustav Holst <br/>
\n<br/>
\n<br/>
\n<strong>STABAT MATER, PERGOLESI</strong><br/>
\nLes deux cantatrices lucernoises Carmela Konrad (soprano) et Liliane Glanzmann (alto) se proposent de porter sur cetteoeuvre un nouvel �clairage, rempla�ant les cordes et le continuo de la version originale par les quatre saxophones du quatuor Marquis de Saxe.<br/>
\n<br/>
\n<br/>
\n<strong>LE CARNAVAL DES AMIMAUX</strong><br/>
\nHonorer la vision de Saint-Sa�ns lorsqu\'il composa ce carnaval durant ses vacances dans un petit village autrichien : faire rire, sans infantiliser. C\'est le d�fis que se sont lanc�s Sandra Korol (textes), Sylviane Tille (mise en sc�ne) et le Marquis de Saxe.
\n<br/>
\n<br/>
\n<strong>L\'HISTOIRE DE BABAR</strong><br/>
\n<i>L\'histoire de Babar</i> de Francis Poulenc et Jean de Brunhoff (arr. Marquis de Saxe)<br/>
\nRevisit� par Marquis de Saxe et Sylviane Tille (mise en sc�ne), <i>L\'histoire de Babar</i> saura enchanter les petits comme les grands par le r�cit des aventures de Babar, d\'Arthur, de C�leste et de la vieille dame. <br/><br/>
\n<i>Sports et divertissements</i> d\'Erik Satie<br/>
\n20 petites sc�nettes mises en espace par Christiane Sordet d�crivent, gr�ce � la musique si caract�ristique d\'Erik Satie, le tango, le golf, la chasse ou encore le pique-nique.<br/><br/>
\nCes deux programmes composent un spectacle d\'environ 50 minutes. <br/>
\n<br/>
\n<br/>
\n<strong>VARIATIONS GOLDBERG, BWV 988</strong><br/>
\nL\'int�grale des <i>Variations Goldberg</i> de Jean-S�bastien Bach a �t� arrang�e sp�cialement par Marquis de Saxe � l\'occasion de son 20e anniversaire, en 2008. Des po�mes, lus par Samuel Zumb�hl (en allemand) ou par Miruna Coca-Cosma (en fran�ais), viennent enrichir l\'oeuvre entre les diff�rentes variations. <br/>
\n<br/>
\n<br/>
\n<strong>SAXE AND THE CITY </strong><br/>
\nCe spectacle musical et didactique s\'adresse particuli�rement aux adolescents. Mettant en sc�ne les quatre musiciens du quatuor, il peut facilement �tre d�fini comme � musicop�dagorigolo �. <br/>
\n<br/>
\n<br/>
\n<br/>
\nDe plus amples informations sont disponibles sur demande.</p>","0","","0","5"),
("53","19","4","Discographie","","uploads/discographies","","9","4"),
("54","22","1","Trio Nota Bene","<p>Le trio suisse Nota Bene est form� du pianiste Lionel Monnet, du violoncelliste Xavier Pignat et du violoniste Julien Zufferey.<br/>
\n<br/>
\nApr�s l\'obtention d\'une virtuosit� de musique de chambre au Conservatoire de Lausanne, le groupe se perfectionne � Paris aupr�s du Trio Wanderer, qui loue son \"�tonnante maturit� musicale\" et suit les conseils de professeurs tels que Roberto Szidon, Menahem Pressler (Beaux-Arts Trio), Patrick Genet (Quatuor Sine Nomine), Christian Favre (Quatuor Schumann), Jean Balissat, Rapha�l Wallfisch, Thomas Grossenbacher, Shmuel Ashkenasi (Quatuor Vermeer), Mauro Minguzzi, Christian Ivaldi, Claire D�sert et Emmanuel Strosser.<br/>
\n<br/>
\nLe Nota Bene acc�de � la finale du 11�me Concours International \"Carlo Soliva\" � Casale Monferrato (Italie), remporte le 1er Prix du Concours International de musique de chambre de Hellevoetsluis-Rotterdam (Hollande), re�oit le Prix Culturel d\'Encouragement de l\'Etat du Valais, d�croche le 1er Prix � l\'unanimit� du jury au 28�me Concours pour Trio Instrumental - Prix G�raldine Whittaker � Neuch�tel, se distingue en remportant le Prix Philippe Chaignat (r�compensant la qualit� de sa prestation lors des Sommets Musicaux de Gstaad) et s\'adjuge le Prix du Public � l\'�dition 2009 du Prix Zulawski-Ville de Chamonix. En 2011, la bourse trisannuelle MusiquePro lui est, en outre, d�cern�e par l\'Etat du Valais.<br/>
\n<br/>
\nLe trio se produit au Festival Sine Nomine � Lausanne, aux Fl�neries musicales de Champ�ry, au Festival des Haud�res, au Festival d\'Ernen, � la Tonhalle de Zurich, au Theater Basel, au studio Ernest Ansermet, � l\'Auditorium du Conservatoire de Gen�ve, au Mus�e d\'Art et d\'Histoire de Gen�ve, � l\'Octogone de Pully, � la Fondation Gianadda, au Festival International de la Roque d\'Anth�ron (France), � La Folle Journ�e de Nantes (France), au Concertgebouw d\'Amsterdam (Hollande), au Festival de Hellevoetsluis (Hollande), au Teatro Sociale de Castiglione delle Stiviere (Italie), aux Zinettiadi de V�rone (Italie), ou encore au Festival D-Marin de Bodrum (Turquie) o� les trois artistes apparaissent en solistes dans le Triple Concerto de Beethoven aux c�t�s du Dogus Youth Symphony Orchestra. Une r�cente tourn�e m�ne les trois musiciens au Recanati Hall de Tel Aviv, au Music Center de J�rusalem et � la Chamber Music Society de Ha�fa.<br/>
\n<br/>
\nActif dans le domaine de la musique contemporaine, le trio Nota Bene cr�e r�guli�rement des oeuvres de compositeurs suisses et �trangers : citons les premi�res des trios de Roberto Sierra, Marie-Christine Raboud, Jean-Luc Darbellay, Gregorio Zanon ou encore Alfred Zimerlin.<br/>
\n<br/>
\nLe trio collabore avec des artistes de renom tels que Fabio di C�sola, Brigitte Fournier, Christoph Schiller, Shlomo Mintz, Nobuko Imai, G�rard Causs�, Pierre Amoyal ou encore Shmuel Ashkenasi.<br/>
\n<br/>
\nNota Bene a � son actif deux enregistrements parus sous le label Claves et chaleureusement salu�s par la critique. Le premier, �100% Russe�, est d�di� aux trios d\'Arenski, Rachmaninov et Chostakovich; le second, �Swiss Perspective�, est consacr� aux compositeurs helv�tiques J. Raff, A. Honegger, E. Bloch et F. Martin.<b/>
\n<br/><br/>
\n<a href=\"http://trionotabene.com\">www.trionotabene.com</a></p>","uploads/img_trio_nota_bene","","0","1"),
("56","22","2","Extraits musicaux","","uploads/sound_trio_nota_bene","","0","2"),
("57","22","3","Extrait vid�o","<p><inframe width=\"420\"height=\"315\"src=\"http://youtube.com/embed/8n-TATNpUWA?rel=0\"frameborder=\"0\"allowfullscreen></inframe></p>","0","8n-TATNpUWA","0","3"),
("58","22","4","Discographie","","0","","10","4");




DROP TABLE `profile`;CREATE TABLE `profile` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `dir_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL DEFAULT '0',
  `dir_name_2` varchar(255) NOT NULL,
  `media_url` varchar(255) NOT NULL,
  `profile_category_id` smallint(15) NOT NULL,
  `upload_file_id` int(255) NOT NULL,
  `profile_name` varchar(55) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `profile_surname` varchar(55) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `profile_short_biography` text CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `profile_function` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `profile_company` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `profile_company_url` varchar(55) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `profile_email_address` varchar(55) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `profile_phone_number` varchar(55) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `profile_address` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `profile_city` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `profile_postal_code` varchar(55) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `profile_country` smallint(12) NOT NULL,
  `profile_status` tinyint(2) NOT NULL DEFAULT 1,
  `profile_creation` date NOT NULL,
  `profile_modification` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


INSERT INTO profile VALUES
("4","uploads/img_ensemble_daedalus","0","vvGmSv9J-jk","2","12","Ensemble","Daedalus","","Musique ancienne","Ensemble Daedalus","","","","","","","0","1","2011-03-19","2011-11-17"),
("12","uploads/img_bertrand_bochud","uploads/sound_bertrand_bochud","","2","0","Bertrand","Bochud","<p>Dès l’âge de huit ans, Bertrand Bochud suit dès des cours de piano, de chant et d’orgue au Conservatoire de Fribourg. Après l’obtention du diplôme d’enseignement en 2004, pour lequel il a reçu le prix de la Fondation Max et Axelle Koch de Lucerne, il termine sa formation par la virtuosité – mention excellente avec félicitations du jury – auprès de Michel Brodard à la Musikhochschule de Lucerne. Il se perfectionne actuellement auprès de Tiny Westendorp.</p>
\n
\n<p><br/></p>
\n
\n<p>Dans le domaine du récital, son répertoire comprend plusieurs cycles de Lieder romantiques allemands : Winterreise de Schubert ou Dichterliebe de Schumann ainsi que des mélodies françaises de Fauré, Bizet, Duparc et Poulenc. Bertrand Bochud a présenté récemment un récital de musique russe au côté de la mezzo-soprano Brigitte Balleys. Cette collaboration se poursuit avec la préparation d’un programme autour du compositeur français Emmanuel Chabrier. Le duo sera accompagné par le pianiste Laurent Martin.</p>
\n
\n<p><br/></p>
\n
\n<p>Bertrand Bochud aborde également volontiers des pages de musique contemporaine dont récemment une création pour ténor et quatuor à cordes de Dominique Gesseney-Rappo : le Nunc Dimitis interprété en collaboration avec le Quatuor Sine Nomine.</p>
\n
\n<p><br/></p>
\n
\n<p>Durant l’été 2008, il tient le rôle de Rodolphe dans la production de La Bohème de Puccini pour l’Association Ouverture-Opéra à la Ferme Asile de Sion.</p>
\n
\n<p><br/></p>
\n
\n<p>Dès la rentrée 2010, il enseigne à la Haute Ecole de Musique de Lausanne.</p>
\n
\n<p><br/><br/>
\n<a href=\"http://www.bertrandbochud.ch\" onclick=\"window.open(this.href, \'_blank\'); return false;\">www.bertrandbochud.ch</a></p>","T�nor","","http://www.bertrandbochud.ch/","","","","","","214","1","2011-08-04","2011-12-06"),
("13","uploads/img_hirundo_maris","uploads/sound_hirundo_maris","v3Xptfn2DnA","2","0","Hirundo","Maris","<p>Arianna Savall et Petter Udland Johansen créent Hirundo Maris en 2009. Leur souhait est de se spécialiser tout d’abord dans la musique ancienne tout en gardant une place importante pour des créations contemporaines de leur composition. </p>
\n<p><br/></p>
\n<p>Leur projet porte principalement sur la musique méditerranéenne et nordique. A l’image de l’hirundo maris, un oiseau migrateur, les musiciens retrouvent, grâce à un travail mené conjointement, les chemins de la mer et de la musique qui, depuis la nuit des temps, unissent les pays scandinaves à la péninsule ibérique. Il ne s’agit pas seulement d’un voyage musical unique entre les pays civilisés, l\'Espagne et la Norvège, ou encore entre le Sud et le Nord, mais également d’un parcours à travers les siècles. </p>
\n<p><br/></p>
\n<p>Hirundo Maris, ensemble à géométrie variable rassemblant différents solistes, enchante les amateurs de musique par sa diversité sonore. Son premier disque sera disponible au printemps 2012 sous le prestigieux label ECM.
\n</p>","Musique ancienne & traditionnelle","Hirundo Maris","","","","","","","214","1","2011-08-04","2011-12-07"),
("14","uploads/img_les_riches_heures_de_valere","","","1","0","Les Riches Heures de Val�re","","<p>Créée en 2008, l’Association Les Riches Heures de Valère a pour ambition, grâce à une programmation spécifique visant un niveau d’excellence, de mettre en valeur le site exceptionnel de Valère et de la vieille ville de Sion par l’organisation de concerts de musique ancienne et baroque.</p>
\n
\n<p><br/></p>
\n
\n<p>Les premières saisons ont notamment vu se produire à Sion Jordi Savall(Temps retrouvé), l’Ensemble Vocal de Lausanne & Michel Corboz (Missa a quattro voci da cappella de Claudio Monteverdi), le Hilliard Ensemble(In Paradisum), le Quatuor Sine Nomine (Les sept dernières paroles du Christ en croix, Joseph Haydn), Arianna Savall & Petter Udland Johansen (Il viaggio d’Amore), Stile Antico(Song of songs), l’Ensemble Daedalus & Roberto Festa (O Vergin Santa non m’abbandonare), l’Ensemble Musica Fiorita (Nascente Maria, Barbara Strozzi) ou encore le Huelgas Ensemble & Paul van Nevel (Apogée de la polyphonie sacrée). Concerto Soave, accompagné de Maria Cristina Kiehr et de Jean-Marc Aymes (Il Canto delle Dame), se produira en novembre. </p>
\n
\n<p><br/></p>
\n
\n<p><a href=\"http://www.lesrichesheuresdevalere.ch/\">www.lesrichesheuresdevalere.ch</a> </p>","","Les Riches Heures de Val�re","","","","","","","214","1","2011-08-04","2011-12-05"),
("15","uploads/img_marquis_de_saxe","0","","2","0","Marquis de Saxe","","<p>Fondé en automne 1988 au Conservatoire de Lausanne et après avoir connu divers changements, Marquis de Saxe est constitué depuis 2000 de saxophonistes tous en possession d’un 1er prix de virtuosité. Ils travaillent comme pédagogues dans les Conservatoires de Sion, Lausanne, Fribourg et Morges (COV), ainsi qu’à la HEM de Lausanne et à l’Ecole de Musique de Lucerne.</p>
\n
\n<p><br/></p>
\n
\n<p>En 1990, Marquis de Saxe remporte un 2ème prix au Concours National de Musique Contemporaine de la fondation B.A.T.; à cette occasion, il interprétait entre autres la première pièce écrite spécialement à son intention par Alexis Chalier. Depuis, le quatuor entretient diverses collaborations avec les compositeurs Jean-François Bovard, Andor Kovach, Jean-François Michel, Claude Ferrier, Claude Prior ou encore avec Dominique Gesseney Rappo à qui le quatuor a commandé un concerto pour quatuor de saxophones et orchestre symphonique qui est créé lors d’une tournée de concerts en novembre 2011.</p>
\n
\n<p><br/></p>
\n
\n<p>Les succès obtenus en concerts dans toute la Suisse mais aussi en France, en Roumanie, en Slovénie et en Autriche encouragent le quatuor à partir à la recherche de nouvelles couleurs à travers des répertoires éclectiques mêlant les grandes œuvres du répertoire à la musique contemporaine et au rire.</p>
\n
\n<p><br/></p>
\n
\n<p>
\nEn 2004, il obtient le droit exceptionnel d’arrangement et d’interprétation de L’histoire de Babar de Francis Poulenc. Dans une mise en scène de Sylviane Tille, ce concert/spectacle continue de connaître un succès sans précédent. Parallèlement, Marquis de Saxe initie les écoles à l’univers du saxophone à travers son spectacle maison Sax and the city. En 2007, il collabore avec le quatuor Clair-Obscur de Berlin pour une série de concerts en Suisse et dans la capitale allemande avec au programme un arrangement de Pierre et le Loup de Prokoviev pour huit saxophones. Ces deux dernières années, les Variations Goldberg de Jean-Sébastien Bach ont représenté le pilier de son activité dont le dernier concert a été donné en août 2011 au Festival Bach en Combrailles (Auvergne).</p>
\n
\n<p><br/></p>
\n
\n<p>Marquis de Saxe a, jusqu’à ce jour, produit quatre disques.</p> 
\n
\n<p><br/></p>
\n
\n<p>Actuellement, Marquis de Saxe travaille sur plusieurs nouveaux projets en collaboration avec des artistes de renoms et tous spécialisés dans leur art. Une tournée de plusieurs concerts est prévue en août 2012 avec le quatuor allemand Clair-Obscur pour présenter L’Apprenti Sorcier de Paul Dukas et Les Planètes de Gustav Holst. Accompagné de la soprano Carmela Konrad et l’alto Lilian Glanzmann, il fera un nouveau passage dans le répertoire baroque avec l’interprétation du Stabat Mater de Pergolesi. Enfin, Marquis de Saxe souhaite faire revivre Le Carnaval des Animaux de Saint-Saëns avec des textes de Sandra Korol et sur une mise en scène de Sylviane Tille.</p> 
\n
\n<p><br/><br/>
\n<a href=\"http://www.marquisdesaxe.ch\" onclick=\"window.open(this.href, \'_blank\'); return false;\">www.marquisdesaxe.ch</a></p>","Quatuor de saxophones","Marquis de Saxe","http://www.marquisdesaxe.ch/","","","","","","214","1","2011-08-04","2011-12-05"),
("16","uploads/img_orgue_ancien","","","1","0","Festival de l\'Orgue Ancien","","<p>Chaque samedi d’été, depuis plus de 40 ans, le Festival International de l’Orgue Ancien et de la Musique Ancienne de Valère convie le public à entendre en concert le plus ancien orgue encore jouable au monde (1435 env.). 
\n</p>
\n
\n<p><br/></p>
\n<p>
\nDes concertistes de renom présentent aux auditeurs des programmes variés et originaux, et ils font vivre cet instrument vénérable installé à Valère voilà bientôt 600 ans. 
\n</p>
\n
\n<p><br/></p>
\n<p>
\nDurant les mois de juillet et août, ce haut-lieu s’anime. Lors de ces récitals, c’est tout le vaisseau de pierre qui résonne et qui vibre : la musique magnifie l’œuvre des bâtisseurs médiévaux. Les musiciens invités se réjouissent de jouer sur cet orgue unique. Ils s’ingénient à présenter un répertoire destiné à mettre en valeur les possibilités étonnantes de cet orgue historique de Valère.
\n</p>
\n
\n<p>
\n<br/>
\n<a href=\"http://www.orgueancien-valere.ch \" onclick=\"window.open(this.href, \'_blank\'); return false;\">www.orgueancien-valere.ch </a>
\n</p>","","Festival de l\'Orgue Ancien","http://www.orgueancien-valere.ch/","","","","","","214","1","2011-08-04","2011-11-17"),
("17","uploads/img_ouverture_opera","","","1","0","Ouverture-Op�ra","","<p>L’association Ouverture-Opéra œuvre depuis 2006 à la création et à la promotion de spectacles lyriques. 
\n</p>
\n
\n<p><br/></p>
\n<p>
\nElle vise essentiellement deux buts: d’une part de favoriser, dans un encadrement professionnel, le développement de jeunes talents valaisans, principalement de chanteurs, mais également de tout créateur dont l’art peut contribuer à la réalisation d’un opéra, et d’autre part de répondre à l’attente d’un public valaisan amateur de chant et d’art lyrique en lui offrant des productions originales et inhabituelles d’un répertoire « traditionnel ». 
\n</p>
\n
\n<p><br/></p>
\n<p>
\nSous la direction musicale de Jean-Luc Follonier et dans des mises en scènes exceptionnelles de Julie Beauvais, Ouverture-Opéra a présenté, à la Ferme-Asile de Sion, Les Noces de Figaro de Mozart (2006), La Bohème de Puccini (2008) et Don Giovanni de Mozart (2010). La troupe présentera Alcina de Haendel du 22 août au 12 septembre 2012. 
\n</p>
\n
\n<p>
\n<br/><br/>
\n<a href=\"http://www.ouverture-opera.ch\" onclick=\"window.open(this.href, \'_blank\'); return false;\">www.ouverture-opera.ch</a>
\n</p>","op�ra","Ouverture-Op�ra","http://www.ouverture-opera.ch/","","","","","","214","1","2011-08-04","2011-12-05"),
("18","uploads/img_petter_udland_johansen","0","Rws7FsUvK2A","2","0","Petter ","Udland Johansen","<p>Né à Oslo où il reçoit sa première formation vocale et instrumentale, Petter Udland Johannsen obtient un diplôme de chant à la Musikhøyskole Norges. Il se perfectionne ensuite avec Ingrid Bjoner et Svein Bjørkøy, puis à la Schola Cantorum Basiliensis avec Richard Levitt. Le ténor Hans Peter Blochwitz lui apporte un supplément de formation vocale.</p>
\n
\n<p><br/></p>
\n
\n<p>Son répertoire d\'opéra et de concerts comprend les œuvres majeures de compositeurs tels que J.S. Bach, C. Monteverdi, W.A Mozart, F. Mendelssohn ou encore des pièces de F. Schubert, E. Grieg, H. Wolf, G. Mahler, E. Grieg et J. Brahms. Petter Udland Johansen a travaillé avec les chefs Rinaldo Alessandrini, Jordi Savall, Pep Prats, Christer Løvold, Tom et Tobias Kjellum Gossmann.</p> 
\n
\n<p><br/></p>
\n
\n<p>Petter Udland Johannsen a participé à des concerts et des enregistrements de CD avec de nombreux ensembles, notamment Hirundo Maris, Pechrima, Sagene anneau, Capella Antiqua Bambergensis, Pratum Musicum, La Morra, Ferarra et Lucidarium.</p>
\n
\n<p><br/></p>
\n
\n<p>En 2009, il fonde avec sa partenaire, Arianna Savall, l\'ensemble Hirundo Maris. Cette formation a une activité régulière de concerts dans la plupart des pays d’Europe. Le premier CD de l\'ensemble, Chants du Sud et du Nord, sera disponible au printemps 2012 sous le prestigieux label ECM.</p>
\n
\n<p><br/></p>
\n
\n<p>
\nPetter Udland Johansen fonde, en collaboration avec Christer Løvold et Mark B. Lay, le trio vocal Pechrima dont les programmes allient compositions personnelles et répertoire traditionnel. Leur premier disque sort en 2011.</p> 
\n
\n<p>Petter Udland Johansen est également reconnu comme compositeur et arrangeur. Il donne régulièrement des cours de chant choral et de soliste.</p>
\n
\n<p><br/><br/>
\n<a href=\"http://www.petterudland.com \" onclick=\"window.open(this.href, \'_blank\'); return false;\"> www.petterudland.com </a></p>","Ténor","","http://www.petterudland.com","","","","","","214","0","2011-08-04","2011-12-05"),
("19","uploads/img_schola","","","1","0","Schola de Sion","","<p>Depuis plus de 80 ans, la <strong>Schola de Sion</strong> initie des jeunes valaisans au chant choral (solfège, travail vocal, travail du répertoire, prestations musicales publiques). </p>
\n
\n<p><br/></p>
\n
\n<p>Elle forme actuellement près de 150 chanteuses et chanteurs répartis en différents chœurs : le Chœur des Petits Nouveaux et le Chœur des Petites Nouvelles (6 à 9 ans), le Petit Chœur de filles (9 à 11 ans), le Grand Chœur de filles (dès 12 ans), les Petits Chanteurs (dès 9 ans), le Chœur d’hommes (dès la mue) et l’Ensemble vocal.</p>
\n
\n<p><br/></p>
\n
\n<p>La Schola de Sion présente environ 45 prestations publiques par année (concerts et offices) et assure plus de 20 heures de formation musicale hebdomadaire.</p>
\n
\n<p><br/></p>
\n
\n<p><a href=\"http://www.schola-sion.ch/\">www.schola-sion.ch</a></p>","Chant","Schola","http://www.schola-sion.ch/","","","","","","214","1","2011-08-04","2011-12-01");




DROP TABLE `profile_category`;CREATE TABLE `profile_category` (
  `profile_category_id` smallint(15) NOT NULL AUTO_INCREMENT,
  `profile_category_name_en` varchar(255) NOT NULL,
  `profile_category_name_fr` varchar(255) NOT NULL,
  PRIMARY KEY (`profile_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;


INSERT INTO profile_category VALUES
("2","Production","Production"),
("1","Diffusion","Diffusion");




DROP TABLE `profile_description`;CREATE TABLE `profile_description` (
  `profile_description_id` int(255) NOT NULL AUTO_INCREMENT,
  `profile_id` int(255) NOT NULL,
  `language_id` smallint(10) NOT NULL DEFAULT 1,
  `profile_description_content` text NOT NULL,
  PRIMARY KEY (`profile_description_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;


INSERT INTO profile_description VALUES
("5","1","1","<p>Stile Antico is an ensemble of young British singers, now established as one of the most original and exciting new voices in its field. Much in demand in concert, the group performs regularly throughout Europe and North America. Their recordings on the Harmonia Mundi label have enjoyed great success, receiving the Diapason d�Or de l\\\\\\\'ann�e, the Preis der deutschen Schallplattenkritik and twice attracting GRAMMY nominations. Their recent release Song of Songs won the 2009 Gramophone Award for Early Music and reached the top of the US Classical Chart.</p>"),
("6","4","2","<p>Fondé à Genève en 1986, Daedalus consacre les deux premières années de son activité à la recherche. Les programmes qui virent les débuts de l\'ensemble, lors du prestigieux Festival des Flandres, et à Milan, lors de Musica e poesia a San Maurizio, sont le résultat concret de cette période d\'étude. Le succès rencontré à Bruges ouvre la voie à deux collaborations essentielles dans le parcours du groupe : avec Accent, tout d\'abord, la maison de disques qui a enregistré 10 de ses CDs, et RTB 3, la chaîne culturelle de la radio belge, coproductrice de 4 d\'entre eux. </p>"),
("7","8","2","<p>Mar�a Cristina Kiehr s�est tr�s vite impos�e, aupr�s de la presse et du public, comme une des plus grandes interpr�tes du chant baroque. Elle sait en effet allier la suavit� de son timbre unique � un fervent respect des textes po�tiques qu�elle d�fend avec humilit� et chaleur. Seraient-ce sa nationalit� argentine et ses origines danoises qui m�langent � merveille cette suavit� sans �gale � la plus grande rigueur musicale et stylistique ? 
\nForm�e � la Schola Cantorum de B�le aupr�s de Ren� Jacobs, elle est tr�s vite invit�e par les plus grands chefs (Ren� Jacobs, Philippe Herreweghe, Franz Bruggen, Jordi Savall, Gustav Leonhardt, Nikolaus Harnoncourt...) et les formations les plus prestigieuses (Hesperion XXI, Concerto K�ln, Ensemble 415, Seminario Musicale, Concerto Vocale, Elyma, La Fenice...).
\nHormis sa participation � des productions d�op�ras (Orontea de Cesti � B�le, Incoronazione di Poppea de Monteverdi � Montpellier, Dorilla de Vivaldi � Nice...), elle voyage � travers le monde (en Europe, au Japon, en Australie, en Am�rique Centrale et du Sud...) et a particip� � plus d�une centaine d�enregistrements.
\nMais sa double passion pour la polyphonie et la monodie italienne du XVIIe si�cle s��panouit pleinement avec Concerto Soave, dont elle est co-fondatrice. Mar�a Cristina Kiehr y r�v�le ses talents de conteuse, s�attachant � rendre les moindres intentions de la ��nouvelle musique�� monodique (la nuova musica). Celle-ci t�moigne d�une p�riode faste o� les plus grands po�tes (Tasso, Marino, P�trarque...) �taient mis en musique par les plus grands compositeurs (Monteverdi, d�India, Mazzochi...) et o� la musique sacr�e s�adressait aux sens et au c�ur avec la m�me rh�torique que la musique profane. Elle nous permet de d�couvrir non seulement une chanteuse unique, mais une artiste accomplie.</p>"),
("8","7","2","<p>N� de la rencontre de Maria Cristina Kiehr et Jean-Marc Aymes, Concerto Soave fut au d�part con�u comme un �crin de solistes ench�ssant la voix unique de la soprano. Plus particuli�rement vou� � la musique italienne du seicento, ses concerts � travers le monde (France, Belgique, Hollande, Pologne, Angleterre, Canada, Italie, �tats-Unis, Autriche, Allemagne, Espagne, Portugal...) et ses enregistrements pour l�empreinte digitale, Harmonia Mundi ou le Label Ambronay marquent immanquablement le paysage musical baroque. L�ensemble est ainsi devenu une r�f�rence pour l�interpr�tation de la musique italienne, interpr�tation o� le respect des �uvres n�a d�autre but que d�en d�cupler le pouvoir �motionnel, la suavit� et le myst�re.
\nDepuis 2007, Concerto Soave a Marseille pour port d�attache, o� il organise le festival Mars en Baroque. L�ensemble �largit son r�pertoire � toute la p�riode baroque en faisant appel aux meilleurs instrumentistes et chanteurs. Il s�ouvre aussi � de nouveaux r�pertoires et collaborations : musique contemporaine (cr�ation de la Passion selon Marie de Zad Moultaka avec Les �l�ments ; Tresses &amp; d�tresse avec Musicatreize), musique extra-europ�enne (Vertiges du Sacr� avec le chanteur Moneim Adwan), spectacles avec danse (Il Ballo della Ninfa avec Il Ballarino) ou d�clamation (L�Amour de Madeleine avec Benjamin Lazar).</p>"),
("9","9","2","<p>Jean-Marc Aymes est � la fois soliste, directeur artistique et enseignant. En tant que claveciniste et organiste, il a entrepris l�enregistrement int�gral de la musique pour clavier de Girolamo Frescobaldi. Le quatri�me et dernier volume (Fantasie, Recercari &amp; Canzoni Franzese, Fiori musicali), paru en novembre 2010, a �t� distingu� par un Diapason 5. L�ensemble de cette int�grale a ainsi re�u un accueil enthousiaste de la critique internationale�: deux diapasons d�or et 5 Goldberg (volumes 1 et 3), Joker de la revue belge Crescendo (volume 1).
\nJean-Marc Aymes est le directeur artistique de Concerto Soave. Il a fond� cet ensemble, maintenant consid�r� comme une r�f�rence dans l�interpr�tation de la musique italienne du Seicento, avec la soprano argentine Mar�a Cristina Kiehr. Les enregistrements r�alis�s pour Harmonia Mundi ont recueilli les plus grandes r�compenses internationales. Il voyage avec cet ensemble � travers le monde (Royaume-Uni, Pays-Bas, Allemagne, Suisse, Belgique, Espagne, Italie, Autriche, �tats-Unis, Canada...), se produisant dans les plus prestigieux festivals.
\nJean-Marc Aymes est aussi connu pour sa participation � diff�rents projets de musique contemporaine, en tant que soliste (cr�ation et d�dicace de plusieurs pi�ces solo) ou avec l�ensemble Musicatreize, dirig� par Roland Hayrab�dian. Il a bien entendu jou� avec un grand nombre d�ensembles de musique ancienne (Janequin, Talens Lyriques, Grande Ecurie, Daedalus, Akademia...) et continue de se produire r�guli�rement avec l�ensemble La Fenice, dirig� par son grand ami Jean Tub�ry. Il a ainsi particip� � plus d�une soixantaine d�enregistrements et � d�innombrables concerts et �missions de radio.
\n� Marseille, il est directeur musical du festival Mars en Baroque. En septembre 2009, il a �t� nomm� professeur de clavecin du Conservatoire Sup�rieur de Musique et de Danse de Lyon.</p>");




DROP TABLE `profile_picture`;CREATE TABLE `profile_picture` (
  `profile_picture_id` int(55) NOT NULL AUTO_INCREMENT,
  `profile_id` int(55) NOT NULL,
  `profile_picture_name` varchar(255) NOT NULL,
  `profile_picture_ext` varchar(5) NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`profile_picture_id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;


INSERT INTO profile_picture VALUES
("40","61","borgeaud",".jpg","2010-03-11 17:47:37"),
("41","64","hai",".jpg","2010-03-12 10:28:07"),
("42","65","catherineschnydrig",".jpg","2010-03-12 16:42:02"),
("45","69","fredericstuder",".jpg","2010-03-13 13:12:53"),
("46","70","jeannoelmoulin",".jpg","2010-03-13 13:39:17"),
("61","97","laubergraphics",".gif","2010-04-14 15:54:23"),
("60","86","antidote",".gif","2010-04-01 20:52:40");




DROP TABLE `subcategory`;CREATE TABLE `subcategory` (
  `subcategory_id` smallint(3) NOT NULL AUTO_INCREMENT,
  `subcategory_parent_id` smallint(3) NOT NULL,
  `subcategory_name` varchar(55) NOT NULL,
  PRIMARY KEY (`subcategory_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;






DROP TABLE `template`;CREATE TABLE `template` (
  `template_id` int(255) NOT NULL AUTO_INCREMENT,
  `template_parent_id` int(255) NOT NULL,
  `template_name` varchar(55) NOT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO template VALUES
("70","0","œuvres_completes"),
("71","70","œuvres_completes_recits"),
("78","73","presentation_site"),
("72","70","œuvres_completes_nouvelles_editions"),
("73","0","association"),
("74","0","fonds"),
("75","74","fonds_crlr"),
("76","74","fonds_bcu"),
("77","73","presentation_association"),
("79","0","citations"),
("80","79","citations"),
("81","0","notices"),
("82","81","notice_biographique"),
("83","81","cingria_vu_par_max_jacob"),
("84","0","presse_media"),
("85","84","presse_media");




DROP TABLE `upload_file`;CREATE TABLE `upload_file` (
  `upload_file_id` int(55) NOT NULL AUTO_INCREMENT,
  `profile_id` int(55) NOT NULL DEFAULT 0,
  `dir_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `upload_file_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `upload_file_ext` varchar(5) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `language_id` tinyint(5) NOT NULL DEFAULT 1,
  `upload_file_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `upload_file_description` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `upload_file_rank` mediumint(25) NOT NULL DEFAULT 1,
  `upload_file_display` tinyint(1) NOT NULL DEFAULT 1,
  `upload_file_creation_date` date NOT NULL,
  `upload_file_modification_date` date NOT NULL,
  PRIMARY KEY (`upload_file_id`)
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


INSERT INTO upload_file VALUES
("97","0","uploads/illustrations","cingria_turban",".jpg","1","Cingria turban","","1","1","2012-02-21","0000-00-00"),
("98","0","uploads/illustrations","cingria_chapeau",".jpg","1","cingria_chapeau","","1","1","2012-02-21","0000-00-00"),
("99","0","uploads/documents","bulletin_d_inscription",".pdf","1","Bulletin d\'inscription à l\'Association","","1","1","2012-02-28","0000-00-00"),
("100","0","uploads/couvertures","adrienbovy",".jpg","1","adrienbovy","","1","1","0000-00-00","0000-00-00"),
("101","0","uploads/couvertures","allianceculturelle",".jpg","1","allianceculturelle","","1","1","0000-00-00","0000-00-00"),
("102","0","uploads/couvertures","anthologie1995",".jpg","1","anthologie1995","","1","1","0000-00-00","0000-00-00"),
("103","0","uploads/couvertures","balmoral37",".jpg","1","balmoral37","","1","1","0000-00-00","0000-00-00"),
("104","0","uploads/couvertures","balmoral48",".jpg","1","balmoral48","","1","1","0000-00-00","0000-00-00"),
("105","0","uploads/couvertures","belleslettres",".jpg","1","belleslettres","","1","1","0000-00-00","0000-00-00"),
("106","0","uploads/couvertures","bitumeexquis",".jpg","1","bitumeexquis","","1","1","0000-00-00","0000-00-00"),
("107","0","uploads/couvertures","boissecboisvert",".jpg","1","boissecboisvert","","1","1","0000-00-00","0000-00-00"),
("108","0","uploads/couvertures","boissecboisvert1983",".jpg","1","boissecboisvert1983","","1","1","0000-00-00","0000-00-00"),
("109","0","uploads/couvertures","bouvier",".jpg","1","bouvier","","1","1","0000-00-00","0000-00-00"),
("110","0","uploads/couvertures","brunonpomposo",".jpg","1","brunonpomposo","","1","1","0000-00-00","0000-00-00"),
("111","0","uploads/couvertures","brunonpomposo1997",".jpg","1","brunonpomposo1997","","1","1","0000-00-00","0000-00-00"),
("112","0","uploads/couvertures","cahiersbleus",".jpg","1","cahiersbleus","","1","1","0000-00-00","0000-00-00"),
("113","0","uploads/couvertures","carnetduchatsauvage",".jpg","1","carnetduchatsauvage","","1","1","0000-00-00","0000-00-00"),
("114","0","uploads/couvertures","chessexagedhomme",".jpg","1","chessexagedhomme","","1","1","0000-00-00","0000-00-00"),
("115","0","uploads/couvertures","chessexseghers",".jpg","1","chessexseghers","","1","1","0000-00-00","0000-00-00"),
("116","0","uploads/couvertures","cippecollectif",".jpg","1","cippecollectif","","1","1","0000-00-00","0000-00-00"),
("117","0","uploads/couvertures","cippejoriscorbellari",".jpg","1","cippejoriscorbellari","","1","1","0000-00-00","0000-00-00"),
("118","0","uploads/couvertures","civilisationsaintgall",".jpg","1","civilisationsaintgall","","1","1","0000-00-00","0000-00-00"),
("119","0","uploads/couvertures","coleresetantidotes",".jpg","1","coleresetantidotes","","1","1","0000-00-00","0000-00-00"),
("120","0","uploads/couvertures","coronanova",".jpg","1","coronanova","","1","1","0000-00-00","0000-00-00"),
("121","0","uploads/couvertures","dossiersh",".jpg","1","dossiersh","","1","1","0000-00-00","0000-00-00"),
("122","0","uploads/couvertures","ecriture21",".jpg","1","ecriture21","","1","1","0000-00-00","0000-00-00"),
("123","0","uploads/couvertures","ecriture29",".jpg","1","ecriture29","","1","1","0000-00-00","0000-00-00"),
("124","0","uploads/couvertures","eruditionetliberte",".jpg","1","eruditionetliberte","","1","1","0000-00-00","0000-00-00"),
("125","0","uploads/couvertures","esperanto",".jpg","1","esperanto","","1","1","0000-00-00","0000-00-00"),
("126","0","uploads/couvertures","floridesetautrestextes",".jpg","1","floridesetautrestextes","","1","1","0000-00-00","0000-00-00"),
("127","0","uploads/couvertures","florideshelvetes",".jpg","1","florideshelvetes","","1","1","0000-00-00","0000-00-00"),
("128","0","uploads/couvertures","fourmirouge",".jpg","1","fourmirouge","","1","1","0000-00-00","0000-00-00"),
("129","0","uploads/couvertures","geographievraie",".jpg","1","geographievraie","","1","1","0000-00-00","0000-00-00"),
("130","0","uploads/couvertures","hebdolitteraire",".jpg","1","hebdolitteraire","","1","1","0000-00-00","0000-00-00"),
("131","0","uploads/couvertures","impressionsdunpassant",".jpg","1","impressionsdunpassant","","1","1","0000-00-00","0000-00-00"),
("132","0","uploads/couvertures","impressionsdunpassantalausanne",".jpg","1","impressionsdunpassantalausanne","","1","1","0000-00-00","0000-00-00"),
("133","0","uploads/couvertures","jaton",".jpg","1","jaton","","1","1","0000-00-00","0000-00-00"),
("134","0","uploads/couvertures","lagrandeourse",".jpg","1","lagrandeourse","","1","1","0000-00-00","0000-00-00"),
("135","0","uploads/couvertures","lajongleresse",".jpg","1","lajongleresse","","1","1","0000-00-00","0000-00-00"),
("136","0","uploads/couvertures","lareineberthe",".jpg","1","lareineberthe","","1","1","0000-00-00","0000-00-00"),
("137","0","uploads/couvertures","lareineberthe1992",".jpg","1","lareineberthe1992","","1","1","0000-00-00","0000-00-00"),
("138","0","uploads/couvertures","leaudeladixiememilliaire",".jpg","1","leaudeladixiememilliaire","","1","1","0000-00-00","0000-00-00"),
("139","0","uploads/couvertures","lebeydepergame",".jpg","1","lebeydepergame","","1","1","0000-00-00","0000-00-00"),
("140","0","uploads/couvertures","lecampdecesar",".jpg","1","lecampdecesar","","1","1","0000-00-00","0000-00-00"),
("141","0","uploads/couvertures","lecanalexutoire1973",".jpg","1","lecanalexutoire1973","","1","1","0000-00-00","0000-00-00"),
("142","0","uploads/couvertures","lecarnetduchatsauvage",".jpg","1","lecarnetduchatsauvage","","1","1","0000-00-00","0000-00-00"),
("143","0","uploads/couvertures","lecomtedesformes",".jpg","1","lecomtedesformes","","1","1","0000-00-00","0000-00-00"),
("144","0","uploads/couvertures","lenovellino",".jpg","1","lenovellino","","1","1","0000-00-00","0000-00-00"),
("145","0","uploads/couvertures","leparcoursduhautrhone",".jpg","1","leparcoursduhautrhone","","1","1","0000-00-00","0000-00-00"),
("146","0","uploads/couvertures","lettreauverificateurdeseaux",".jpg","1","lettreauverificateurdeseaux","","1","1","0000-00-00","0000-00-00"),
("147","0","uploads/couvertures","mermod",".jpg","1","mermod","","1","1","0000-00-00","0000-00-00"),
("148","0","uploads/couvertures","michon",".jpg","1","michon","","1","1","0000-00-00","0000-00-00"),
("149","0","uploads/couvertures","musiquesdefribourg",".jpg","1","musiquesdefribourg","","1","1","0000-00-00","0000-00-00"),
("150","0","uploads/couvertures","musiquesdefribourg1968",".jpg","1","musiquesdefribourg1968","","1","1","0000-00-00","0000-00-00"),
("151","0","uploads/couvertures","novellino2004",".jpg","1","novellino2004","","1","1","0000-00-00","0000-00-00"),
("152","0","uploads/couvertures","nrf1955",".jpg","1","nrf1955","","1","1","0000-00-00","0000-00-00"),
("153","0","uploads/couvertures","nrf1993",".jpg","1","nrf1993","","1","1","0000-00-00","0000-00-00"),
("154","0","uploads/couvertures","oc1",".jpg","1","oc1","","1","1","0000-00-00","0000-00-00"),
("155","0","uploads/couvertures","oc2",".jpg","1","oc2","","1","1","0000-00-00","0000-00-00"),
("156","0","uploads/couvertures","pendeloquealpestre",".jpg","1","pendeloquealpestre","","1","1","0000-00-00","0000-00-00"),
("157","0","uploads/couvertures","pendeloques",".jpg","1","pendeloques","","1","1","0000-00-00","0000-00-00"),
("158","0","uploads/couvertures","persil",".jpg","1","persil","","1","1","0000-00-00","0000-00-00"),
("159","0","uploads/couvertures","petitesfeuilles",".jpg","1","petitesfeuilles","","1","1","0000-00-00","0000-00-00"),
("160","0","uploads/couvertures","petrarque",".jpg","1","petrarque","","1","1","0000-00-00","0000-00-00"),
("161","0","uploads/couvertures","petrarque2003",".jpg","1","petrarque2003","","1","1","0000-00-00","0000-00-00"),
("162","0","uploads/couvertures","portraits1994",".jpg","1","portraits1994","","1","1","0000-00-00","0000-00-00"),
("163","0","uploads/couvertures","proposanimaliers",".jpg","1","proposanimaliers","","1","1","0000-00-00","0000-00-00"),
("164","0","uploads/couvertures","pycniquesetleptosomes",".jpg","1","pycniquesetleptosomes","","1","1","0000-00-00","0000-00-00"),
("165","0","uploads/couvertures","redachiensetchat",".jpg","1","redachiensetchat","","1","1","0000-00-00","0000-00-00"),
("166","0","uploads/couvertures","seizejuillet",".jpg","1","seizejuillet","","1","1","0000-00-00","0000-00-00"),
("167","0","uploads/couvertures","stalactites",".jpg","1","stalactites","","1","1","0000-00-00","0000-00-00"),
("168","0","uploads/couvertures","strawinski",".jpg","1","strawinski","","1","1","0000-00-00","0000-00-00"),
("169","0","uploads/couvertures","viesparalleles",".jpg","1","viesparalleles","","1","1","0000-00-00","0000-00-00"),
("170","0","uploads/couvertures","walzerameantique",".jpg","1","walzerameantique","","1","1","0000-00-00","0000-00-00"),
("171","0","uploads/couvertures","walzerprisons",".jpg","1","walzerprisons","","1","1","0000-00-00","0000-00-00"),
("172","0","uploads/couvertures","walzerqoc1",".jpg","1","walzerqoc1","","1","1","0000-00-00","0000-00-00"),
("173","0","uploads/couvertures","walzerqoc2",".jpg","1","walzerqoc2","","1","1","0000-00-00","0000-00-00"),
("174","0","uploads/couvertures","walzerqoc3",".jpg","1","walzerqoc3","","1","1","0000-00-00","0000-00-00"),
("175","0","uploads/couvertures","generique",".jpg","1","generique","","1","1","0000-00-00","0000-00-00"),
("176","0","uploads/illustrations","modigliani",".jpg","2","modigliani","","1","1","2012-03-23","0000-00-00"),
("177","0","uploads/illustrations","histoire_de_la_litterature_en_suisse_romande",".jpg","2","histoire-de-la-litterature-en-suisse-romande","","1","1","2012-03-23","0000-00-00"),
("178","0","uploads/couvertures","campdecesar",".jpg","2","campdecesar","","1","1","2012-05-03","0000-00-00"),
("179","0","uploads/couvertures","tn_campdecesar",".jpg","2","tn_campdecesar","","1","1","2012-05-03","0000-00-00"),
("180","0","uploads/couvertures","beydepergame",".jpg","2","beydepergame","","1","1","2012-05-03","0000-00-00"),
("181","0","uploads/couvertures","tn_beydepergame",".jpg","2","tn_beydepergame","","1","1","2012-05-03","0000-00-00"),
("182","0","uploads/couvertures","voilelatine",".jpg","2","voilelatine","","1","1","2012-05-03","0000-00-00"),
("183","0","uploads/couvertures","tn_voilelatine",".jpg","2","tn_voilelatine","","1","1","2012-05-03","0000-00-00"),
("184","0","uploads/couvertures","limbes",".jpg","2","limbes","","1","1","2012-05-20","0000-00-00"),
("185","0","uploads/couvertures","tn_limbes",".jpg","2","tn_limbes","","1","1","2012-05-20","0000-00-00"),
("186","0","uploads/couvertures","voix_clementine",".jpg","2","voix_clementine","","1","1","2012-05-20","0000-00-00"),
("187","0","uploads/couvertures","tn_voix_clementine",".jpg","2","tn_voix_clementine","","1","1","2012-05-20","0000-00-00"),
("188","0","uploads/couvertures","penates",".jpg","2","penates","","1","1","2012-05-20","0000-00-00"),
("189","0","uploads/couvertures","tn_penates",".jpg","2","tn_penates","","1","1","2012-05-20","0000-00-00");




DROP TABLE `user`;CREATE TABLE `user` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO user VALUES
("1","al-eck","aleck","nowitzki"),
("2","","","");




DROP TABLE `writing`;CREATE TABLE `writing` (
  `writing_id` int(255) NOT NULL AUTO_INCREMENT,
  `template_id` int(255) NOT NULL,
  `language_id` smallint(3) NOT NULL,
  `writing_title` varchar(55) NOT NULL,
  `writing_description` varchar(55) NOT NULL,
  `writing_content` text NOT NULL,
  `upload_file_id` int(55) NOT NULL,
  `dir_name` varchar(255) NOT NULL,
  `media_url` varchar(255) NOT NULL,
  `writing_public_date` varchar(55) NOT NULL,
  `admin_id` tinyint(3) NOT NULL,
  `writing_status` tinyint(1) NOT NULL,
  `writing_rank` tinyint(3) NOT NULL,
  `writing_publication_start_date` date NOT NULL,
  `writing_publication_end_date` date NOT NULL,
  `writing_creation_date` date NOT NULL,
  `writing_modification_date` date NOT NULL,
  PRIMARY KEY (`writing_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


INSERT INTO writing VALUES
("33","85","2","Presse et médias","Page dédiée à la presse et aux médias","<h1>Les nouvelles Œuvres complètes dans la presse</h1>
\n
\n<p><strong>Avec Cingria, une promenade exquise</strong>, Bruno de Cessole, <em>Valeurs actuelles</em>, 13 juillet 2011<br>
\nhttp://www.valeursactuelles.com/divers/avec-cingria-une-promenade-exquise-29583 </p>
\n
\n<p><strong>Cingria et la splendeur du monde</strong>, Patrick Kéchichian, <em>La Croix</em>, 1 février 2012 <br>
\nhttp://www.la-croix.com/Culture/Livres-Idees/Livres/Cingria-et-la-splendeur-du-monde-_NG_-2012-02-01-764387 </p>
\n
\n<p><strong>Cingria, un exercice humain et savant de la vie </strong>, Pascal Décaillet, <em>Les Blogs</em>, 17 février 2012 <br>
\nhttp://pascaldecaillet.blog.tdg.ch/archive/2012/02/17/cingria-un-exercice-humain-et-savant-de-la-vie.html </p>
\n
\n<p><strong>Un jouisseur raffiné</strong>, Thierry Clermont, <em>Le Figaro</em>, 1<sup>er</sup> mars 2012 <br>
\nhttp://www.lagedhomme.com/site/medias/CINGRIA_FIGARO.pdf </p>
\n
\n<p><strong>Cingria, maître du caprice</strong>, Anne Pitteloud, <em>Le Courrier</em>, 4 mars 2012 <br>
\nhttp://www.lecourrier.ch/cingria_maitre_du_caprice </p>
\n
\n<p><strong>Charles-Albert Cingria capturait l\'instant pour le déplier jusqu\'à l\'illumination</strong>, Isabelle Rüf, <em>Le Temps</em>, 7 avril 2012 <br>
\nhttp://www.letemps.ch/Page/Uuid/0a860a76-7f5f-11e1-9230-e15706ef0baa/Charles-Albert_Cingria_capturait_linstant_pour_le_d%C3%A9plier_jusqu%C3%A0_lillumination </p>
\n
\n<p><strong>Haute-lice de Cingria</strong>, Jean-Louis Kuffer, <em>Passion de lire</em>, 18 juillet 2013 <br>
\nhttp://passiondelire.blog.24heures.ch/archive/2013/07/18/haute-lice-de-cingria-853356.html </p>
\n
\n<p><strong>Cingria, le flâneur impénitent</strong>, Alain Favarger, <em>La Liberté</em>, 28 octobre 2014 <br>
\nPDF 
\n
\n<p><strong>Cingria sur le blog de Jean-Louis Kuffer </strong> <br>
\nhttp://carnetsdejlk.hautetfort.com/charles-albert_cingria/ </p>
\n","0","0","","","19","1","1","2018-01-28","2025-01-28","2015-01-28","2018-10-07"),
("13","78","2","Chapeau","","Lancé en marge de la parution des nouvelles <em>Œuvres complètes</em> critiques de Charles-Albert Cingria, ce site se veut un lieu d’informations et de références, ainsi qu’une façon de continuer à faire vivre et rayonner l’œuvre originale et encore méconnue de cet auteur qui échappe aux étiquettes et aux catégories, et réjouit ceux qui le découvrent. Bonne visite !","0","0","","","19","1","1","2018-02-21","2022-02-21","2012-02-21","2018-10-07"),
("14","78","2","Corps","","<div class=\"fig\">
\n<img src=\"uploads/illustrations/roger_mantondon.jpg\" alt=\"Photo de Cingria par Roger Montandon\"/>
\n<span class=\"caption\">Photo Roger Montandon, CRLR</span>
\n</div>
\n<br>
\n<p>
\n<h2>L’humour du monde</h2>
\n</p>
\n<p>
\nL’on a tout dit, ou presque, pour tenter de cerner Cingria, de saisir son œuvre en suivant les traces laissées par ce personnage démultiplié, vélocipédant sans gêne sur la corde raide du langage qu’il tend entre le sublime universel et la splendeur des choses communes. L’homme si présent dans son verbe, que décrire les errances de l’un semble souvent permettre d’appréhender les circonvolutions de l’autre. Tout aussi insaisissables pourtant, ils se confondent en une même figure protéiforme, au point de désarçonner jusqu’aux amis de la première heure.
\n</p>
\n<p>
\nMax Jacob, que Cingria rencontre régulièrement à Saint-Benoît dès 1922 et qu’il tenait pour « le plus éblouissant esprit de notre époque », répondra à son admiration par une amitié sincère, marquée occasionnellement par quelques réserves face au lunatisme artistique de ce gyrovague érudit. Ainsi écrit-il à Cocteau, le 1<sup>er</sup> mai 1925 : « On ne sait de quelle caste, de quel pays il est ! il n’est même pas homme de lettres ni poète ni musicien bien qu’il ait de grands talents dans tout cela […]. » Mondain désabusé ou clochard subversif, les contours changeants de cet être ambivalent déconcertent : « Quant à Cingria quand il sera devenu intelligible on le comprendra, <em>c’est-à-dire jamais</em> », poursuit Jacob.
\n</p>
\n<p>
\nMais faut-il réellement <em>comprendre</em> un écrivain affirmant avec autant d’assurance son droit à la contradiction, à la fantaisie ? Il faut le lire, le suivre dans ses divagations incongrues et superbes, le perdre du regard parfois, engoncé qu’il est dans la truculence d’une érudition où il se perd lui-même, le retrouver ensuite, rêvant avec humour à sa reconversion prochaine en scaphandrier d’eau douce.
\n</p>
\n
\n<p>
\nEn ce sens, la publication aux Editions de L’Age d’Homme de l’édition critique des <em>Œuvres complètes</em> de l’écrivain est une heureuse initiative, achevant de donner toute sa légitimité à cette plume singulière, qui se voit par ailleurs dédier ce site internet. Créée à l’initiative de l’Association des amis de Ch.-A. Cingria, cette plateforme de référence et de diffusion permet de faire connaître l’univers de l’écrivain, son acuité drôle et nécessaire à l’heure où la « magistrale intercommunication des mondes » égalise les esprits et uniformise les visions.
\n</p>
\n<p>
\nQu’on ne néglige pas de se fendre d’un rire éclatant lorsque les bibliothèques s’écroulent avec fracas, lorsque les vélos tordent leurs boyaux sur un bitume étrangement mou ou lorsque l’auteur s’essouffle à poursuivre dans les rues de Venise un Stravinsky fuyant, rapide et souple, pour échapper à ses contradicteurs, avant de se réfugier derrière un verre de Cynar !
\n</p>
\n<p>
\nD’une drôlerie si variée – ironique ou scabreuse – qu’elle fait oublier son omniprésence dans ces textes, écrits comme un coup de pied dans la fourmilière des bonnes intentions dont est faite la « littératuraille » de son temps. Là ou d’autres se recroquevillent sur un paysage intérieur mis en scène afin d’en exalter – avec une pudeur calculée – la sagesse austère et heureusement bien-pensante, Cingria donne à lire l’humour d’un monde d’imprévus, où le commun et le quotidien disputent au sublime leur droit à l’existence, où « il faut faire des gestes, les gestes convenables, beaucoup de gestes convenables, rire, sourire, parler, bien parler et beaucoup, dire des tas de choses qui intéressent le monde, bien écouter, bien répondre, parfois éclater de rire (pas continuellement) ». Cingria sur la toile, c’est aussi prolonger l’écho de ce rire sonore, qui éclabousse encore l’immarcescible beauté de l’existence.
\n</p>
\n<p>
\n<br/>
\n<strong>Thierry Raboud</strong><br/>
\n<em>vice-président de l\'Association</em>
\n</p>","0","0","","","19","1","1","2018-02-21","2022-02-21","2012-02-21","2018-10-07"),
("27","82","2","Notice biographique","","<p>Ecrivain inclassable et « cas littéraire », Charles-Albert Cingria (1883-1954), né et mort à Genève, a vécu et publié en Suisse et en France. Ses textes naviguent entre les genres : récits poétiques, essais historiques, traités de musicologie, propos variés, chroniques d’humeur…</p><p><br/>La première entreprise de regroupement de sa production (17 volumes, dont 5 de correspondance) a été éditée entre 1976 et 1981 à Lausanne, aux Editions de L’Age d’Homme ; elle est à présent épuisée. Ses premières Œuvres complètes critiques, en cours de parution chez le même éditeur, apportent aujourd’hui, et pour la première fois, un éclairage bienvenu sur l’ensemble de son œuvre. 
\n</p>","0","0","","","19","1","1","2012-02-21","2022-02-21","2012-02-21","2012-03-02"),
("15","80","2","« Graffiti », 1941","« Graffiti », 1941","« C’est dans cet état qu’il faut être. Divinement neuf et calme, comme une pêche en juillet dans la nuit d’un verger qu’aucun vent ne remue. »","0","0","","","19","1","1","2012-02-21","2022-02-21","2012-02-21","0000-00-00"),
("16","80","2","« Brumaire savoisien », 1941","« Brumaire savoisien », 1941","« Le paysage existe déjà en tant qu’aventure ou intrigue végétale d’un intérêt fou […] »
\n","0","0","","","19","1","2","2012-02-21","2022-02-21","2012-02-21","0000-00-00"),
("17","80","2","Petit labyrinthe harmonique, 1929","<em>Petit labyrinthe harmonique</em>, 1929","« Moi qui ai un lieu, une vieillesse d’autres, des térébinthes, d’immenses biens, des flottilles de lourd cèdre où passent de fantomatiques fastueux poissons, au fond de la mer, mais qui suis ailleurs, seul avec ce plectre à faire chuter les étoiles ; ne voulant pas, ne pouvant plus, me laissant vivre : de rien : de bonjours, de bonsoirs, de verres et de réciprocités de verres à droite et à gauche, de bouts de pain trouvés chez moi sous des caisses ; m’avilissant, me faisant aimable alors que je suis tueur, me faisant pittoresque alors que je suis roi. »","0","0","","","19","1","3","2012-02-21","2022-02-21","2012-02-21","0000-00-00"),
("18","80","2","« [L’Ame antique] », vers 1932","« [L’Ame antique] », vers 1932","« Nous avions, tous, à la maison, l’âme antique. »","0","0","","","19","1","4","2012-02-21","2022-02-21","2012-02-21","0000-00-00"),
("19","80","2","« [Je suis peut-être différent…] », sans date","« [Je suis peut-être différent…] », sans date","« Je ne puis comprendre par exemple que l’on ne se rende pas compte que chaque minute est une concession de pulsation divine dont nous avons le bonheur de pouvoir nous servir, et que c’est donc non un état ordinaire, non un état naturel, mais un état miraculeux dont nous bénéficions ou plutôt dont nous ne bénéficions pas assez. Une chance sur cent milliards de probabilités ou le néant absolu. »","0","0","","","19","1","5","2012-02-21","2022-02-21","2012-02-21","0000-00-00"),
("20","80","2","Le Seize Juillet, 1929","<em>Le Seize Juillet</em>, 1929","« Entre le néant et le surnaturel, ce qu’il y a de stupéfiant est le réel. Entre bouger le petit doigt et faire tomber une cheminée d’usine il n’y a pas une différence si grande. »","0","0","","","19","1","6","2012-02-21","2022-02-21","2012-02-21","0000-00-00"),
("21","80","2","Petit labyrinthe harmonique, 1929","<em>Petit labyrinthe harmonique</em>, 1929","« Je suis un cristal qui ne respire pas : qui existe […]. Par le bas, je reste animal, mais je suis une boule. J’ai frais aux cuisses. Je n’ai plus besoin de voir. c’est adorable. J’ai aussi un peu peur. C’est adorable. Je vais excessivement vite. […] Je suis heureux de ce siècle, heureux de ce sable, heureux de ma selle Brooks aux exquis craquements. »","0","0","","","19","1","7","2012-02-21","2022-02-21","2012-02-21","0000-00-00"),
("22","80","2","« La Fourmi rouge », 1931","« La Fourmi rouge », 1931","« Rien. Je suis absolument libre, un peu seul. J’ai faim. Je suis un être  comme les autres. J’ai besoin de m’asseoir et de m’étendre. Je suis fou de joie. »","0","0","","","19","1","8","2012-02-21","2022-02-21","2012-02-21","0000-00-00"),
("23","80","2","« Epissea », 1939","« <em>Epissea</em> », 1939","« Faire quoi alors ? Des poèmes ? Je n’y tiens pas : je suis persuadé qu’ils ne vaudraient rien – rien en ce moment – : le dépit de ne pouvoir m’exprimer sur un argument qui est le seul où je me sens une naturelle maîtrise abolit en moi toute émotion, toute verve. Des travaux alors, de ces travaux de cave, historiques ou scientifiques ou palimpsestiques qui saturent l’être de délire-délice faisant tout oublier ?  certainement, mais il faut vivre, et ces travaux, aussi opportuns, urgents qu’ils soient, n’intéressent ni les éditeurs, ni le public, ni personne. Il vaut mieux n’y pas penser. »","0","0","","","19","1","9","2012-02-21","2022-02-21","2012-02-21","0000-00-00"),
("25","80","2","« Métaphysique », vers 1950","« Métaphysique », vers 1950","« Il me semble que je nais aujourd’hui à l’instant même. Je sais bien que je suis destiné à périr mais il y a cette minute quand même maintenant où je suis éternel et illimité si je prends la peine d’en prendre conscience. Et rien ne répond à cet instant-là que l’expérience des autres sera la mienne. Je suis peut-être d’une qualité tout à fait différente. Il se peut que l’univers sombre avec moi comme il n’existait pas avant que je fusse né. »","0","0","","","19","1","11","2012-02-21","2022-02-21","2012-02-21","0000-00-00"),
("26","80","2","Appendices à Bois sec Bois vert, vers 1948","Appendices à <em>Bois sec Bois vert</em>, vers 1948","« Ce que je fais, c’est des petits livres sur le plein air et les ferrailles et un peu de pensée – dialectique pure –, et des voyages dans l’histoire quand cette passion me prend et me reprend. Ma poésie est bien furtive, aussi j’arrête dès que le flot s’arrête. Et s’il continue, j’arrête néanmoins. » ","0","0","","","19","1","12","2012-02-21","2022-02-21","2012-02-21","0000-00-00"),
("28","77","2","Chapeau","Chapeau","L’Association des Amis de Charles-Albert Cingria a été fondée à Romont (Fribourg) le 11 mai 1963. Elle a statutairement pour but de maintenir vivantes la mémoire et l’œuvre de Charles-Albert Cingria, de favoriser la diffusion de ses textes et de travailler à la constitution d’un fonds documentaire mis à la disposition des chercheurs.","0","0","","","19","1","1","2012-02-23","2022-02-23","2012-02-23","0000-00-00"),
("29","77","2","Corps","Corps","<p>Son premier comité était constitué du neveu de l’auteur Albert Cingria (président), de sa nièce Isabelle Melley (secrétaire) et du professeur Pierre-Olivier Walzer (vice-président). Ce noyau d’origine comprenait aussi Jacques Chessex, Georges Anex, Jean-Luc Seylaz, Henry-Louis Mermod, Aloyse Margot et Gisèle Peyron, laquelle s’était déjà attelée à la recherche  et la transcription d’une grande partie de la production de Cingria, éparpillée dans une centaine de revues et journaux.
\n</p>
\n<p>
\nEntre 1967 et 1969, les dix premiers volumes des <a href=\"premiere-edition-des-oeuvres-completes\" class=\"inline_link\"><span>Œuvres complètes</span></a> paraissent à l’enseigne des <a href=\"https://www.lagedhomme.com/\" onclick=\"window.open(this.href, \'_blank\'); return false;\" class=\"inline_link\"><span>Editions de l\'Age d\'Homme</span></a>, fondées l’année précédente par Vladimir Dimitrijevic. Isabelle Melley et Pierre-Olivier Walzer, devenu président de l’Association en 1968 (poste qu’il occupera plus de vingt ans), prennent une part majeure à cette publication. En 1981, une partie de la correspondance de Cingria est réunie en cinq volumes, enrichis de deux derniers volumes, l’un d’inédits et l’autre consacré à la bibliographie et à l’index général. Au total, ce sont dix-sept volumes sous reliure ocre doré, qui constituent les premières <em>Œuvres complètes</em> de l’auteur.
\n</p>
\n<p>
\nAu printemps 1983, l’Association organise l’exposition du centenaire de la naissance de Cingria, qui se tient à la Bibliothèque nationale suisse et s’exporte au printemps suivant à la Bibliothèque nationale de Paris. Les catalogues illustrés publiés à cette occasion témoignent de la richesse de la documentation réunie alors – où se signalent en particulier les portraits classiques d’Alexandre, le frère de l’écrivain, de René Auberjonois, de Théodore Strawinsky, de Modigliani et de Jean Dubuffet.
\n</p>
\n<p>
\nAvec la progressive disparition des témoins directs, la mise à disposition d’une bonne partie du Fonds Cingria à Lausanne au Centre de recherche sur les lettres romandes (CRLR) et la direction, dès 1991, de sa nouvelle présidente Maryke de Courten, l’Association des Amis de Charles-Albert Cingria prend un virage universitaire, concrétisé par le premier colloque international consacré à Cingria, à l’Université de Lausanne, les 16 et 17 octobre 1997. Une exposition au Musée historique de Lausanne, du 16 octobre 1997 au 4 janvier 1998, accompagne la manifestation. Les actes du colloque sont publiés à Paris trois ans plus tard. L’Association organise encore d’autres manifestations : à la Société de lecture de Genève le 26 novembre 2004, une soirée consacrée à Charles-Albert Cingria intitulée « Quelque bonne secousse salubre » propose des conférences de Jacques Réda et Michel Butor, une présentation de deux manuscrits par Charles Méla et des mises en voix d’extraits de l’auteur par Caroline Gasser.
\n</p>
\n<p>
\nLe projet de l’édition critique des <em>Œuvres complètes</em> est lancé le 17 juin 2000 lors de la dix-huitième assemblée générale de l’Association. Il se concrétise dès janvier 2012, avec la parution, aux Editions de L’Age d’Homme, des deux premiers tomes de <em>Récits</em>, puis en juin 2013 et juin 2014, des deux volumes de <em>Propos</em>. Les volumes d’<em>Essais</em> suivent en 2016 et 2018, tandis qu\'un dernier volume de Tables et index doit encore voir le jour.</p>","0","0","","","19","0","1","2018-01-01","2018-01-01","0000-00-00","2018-10-07"),
("30","72","2","Chapeau","Chapeau","Conduite par une équipe internationale de chercheurs dont les travaux ont été soutenus par le Fonds National Suisse de la Recherche Scientifique et par des institutions privées, la nouvelle édition des <em>Œuvres complètes</em> de Charles-Albert Cingria a été réalisée sous la direction d’Alain Corbellari, Maryke de Courten, Pierre-Marie Joris, Marie-Thérèse Lathion, Daniel Maggetti et Thierry Raboud dans le cadre du Centre de recherches sur les lettres romandes de l’Université de Lausanne, où est conservée la plus grande partie des manuscrits de l’écrivain. Elle est éditée par L’Age d’Homme dans la collection « Caryatides ».","0","0","","","19","1","1","2018-02-24","2022-02-24","2012-02-24","2018-10-07"),
("31","72","2","Corps","Corps","<p>Les caractéristiques principales des <em>OC</em> sont les suivantes :
\n<ul>
\n<li><p>Pour la première fois, l\'ensemble de l\'œuvre de Cingria est pris en compte ; à la totalité des textes que l\'auteur a publiés de son vivant s\'ajoutent un grand nombre d\'inédits restés jusque-là à l\'état de manuscrits.</p>
\n</li>
\n<li>
\n<p>L\'édition adopte des principes scientifiques aussi bien dans l\'établissement des textes que dans leur accompagnement ; des notes explicatives, des relevés de variantes, des notes sur le texte et des commentaires critiques proposent des éclairages génétiques, des éclaircissements thématiques, des précisions intertextuelles, des pistes interprétatives.</p>
\n</li>
\n<li>
\n<p>Soucieuse de refléter les différentes pulsions et postures d\'écriture de Cingria, qui aboutissent à des solutions stylistiques et génériques variées, la nouvelle édition ne se contente pas de suivre  la chronologie de la production de l\'écrivain, mais regroupe ses récits selon trois axes qui justifient le partage en trois parties : les « Récits » (dans les deux premiers volumes), où l\'on observe comment Cingria est tenté par la fiction ; les « Essais » (volume 3 et 4), réunissent les contributions historiques et musicologiques érudites portant essentiellement sur le Moyen Age ; les « Propos » (volumes 5 et 6) enfin, lieu d\'une écriture davantage en prise sur l\'actualité et souvent destinée à la presse périodique.</p></li>
\n<li>
\n<p>Dans chaque volume, un cahier iconographique reproduit, à l\'échelle de la collection, les illustrations des éditions originales.</p>
\n</li>
\n<li><p>Un système d\'index et de repères permet au lecteur de circuler d\'un volume à l\'autre, et de s\'orienter aisément dans une œuvre étendue et complexe.</p></li>
\n</ul>
\n</p>
\n<p>
\nPar sa rigueur, son exhaustivité, sa volonté d\'aider le lecteur dans sa découverte, son souci constant de lisibilité, cette nouvelle édition est une réalisation qui répond aux critères scientifiques que l\'on attend d\'une entreprise de cette nature, tout en restant accessible à un public non spécialisé. Elle est donc à même de mieux faire connaître un des plus grands écrivains du XX<sup>e</sup> siècle, dont elle permet de mesurer la qualité esthétique, la richesse des contenus et des sujets, ainsi que l\'ampleur de l\'écriture : elle valorise par là en le prenant en charge de manière exemplaire, un moment clé du patrimoine culturel suisse.</p>","0","0","","","19","1","1","2018-02-24","2022-02-24","2012-02-24","2018-10-07"),
("32","83","2","Cingria vu par Max Jacob","Cingria vu par Max Jacob","<p>En mai 1926, Max Jacob livre, dans une lettre à Jean Paulhan, un portrait haut en couleur de Charles-Albert Cingria…<br/><br/></p>
\n<p>« Cingria est un petit gros musicien au vaste front chauve qui n’avoue pas quarante ans. Il habite un coin pauvre dans une maison de la rue Bonaparte 59. Il improvise avec une verve qui lui contracte les yeux (bleus les yeux) dans une figure grosse et pointue en bas. Il est sale d’aspect bien que très lavé. Il ne sait pas s’il est turc ou suisse mais il est de très grande famille. De temps en temps il reçoit de l’argent d’une propriété de famille en Turquie ; il le mange et redevient mendiant ; alors il joue de l’orgue dans des églises. Limbour dit qu’il marche comme un gros crabe. Le fait est que lorsqu’il veut avoir l’air distingué il a l’air d’un curé « oui, ma sœur… » Qui l’a vu en colère n’est pas de cet avis. Or il est toujours en colère… contre le surréalisme, le parisianisme, contre la France, les Français, contre la manière de rythmer le chant grégorien, contre les prêtres, les païens, les chrétiens. Il tonne, il étonne puis redevient un petit un humble petit gars. Cingria est « <em>aimé</em> » de gens très bien : Paul Claudel par exemple et, je crois bien, Maritain ; des peintres de talent, des gens même de Montparnasse très avancés. On dit : « C’est un type ! » et personne n’a eu l’idée de l’aider, bien que ce soit, à mon avis, un <em>très très grand poète</em> et d’une envergure que personne en somme n’a aujourd’hui. C’est un savant ! c’est un homme qui a un caractère, des idées et un véritable talent de musicien. Kahnweiler (galerie Simon. 29<sup>bis </sup>rue d’Astorg) sur les instances de quelques amis tout de même lui a commandé une centaine de pages pour un volume de sa collection. Après mille histoires compliquées, Cingria a écrit quelque chose de beau dont j’ai eu des extraits. Demande à Kahnweiler communication de l’ouvrage ou des épreuves, tu verras que cet homme est digne d’être lancé sinon comme littérateur du moins comme poète. Méfie-toi !!! il voudra te coller des dissertations sur la musique ou la langue grecque ou autre tutti quanti… or tu ne veux de lui que de la grande poésie.<br/><br/></p>
\n<p>N. B. Cingria après avoir réjoui par son piano une assistance, prend sa bicyclette à deux heures du matin : « Où allez-vous donc ? – Je vais à Sienne pour entendre la maîtrise de l’église Sainte Catherine » ou bien « Je vais en Espagne chercher l’héritage de mon oncle Ambrosio. »
\nN. B. Cingria ne fait rien quand on ne le force pas avec énergie à travailler. Si tu lui fais des avances d’argent, il les mangera et ne travaillera pas. Il faut lui dire : « Non ! apportez-moi la moitié de votre manuscrit et vous aurez la moitié de votre salaire ! » ou le quart et ainsi de suite. C’est un monstre. D’ailleurs compagnon adorable, plein d’histoires énormes, éclatant de rire comme un gros bébé Cadum qu’il est ou prêt à pleurer. Garçon tendre et assez méchant en paroles, en paroles seulement, je le crois profondément honnête, délicat et noble et pourtant pas bête quand il s’agit d’affaires.<br/><br/></p>
\n <p>Demande-lui quelque chose et promets-lui de l’argent tout de suite. »<br/><br/><br/></p>
\n<p class=\"note\">
\n<em>Max Jacob, Jean Paulhan,</em> Correspondance 1915-1941<em>, texte établi et présenté par Anne Kimball, Paris, Méditerranée, 2006, pp. 114-115.</em>
\n</p>","0","0","","","19","1","1","2012-03-02","2022-03-02","2012-03-02","2012-03-02");




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;