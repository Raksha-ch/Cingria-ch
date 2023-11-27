-- phpMyAdmin SQL Dump
-- version 2.11.9.6
-- http://www.phpmyadmin.net
--
-- Serveur: localhost:3306
-- Généré le : Ven 02 Mars 2012 à 11:30
-- Version du serveur: 5.1.50
-- Version de PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `cingria`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(55) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `admin_surname` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `admin_email` varchar(55) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `admin_password` varchar(55) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `admin_group` tinyint(2) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_surname`, `admin_email`, `admin_password`, `admin_group`) VALUES
(19, 'Yannick', 'Saraillon', 'yansar', '19_juanito_76', 1);

-- --------------------------------------------------------

--
-- Structure de la table `bibliography`
--

CREATE TABLE IF NOT EXISTS `bibliography` (
  `bibliography_id` smallint(15) NOT NULL AUTO_INCREMENT,
  `bibliography_title` varchar(55) NOT NULL,
  PRIMARY KEY (`bibliography_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `bibliography`
--

INSERT INTO `bibliography` (`bibliography_id`, `bibliography_title`) VALUES
(2, 'Hirundo Maris'),
(7, 'Ensemble Daedalus'),
(8, 'Marquis de Saxe'),
(9, 'Schola'),
(10, 'Trio Nota Bene');

-- --------------------------------------------------------

--
-- Structure de la table `bibliography_item`
--

CREATE TABLE IF NOT EXISTS `bibliography_item` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Contenu de la table `bibliography_item`
--

INSERT INTO `bibliography_item` (`bibliography_item_id`, `bibliography_id`, `category_id`, `upload_file_id`, `bibliography_item_title`, `bibliography_item_content`, `bibliography_editor`, `bibliography_release`, `bibliography_item_rank`) VALUES
(1, 2, 0, 180, 'SAPPHO AND HER TIME', '<p><strong>Arianna Savall</strong><br/>\r\nsoprano et harpe<br/>\r\n<strong>Giovanni Cantarini</strong><br/>\r\nténor et cithare<br/>\r\n<strong>Massimo Cialfi</strong><br/>\r\nsalpinx, tympanon et kýmbala<br/>\r\n<strong>Conrad Steinmann</strong><br/>\r\naulos, kýmbala, seístron et direction</p>', 'Deutsche Harmonie Mundi, 88697 671742', 2010, 0),
(2, 2, 0, 181, 'KLANG DER STAUFFER', '<p><strong>Capella Antiqua Bambergensis<br/>Arianna Savall</strong><br/>soprano et harpe gothique<br/><strong>Petter Udland Johansen</strong><br/>ténor et hardingfele</p>', 'CAB Records, CAB 12', 2010, 0),
(3, 2, 0, 182, 'CHANTS DU SUD ET DU NORD', '<p>Sortie au printemps 2012<br/><br/>\r\n<strong>Arianna Savall</strong><br/>\r\nsoprano et harpe gothique<br/>\r\n<strong>Petter Udland Johansen</strong><br/>\r\nténor et hardingfele</p>', 'ECM New Series', 2012, 0),
(4, 2, 0, 184, 'PEIWOH', '<p><strong>Arianna Savall</strong><br/>\r\nsoprano, harpe triple, harpe gothique,<br/> harpe celtique et bol tibétain<br/>\r\n<strong>Petter Udland Johansen</strong><br/>\r\nténor et hardingfele<br/>\r\n<strong>Ferran Savall</strong><br/>\r\nténor et luth<br/>\r\n<strong>Javier Mas</strong><br/>\r\nguitare acoustique<br/>\r\n<strong>Mario Mas</strong><br/>\r\nguitare espagnole<br/>\r\n<strong>Bjørn Kjellemyr</strong><br/>\r\ncontrebasse<br/>\r\n<strong>Dimitri Psonis</strong><br/>\r\nsantur et lyre crête<br/>\r\n<strong>Pedro Estevan</strong><br/>\r\npercussions<br/>\r\n<strong>David Mayoral</strong><br/>\r\npercussions</p>', 'Alia Vox, AV 9869', 2009, 0),
(8, 2, 0, 185, 'BELLMANN', '<p><strong>Petter Udland Johansen</strong><br/>\r\nténor<br/><br/>\r\n<strong>Ensemble Pratum Musicum</strong><br/>\r\n<strong>Stefano Lai</strong><br/>\r\nflûte baroque<br/>\r\n<strong>Nicole Hitz</strong><br/>\r\nviole baroque<br/>\r\n<strong>Jakob Ruppel</strong><br/>\r\nluth<br/>\r\n<strong>Christian Niedling</strong><br/>\r\nvioloncelle baroque et gambe</p>', 'Swiss Pan, SP 51718', 2005, 0),
(9, 2, 0, 186, 'BELLA TERRA', '<p><strong>Arianna Savall</strong><br/>\r\nsoprano et harpe<br/>\r\n<strong>Dimitris Psonis</strong><br/>\r\nbendir, saz, bouzouki et oud<br/>\r\n<strong>Pedro Estevan</strong><br/>\r\nbendir, bâton de pluie et caxixi<br/>\r\n<strong>Julio Andrade</strong><br/>\r\ncontrebasse</p>', 'AliaVox, AV 9833', 2005, 0),
(10, 2, 0, 187, 'NUOVE MUSICHE', '<p><strong>Rolf Lislevand</strong><br/>\r\narchiluth, guitare baroque et théorbe<br/>\r\n<strong>Arianna Savall</strong><br/>\r\nsoprano et harpe triple<br/>\r\n<strong>Pedro Estevan</strong><br/>\r\npercussions<br/>\r\n<strong>Bjørn Kjellemyr</strong><br/>\r\ncolachon et contrebasse<br/>\r\n<strong>Guido Morini</strong><br/>\r\norgue, clavecin<br/>\r\n<strong>Marco Ambrosini</strong><br/>\r\nnyckelharpa <br/>\r\n<strong>Thor-Harald Johnsen</strong><br/>\r\nchitarra battente </p>', 'ECM New Series, ECM 1922', 2004, 0),
(11, 2, 0, 188, 'JOYSSANCE VOUS DONNERAY', '<p><strong>Arianna Savall</strong><br/>\r\nsoprano et harpe<br/>\r\n<strong>Thomas Kügler, </strong><br/>\r\nflûte et direction<br/>\r\n<br/>\r\n<strong>Il Desiderio</strong><br/>\r\n<strong>Hans-Jakob Bolllinger,</strong><br/>\r\ncornet<br/>\r\n<strong>Agathe Gautschi</strong><br/>\r\ncornet<br/>\r\n<strong>Markus Bertsch</strong><br/>\r\nsacqueboute<br/>\r\n<strong>Susann Landert</strong><br/>\r\ndulciane<br/>\r\n<strong>Emanuele Forni</strong><br/>\r\nthéorbe<br/>\r\n<strong>Daniel Rüegg</strong><br/>\r\norgue</p>', 'Aeolus Music, AE-10066', 2003, 0),
(12, 7, 0, 189, 'MUSA LATINA', '<p>Coproduction Festival du Haut Jura<br/>\r\nPrix Classic Voice, Muse du Mois, 5 Diapason<br/></p>', 'Alpha 144', 2009, 0),
(13, 7, 0, 190, 'ROLAND DE LASSUS: ORACULA', '<p>Coproduction Festival de la Semaine Sainte de Perpignan<br/>\r\nChoc de la Musique - Choc de la Musique de l''Année 2006<br/>\r\nCoup de Coeur de l''Académie Charles Cros - 5 Diapason</p>', 'Alpha, 095', 2006, 0),
(14, 7, 0, 191, 'SATURN AND POLYPHONY', '<p>Coproduction Festival de Fontevraud, Radio 3 Belge,<br/>\r\nCentre de Musique Ancienne de Tours<br/>\r\nPrix Goldberg - Prix CD Compact Espagne - 5 Diapason</p>', 'Accent, 98130 D', 1999, 0),
(15, 7, 0, 192, 'THE ANATOMY OF MELANCHOLY', '<p>Coproduction Festival de Fontevraud<br/>\r\nffff Telerama - Prix CD Compact Espagne</p>', 'Accent, 98128 D', 1998, 0),
(16, 7, 0, 193, 'LES DEUX AMES DE SALOMON', '<p>Coproduction Radio 3 Belge et Festival des Flandres 1996<br/>\r\nDisque de l''année  1998, Le Monde - 5 Diapason</p>', 'Accent, 6119 D', 1996, 0),
(17, 7, 0, 194, 'LA FAVOLA DI ORLANDO', '<p><i>Il primo, il secondo ed il terzo libro del Capriccio di Jachet Berchem</i><br/>\r\nCoproduction Radio Suisse Romande - Espace 2 et RTB 3 Belge</p>', 'Accent, 95112 D', 1995, 0),
(18, 7, 0, 195, 'CANZONI VILLANESCHE ALLA NAPOLITANA', '<p>Coproduction Festival de Beaune<br/>\r\n10 de Répertoire - 5 Diapason</p>', 'Accent, 9289 D', 1994, 0),
(19, 7, 0, 196, 'O VERGIN SANTA NON M''ABBANDONARE', '<p>5 Diapason</p>', 'Accent, 9289 D', 1992, 0),
(20, 7, 0, 197, 'EL CANCIONERO DE LA CATEDRAL DE SEGOVIA', '<p>Coproduction Radio 3 Belge et Festival Antwerpen 1993<br/>\r\nPrix Goldberg</p>', 'Accent, 9176 D', 1991, 0),
(21, 7, 0, 198, 'IL CANTAR MODERNO', '<p>Diapason d''Or - Coup de Coeur</p>', 'Accent, 9068 D', 1990, 0),
(22, 7, 0, 199, 'JOHANNES PRIORIS', '<p>Coproduction Festival de la Semaine Sainte de Perpignan<br/>\r\nPrix CD Compact Espagne - ffff Telerama - 5 Diapason</p>', 'Accent, 23153', 1990, 0),
(23, 7, 0, 200, 'DELIZIE NAPOLETANE OVVERO IN LODE DELLA VILLANELLA', '<p>Coproduction Festival Estivoce de Pigna<br/>\r\nPrix CD Compact Espagne - 5 Diapason</p>', 'Accent, 23159', 1990, 0),
(24, 7, 0, 202, 'RESONANZEN ''99', '<p>Compilation</p>', 'ORF Production', 1999, 0),
(25, 7, 0, 203, 'MILLENNIUM OF MUSIC VOL. 3', '<p>Millenium of Music Production</p>', 'Polystar ', 2002, 0),
(26, 7, 0, 204, 'FESTIVOCE FLORILEGIUM', '<p>Compilation</p>', '''a Casa - Pigna', 2008, 0),
(27, 8, 0, 208, 'VARIATIONS GOLDBERG, BWV 988', '<table>\r\n<tr>\r\n<td>J.S. Bach</td>\r\n<td><i>                      Airs & 30 Variations</i></td>\r\n</tr>\r\n</table>\r\n\r\n<p><br/>Miruna Coca-Cozma, lecture de poèmes</p>', 'ARTLAB 09524', 2009, 0),
(28, 8, 0, 206, 'BONUS TRACK', '<table>\r\n<tr>\r\n<td>G.F. Händel</td>\r\n<td><i>Arrivée de la Reine Saba</i></td>\r\n</tr>\r\n<tr>\r\n<td>A. Borodin</td>\r\n<td><i>Danses Polovtsiennes</i> Nr. 1 & 8</td>\r\n</tr>\r\n<tr>\r\n<td>Traditionnel haïtien  </td>\r\n<td><i>Berceuse Créole</i></td>\r\n</tr>\r\n<tr>\r\n<td>M. Nyman</td>\r\n<td><i>Songs for Tony Nr. 1</i></td>\r\n</tr>\r\n<tr>\r\n<td>R. Widoeft</td>\r\n<td><i>Valse Erica</i></td>\r\n</tr>\r\n<tr>\r\n<td>A. Piazzolla</td>\r\n<td>Extraits de <i>Maria de Buona Aires</i></td>\r\n</tr>\r\n<tr>\r\n<td></td>\r\n<td>avec Marielle Dubosson, chant</td>\r\n</tr>\r\n<tr>\r\n<td>B. Peigné</td>\r\n<td><i>Spirit of Highland</i></td>\r\n</tr>\r\n<tr>\r\n<td>D. Schostakovitch</td>\r\n<td><i>Valse Nr. 1</i></td>\r\n</tr>\r\n<tr>\r\n<td>Ph. Collet</td>\r\n<td><i>Poor Elise</i></td>\r\n</tr>\r\n<tr>\r\n<td>E. Gillioz</td>\r\n<td><i>Saxy Zap</i></td>\r\n</tr>\r\n<tr>\r\n<td>J. Matitia</td>\r\n<td><i>Chinese Rag</i></td>\r\n</tr>\r\n<tr>\r\n<td>L. Caillet</td>\r\n<td><i>Carnaval</i></td>\r\n</tr>\r\n</table>', 'ARTLAB 05501', 2005, 0),
(30, 8, 0, 207, 'MARQUIS DE SAXE', '<table>\r\n<tr>\r\n<td>J.B. Singelée                </td>\r\n<td><i>Premier Quatuor op. 53</i></td>\r\n</tr>\r\n<tr>\r\n<td>A. Kovach</td>\r\n<td><i>Dualité</i></td>\r\n</tr>\r\n<tr>\r\n<td>E. Satie</td>\r\n<td><i>Sports et divertissements</i></td>\r\n</tr>\r\n<tr>\r\n<td>P. Itturalde</td>\r\n<td><i>Suite hellénique</i></td>\r\n</tr>\r\n</table>', 'GPP, CORIOLAN', 1994, 0),
(29, 8, 0, 205, 'ANGE & DEMON', '<table>\r\n<tr>\r\n<td>A. Romero                                    </td>\r\n<td><i>Cuarteto latinoamericano</i></td> \r\n</tr>\r\n<tr>\r\n<td>E. Carter</td>\r\n<td><i>Canonic Suite</i></td> \r\n</tr>\r\n<tr>\r\n<td>I. Albeniz</td>\r\n<td><i>Trois Pièces</i></td> \r\n</tr>\r\n<tr>\r\n<td>P. Itturalde          </td>\r\n<td><i>Pequena Czarda</i></td> \r\n</tr>\r\n<tr>\r\n<td>A. Piazzolla</td>\r\n<td><i>Suite de l''Ange</i></td>\r\n</tr>\r\n<tr>\r\n<td>C. Macy</td>\r\n<td><i>Faust</i></td>\r\n</tr>\r\n</table>', 'ARTLAB 01988', 2001, 0),
(31, 9, 0, 210, 'ETOILES, ETOILES RESPLENDISSEZ!', '<p>Disque de chants de Noël enregistré à l''occasion <br/>\r\ndu 80e anniversaire de la Schola de Sion</p>', 'Schola de Sion', 2010, 0),
(32, 9, 0, 209, 'MUSIQUE SACREE A CAPPELLA', '<p>En 2007, la Schola de Sion a réalisé un enregistrement<br/>\r\n en studio réunissant tous ses coeurs.</p>', 'ARTLAB 07571', 2007, 0),
(33, 10, 0, 228, '100% RUSSIAN', '<p><strong>Lionel Monnet</strong><br/>\r\npiano<br/>\r\n<strong>Julien Zuffrey</strong><br/>\r\nviolon<br/>\r\n<strong>Xavier Pignat</strong><br/>\r\nvioloncelle</p>', 'Claves, CD 2720', 2007, 0),
(34, 10, 0, 225, 'SWISS PERSPECTIVE', '<p><strong>Lionel Monnet</strong><br/>\r\npiano<br/>\r\n<strong>Julien Zuffrey</strong><br/>\r\nviolon<br/>\r\n<strong>Xavier Pignat</strong><br/>\r\nvioloncelle</p>', 'Claves, CD 2912', 2009, 0),
(35, 10, 0, 226, 'JEAN DAETWYLER TRIOS', '<p>Concerto pour violon, violoncelle et piano<br/>\r\n<br/>\r\n<strong>Julien Zufferey</strong><br/>\r\nviolon<br/>\r\n<strong>Xavier Pignat</strong><br/>\r\nvioloncelle<br/>\r\n<strong>Lionel Monnet</strong><br/>\r\npiano<br>\r\n<strong>Caroline Delessert</strong><br/>\r\nflûte<br/>\r\n<strong>Sarah Chardonnens</strong><br/>\r\nclarinette<br/>\r\n<strong>Laurent Galliano</strong><br/>\r\nalto</p>', 'Gallo, CD 1216', 2006, 0);

-- --------------------------------------------------------

--
-- Structure de la table `calendar`
--

CREATE TABLE IF NOT EXISTS `calendar` (
  `calendar_id` int(255) NOT NULL AUTO_INCREMENT,
  `profile_id` int(255) NOT NULL,
  `artist_name` varchar(255) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `place` varchar(255) NOT NULL,
  `programme` text NOT NULL,
  `extra_info` text NOT NULL,
  PRIMARY KEY (`calendar_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `calendar`
--


-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` mediumint(3) NOT NULL AUTO_INCREMENT,
  `category_parent_id` mediumint(3) NOT NULL,
  `category_name` varchar(55) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`category_id`, `category_parent_id`, `category_name`) VALUES
(56, 0, 'editions_originales'),
(57, 0, 'en_bouquinerie'),
(58, 0, 'en_librairie'),
(59, 57, 'de_cingria'),
(60, 57, 'sur_cingria'),
(61, 58, 'de_cingria'),
(62, 58, 'sur_cingria');

-- --------------------------------------------------------

--
-- Structure de la table `concerts`
--

CREATE TABLE IF NOT EXISTS `concerts` (
  `concert_id` int(55) NOT NULL AUTO_INCREMENT,
  `profile_id` int(55) NOT NULL,
  `date` date NOT NULL,
  `place` varchar(255) NOT NULL,
  `additional_info` text NOT NULL,
  `concert_status` tinyint(2) NOT NULL,
  `concert_creation_date` date NOT NULL DEFAULT '0000-00-00',
  `concert_modification_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`concert_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=103 ;

--
-- Contenu de la table `concerts`
--

INSERT INTO `concerts` (`concert_id`, `profile_id`, `date`, `place`, `additional_info`, `concert_status`, `concert_creation_date`, `concert_modification_date`) VALUES
(4, 12, '2011-05-15', 'Lutry', '17h00 I Temple, Lutry \r\n<br/><i>Litaniae Lauretanae K 109</i> & <i>Missa brevis in F K 192</i><br/>\r\nWolfgang Amadeus Mozart<br/><strong>Choeur de la HEP de Lausanne</strong><br/>\r\nJulien Laloux, direction', 1, '2011-12-01', '2011-12-14'),
(5, 14, '2011-05-28', 'Sion', '20h00 I Basilique de Valère, Sion<br/>Les Riches Heures de Valère<br/><em>Cantique des cantiques</em><br/>Giovanni Pierluigi da Palestrina</br> Orlano de Lassus</br>Tomás Luis de Victoria...<br/><strong>Ensemble vocal Stile Antico</strong>', 1, '2011-12-01', '2011-12-14'),
(6, 12, '2011-05-29', 'Roppraz', '17h00 I Fondation Estrée, Roppaz<br/>Récital Russe avec exposition du peintre Sergeï Eloyan<br/>\r\nBrigitte Balleys, mezzo-soprano<br/>\r\nKarine Mkrtchyan, soprano<br/>\r\nBertrand Bochud, ténor<br/>\r\nAnthony Di Giantomasso, piano', 1, '2011-12-01', '2011-12-09'),
(7, 12, '2011-06-02', 'Yverdon-les-Bains', '17h00 I Temple, Yverdon-les-Bains<br/><em>Messe en mib D 950</em> - <em>Tantum ergo D 962</em> & <em>Intende Voci D 963</em><br/>Franz Schubert<br/>\r\n<strong>Ensemble vocal Horizons</strong><br/>\r\nMichel Cavin, direction', 1, '2011-12-01', '2011-12-14'),
(8, 12, '2011-06-05', 'Moudon', '17h00 I Temple, Moudon<br/>\r\n<em>Messe en mib D 950</em> - <em>Tantum ergo D 962</em> & <em>Intende Voci D 963</em><br/>Franz Schubert<br/>\r\n<strong>Ensemble vocal Horizons</strong><br/>\r\nMichel Cavin, direction', 1, '2011-12-01', '2011-12-14'),
(9, 12, '2011-06-10', 'Romont ', '20h00 I Romont<br/><strong>Choeur du Cycle d''Orientation de Romont</strong>', 1, '2011-12-01', '2011-12-14'),
(10, 12, '2011-06-11', 'Romont', '20h00 I Romont<br/><strong>\r\nChoeur du Cycle d''Orientation de Romont</strong>', 1, '2011-12-01', '2011-12-14'),
(11, 14, '2011-06-12', 'Sion', '17h00 I Basilique de Valère, Sion<br/>Les Riches Heures de Valère<br/><em>O Vergin Santa non m''abbandonare</em><br/><strong>Ensemble Daedalus</strong><br/>Roberto Festa, direction', 1, '2011-12-01', '2011-12-13'),
(12, 12, '2011-06-18', 'Genève', '20h00 I Victoria Hall, Genève<br/>\r\n<em>Messe en mib D 950</em> - <em>Tantum ergo D 962</em> & <em>Intende Voci D 963</em><br/>Franz Schubert<br/><strong>Ensemble vocal Horizons</strong><br/>Michel Cavin, direction', 1, '2011-12-01', '2011-12-14'),
(13, 19, '2011-06-19', 'Charrat ', 'Eglise paroissiale, Charrat<br/>\r\nMesse de clôture<br/>\r\n<strong>Schola de Sion</strong><br/>Marc Bochud, direction', 1, '2011-12-01', '2011-12-14'),
(14, 19, '2011-06-23', 'Sion', '10h00 I Cathédrale, Sion<br/>Messe de la Fête-Dieu<br/><strong>Petits Chanteurs, Grand Choeur de filles et Choeur d''hommes</strong><br/>Marc Bochud, direction', 1, '2011-12-01', '2011-12-14'),
(15, 12, '2011-06-24', 'Romont', 'Lieu à préciser<br/><strong>Choeur du Cycle d''Orientation de Romont</strong>', 1, '2011-12-01', '2011-12-14'),
(16, 16, '2011-07-09', 'Sion', '16h00 I Basilique de Valère, Sion<br/>Festival International de l''Orgue Ancien et de la Musique Ancienne de Valère<br/><strong>Maurizio Croci</strong>', 1, '2011-12-01', '2011-12-14'),
(17, 16, '2011-07-16', 'Sion', '16h00 I Basilique de Valère, Sion<br/>Festival International de l''Orgue Ancien et de la Musique Ancienne de Valère<br/><strong>Sander van Marion</strong>', 1, '2011-12-01', '2011-12-14'),
(18, 16, '2011-07-23', 'Sion', '16h00 I Basilique de Valère, Sion<br/>Festival International de l''Orgue Ancien et de la Musique Ancienne de Valère<br/><strong>Daniel Meylan</strong>', 1, '2011-12-01', '2011-12-14'),
(19, 16, '2011-07-30', 'Sion', '16h00 I Basilique de Valère, Sion<br/>Festival International de l''Orgue Ancien et de la Musique Ancienne de Valère<br/><strong>Dimitri Goldobine</strong>', 1, '2011-12-01', '2011-12-14'),
(20, 16, '2011-08-06', 'Sion', '16h00 I Basilique de Valère, Sion<br/>Festival International de l''Orgue Ancien et de la Musique Ancienne de Valère<br/><strong>Carolyn Shuster Fournier</strong>', 1, '2011-12-01', '2011-12-14'),
(21, 16, '2011-08-13', 'Sion', '16h00 I Basilique de Valère, Sion<br/>Festival International de l''Orgue Ancien et de la Musique Ancienne de Valère<br/>\r\n<strong>Luigi Celeghin</strong>', 1, '2011-12-01', '2011-12-14'),
(22, 16, '2011-08-20', 'Sion', '16h00 I Basilique de Valère, Sion<br/>Festival International de l''Orgue Ancien et de la Musique Ancienne de Valère<br/><strong>Juan Maria Pedrero Encabo</strong>', 1, '2011-12-01', '2011-12-14'),
(23, 14, '2011-09-25', 'Sion', '17h00 I Basilique de Valère, Sion<br/>Les Riches Heures de Valère<br/>\r\n<em>Nascente Maria</em><br/>\r\nBarbara Strozzi<br/>\r\n<strong>Ensemble Musica Fiorita</strong><br/>Daniela Dolci, direction', 1, '2011-12-01', '2011-12-14'),
(24, 14, '2011-10-16', 'Sion', '17h00 I Basilique de Valère, Sion<br/>\r\nLes Riches Heures de Valère<br/><em>Apogée de la polyphonie sacrée</em><br/>\r\nGiovanni Pierluigi da Palestrina, Robert White et Orlando di Lasso<br/>\r\n<strong>Huelgas Ensemble</strong><br/>Paul Van Nevel, direction', 1, '2011-12-01', '2011-12-13'),
(25, 14, '2011-11-18', 'Sion', '20h00 I Eglise des Jésuites, Sion<br/>Les Riches Heures de Valère<br/>\r\n<em>Il Canto delle Dame</em><br/>\r\n<strong>Concerto Soave</strong><br/>Maria Cristina Kiehr, soprano<br/>Jean-Marc Aymes, direction', 1, '2011-12-01', '2011-12-13'),
(31, 12, '2012-02-04', 'Lausanne', '20h00 I Egise St-Laurent, Lausanne<br/><em>Acis et Galatée</em><br/>Georg Friedrich Händel<br/><strong>Les Vocalistes</strong><br/>Orchestre de l''HEMU<br/>Henri Farge, direction', 1, '2011-12-07', '2011-12-14'),
(32, 12, '2012-02-05', 'Lausanne', '17h30 I Eglise St-Laurent, Lausanne<br/><em>Acis et Galatée</em><br/>Georg Friedrich Händel<br/><strong>Les Vocalistes</strong><br/>Orchestre de l''HEMU<br/>Henri Farge, direction', 1, '2011-12-07', '2011-12-14'),
(33, 12, '2012-02-19', 'Vallée de Joux', '17h30 I Eglise paroissiale, Le Lieu<br/>Rencontres culturelles de la Vallée de Joux<br/><em>Die Schöne Müllerin</em><br/>Franz Schubert<br/>Eric Cerantola, piano', 1, '2011-12-07', '2012-01-13'),
(34, 12, '2012-02-26', 'Gruyère', '17h00 I Eglise paroissiale, Gruyère<br/>Fondation du Rectorat des Marches<br/>Récital de musique religieuse<br/>Claire-Anne Piguet, clavecin et orgue', 1, '2011-12-07', '2012-02-09'),
(35, 12, '2012-03-11', 'Leytron', '17h00 I Eglise paroissiale, Leytron<br/>Festival de Musique Ancienne de Leytron<br/><em>Brockes Passion</em><br/>Gottfried Heinrich Stölzel<br/><strong>Petits Chanteurs, Grand Choeur de filles et Choeur d''homme de la Schola</strong><br>Capella paterniacensis<br/>Marc Bochud, direction<br/>\r\nCharlotte Müller Perrier, soprano<br/>Aurélie Jaecklé, sporano<br/>Valérie Bonnard, alto<br/>Bertrand Bochud, ténor<br/>Raphaël Favre, ténor<br/>Didier Combe, ténor<br/>Stephan Imboden, basse<br/>Stéphane Karlen, basse<br/>Frédéric Moix, basse', 1, '2011-12-07', '2012-02-16'),
(36, 12, '2012-03-29', 'Fribourg', '20h00 I Eglise des Cordeliers, Fribourg<br/><em>Passion selon St-Jean</em><br/>Jean-Sébastien Bach<br/><strong>Ensemble vocal DeMusica</strong><br/>Ensemble Quintessence<br/>Marc Bochud, direction<br/>Maria C. Schmid, soprano<br/>Astrid Pfarrer, alto<br/>Jakob Pilgram, ténor<br/>Bertrand Bochud, ténor<br/>René Perler, basse', 1, '2011-12-07', '2011-12-14'),
(37, 12, '2012-03-31', 'Fribourg', '20h00 I Eglise des Cordeliers, Fribourg<br/><em>Passion selon St-Jean</em><br/>Jean-Sébastien Bach<br/><strong>Ensemble vocal DeMusica</strong><br/>Ensemble Quintessence<br/>Marc Bochud, direction<br/>Maria C. Schmid, soprano<br/>Astrid Pfarrer, alto<br/>Jakob Pilgram, ténor<br/>Bertrand Bochud, ténor<br/>René Perler, basse', 1, '2011-12-07', '2011-12-14'),
(38, 12, '2012-04-01', 'Lutry', '17h00 I Temple, Lutry<br/>\r\nConcerts Bach de Lutry<br/><em>Passion selon St-Jean</em><br/>Jean-Sébastien Bach<br/><strong>Ensemble vocal DeMusica</strong><br/>Ensemble Quintessence<br/>Marc Bochud, direction<br/>Maria C. Schmid, soprano<br/>Astrid Pfarrer, alto<br/>Jakob Pilgram, ténor<br/>Bertrand Bochud, ténor<br/>René Perler, basse', 1, '2011-12-07', '2012-02-16'),
(39, 12, '2012-04-04', 'Payerne', '19h30 I Abbatiale, Payerne<br/>Concerts de l''Abbatiale<br/><em>Brockes Passion</em><br/>Gottfried Heinrich Stölzel<br/><strong>Petits Chanteurs, Grand Choeur de filles et Choeur d''homme de la Schola</strong><br>Capella paterniacensis<br/>Marc Bochud, direction<br/>\r\nCharlotte Müller Perrier, soprano<br/>Aurélie Jaecklé, sporano<br/>Valérie Bonnard, alto<br/>Bertrand Bochud, ténor<br/>Raphaël Favre, ténor<br/>Didier Combe, ténor<br/>Stephan Imboden, basse<br/>Stéphane Karlen, basse<br/>Frédéric Moix, basse', 1, '2011-12-07', '2012-02-16'),
(41, 12, '2012-10-06', 'Bulle', '20h00 I Bulle<br/><strong>Maîtrise de Bulle</strong><br/>Bernard Maillard, direction', 1, '2011-12-07', '2011-12-14'),
(42, 12, '2012-10-07', 'Bulle', '17h00 I Bulle<br/><strong>Maîtrise de Bulle</strong><br/>Bernard Maillard, direction', 1, '2011-12-07', '2011-12-14'),
(43, 12, '2012-10-28', 'Romainmôtier', '17h00 I Abbatiale, Romainmôtier<br/>Concerts de Romainmôtier<br/>Oeuvres de Wolfgang Amadeus Mozart et Dominique Gesseney-Rappo<br/><strong>Orchestre de Chambre Helvetica</strong><br/>Alexandre Clerc, direction', 1, '2011-12-07', '2012-02-09'),
(44, 12, '2012-11-04', 'Payerne', '17h00 I Abbatiale, Payerne<br/>Concerts de l''Abbatiale<br/>Oeuvres de Wolfgang Amadeus Mozart et Dominique Gesseney-Rappo<br/><strong>Orchestre de Chambre Helvetica</strong><br/>Alexandre Clerc, direction', 1, '2011-12-07', '2012-02-09'),
(45, 19, '2011-12-17', 'Sion', '20h00 I Eglise du Sacré-Coeur, Sion<br/>Concert de Noël<br/><strong>Schola de Sion</strong><br/>Marc Bochud, direction', 1, '2011-12-07', '2011-12-14'),
(46, 19, '2011-12-18', 'Sion', '17h00 I Eglise du Sacré-Coeur, Sion<br/>Concert de Noël<br/><strong>Schola de Sion</strong><br/>Marc Bochud, direction', 1, '2011-12-07', '2011-12-13'),
(47, 19, '2011-12-24', 'Sion', '00h00 I Cathédrale, Sion<br/>\r\nMesse de Minuit<br/>\r\n<strong>Petits Chanteurs et Grand Choeur de filles de la Schola</strong><br/>Marc Bochud, direction', 1, '2011-12-09', '2011-12-14'),
(50, 14, '2011-04-24', 'Sion', '17h00 I Eglise des Jésuites, Sion<br/>\r\nLes Riches Heures de Valères<br/>\r\n<i>Stabat Mater</i><br/>Luigi Boccherini<br/>\r\n<strong>Jeunes artistes professionnels valaisans</strong><br/>\r\nEnsemble Fratres<br/>\r\nMarie-Marthe Claivaz, soprano', 1, '2011-12-13', '2011-12-14'),
(51, 19, '2011-12-08', 'Sion', '10h30 I Cathédrale, Sion<br/>\r\nMesse de la Prise d''Aube<br/>\r\n<strong>Petits Chanteurs</strong><br/>\r\nMarc Bochud, direction', 1, '2011-12-13', '2011-12-14'),
(52, 19, '2012-03-11', 'Leytron', '17h00 I Eglise paroissiale, Leytron<br/>Festival de Musique Ancienne de Leytron<br/><em>Brockes Passion</em><br/>Gottfried Heinrich Stölzel<br/><strong>Petits Chanteurs, Grand Choeur de filles et Choeur d''homme de la Schola</strong><br/>Capella paterniacensis<br/>Marc Bochud, direction<br/>\r\nCharlotte Müller Perrier, soprano<br/>Aurélie Jaecklé, sporano<br/>Valérie Bonnard, alto<br/>Bertrand Bochud, ténor<br/>Raphaël Favre, ténor<br/>Didier Combe, ténor<br/>Stephan Imboden, basse<br/>Stéphane Karlen, basse<br/>Frédéric Moix, basse', 1, '2011-12-13', '2012-02-17'),
(53, 19, '2012-04-04', 'Payerne', '19h30 I Abbatiale, Payerne<br/>Concerts de l''Abbatiale<br/><em>Brockes Passion</em><br/>Gottfried Heinrich Stölzel<br/><strong>Petits Chanteurs, Grand Choeur de filles et Choeur d''homme de la Schola</strong><br/>Capella paterniacensis<br/>Marc Bochud, direction<br/>\r\nCharlotte Müller Perrier, soprano<br/>Aurélie Jaecklé, sporano<br/>Valérie Bonnard, alto<br/>Bertrand Bochud, ténor<br/>Raphaël Favre, ténor<br/>Didier Come, ténor<br/>Stephan Imboden, basse<br/>Stéphane Karlen, basse<br/>Frédéric Moix, basse', 1, '2011-12-13', '2012-02-16'),
(54, 19, '2012-04-08', 'Sion', '10h30 I Cathédrale, Sion<br/>Messe de Pâques<br/><strong>Petits Chanteurs de la Schola</strong><br/>Marc Bochud, direction', 1, '2011-12-13', '2011-12-14'),
(55, 19, '2012-05-12', 'Sion', '20h00 I Eglise St-Théodule, Sion<br/>\r\n<i>Gloria</i><br/>\r\nAntonio Vivaldi<br/>\r\n<i>Magnificat</i><br/>\r\nJohann Sebastian Bach<br/>\r\n<strong>Ensemble vocal de la Schola de Sion<br/>Choeur des étudiants et Orchestre de la HEMU<br/>\r\nHaute Ecole de Musique de Lausanne, Site de Sion</strong><br/>\r\nMarc Bochud, direction<br/>\r\nMarie Jaermann, soprano<br/>\r\nHélène Walter, soprano<br/>\r\nMaria Irène Fantini, alto<br/>\r\nBertrand Bochud, ténor<br/>\r\nStephan Imboden, basse<br/>', 1, '2011-12-13', '2012-02-17'),
(57, 19, '2012-04-01', 'Sion', '9h30 I Eglise du Sacré-Coeur, Sion<br/>Messe des Rameaux<br/><strong>Petits Chanteurs</strong><br/>Marc Bochud, direction', 1, '2011-12-13', '2012-01-27'),
(58, 19, '2012-04-06', 'Sion', '15h00 I Eglise du Sacré-Coeur, Sion<br/>Chemin de Croix<br/><strong>Petits Chanteurs</strong><br/>Marc Bochud, direction', 1, '2011-12-13', '2011-12-14'),
(59, 19, '2012-04-05', 'Fully', '20h00 I Eglise paroissiale, Fully<br/>Office du Jeudi Saint<br/><strong>Grand Choeur de filles</strong> <br/>Marc Bochud, direction', 1, '2011-12-13', '2011-12-14'),
(60, 19, '2012-04-05', 'Sion', '9h30 I Cathédrale, Sion<br/>Messe Chrismale<br/><strong>Petits Chanteurs</strong><br/>Marc Bochud, direction', 1, '2011-12-13', '2011-12-14'),
(61, 19, '2012-04-06', 'Sion', '20h00 I Eglise du Sacré-Coeur, Sion<br/>Office du Vendredi Saint<br/><strong>Petits Chanteurs</strong><br/>Marc Bochud, direction', 1, '2011-12-13', '2011-12-14'),
(62, 19, '2012-04-07', 'Sion', '20h30 I Eglise du Sacré-Coeur, Sion<br/>Veillée Pascale<br/><strong>Petits Chanteurs</strong><br/>Marc Bochud, direction', 1, '2011-12-13', '2011-12-14'),
(63, 19, '2012-05-13', 'Lutry', '12h30 I Temple, Lutry<br/>Concerts Bach de Lutry<br/>\r\n<i>Gloria</i><br/>\r\nAntonio Vivaldi<br/>\r\n<i>Magnificat</i><br/>\r\nJohann Sebastian Bach<br/>\r\n<strong>Ensemble vocal de la Schola de Sion<br/>Choeur des étudiants et Orchestre de la HEMU<br/>\r\nHaute Ecole de Musique de Lausanne, Site de Sion</strong><br/>\r\nMarc Bochud, direction<br/>\r\nMarie Jaermann, soprano<br/>\r\nHélène Walter, soprano<br/>\r\nMaria Irène Fantini, alto<br/>\r\nBertrand Bochud, ténor<br/>\r\nStephan Imboden, basse<br/>', 1, '2011-12-13', '2012-02-17'),
(64, 15, '2012-01-27', 'Montreux', 'Montreux<br/><i>Sax and the city</i><br/>Spectacle scolaire', 1, '2011-12-13', '0000-00-00'),
(65, 15, '2012-03-09', 'La Tour-de-Trême', 'La Tour-de-Trême<br/><i>Sax and the city</i><br/>Spectacle scolaire', 1, '2011-12-13', '0000-00-00'),
(66, 14, '2012-04-08', 'Sion', '17h00 I Eglise des Jésuites, Sion<br/>Les Riches Heures de Valère', 1, '2011-12-13', '0000-00-00'),
(67, 14, '2012-05-20', 'Sion', '17h00 I Basilique de Valère<br/>\r\nLes Riches Heures de Valère', 1, '2011-12-14', '0000-00-00'),
(68, 14, '2012-06-17', 'Sion', '17h00 I Basilique de Valère<br/>\r\nLes Riches Heures de Valère', 1, '2011-12-14', '0000-00-00'),
(69, 14, '2012-09-30', 'Sion', '17h00 I Basilique de Valère<br/>\r\nLes Riches Heures de Valère', 1, '2011-12-14', '0000-00-00'),
(70, 14, '2012-10-21', 'Sion', '17h00 I Basilique de Valère<br/>\r\nLes Riches Heures de Valère', 1, '2011-12-14', '0000-00-00'),
(71, 16, '2012-07-07', 'Sion', '16h00 I Basilique de Valère<br/>Festival International de l''Orgue Ancien et de la Musique Ancienne de Valère', 1, '2011-12-14', '0000-00-00'),
(72, 16, '2012-07-14', 'Sion', '16h00 I Basilique de Valère<br/>Festival International de l''Orgue Ancien et de la Musique Ancienne de Valère', 1, '2011-12-14', '0000-00-00'),
(73, 16, '2012-07-21', 'Sion', '16h00 I Basilique de Valère<br/>Festival International de l''Orgue Ancien et de la Musique Ancienne de Valère', 1, '2011-12-14', '0000-00-00'),
(74, 16, '2012-07-28', 'Sion', '16h00 I Basilique de Valère<br/>Festival International de l''Orgue Ancien et de la Musique Ancienne de Valère', 1, '2011-12-14', '0000-00-00'),
(75, 16, '2012-08-04', 'Sion', '16h00 I Basilique de Valère<br/>Festival International de l''Orgue Ancien et de la Musique Ancienne de Valère', 1, '2011-12-14', '2011-12-14'),
(76, 16, '2012-08-11', 'Sion', '16h00 I Basilique de Valère<br/>Festival International de l''Orgue Ancien et de la Musique Ancienne de Valère', 1, '2011-12-14', '0000-00-00'),
(77, 16, '2012-08-18', 'Sion', '16h00 I Basilique de Valère<br/>Festival International de l''Orgue Ancien et de la Musique Ancienne de Valère', 1, '2011-12-14', '2011-12-14'),
(78, 17, '2012-08-22', 'Sion', '19h30 I Ferme-Asile, Sion<br/>Ouverture-Opéra<br/><i>Alcina</i><br/>Georg Friedrich Haendel<br/>Jean-Luc Follonier, direction musicale<br/>Julie Beauvais, mise en scène', 1, '2011-12-14', '2011-12-15'),
(79, 17, '2012-08-24', 'Sion', '19h30 I Ferme-Asile, Sion<br/>Ouverture-Opéra<br/><i>Alcina</i><br/>Georg Friedrich Haendel<br/>Jean-Luc Follonier, direction musicale<br/>Julie Beauvais, mise en scène', 1, '2011-12-14', '2011-12-15'),
(80, 17, '2012-08-26', 'Sion', '17h00 I Ferme-Asile, Sion<br/>Ouverture-Opéra<br/><i>Alcina</i><br/>Georg Friedrich Haendel<br/>Jean-Luc Follonier, direction musicale<br/>Julie Beauvais, mise en scène', 1, '2011-12-14', '2011-12-15'),
(81, 17, '2012-08-29', 'Sion', '19h30 I Ferme-Asile, Sion<br/>Ouverture-Opéra<br/><i>Alcina</i><br>Georg Friedrich Haendel<br/>Jean-Luc Follonier, direction musicale<br/>Julie Beauvais, mise en scène', 1, '2011-12-14', '2011-12-15'),
(82, 17, '2012-08-31', 'Sion', '19h30 I Ferme-Asile, Sion<br/>Ouverture-Opéra<br/><i>Alcina</i><br/>Georg Friedrich Haendel<br/>Jean-Luc Follonier, direction musicale<br/>Julie Beauvais, mise en scène', 1, '2011-12-14', '2011-12-15'),
(83, 17, '2012-09-02', 'Sion', '17h00 I Ferme-Asile, Sion<br/>Ouverture-Opéra<br/><i>Alcina</i><br/>Georg Friedrich Haendel<br/>Jean-Luc Follonier, direction musicale<br/>Julie Beauvais, mise en scène', 1, '2011-12-14', '2011-12-15'),
(84, 17, '2012-09-05', 'Sion', '19h30 I Ferme-Asile, Sion<br/>Ouverture-Opéra<br/><i>Alcina</i><br/>Georg Friedrich Haendel<br/>Jean-Luc Follonier, direction musicale<br/>Julie Beauvais, mise en scène', 1, '2011-12-14', '2011-12-15'),
(85, 17, '2012-09-07', 'Sion', '19h30 I Ferme-Asile, Sion<br/>Ouverture-Opéra<br/><i>Alcina</i><br/>Georg Friedrich Haendel<br/>Jean-Luc Follonier, direction musicale<br/>Julie Beauvais, mise en scène', 1, '2011-12-14', '2011-12-15'),
(86, 17, '2012-09-09', 'Sion', '17h00 I Ferme-Asile, Sion<br/>Ouverture-Opéra<br/><i>Alcina</i><br/>Georg Friedrich Haendel<br/>Jean-Luc Follonier, direction musicale<br/>Julie Beauvais, mise en scène', 1, '2011-12-14', '2011-12-15'),
(87, 17, '2012-09-12', 'Sion', '19h30 I Ferme-Asile, Sion<br/>Ouverture-Opéra<br/><i>Alcina</i><br/>Georg Friedrich Haendel<br/>Jean-Luc Follonier, direction musicale<br/>Julie Beauvais, mise en scène', 1, '2011-12-14', '2011-12-15'),
(88, 15, '2012-05-04', 'Bulle', 'La Tour-de-Trême<br/>\r\n<i>Sax and the city</i><br/>\r\nSpectacle scolaire', 1, '2011-12-14', '0000-00-00'),
(89, 15, '2011-08-09', 'Auvergne (F)', '16h00 I Eglise paroissiale, Loubeyrat<br/>\r\nFestival Bach en Combrailles<br/><i>Varations Goldberg</i>', 1, '2011-12-14', '2011-12-15'),
(90, 15, '2011-07-02', 'Weikersheim (D)', '18h30 I Schloss, Weikersheim<br/><i>Le Barbier de Seville</i><br/>Giocchino Rossini<br/>Manuel Kühne, comédien', 1, '2011-12-14', '2011-12-14'),
(91, 15, '2011-02-25', 'Crassier', 'Crassier<br/><i>Sax and the city</i><br/>Spectacle scolaire', 1, '2011-12-14', '0000-00-00'),
(92, 15, '2011-02-20', 'Nyon', '13h00 I Villa Thomas, Nyon<br/>Oeuvres de Tomás Luis de Victoria, Isaac Albéniz, Manuel de Falla, Astor Piazzolla...', 1, '2011-12-14', '2011-12-14'),
(93, 19, '2012-12-22', 'Sion', '20h00 I Eglise du Sacré-Coeur, Sion<br/>\r\nConcert de Noël<br/>\r\n<strong>Schola de Sion</strong><br/>\r\nMarc Bochud, direction', 1, '2011-12-22', '0000-00-00'),
(94, 19, '2012-12-23', 'Sion', '17h00 I Eglise du Sacré-Coeur, Sion<br/>\r\nConcert de Noël<br/>\r\n<strong>Schola de Sion</strong><br/>\r\nMarc Bochud, direction', 1, '2011-12-22', '0000-00-00'),
(95, 19, '2012-03-13', '', '10h00 I Lieu à confirmer<br/>\r\nConcert des écoles<br/>\r\n<strong>Projet culture musicale</strong>', 1, '2012-01-27', '2012-01-27'),
(96, 19, '2012-04-04', '', '10h00 I Lieu et horaire à confirmer<br/>\r\n<strong>Concert des écoles</strong><br/>\r\nProjet culture musicale', 1, '2012-01-27', '0000-00-00'),
(97, 12, '2012-12-16', 'Nyon', '17h00 I Nyon<br/>\r\nOratorio de Noël<br/>\r\n<i>Cantates 1, 2, 3</i><br/>\r\nJean-Sébastien Bach<br/>\r\n<strong>Ensemble vocal la Camerata Baroque</strong><br/>\r\nDaniel Meylan, direction\r\n', 1, '2012-02-09', '0000-00-00'),
(98, 12, '2012-12-28', 'Le Sentier', '20h00 I Le Sentier<br/>\r\nOratorio de Noël<br/>\r\n<i>Cantates 1, 2, 3</i><br/>\r\nJean-Sébastien Bach<br/>\r\n<strong>Ensemble vocal la Camerata Baroque</strong><br/>\r\nDaniel Meylan, direction\r\n', 1, '2012-02-09', '0000-00-00'),
(99, 19, '2012-05-11', 'Sion', '18h30 I Eglise St-Théodule, Sion<br/>Générale publique<br/><i>Gloria</i><br/>\r\nAntonio Vivaldi<br/>\r\n<i>Magnificat</i><br/>\r\nJohann Sebastian Bach<br/>\r\n<strong>Ensemble vocal de la Schola de Sion<br/>\r\nChoeur des étudiants et Orchestre de la HEMU<br/>Haute Ecole de Musique de Lausanne, Site de Sion</strong><br/>Marc Bochud, direction<br/>Marie Jaermann, soprano<br/>\r\nHélène Walter, soprano<br/>\r\nMaria Irène Fantini, alto<br/>Bertrand Bochud, ténor<br/>Stephan Imboden, basse', 1, '2012-02-17', '0000-00-00'),
(100, 12, '2012-05-11', 'Sion', '18h30 I Eglise St-Théodule, Sion<br/>\r\nGénérale publique<br/>\r\n<i>Gloria</i><br/>\r\nAntonio Vivaldi<br/>\r\n<i>Magnificat</i><br/>\r\nJohann Sebastian Bach<br/>\r\n<strong>Ensemble vocal de la Schola de Sion<br/>Choeur des étudiants et Orchestre de la HEMU<br/>\r\nHaute Ecole de Musique de Lausanne, Site de Sion</strong><br/>\r\nMarc Bochud, direction<br/>\r\nMarie Jaermann, soprano<br/>\r\nHélène Walter, soprano<br/>\r\nMaria Irène Fantini, alto<br/>\r\nBertrand Bochud, ténor<br/>\r\nStephan Imboden, basse<br/>', 1, '2012-02-17', '2012-02-17'),
(101, 12, '2012-05-12', 'Sion', '20h00 I Eglise St-Théodule, Sion<br/>\r\n<i>Gloria</i><br/>\r\nAntonio Vivaldi<br/>\r\n<i>Magnificat</i><br/>\r\nJohann Sebastian Bach<br/>\r\n<strong>Ensemble vocal de la Schola de Sion<br/>Choeur des étudiants et Orchestre de la HEMU<br/>\r\nHaute Ecole de Musique de Lausanne, Site de Sion</strong><br/>\r\nMarc Bochud, direction<br/>\r\nMarie Jaermann, soprano<br/>\r\nHélène Walter, soprano<br/>\r\nMaria Irène Fantini, alto<br/>\r\nBertrand Bochud, ténor<br/>\r\nStephan Imboden, basse<br/>', 1, '2012-02-17', '0000-00-00'),
(102, 12, '2012-05-13', 'Lutry', '12h30 I Temple, Lutry<br/>Concerts Bach de Lutry<br/>\r\n<i>Gloria</i><br/>\r\nAntonio Vivaldi<br/>\r\n<i>Magnificat</i><br/>\r\nJohann Sebastian Bach<br/>\r\n<strong>Ensemble vocal de la Schola de Sion<br/>Choeur des étudiants et Orchestre de la HEMU<br/>\r\nHaute Ecole de Musique de Lausanne, Site de Sion</strong><br/>\r\nMarc Bochud, direction<br/>\r\nMarie Jaermann, soprano<br/>\r\nHélène Walter, soprano<br/>\r\nMaria Irène Fantini, alto<br/>\r\nBertrand Bochud, ténor<br/>\r\nStephan Imboden, basse<br/>', 1, '2012-02-17', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `country_list`
--

CREATE TABLE IF NOT EXISTS `country_list` (
  `country_id` int(255) NOT NULL AUTO_INCREMENT,
  `country_name_en` varchar(155) COLLATE latin1_german1_ci NOT NULL,
  `country_name_fr` varchar(155) COLLATE latin1_german1_ci NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci AUTO_INCREMENT=249 ;

--
-- Contenu de la table `country_list`
--

INSERT INTO `country_list` (`country_id`, `country_name_en`, `country_name_fr`) VALUES
(1, 'Afghanistan', 'Afghanistan'),
(2, 'Albania', 'Albanie'),
(3, 'Algeria', 'Alg?©rie'),
(4, 'American Samoa', 'Samoa Am?©ricaines'),
(5, 'Andorra', 'Andorre'),
(6, 'Angola', 'Angola'),
(7, 'Anguilla', 'Anguilla'),
(8, 'Antarctica', 'Antarctique'),
(9, 'Antigua and Barbuda', 'Antigua-et-Barbuda'),
(10, 'Argentina', 'Argentine'),
(11, 'Armenia', 'Arm?©nie'),
(12, 'Aruba', 'Aruba'),
(13, 'Ascension Island', '?éles d''Ascension'),
(14, 'Australia', 'Australie'),
(15, 'Austria', 'Autriche'),
(16, 'Azerbaijan', 'Azerba?Ødjan'),
(17, 'Bahamas', 'Bahamas'),
(18, 'Bahrain', 'Bahre?Øn'),
(19, 'Bangladesh', 'Bangladesh'),
(20, 'Barbados', 'Barbade'),
(21, 'Belarus', 'B?©larus'),
(22, 'Belgium', 'Belgique'),
(23, 'Belize', 'Belize'),
(24, 'Benin', 'B?©nin'),
(25, 'Bermuda', 'Bermudes'),
(26, 'Bhutan', 'Bhoutan'),
(27, 'Bolivia', 'Bolivie'),
(28, 'Bosnia and Herzegovina', 'Bosnie-Herz?©govine'),
(29, 'Botswana', 'Botswana'),
(30, 'Bouvet Island', '?éle Bouvet'),
(31, 'Brazil', 'Br?©sil'),
(32, 'British Indian Ocean Territory', 'Territoire Britannique de l''Oc?©an Indien'),
(33, 'Brunei Darussalam', 'Brun?©i Darussalam'),
(34, 'Bulgaria', 'Bulgarie'),
(35, 'Burkina Faso', 'Burkina Faso'),
(36, 'Burundi', 'Burundi'),
(37, 'Cambodia', 'Cambodge'),
(38, 'Cameroon', 'Cameroun'),
(39, 'Canada', 'Canada'),
(40, 'Cape Verde', 'Cap-Vert'),
(41, 'Cayman Islands', 'Ca?Ømanes,?éles'),
(42, 'Central African Republic', 'Centrafricaine,R?©publique'),
(43, 'Chad', 'Tchad'),
(44, 'Chile', 'Chili'),
(45, 'China', 'Chine'),
(46, 'Christmas Island', '?éle Christmas'),
(47, 'Cocos (Keeling) Islands', '?éles Cocos (Keeling)'),
(48, 'Colombia', 'Colombie'),
(49, 'Comoros', 'Comores'),
(50, 'Democratic Republic of the Congo (Kinshasa)', 'Congo,La R?©publique D?©mocratique du'),
(51, 'Congo,Republic of (Brazzaville)', 'R?©publique du Congo'),
(52, 'Cook Islands', '?éles Cook'),
(53, 'Costa Rica', 'Costa Rica'),
(54, 'Ivory Coast', 'C?¥te D''Ivoire'),
(55, 'Croatia', 'Croatie'),
(56, 'Cuba', 'Cuba'),
(57, 'Cyprus', 'Chypre'),
(58, 'Czech Republic', 'R?©publique Tch?®que'),
(59, 'Denmark', 'Danemark'),
(60, 'Djibouti', 'Djibouti'),
(61, 'Dominica', 'Dominique'),
(62, 'Dominican Republic', 'Dominicaine,R?©publique'),
(63, 'East Timor Timor-Leste', 'Timor-Leste (Timor Oriental)'),
(64, 'Ecuador', '?âquateur'),
(65, 'Egypt', '?âgypte'),
(66, 'El Salvador', 'El Salvador'),
(67, 'Equatorial Guinea', 'Guin?©e ?âquatoriale'),
(68, 'Eritrea', '?ârythr?©e'),
(69, 'Estonia', 'Estonie'),
(70, 'Ethiopia', '?âthiopie'),
(71, 'Falkland Islands', 'Falkland,?éles (Malvinas)'),
(72, 'Faroe Islands', '?éles F?©ro?©'),
(73, 'Fiji', 'Fidji'),
(74, 'Finland', 'Finlande'),
(75, 'France', 'France'),
(76, 'French Guiana', 'Guyane Fran?ßaise'),
(77, 'French Metropolitan', 'France M?©tropolitaine'),
(78, 'French Polynesia', 'Polyn?©sie Fran?ßaise'),
(79, 'French Southern Territories', 'Terres Australes Fran?ßaises'),
(80, 'Gabon', 'Gabon'),
(81, 'Gambia', 'Gambie'),
(82, 'Georgia', 'G?©orgie'),
(83, 'Germany', 'Allemagne'),
(84, 'Ghana', 'Ghana'),
(85, 'Gibraltar', 'Gibraltar'),
(86, 'Great Britain', 'Grande-Bretagne'),
(87, 'Greece', 'Gr?®ce'),
(88, 'Greenland', 'Groenland'),
(89, 'Grenada', 'Grenade'),
(90, 'Guadeloupe', 'Guadeloupe'),
(91, 'Guam', 'Guam'),
(92, 'Guatemala', 'Guatemala'),
(93, 'Guernsey', 'Guernesey'),
(94, 'Guinea', 'Guin?©ee'),
(95, 'Guinea-Bissau', 'Guin?©e-Bissau'),
(96, 'Guyana', 'Guyana'),
(97, 'Haiti', 'Ha?Øti'),
(98, 'Heard and Mc Donald Islands', '?éle Heard et ?éles Mcdonald'),
(99, 'Holy See', 'Saint-Si?®ge (?âtat de la Cit?© du Vatican)'),
(100, 'Honduras', 'Honduras'),
(101, 'Hong Kong', 'Hong-Kong'),
(102, 'Hungary', 'Hongrie'),
(103, 'Iceland', 'Islande'),
(104, 'India', 'Inde'),
(105, 'Indonesia', 'Indon?©sie'),
(106, 'Iran (Islamic Republic of)', 'R?©publique Islamique d''Iran'),
(107, 'Iraq', 'Irak'),
(108, 'Ireland', 'Irlande'),
(109, 'Isle of Man', '?éle de Man'),
(110, 'Israel', 'Isra?´l'),
(111, 'Italy', 'Italie'),
(112, 'Jamaica', 'Jama?Øque'),
(113, 'Japan', 'Japon'),
(114, 'Jersey', 'Jersey'),
(115, 'Jordan', 'Jordanie'),
(116, 'Kazakhstan', 'Kazakstan'),
(117, 'Kenya', 'Kenya'),
(118, 'Kiribati', 'Kiribati'),
(119, 'Korea,Democratic People''s Rep. (North Korea)', 'Cor?©e,R?©publique Populaire D?©mocratique de'),
(120, 'Korea,Republic of (South Korea)', 'Cor?©e,R?©publique de'),
(121, 'Kuwait', 'Kowe?Øt'),
(122, 'Kyrgyzstan', 'Kirghizistan'),
(123, 'Lao,People''s Democratic Republic', 'Laos,R?©publique D?©mocratique Populaire'),
(124, 'Latvia', 'Lettonie'),
(125, 'Lebanon', 'Liban'),
(126, 'Lesotho', 'Lesotho'),
(127, 'Liberia', 'Lib?©ria'),
(128, 'Libya', 'Libye'),
(129, 'Liechtenstein', 'Liechtenstein'),
(130, 'Lithuania', 'Lituanie'),
(131, 'Luxembourg', 'Luxembourg'),
(132, 'Macau', 'Macao'),
(133, 'Macedonia,Rep. of', 'Mac?©doine,ex-R?©publique Yougoslave de'),
(134, 'Madagascar', 'Madagascar'),
(135, 'Malawi', 'Malawi'),
(136, 'Malaysia', 'Malaisie'),
(137, 'Maldives', 'Maldives'),
(138, 'Mali', 'Mali'),
(139, 'Malta', 'Malta'),
(140, 'Marshall Islands', '?éles Marshall'),
(141, 'Martinique', 'Martinique'),
(142, 'Mauritania', 'Mauritanie'),
(143, 'Mauritius', '?éle Maurice'),
(144, 'Mayotte', 'Mayotte'),
(145, 'Mexico', 'Mexique'),
(146, 'Micronesia,Federal States of', '?âtats F?©d?©r?©s de Micron?©sie'),
(147, 'Moldova,Republic of', 'Moldova,R?©publique de'),
(148, 'Monaco', 'Monaco'),
(149, 'Mongolia', 'Mongolie'),
(150, 'Montenegro', 'Mont?©n?©gro'),
(151, 'Montserrat', 'Montserrat'),
(152, 'Morocco', 'Maroc'),
(153, 'Mozambique', 'Mozambique'),
(154, 'Myanmar,Burma', 'Myanmar,Birmanie'),
(155, 'Namibia', 'Namibie'),
(156, 'Nauru', 'Nauru'),
(157, 'Nepal', 'N?©pal'),
(158, 'Netherlands', 'Pays-Bas'),
(159, 'Netherlands Antilles', 'Antilles N?©erlandaises'),
(160, 'New Caledonia', 'Nouvelle-Cal?©donie'),
(161, 'New Zealand', 'Nouvelle-Z?©lande'),
(162, 'Nicaragua', 'Nicaragua'),
(163, 'Niger', 'Niger'),
(164, 'Nigeria', 'Nig?©ria'),
(165, 'Niue', 'Niou?©'),
(166, 'Norfolk Island', 'Norfolk,?éle'),
(167, 'Northern Mariana Islands', '?éles Mariannes du Nord'),
(168, 'Norway', 'Norv?®ge'),
(169, 'Oman', 'Oman'),
(170, 'Pakistan', 'Pakistan'),
(171, 'Palau', 'Palaos'),
(172, 'Palestinian National Authority', 'Autorit?© Nationale Palestinienne'),
(173, 'Panama', 'Panama'),
(174, 'Papua New Guinea', 'Papouasie-Nouvelle-Guin?©e'),
(175, 'Paraguay', 'Paraguay'),
(176, 'Peru', 'P?©rou'),
(177, 'Philippines', 'Philippines'),
(178, 'Pitcairn Island', 'Pitcairn'),
(179, 'Poland', 'Pologne'),
(180, 'Portugal', 'Portugal'),
(181, 'Puerto Rico', 'Porto Rico'),
(182, 'Qatar', 'Qatar'),
(183, 'Reunion Island', 'Ile de la R?©union'),
(184, 'Romania', 'Roumanie'),
(185, 'Russian Federation', 'Russie,F?©d?©ration de'),
(186, 'Rwanda', 'Rwanda'),
(187, 'Saint Kitts and Nevis', 'Saint-Kitts-et-Nevis'),
(188, 'Saint Lucia', 'Sainte-Lucie'),
(189, 'Saint Vincent and the Grenadines', 'Saint-Vincent-et-les Grenadines'),
(190, 'Samoa', 'Samoa'),
(191, 'San Marino', 'Saint-Marin'),
(192, 'Sao Tome and Principe', 'Sao Tom?©-et-Principe'),
(193, 'Saudi Arabia', 'Arabie Saoudite'),
(194, 'Senegal', 'S?©n?©gal'),
(195, 'Serbia', 'Serbie'),
(196, 'Seychelles', 'Seychelles'),
(197, 'Sierra Leone', 'Sierra Leone'),
(198, 'Singapore', 'Singapour'),
(199, 'Slovakia (Slovak Republic)', 'Slovaquie'),
(200, 'Slovenia', 'Slov?©nie'),
(201, 'Solomon Islands', 'Salomon; ?éles'),
(202, 'Somalia', 'Somalie'),
(203, 'South Africa', 'Afrique du Sud'),
(204, 'South Georgia and South Sandwich Islands', 'G?©orgie du Sud et les ?éles Sandwich du Sud'),
(205, 'Spain', 'Espagne'),
(206, 'Sri Lanka', 'Sri Lanka'),
(207, 'Saint Helena', 'Sainte-H?©l?®ne'),
(208, 'St. Pierre and Miquelon', 'Saint-Pierre-et-Miquelon'),
(209, 'Sudan', 'Soudan'),
(210, 'Suriname', 'Suriname'),
(211, 'Svalbard and Jan Mayen Islands', 'Svalbard et ?éle Jan Mayen'),
(212, 'Swaziland', 'Swaziland'),
(213, 'Sweden', 'Su?®de'),
(214, 'Switzerland', 'Suisse'),
(215, 'Syria,Syrian Arab Republic', 'Syrienne,R?©publique Arabe'),
(216, 'Taiwan (Republic of China)', 'Ta?Øwan,Province de Chine'),
(217, 'Tajikistan', 'Tadjikistan'),
(218, 'Tanzania', 'Tanzanie,R?©publique-Unie de'),
(219, 'Thailand', 'Tha?Ølande'),
(220, 'Tibet', 'Tibet'),
(221, 'Timor-Leste (East Timor)', 'Timor-Leste (Timor Oriental)'),
(222, 'Togo', 'Togo'),
(223, 'Tokelau', 'Tokelau'),
(224, 'Tonga', 'Tonga'),
(225, 'Trinidad and Tobago', 'Trinit?©-et-Tobago'),
(226, 'Tunisia', 'Tunisie'),
(227, 'Turkey', 'Turquie'),
(228, 'Turkmenistan', 'Turkm?©nistan'),
(229, 'Turks and Caicos Islands', 'Turks et Ca?Øques,?éles'),
(230, 'Tuvalu', 'Tuvalu'),
(231, 'Uganda', 'Ouganda'),
(232, 'Ukraine', 'Ukraine'),
(233, 'United Arab Emirates', '?âmirats Arabes Unis'),
(234, 'United Kingdom', 'Royaume-Uni'),
(235, 'United States', '?âtats-Unis'),
(236, 'U.S. Minor Outlying Islands', '?éles Mineures ?âloign?©es des ?âtats-Unis'),
(237, 'Uruguay', 'Uruguay'),
(238, 'Uzbekistan', 'Ouzb?©kistan'),
(239, 'Vanuatu', 'Vanuatu'),
(240, 'Venezuela', 'Venezuela'),
(241, 'Vietnam', 'Vi?™t Nam'),
(242, 'Virgin Islands (British)', '?éles Vierges Britanniques'),
(243, 'Virgin Islands (U.S.)', '?éles Vierges des ?âtats-Unis'),
(244, 'Wallis and Futuna Islands', 'Wallis et Futuna'),
(245, 'Western Sahara', 'Sahara Occidental'),
(246, 'Yemen', 'Y?©men'),
(247, 'Zambia', 'Zambie'),
(248, 'Zimbabwe', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Structure de la table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `language_id` smallint(3) NOT NULL,
  `language_name` varchar(55) NOT NULL,
  `language_short_name` varchar(25) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `language`
--

INSERT INTO `language` (`language_id`, `language_name`, `language_short_name`) VALUES
(1, 'English', 'EN'),
(2, 'Fran?ßais', 'FR'),
(3, 'Deutsch', 'DE'),
(4, 'Italiano', 'IT');

-- --------------------------------------------------------

--
-- Structure de la table `link`
--

CREATE TABLE IF NOT EXISTS `link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `link_url` varchar(55) NOT NULL,
  `language_id` smallint(3) NOT NULL,
  `link_title` varchar(55) NOT NULL,
  `link_description` text NOT NULL,
  `link_rank` tinyint(3) NOT NULL DEFAULT '1',
  `link_category_id` int(10) NOT NULL,
  `link_creation_date` date NOT NULL DEFAULT '0000-00-00',
  `link_modification_date` date NOT NULL DEFAULT '0000-00-00',
  `link_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Contenu de la table `link`
--

INSERT INTO `link` (`link_id`, `link_url`, `language_id`, `link_title`, `link_description`, `link_rank`, `link_category_id`, `link_creation_date`, `link_modification_date`, `link_status`) VALUES
(1, 'http://www.sionairport.ch/index.xhtml', 1, 'Sion Airport', 'Information on airport access, and arrival and departur', 1, 17, '2010-06-28', '2010-06-28', 1),
(2, 'http://www.sbb.ch/', 1, 'Swiss International Airlines', 'Information on ticket prices and availability; flight arrival and departure times', 2, 17, '2010-06-28', '2010-06-28', 1),
(3, 'http://www.lyonairport.com/', 1, 'Lyon Airports', 'An alternative to Geneva offering flights daily during the winter season.', 2, 17, '2010-06-28', '0000-00-00', 1),
(4, 'http://www.gva.ch/en/DesktopDefault.aspx/tabid-11/', 1, 'Geneva Airport', 'Information on airport access, and arrival and departure times.', 3, 17, '2010-06-28', '0000-00-00', 1),
(5, 'http://www.easyjet.com/asp/en/book/index.asp?lang=en', 1, 'easyJet', 'Information on ticket prices and availability; flight arrival and departure times.', 4, 17, '2010-06-28', '0000-00-00', 1),
(6, 'http://www.ski-flights.com/home.html', 1, 'Cheap charter flights to ski resorts', 'The UK independent travel specialist flying you to the snow this Winter.', 5, 17, '2010-06-28', '0000-00-00', 1),
(7, 'http://www.skyscanner.fr/', 1, 'Compare flights from all over Europe', 'Shows all airlines from most European airports.', 6, 17, '2010-06-28', '0000-00-00', 1),
(8, 'http://www.britishairways.com/travel/home/public/en_gb?', 1, 'British Airways', 'Information on ticket prices and availability; flight arrival and departure times.', 7, 17, '2010-06-28', '0000-00-00', 1),
(9, 'http://www.alpinexpress.com/home', 1, 'Airport Transfers to Verbier', 'Verbier - Geneva Airport. Journey time +/- 1hr 45min. Chauffeured transfer in air conditioned minibus.', 8, 17, '2010-06-28', '0000-00-00', 1),
(10, 'http://www.comparecarhire.co.uk/', 1, 'Car Hire comparison', 'CompareCarHire.co.uk searches and compares over 40 car hire companies to get consumers the cheapest price for car hire, whatever the desination may be.', 9, 17, '2010-06-28', '0000-00-00', 1),
(11, 'http://www.sbb.ch/', 1, 'Swiss train and bus timetables', 'Find all the train timetables for Switzerland and connections to Verbier.', 10, 17, '2010-06-28', '0000-00-00', 1),
(12, 'http://www.verbier.ch/', 1, 'Tourist Office', 'Find lots of useful information about Verbier.', 1, 18, '2010-06-28', '0000-00-00', 1),
(13, 'http://www.verbinet.com/', 1, 'Verbinet.com', 'A news and information website about Verbier.', 2, 18, '2010-06-28', '2010-06-28', 1),
(14, 'http://www.mtbverbier.com/', 1, 'MTB-Verbier', 'Mountain biking in and around Verbier - day guiding and day trips, we have a van ready for bikes, so we can take people outside of Verbier.', 1, 19, '2010-06-28', '0000-00-00', 1),
(15, 'http://www.thecyclepeople.com/cyclingtoursandholidays', 1, 'The Cycle People', 'Compare & Review over 750 Cycling Holidays and Mountain Bike Holidays from the leading operators at TheCyclePeople.com.', 2, 19, '2010-06-28', '0000-00-00', 1),
(16, 'http://www.cherrieswalks.com/', 1, 'Guided mountain walks & hikes in and around Verbier', 'More than just a simple hike, experience nature in a safe environment.', 3, 19, '2010-06-28', '0000-00-00', 1),
(17, 'http://ski.intermaps.ch/verbier/index.swf?lang=en', 1, 'Interactive Piste Map', 'Navigate your way around the 4 Valleys. Pistes, restaurants and information points.', 4, 19, '2010-06-28', '0000-00-00', 1),
(18, 'http://sdds.intermaps.com/verbier/web_verbier.asp', 1, 'Verbier Webcams and Piste information', 'Latest updates on weather, lifts and conditions for Verbier and 4 Valleys.', 5, 19, '2010-06-28', '0000-00-00', 1),
(19, 'http://www.europeansnowsport.com/', 1, 'European Snowsport Ski School', 'English speaking ski school. Innovative lessons with fun, qualified instructors. Maximum 6 per group.', 6, 19, '2010-06-28', '0000-00-00', 1),
(20, 'http://www.altitude-futures.com/', 1, 'Become a BASI snowsport instructor', 'Taking a gap year? Why not spend the winter in Verbier training to become a BASI ski or snowboard instructor?', 7, 19, '2010-06-28', '0000-00-00', 1),
(21, 'http://www.contact-immobilier.ch/fr/index.php', 1, 'Buying a property in Verbier', 'For everything you need to know about buying a property in Verbier.', 1, 20, '2010-06-28', '0000-00-00', 1),
(22, 'http://www.thomasdainty.co.uk/', 1, 'Brogue Trader!', 'Bespoke footwear for discerning gentlemen. City shoes and outdoor pursuits.', 1, 21, '2010-06-28', '0000-00-00', 1),
(23, 'http://www.verbierlanguageschool.com/', 1, 'Verbier Language School', 'Brush up on your language skills. French, German, Italian & English. Private or group lessons.', 2, 21, '2010-06-28', '0000-00-00', 1),
(24, 'http://www.soifandthirst.com/', 1, 'Wines delivered to your chalet', 'Great selection of quality wines and spirits from around the world. Free delivery to your chalet.', 3, 21, '2010-06-28', '0000-00-00', 1),
(25, 'http://www.thomasdainty.co.uk', 2, 'Chausseur de tradition', 'Chaussures sur mesure pour les hommes de go?ªt. Chaussures de ville et plus.\r\n', 1, 21, '2010-12-10', '0000-00-00', 1),
(26, 'http://www.verbierlanguageschool.com', 2, 'Verbier Language School', 'Remettez vos connaissances linguistiques ?† jour. Fran?ßais, Allemand, Italien et Anglais. En groupe ou en cours priv?©.\r\n', 1, 21, '2010-12-10', '2010-12-11', 1),
(27, 'http://www.soifandthirst.com', 2, 'Vins et spiritueux ?† domicile', 'Grande s?©lection de vins mill?©sim?©s et de spiritueux du monde. Livraison gratuite.\r\n', 3, 21, '2010-12-10', '0000-00-00', 1),
(28, 'http://www.contact-immobilier.ch/fr/index.php', 2, 'Acheter un propri?©t?© ?† Verbier', 'Pour tout savoir sur comment acheter une propri?©t?© ?† Verbier.', 1, 20, '2010-12-10', '0000-00-00', 1),
(29, 'http://www.mtbverbier.com', 2, 'MTB-Verbier', 'Le v?©lo de montagne ?† Verbier et alentours - sorties guid?©es et excursions dans un van pr?©vu ?† cet effet.', 1, 19, '2010-12-10', '0000-00-00', 1),
(30, 'http://www.thecyclepeople.com/cyclingtoursandholidays', 2, 'The Cycle People', 'Comparez et passez en revue plus de 750 propositions de vacances ?† v?©lo aupr?®s du sp?©cialiste en la mati?®re TheCyclePeople.com.', 2, 19, '2010-12-10', '0000-00-00', 1),
(31, 'http://www.cherrieswalks.com', 2, 'Randonn?©es guid?©es et sorties en montagne', 'Plus qu''une simple randonn?©e, un go?ªt de nature dans un cadre de s?©curit?©.', 3, 19, '2010-12-10', '2010-12-11', 1),
(32, 'http://ski.intermaps.ch/verbier/index.swf?lang=en', 2, 'Carte interactive des pistes de ski', 'Trouvez votre chemin sur le domaine des 4 Vall?©es. Toutes les pistes, les restaurants, les points d\\''information.', 4, 19, '2010-12-10', '0000-00-00', 1),
(33, 'http://sdds.intermaps.com/verbier/web_verbier.asp', 2, 'Webcam de Verbier et Infos pistes', 'Les derniers bulletins m?©t?©o et l\\''?©tat du r?©seau de remont?©es m?©caniques pour Verbier et les 4 Vall?©es.', 5, 19, '2010-12-10', '0000-00-00', 1),
(34, 'http://www.europeansnowsport.com', 2, 'European Snowsport Ski School', 'Ecole de ski anglophone. Le?ßons innovantes et interactives avec des instructeurs qualifi?©s. Groupes restreints de 6 personnes.', 6, 19, '2010-12-10', '0000-00-00', 1),
(35, 'http://www.altitude-futures.com', 2, 'Devenez instructeur BASI', 'Vous entamez une ann?©e sabatique? Pourquoi ne pas passer l\\''hiver ?† Verbier et devenir instructeur BASI?', 7, 19, '2010-12-10', '0000-00-00', 1),
(36, 'http://www.verbier.ch', 2, 'Le site de l''Office du tourisme de Verbier', 'Trouvez ici toutes les informations sur Verbier.', 1, 18, '2010-12-10', '2010-12-11', 1),
(37, 'http://www.verbinet.com', 2, 'Verbinet.com', 'Un site de news et d''informations sur Verbier.', 2, 18, '2010-12-10', '2010-12-11', 1),
(38, 'http://www.sionairport.ch/index.xhtml', 2, 'A?©roport de Sion', 'Informations sur les acc?®s ?† l\\''a?©roport et sur les d?©parts / arriv?©es.', 1, 17, '2010-12-10', '0000-00-00', 1),
(39, 'http://www.swiss.ch', 2, 'Site de la compagnie a?©rienne Swiss', 'Informations sur le prix des billets et leur disponibilit?©; horaires des d?©parts / arriv?©es.', 2, 17, '2010-12-10', '0000-00-00', 1),
(40, 'http://www.lyonairport.com', 2, 'A?©roport de Lyon', 'Une alternative ?† l''a?©roport de Gen?®ve. Offre des vols quotidiens durant la saison d''hiver.', 3, 17, '2010-12-10', '2010-12-11', 1),
(41, 'http://www.gva.ch/en/DesktopDefault.aspx/tabid-11', 2, 'A?©roport de Gen?®ve', 'Informations sur les acc?®s ?† l\\''a?©roport et sur les d?©parts / arriv?©es.', 6, 17, '2010-12-10', '0000-00-00', 1),
(42, 'http://www.easyjet.com/asp/en/book/index.asp?lang=en', 2, 'easyJet', 'Informations sur le prix des billets et leur disponibilit?©; horaires des d?©parts / arriv?©es.', 7, 17, '2010-12-10', '0000-00-00', 1),
(43, 'http://www.ski-flights.com/home.html', 2, 'Vols charters ?† destination des stations de ski', 'La compagnie du Royaume-Uni ind?©pendante qui vous transporte jusque vers les sommets enneig?©s.', 8, 17, '2010-12-10', '0000-00-00', 1),
(44, 'http://www.skyscanner.fr', 2, 'Comparez les vols sur l\\''ensemble de l\\''Europe', 'Un r?©pertoire de toutes les compagnies a?©riennes des principaux a?©roports.', 9, 17, '2010-12-10', '0000-00-00', 1),
(45, 'http://www.britishairways.com/travel/home/public/en_gb?', 2, 'British Airways', 'Informations sur le prix des billets et leur disponibilit?©; horaires des d?©parts / arriv?©es.', 10, 17, '2010-12-10', '0000-00-00', 1),
(46, 'http://www.alpinexpress.com/home', 2, 'Transfert de l\\''a?©roport de Gen?®ve ?† Verbier', 'Un transfert de +/- 1h45 ?† bord d\\''un minibus climatis?©.', 11, 17, '2010-12-10', '0000-00-00', 1),
(47, 'http://www.comparecarhire.co.uk', 2, 'Comparez les prestations des compagnies de location', 'CompareCarHire.co.uk compare pour vous plus de 40 compagnies de locations de voiture.', 13, 17, '2010-12-10', '0000-00-00', 1),
(48, 'http://www.cff.ch', 2, 'Les horaires des trains suisses', 'Trouvez tous les horaires de train / bus de Suisse et les correspondances pour Verbier.', 13, 17, '2010-12-10', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `link_category`
--

CREATE TABLE IF NOT EXISTS `link_category` (
  `link_category_id` int(55) NOT NULL AUTO_INCREMENT,
  `link_category_parent_id` smallint(3) NOT NULL,
  `link_category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`link_category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Contenu de la table `link_category`
--

INSERT INTO `link_category` (`link_category_id`, `link_category_parent_id`, `link_category_name`) VALUES
(17, 0, 'transport'),
(18, 0, 'tourist_info'),
(19, 0, 'sport'),
(20, 0, 'real_estate'),
(21, 0, 'leisure');

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(255) NOT NULL AUTO_INCREMENT,
  `news_category_id` int(255) NOT NULL,
  `subcategory_id` int(55) NOT NULL,
  `news_time` time NOT NULL,
  `language_id` smallint(3) NOT NULL,
  `news_title` varchar(55) CHARACTER SET latin1 NOT NULL,
  `news_title_2` varchar(255) CHARACTER SET latin1 NOT NULL,
  `news_title_3` varchar(255) CHARACTER SET latin1 NOT NULL,
  `news_subtitle` varchar(255) CHARACTER SET latin1 NOT NULL,
  `news_short_title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `pool_list_2` varchar(255) CHARACTER SET latin1 NOT NULL,
  `news_content` text CHARACTER SET latin1 NOT NULL,
  `upload_file_id` int(55) NOT NULL,
  `dir_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `sound_dir_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `bio_dir_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `news_public_date` varchar(55) CHARACTER SET latin1 NOT NULL,
  `admin_id` tinyint(3) NOT NULL,
  `news_status` tinyint(1) NOT NULL DEFAULT '1',
  `news_rank` tinyint(3) NOT NULL DEFAULT '1',
  `news_publication_start_date` date NOT NULL,
  `news_publication_end_date` date NOT NULL,
  `news_creation_date` date NOT NULL,
  `news_modification_date` date NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `news`
--

INSERT INTO `news` (`news_id`, `news_category_id`, `subcategory_id`, `news_time`, `language_id`, `news_title`, `news_title_2`, `news_title_3`, `news_subtitle`, `news_short_title`, `pool_list_2`, `news_content`, `upload_file_id`, `dir_name`, `sound_dir_name`, `bio_dir_name`, `news_public_date`, `admin_id`, `news_status`, `news_rank`, `news_publication_start_date`, `news_publication_end_date`, `news_creation_date`, `news_modification_date`) VALUES
(4, 2, 9, '20:00:00', 2, 'Stile Antico', 'Ensemble vocal', 'Palestrina, Lassus, Victoria...<br/><em>Cantique des cantiques</em>', 'Palestrina, Lassus, Victoria… Cantique des cantiques', 'Stile Antico', 'a:1:{i:0;s:1:"1";}', '<p><strong>Dimanche 24 avril 2011</strong> (Pâques)\r\n17h00, Eglise des Jésuites, Sion\r\n(gratuit avec collecte)</p>\r\n\r\n<p><strong>Jeunes artistes valaisans</strong>\r\nMarie-Marthe Claivaz, soprano\r\nQuatuor Fratres</p>\r\n\r\n<p><em>Stabat Mater, Luigi Boccherini (1743-1805)</em></p>', 1, 'uploads/images_concerts/stile_antico', '0', 'uploads/biographies_concert/biographie_stile_antico', '28.05.2011', 1, 1, 2, '2011-03-17', '2012-03-17', '2011-03-17', '2011-04-29'),
(14, 1, 10, '17:00:00', 2, 'Jeunes artistes', 'Ensemble Fratres & M.M. Claivaz', 'Luigi Boccherini<br/><em>Stabat Mater</em> G 332', 'Ensemble Fratres & Marie-Marthe Claivaz / Luigi Boccherini, Stabat Mater', 'Jeunes artistes', 'a:2:{i:0;s:2:"10";i:1;s:2:"11";}', '<p><strong>Jeunes Artistes</strong>\r\nMarie-Marthe Claivaz, soprano\r\nQuatuor Fratres</p>\r\n\r\n<p><em>Stabat Mater, Luigi Boccherini (1743-1805)</em></p>', 30, 'uploads/images_concerts/jeunes_artistes_valaisans_2011', '0', 'uploads/biographies_concert/biographie_jeunes_artistes', '24.04.2011', 1, 1, 1, '2011-03-19', '2021-03-19', '2011-03-19', '2011-06-08'),
(15, 2, 9, '17:00:00', 2, 'Ensemble Daedalus', 'Roberto Festa', '<em>O Vergin Santa non m''abbandonare</em>', 'O Vergin Santa non m’abandonare', 'Daedalus', 'a:1:{i:0;s:1:"4";}', '', 46, 'uploads/images_concerts/daedalus', '0', 'uploads/biographies_concert/biographie_daedalus', '12.06.2011', 1, 1, 3, '2011-03-19', '2021-03-19', '2011-03-19', '2011-06-08'),
(16, 2, 9, '17:00:00', 2, 'Musica Fiorita', 'Daniela Dolci', 'Barbara Strozzi <em>Nascente Maria</em>', 'Barbara Strozzi, Nascente Maria', 'Musica Fiorita', 'a:1:{i:0;s:1:"5";}', '', 6, 'uploads/images_concerts/musica_fiorita', '0', 'uploads/biographies_concert/biographie_musica_fiorita', '25.09.2011', 1, 1, 4, '2011-03-19', '2021-03-19', '2011-03-19', '2011-04-18'),
(17, 2, 10, '20:00:00', 2, 'Concerto Soave', 'J.-M. Aymes<br/>María C. Kiehr', '<em>Il Canto delle Dame</em>', 'Il Canto delle Dame', 'Concerto Soave', 'a:1:{i:0;s:1:"7";}', '<p>Né de la rencontre de María Cristina Kiehr et Jean-Marc Aymes, Concerto Soave fut au départ conçu comme un écrin de solistes enchâssant la voix unique de la soprano. Plus particulièrement voué à la musique italienne du seicento, ses concerts à travers le monde et ses enregistrements marquent immanquablement le paysage musical baroque.</p>', 3, 'uploads/images_concerts/concerto_soave', '0', 'uploads/biographies_concert/biographie_concerto_soave', '18.11.2011', 1, 1, 6, '2011-03-22', '2021-03-22', '2011-03-22', '2011-04-18'),
(18, 2, 9, '17:00:00', 2, 'Huelgas Ensemble', 'Paul Van Nevel', 'Palestrina, White & Lassus<br/><em>Apogée de la polyphonie sacrée</em>', 'Palestrina, White et Lassus, Apogée de la polyphonie sacrée', 'Huelgas Ensemble', 'a:1:{i:0;s:1:"6";}', '', 5, 'uploads/images_concerts/huelgas', '0', 'uploads/biographies_concert/biographie_huelgas', '16.10.2011', 1, 1, 5, '2011-03-30', '2021-03-30', '2011-03-30', '2011-04-18');

-- --------------------------------------------------------

--
-- Structure de la table `news_category`
--

CREATE TABLE IF NOT EXISTS `news_category` (
  `news_category_id` int(55) NOT NULL AUTO_INCREMENT,
  `news_category_parent_id` smallint(3) NOT NULL,
  `news_category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`news_category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `news_category`
--

INSERT INTO `news_category` (`news_category_id`, `news_category_parent_id`, `news_category_name`) VALUES
(1, 0, 'Ouverture'),
(2, 0, 'Saison'),
(3, 0, 'Soutien');

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `page_id` mediumint(55) NOT NULL AUTO_INCREMENT,
  `profile_id` mediumint(55) NOT NULL,
  `page_type` tinyint(3) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_content` text NOT NULL,
  `dir_name` varchar(55) NOT NULL,
  `media_url` varchar(55) NOT NULL,
  `discography_id` int(55) NOT NULL,
  `page_rank` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Contenu de la table `pages`
--

INSERT INTO `pages` (`page_id`, `profile_id`, `page_type`, `page_title`, `page_content`, `dir_name`, `media_url`, `discography_id`, `page_rank`) VALUES
(5, 12, 1, 'Engagement de l''agence', '<p>Diffusion et gestion administrative</p>', '0', '', 0, 4),
(6, 15, 1, 'Engagement de l''agence', '<p>Diffusion et gestion administrative</p>', '0', '', 0, 6),
(7, 4, 1, 'Engagement de l''agence', '<p>Diffusion, gestions administrative et financière</p>', '0', '', 0, 5),
(8, 13, 1, 'Engagement de l''agence', '<p>Diffusion en Suisse et en Autriche</p>', '0', '', 0, 8),
(9, 12, 1, 'Bertrand Bochud', '<p>Dès l''âge de huit ans, Bertrand Bochud suit dès des cours de piano, de chant et d''orgue au Conservatoire de Fribourg. Après l''obtention du diplôme d''enseignement en 2004, pour lequel il a reçu le prix de la Fondation Max et Axelle Koch de Lucerne, il termine sa formation par la virtuosité "mention excellente avec félicitations du jury" auprès de Michel Brodard à la Musikhochschule de Lucerne. Il se perfectionne actuellement auprès de Tiny Westendorp.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Dans le domaine du récital, son répertoire comprend plusieurs cycles de Lieder romantiques allemands : <i>Winterreise</i> de Schubert ou <i>Dichterliebe</i> de Schumann ainsi que des mélodies françaises de Fauré, Bizet, Duparc et Poulenc. Bertrand Bochud a présenté récemment un récital de musique russe au côté de la mezzo-soprano Brigitte Balleys. Cette collaboration se poursuit avec la préparation d''un programme autour du compositeur français Emmanuel Chabrier. Le duo sera accompagné par le pianiste Laurent Martin.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Bertrand Bochud aborde également volontiers des pages de musique contemporaine dont récemment une création pour ténor et quatuor à cordes de Dominique Gesseney-Rappo : le <i>Nunc Dimitis</i> interprété en collaboration avec le Quatuor Sine Nomine.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Durant l''été 2008, il tient le rôle de Rodolphe dans la production de <i>La Bohème</i> de Puccini pour l''Association Ouverture-Opéra à la Ferme Asile de Sion.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Dès la rentrée 2010, il enseigne au Conservatoire de Lausanne.</p>\r\n\r\n<p><br/><br/>\r\n<a href="http://www.bertrandbochud.ch" onclick="window.open(this.href, ''_blank''); return false;">www.bertrandbochud.ch</a></p>', 'uploads/img_bertrand_bochud', '', 0, 1),
(10, 4, 1, 'Ensemble Daedalus', '<p>Fondé à Genève en 1986 par Roberto Festa, Daedalus consacre les deux premières années de son activité à la recherche. Les programmes qui virent les débuts de l''ensemble, lors du prestigieux Festival des Flandres, et à  Milan, lors de Musica e poesia a San Maurizio, sont le résultat concret de cette période d''étude. Le succès rencontré à  Bruges ouvre la voie à  deux collaborations essentielles dans le parcours du groupe : avec Accent, tout d''abord, la maison de disques qui a enregistré 10 de ses CDs, et RTB 3, la chaîne culturelle de la radio belge, coproductrice de 4 d''entre eux. </p>\r\n\r\n<p><br/></p>\r\n\r\n<p>En 1994, Daedalus réalise la représentation intégrale de <i>La Purpura de la Rosa</i>, de Tomás Torrejon y Velasco, en collaboration avec le Teatro Lirico della Città di Messina et le Teatro Comunale di Bologna. Pour Bologne 2000, capitale européenne de la culture, l''Ensemble Daedalus monte <i>L''Aurora Ingannata</i> de Girolamo Giacobbi. La presse spécialisée prime l''originalité des enregistrements de l''ensemble. Les 12 CDs sont salués avec enthousiasme par la critique et se voient gratifiés de 19 prix.</p>', 'uploads/img_ensemble_daedalus', '', 0, 1),
(11, 13, 1, 'Hirundo Maris', '<p>Arianna Savall et Petter Udland Johansen créent Hirundo Maris en 2009. Leur souhait est de se spécialiser tout d''abord dans la musique ancienne tout en gardant une place importante pour des créations contemporaines de leur composition.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Leur projet porte principalement sur la musique méditerranéenne et nordique. A l''image de l''hirundo maris, un oiseau migrateur, les musiciens retrouvent, grâce à un travail mené conjointement, les chemins de la mer et de la musique qui, depuis la nuit des temps, unissent les pays scandinaves à la péninsule ibérique. Il ne s''agit pas seulement d''un voyage musical unique entre les pays civilisés, l''Espagne et la Norvège, ou encore entre le Sud et le Nord, mais également d''un parcours à travers les siècles.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Hirundo Maris, ensemble à géométrie variable rassemblant différents solistes, enchante les amateurs de musique par sa diversité sonore. Son premier disque sera disponible au printemps 2012 sous le prestigieux label ECM.</p>', 'uploads/img_hirundo_maris', '', 0, 1),
(12, 15, 1, 'Marquis de Saxe', '<p>Fondé en automne 1988 au Conservatoire de Lausanne et après avoir connu divers changements, Marquis de Saxe est constitué depuis 2000 de saxophonistes tous en possession d''un 1er prix de virtuosité. Ils travaillent comme pédagogues dans les Conservatoires de Sion, Lausanne, Fribourg et Morges (COV), ainsi qu''à la HEM de Lausanne et à l''Ecole de Musique de Lucerne.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>En 1990, Marquis de Saxe remporte un 2ème prix au Concours National de Musique Contemporaine de la fondation B.A.T.; à cette occasion, il interprétait entre autres la première pièce écrite spécialement à son intention par Alexis Chalier. Depuis, le quatuor entretient diverses collaborations avec les compositeurs Jean-François Bovard, Andor Kovach, Jean-François Michel, Claude Ferrier, Claude Prior ou encore avec Dominique Gesseney Rappo à qui le quatuor a commandé un concerto pour quatuor de saxophones et orchestre symphonique qui est créé lors d''une tournée de concerts en novembre 2011.</p></p>\r\n\r\n<p><br/></p>\r\n\r\n<p>\r\nLes succès obtenus en concerts dans toute la Suisse mais aussi en France, en Roumanie, en Slovénie et en Autriche encouragent le quatuor à partir à la recherche de nouvelles couleurs à travers des répertoires éclectiques mêlant les grandes oeuvres du répertoire à la musique contemporaine et au rire.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>\r\nEn 2004, il obtient le droit exceptionnel d''arrangement et d''interprétation de <i>L''histoire de Babar</i> de Francis Poulenc. Dans une mise en scène de Sylviane Tille, ce concert/spectacle continue de connaître un succès sans précédent. Parallèlement, Marquis de Saxe initie les écoles à l''univers du saxophone à travers son spectacle maison <i>Sax and the city</i>. En 2007, il collabore avec le quatuor Clair-Obscur de Berlin pour une série de concerts en Suisse et dans la capitale allemande avec au programme un arrangement de <i>Pierre et le Loup</i> de Prokofiev pour huit saxophones. Ces deux dernières années, les <i>Variations Goldberg</i> de Jean-Sébastien Bach ont représenté le pilier de son activité dont le dernier concert a été donné en août 2011 au Festival Bach en Combrailles (Auvergne).</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>\r\nMarquis de Saxe a, jusqu''à ce jour, produit quatre disques.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>\r\nActuellement, Marquis de Saxe travaille sur plusieurs nouveaux projets en collaboration avec des artistes de renom et tous spécialisés dans leur art. Une tournée de plusieurs concerts est prévue en août 2012 avec le quatuor allemand Clair-Obscur pour présenter <i>L''Apprenti Sorcier</i> de Paul Dukas et <i>Les Planètes</i> de Gustav Holst. Accompagné de la soprano Carmela Konrad et l''alto Lilian Glanzmann, il fera un nouveau passage dans le répertoire baroque avec l''interprétation du <i>Stabat Mater</i> de Pergolesi. Enfin, Marquis de Saxe souhaite faire revivre <i>Le Carnaval des Animaux</i> de Saint-Saëns avec des textes de Sandra Korol et sur une mise en scène de Sylviane Tille.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>\r\n<a href="http://www.marquisdesaxe.ch" onclick="window.open(this.href, ''_blank''); return false;">www.marquisdesaxe.ch</a></p>', 'uploads/img_marquis_de_saxe', '', 0, 1),
(13, 16, 1, 'Festival de l''Orgue Ancien', '<p>Chaque samedi d''été, depuis plus de 40 ans, le Festival International de l''Orgue Ancien et de la Musique Ancienne de Valère convie le public à entendre en concert le plus ancien orgue encore jouable au monde (1435 env.).</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Des concertistes de renom présentent aux auditeurs des programmes variés et originaux et ils font vivre cet instrument vénérable installé à Valère depuis bientôt 600 ans.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Durant les mois de juillet et août, ce haut-lieu s''anime. Lors de ces récitals, c''est tout le vaisseau de pierre qui résonne et qui vibre : la musique magnifie loeuvre des bâtisseurs médiévaux. Les musiciens invités se réjouissent de jouer sur cet orgue unique. Ils s''ingénient à présenter un répertoire destiné à mettre en valeur les possibilités étonnantes de cet orgue historique de Valère.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p><a href="http://www.orgueancien-valere.ch" onclick="window.open(this.href, ''_blank''); return false;">www.orgueancien-valere.ch</a></p>', 'uploads/img_orgue_ancien', '', 0, 1),
(14, 14, 1, 'Les Riches Heures de Valère', '<p>Créée en 2008, l''Association Les Riches Heures de Valère a pour ambition, grâce à une programmation spécifique visant un niveau d''excellence, de mettre en valeur le site exceptionnel de Valère et de la vieille ville de Sion par l''organisation de concerts de musique ancienne et baroque.<br/></p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Les premières saisons ont notamment vu se produire à Sion Jordi Savall (<i>Temps retrouvé</i>), l''Ensemble Vocal de Lausanne & Michel Corboz (<i>Missa a quattro voci da cappella</i> de Claudio Monteverdi), le Hilliard Ensemble (<i>In Paradisum</i>), le Quatuor Sine Nomine (<i>Les sept dernières paroles du Christ en croix</i>, Joseph Haydn), Arianna Savall & Petter Udland Johansen (<i>Il viaggio d''Amore</i>), Stile Antico (<i>Song of songs</i>), l''Ensemble Daedalus & Roberto Festa (<i>O Vergin Santa non m''abbandonare</i>), l''Ensemble Musica Fiorita (<i>Nascente Maria</i>, Barbara Strozzi) ou encore le Huelgas Ensemble & Paul van Nevel (<i>Apogée de la polyphonie sacrée</i>). Concerto Soave, accompagné de Maria Cristina Kiehr et de Jean-Marc Aymes (<i>Il Canto delle Dame</i>), s''est produit en novembre dernier.<br/></p>\r\n\r\n<p><br/></p>\r\n\r\n<p><p><a href="http://www.lesrichesheuresdevalere.ch/" onclick="window.open(this.href, ''_blank''); return false;">www.lesrichesheuresdevalere.ch</a></p>', 'uploads/img_les_riches_heures_de_valere', '', 0, 1),
(15, 17, 1, 'Ouverture-Opéra', '<p>L''association Ouverture-Opéra oeuvre depuis 2006 à la création et à la promotion de spectacles lyriques.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Elle vise essentiellement deux buts: d''une part de favoriser, dans un encadrement professionnel, le développement de jeunes talents valaisans, principalement de chanteurs, mais également de tout créateur dont l''art peut contribuer à la réalisation d''un opéra, et d''autre part de répondre à l''attente d''un public valaisan amateur de chant et d''art lyrique en lui offrant des productions originales et inhabituelles d''un répertoire « traditionnel ».</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Sous la direction musicale de Jean-Luc Follonier et dans des mises en scènes exceptionnelles de Julie Beauvais, Ouverture-Opéra a présenté, à la Ferme-Asile de Sion, <i>Les Noces de Figaro</i> de Mozart (2006), <i>La Bohème</i> de Puccini (2008) et <i>Don Giovanni</i> de Mozart (2010). La troupe présentera <i>Alcina</i> de Haendel du 22 août au 12 septembre 2012.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p><a href="http://www.ouverture-opera.ch/" onclick="window.open(this.href, ''_blank''); return false;">www.ouverture-opera.ch</a></p>', 'uploads/img_ouverture_opera', '', 0, 1),
(16, 19, 1, 'Schola de Sion', '<p>Depuis plus de 80 ans, la Schola de Sion initie des jeunes valaisans au chant choral (solfège, travail vocal, travail du répertoire, prestations musicales publiques).</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Elle forme actuellement près de 150 chanteuses et chanteurs répartis en différents choeurs : le Choeur des Petits Nouveaux et le Choeur des Petites Nouvelles (6 à 9 ans), le Petit Choeur de filles (9 à 11 ans), le Grand Choeur de filles (dès 12 ans), les Petits Chanteurs (dès 9 ans), le Choeur d''hommes (dès la mue) et l''Ensemble vocal.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>La Schola de Sion présente environ 45 prestations publiques par année (concerts et offices) et assure plus de 20 heures de formation musicale hebdomadaire.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p><p><a href="http://www.schola-sion.ch/" onclick="window.open(this.href, ''_blank''); return false;">www.schola-sion.ch</a></br><a href="https://www.facebook.com/scholadesion">facebook</a></p>', 'uploads/img_schola', '', 0, 1),
(17, 12, 2, 'Extraits musicaux', '', 'uploads/sound_bertrand_bochud', '', 0, 2),
(18, 13, 2, 'Extraits musicaux', '', 'uploads/sound_hirundo_maris', '', 0, 4),
(21, 17, 1, 'Productions passées', '<p>\r\n<strong>2010</strong> <i>Don Giovanni</i>, Wolfgang Amadeus Mozart\r\n<br/><br/>\r\n<strong>2008</strong> <i>La Bohème</i>, Giacomo Puccini\r\n<br/><br/>\r\n<strong>2006</strong> <i>Les Noces de Figaro</i>, Wolfgang Amadeus Mozart\r\n</p>', '0', '', 0, 2),
(23, 14, 1, 'Concerts', '<p><strong>Edition 2011</strong><br/><br/>\r\n18 novembre<br/>\r\n<strong>Concerto Soave</strong><br/>\r\nJean-Marc Aymes et Maria Cristina Kiehr<br/>\r\n<i>Il Canto delle Dame</i>\r\n<br/><br/>\r\n16 octobre<br/>\r\n<strong>Huelgas Ensemble</strong><br/>\r\nPaul Van Nevel<br/>\r\n<i>Apogée de la polyphonie sacrée</i><br/>\r\nGiovanni Pierluigi da Palestrina, Robert White et Orlando deLassus\r\n<br/><br/>\r\n25 septembre<br/>\r\n<strong>Ensemble Musica Fiorita</strong><br/>\r\nDaniela Dolci<br/>\r\n<i>Nascente Maria</i><br/>\r\nBarbara Strozzi<br/>\r\n<br/>\r\n12 juin<br/>\r\n<strong>Ensemble Daedalus</strong><br/>\r\nRoberto Festa<br/>\r\n<i>O Vergin Santa non m''abbandonare</i><br/>\r\n<br/>\r\n28 mai<br/>\r\n<strong>Ensemble vocal Stile Antico</strong><br/>\r\n<i>Cantique des cantiques</i><br/>\r\nGiovanni Pierluigi da Palestrina, Orlano de Lassus, Tomás Luis de Victoria...<br/>\r\n<br/>\r\n24 avril<br/>\r\n<strong>Jeunes artistes professionnels valaisans</strong><br/>\r\nEnsemble Fratres et Marie-Marthe Claivaz<br/>\r\n<i>Stabat Mater</i><br/>\r\nLuigi Boccherini<br/>\r\n<br/>\r\n<br/>\r\n<strong>Edition 2010</strong>\r\n<br/><br/>\r\n24 octobre<br/>\r\n<strong>Jordi Savall, Ferran Savall et Pedro Estevan</strong><br/>\r\n<i>Le Temps Retrouvé</i><br/><br/>\r\n17 octobre<br/>\r\n<strong>Ensemble Vocal de Lausanne</strong><br/>\r\nMichel Corboz<br/>\r\nMesse & motets<br/>\r\nClaudio Monteverdi <br/>\r\n<br/>\r\n28 mai<br/>\r\n<strong>Ensemble Hirundo Maris</strong><br/>\r\nArianna Savall<br/>\r\nHeinrich Schütz, Johann Sebastian Bach et Dietrich Buxtehude<br/>\r\n<br/>\r\n4 avril<br/>\r\n<strong>Jeunes artistes professionnels valaisans</strong><br/>\r\nCarole Rey, Sylviane Bourban, Julien Zufferey, Hiroko Yamamoto-Croisier,<br/>Laurent Galliano, Matthias Walpen et Lionel Monnet<br/>\r\n<i>Stabat Mater</i><br/>\r\nGiovanni Battista Pergolesi<br/>\r\n<br/>\r\n<br/>\r\n<strong>Edition 2009</strong>\r\n<br/><br/>\r\n18 octobre<br/>\r\n<strong>Ensemble Vocal de Lausanne</strong><br/>\r\nMichel Corboz<br/>\r\n<i>Laudate Dominum</i>, <i>Gloria</i> a 7, <i>Magnificat</i> a 6<br/>\r\nClaudio Monteverdi<br/>\r\n<i>Jephte</i><br/>\r\nGiacomo Carissimi<br/><br/>\r\n12 juin<br/>\r\n<strong>Hilliard Ensemble</strong><br/>\r\n<i>In Paradisum</i><br/>\r\nTomás Luis de Victoria et Giovanni Pierluigi da Palestrina<br/><br/>\r\n30 mai<br/>\r\n<strong>Quatuor Sine Nomine</strong><br/>\r\n<i>Les sept dernières paroles du Christ en croix</i> (Hob. III/50-56)<br/>\r\nJoseph Haydn<br/>\r\n<br/>\r\n12 avril<br/>\r\n<strong>Marquis de Saxe</strong><br/>\r\nConcert pour les enfants: <i>L''histoire de Babar</i><br/>\r\n<i>Variations Goldberg</i><br/>\r\nJohan Sebastian Bach<br/><br/>\r\n<br/>\r\n<strong>Edition 2008</strong><br/><br/>\r\n13 et 14 septembre<br/>\r\n<strong>Brigitte Balleys, Michel Brodard</strong><br/>\r\nMatthias Spaeter, Hager Spaeter, Daniela Numico<br/>\r\nOeuvres de Claudio Monteverdi et Heinrich Schürz</p></p></p></p>', '0', '', 0, 2),
(25, 13, 1, 'Petter Udland Johansen, ténor', '<p>Né à Oslo où il reçoit sa première formation vocale et instrumentale, Petter Udland Johansen obtient un diplôme de chant à la Musikhøyskole Norges. Il se perfectionne ensuite avec Ingrid Bjoner et Svein Bjørkøy, puis à la Schola Cantorum Basiliensis avec Richard Levitt. Le ténor Hans Peter Blochwitz lui apporte un supplément de formation vocale.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Son répertoire d''opéra et de concerts comprend les oeuvres majeures de compositeurs tels que J.S. Bach, C. Monteverdi, W.A Mozart, F. Mendelssohn ou encore des pièces de F. Schubert, E. Grieg, H. Wolf, G. Mahler, E. Grieg et J. Brahms. Petter Udland Johansen a travaillé avec les chefs Rinaldo Alessandrini, Jordi Savall, Pep Prats, Christer Løvold, Tom et Tobias Kjellum Gossmann.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Petter Udland Johansen a participé à des concerts et des enregistrements de CD avec de nombreux ensembles, notamment Hirundo Maris, Pechrima, Sagene anneau, Capella Antiqua Bambergensis, Pratum Musicum, La Morra, Ferarra et Lucidarium.\r\nEn 2009, il fonde avec sa partenaire, Arianna Savall, l''ensemble Hirundo Maris. Cette formation a une activité régulière de concerts dans la plupart des pays d''Europe. Le premier CD, Chants du Sud et du Nord, de l''ensemble sera disponible au printemps 2012, sous le prestigieux label ECM.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Petter Udland Johansen fonde, en collaboration avec Christer Løvold et Mark B. Lay, le trio vocal Pechrima dont les programmes allient compositions personnelles et répertoire traditionnel. Leur premier disque sort en 2011.</p>\r\n\r\n<p>Petter Udland Johansen est également reconnu comme compositeur et arrangeur. Il donne régulièrement des cours de chant choral et de soliste.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p><a href="http://petterudland.com">www.petterudland.com</a> </p>', '0', '', 0, 3),
(26, 13, 3, 'Extrait vidéo', '<iframe width="420" height="315" src="http://www.youtube.com/embed/v3Xptfn2DnA?rel=0" frameborder="0" allowfullscreen></iframe>', '0', 'v3Xptfn2DnA', 0, 5),
(28, 15, 2, 'Extraits musicaux', '', 'uploads/sound_marquis_de_saxe', '', 0, 3),
(30, 19, 1, 'Prestations', '<p>Basé sur un répertoire de qualité, ce patient travail de formation se concrétise, tout au long de l''année, dans une riche activité d''animation liturgique, avant tout dans la Paroisse du Sacré-Coeur ainsi que lors des offices épiscopaux à la Cathédrale de Sion. Divers concerts a cappella ou avec orchestre constituent en outre une part essentielle des prestations des différents choeurs de la Schola.</p>\r\n\r\n<p><br/><p>\r\n<p>A ces activités s''ajoutent de fréquents contacts avec d''autres formations similaires. Camps et voyages (France, Italie, Espagne, Grèce, Israël, Belgique, Russie, Canada), permettent à tous les chanteuses et chanteurs de la Schola de vivre une expérience humaine profondément originale, qui associe enfants, adolescents et adultes autour d''un idéal commun.</p>', '0', '', 0, 2),
(32, 16, 1, 'Concerts', '<p><strong>Edition 2011</strong>\r\n<br/></p>\r\n\r\n<table>\r\n<tr>\r\n<td>9 juin</td> \r\n<td>Maurizio Croci</td>\r\n<td>Varèse, Italie</td>\r\n</tr>\r\n<tr>\r\n<td>16 juillet</td>\r\n<td>Sander van Marion</td>\r\n<td>Schevenigen, Pays-Bas</td>\r\n</tr>\r\n<tr>\r\n<td>23 juillet</td>\r\n<td>Daniel Meylan</td>\r\n<td>Le Brassus, Suisse</td>\r\n</tr>\r\n<tr>\r\n<td>30 juillet     </td>\r\n<td>Dimitri Goldobine</td>\r\n<td>Cannes, France</td>\r\n</tr>\r\n<tr>\r\n<td>6 août</td>\r\n<td>Carolyn Shuster Fournier</td>\r\n<td>Paris, France</td>\r\n</tr>\r\n<tr>\r\n<td>13 août</td>\r\n<td>Luigi Celeghin</td>\r\n<td>Frascati Roma, talie</td>\r\n</tr>\r\n<tr>\r\n<td>20 août</td>\r\n<td>Juan Maria Pedrero Encabo     </td>\r\n<td>Zamora, Espagne</td>\r\n</tr>\r\n</table><br/>\r\n<br/>\r\n<strong>Edition 2010</strong>\r\n<br/>\r\n<table>\r\n<tr>\r\n<td>10 juillet     </td>\r\n<td>Mario Duella</td>\r\n<td>Pray, Italie</td>\r\n</tr>\r\n<tr>\r\n<td>17 juillet</td>\r\n<td>Pierre Thimus</td>\r\n<td>Liège, Belgique</td>\r\n</tr>\r\n<tr>\r\n<td>24 juillet</td>\r\n<td>Gwendolyn Toth</td>\r\n<td>New York, USA</td>\r\n</tr>\r\n<tr>\r\n<td>31 juillet</td>\r\n<td>Thilo Muster</td>\r\n<td>Bâle, Suisse</td>\r\n</tr>\r\n<tr>\r\n<td>7 août</td>\r\n<td>Maurizio Pergelier</td>\r\n<td>Klagenfurt, Autriche</td>\r\n</tr>\r\n<tr>\r\n<td>14 août</td>\r\n<td>Josep Marie Mas I Bonet          </td>\r\n<td>Reus-Tarragona, Espagne</td>\r\n</tr>\r\n<tr>\r\n<td>21 août</td>\r\n<td>Silvano Rodi</td>\r\n<td>Ventimiglia, Italie</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>François Dujardin</td>\r\n</tr>\r\n</table>\r\n\r\n<p><br/>\r\n<br/>\r\n<strong>Edition 2009</strong>\r\n<br/></p>\r\n\r\n<table>\r\n<tr>\r\n<td>4 juillet</td>\r\n<td>Ensemble vocal de la Schola   </td>\r\n<td>Sion, Suisse</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Marc Bochud<td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Philippe Despont</td>\r\n<td>Lausanne, Suisse</td>\r\n</tr>\r\n<tr>\r\n<td>11 juillet     </td>\r\n<td>Wijnand van de Pool</td>\r\n<td>Amelia, Italie</td>\r\n</tr>\r\n<tr>\r\n<td>18 juillet</td>\r\n<td>Josef Stolz</td>\r\n<td>Vienne, Autriche</td>\r\n</tr>\r\n<tr>\r\n<td>25 juillet</td>\r\n<td>Zsigmund Szathmary</td>\r\n<td>Ehrenkirchen, Allemagne</td>\r\n</tr>\r\n<tr>\r\n<td>1<sup>er</sup> août</td>\r\n<td>Guy Bovet</td>\r\n<td>Neuchâtel, Suisse</td>\r\n</tr>\r\n<tr>\r\n<td>8 août</td>\r\n<td>Georges Athanasiadès</td>\r\n<td>St-Maurice, Suisse</td>\r\n</tr>\r\n<tr>\r\n<td>15 août </td>\r\n<td>François Seydoux</td>\r\n<td>Fribourg, Suisse</td>\r\n</tr>\r\n<tr>\r\n<td>22 août</td>\r\n<td>Schola Cantorum di Santa</td>\r\n<td>Belluno, Italie</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Simone Gheller</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Fabrizio Da Ros</td>\r\n</tr>\r\n</table>', '0', '', 0, 2),
(33, 16, 1, 'Le Festival raconté par son fondateur', '<p><i>L''orgue de Valère, une histoire parfumée comme du bon vin vieilli en fût de chêne. J''y ai goûté. Sa musicalité, l''attrait de sa lumière, de son bois, ont marqué d''abord mon enfance puis ma vie toute entière.</i></p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Né à Valère où ma famille est au service de l''Etat et du Vénérable Chapitre depuis 1871, j''ai eu le privilège de découvrir très tôt les trésors fabuleux du Château et de son Eglise. Je fus ainsi interpellé et troublé par le silence du vieil instrument de Valère. </p>\r\n\r\n<p><br/></p>\r\n\r\n<p>En 1948, date de ma nomination à Valère, je m''engageai à chercher le meilleur moyen pour rendre la voix à ce vieil orgue devenu aphone depuis le transfert du Chapitre à la Résidence des Glariers au début du XIXe siècle. Cinq ans plus tard, la visite du professeur anglais Babington Smith du Eton College de Windsor, constitua l''amorce d''un important changement en faveur de la rénovation de l''orgue de Valère. C''est grâce au dévouement, à l''inlassable opiniâtreté et, il faut bien le préciser, à la haute compétence de l''expert bernois bien connu Ernst Schiess que l''orgue de Valère doit d''avoir retrouvé sa voix d''antan, à nulle autre pareille. Avec l''aide non moins enthousiaste du conservateur des monuments historiques de Bâle, le Dr Rudolf Riggenbach, M. Schiess parvint à mettre à exécution son plan de restauration. En la maison Th. Kuhn de Männedorf, on avait trouvé les spécialistes qui réveilleraient l''instrument de son sommeil maladif. Le Vénérable Chapitre de la Cathédrale de Sion à la tête duquel se dépensait sans compter son Doyen, Mgr Clemens Schnyder, n''avait tout de même pas des ressources suffisantes pour garantir en totalité le paiement de l''important devis. La générosité du Dr Riggenbach, ainsi que de quelques mécènes, permit le financement des travaux de restauration des orgues de Valère, sans oublier évidemment le don privé du professeur Babington Smith, modeste il est vrai, mais fait de bon coeur ; son geste émouvant n''a pas été oublié...</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Un beau jour donc, l''orgue fut démonté pièce par pièce, instant où le « suspense » devint quotidien, car l''opération était délicate, vu l''état vétuste des volets du buffet notamment, avec lesquels on croyait un moment ne jamais pouvoir arriver à destination, tant les toiles du XVe siècle étaient endommagées et décomposées... Je fis le long voyage au Kunstmuseum de Bâle en train. Etant donné la grande valeur de ces oeuvres, et la crainte qu''elles soient endommagées au cours du voyage, je me décidai à les accompagner dans la soute du wagon-marchandise pour les garder à portée de vue. Drôle de périple ! Enfin... Le Dr Paulo Cadorin, restaurateur en chef du Kunstmuseum de Bâle, les a efficacement restaurées, cela grâce à une connaissance parfaite et un dévouement total. Quant à l''orgue, il avait pris le chemin de Männedorf où tout a été revu. Bientôt, l''ensemble de cette oeuvre d''art picturale et musicale était remonté à Sion. L''orgue était sauvé et on pouvait s''apprêter à fêter sa résurrection. </p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Mon rêve se réalisait ! Après plus d''un siècle de silence, les voûtes de l''Eglise-Cathédrale de Valère répercutèrent à nouveau le son des orgues dans leur pureté originelle. Quel événement ! Dès ce moment, une idée fit son chemin dans mon esprit : partager cette richesse avec d''autres amateurs d''orgue et de musique ancienne. C''est ainsi que, avec ma femme et mes enfants, en collaboration étroite avec mon ami Jean-Jacques Gramm (fondateur et directeur du Musée suisse de l''orgue à Roche), nous nous sommes lancés, en 1969, dans l''organisation de concerts, que nous annoncions simplement par le moyen de pancartes apposées à l''entrée de l''église où passaient tous les visiteurs. Lors du premier concert, nous avons été stupéfaits par le nombre d''auditeurs venus assister à l''inauguration sonore de ce vieil instrument. Encouragés, nous avons renouvelé l''expérience quelques samedis plus tard, puis, devant l''intérêt grandissant accordé à ces manifestations, nous avons décidé d''entreprendre l''organisation d''un Festival de l''orgue ancien, avec un programme structuré pour chaque saison estivale. Ne disposant pas de moyens financiers pour l''achat de mobilier fixe à l''église de Valère, pendant plusieurs années, à l''occasion du Festival, chaque vendredi soir, nous nous rendions, mes deux fils et moi, au Musée de la Majorie, pour y chercher cent chaises, que nous portions à dos d''homme jusqu''à l''église de Valère, ceci afin que le public puisse s''asseoir durant le concert. De surcroît, rappelons qu''aucune finance d''entrée n''était prélevée. Une simple collecte permettait tout juste à payer le soliste du jour. Quant à la gestion du Festival, aux frais d''organisation y incombant, l''argent du ménage en assurait la continuité. </p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Au cours des conversations avec d''éminents organologues et organistes, j''apprenais l''existence d''une abondante et précieuse littérature musicale, oubliée dans des archives de nombreux pays : des partitions soigneusement ficelées comportant souvent la mention « injouable ». A Valère, ces chefs-d''oeuvres composés dès le XIIe siècle, pouvaient enfin revivre dans leur tonalité originelle. Ce qui n''était plus possible sur un instrument de facture postérieure à la seconde moitié du XVIIe siècle, le redevenait sur les quatre jeux gothiques, et surtout, sur le clavier archaïque des orgues de Valère. Rappelons pour mémoire que, vers 1687, le vénérable Chapitre demanda au facteur d''orgues Christopher Aeby de Soleure, de restaurer l''orgue, qui fut alors agrandi de quelques jeux. </p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Le Festival International de l''Orgue Ancien célébra en 1989 son 20e anniversaire. A cette occasion, une association des amis du Festival fut créée afin de m''aider à préparer et soutenir l''organisation des saisons estivales et en garantir la pérennité. </p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Depuis le début, la priorité a toujours été accordée à des oeuvres de caractère spirituel. Les organistes sélectionnés ont pour la plupart respecté cette demande, soit pour l''établissement de leur programme, soit pour l''interprétation des oeuvres retenues. Mon voeu le plus cher est que cette tradition soit maintenue puisque le caractère sacré des lieux le recommande.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>L''édition 2009 du Festival est la 40e du nom !!! J''espère vivement que Valère restera un haut lieu de rencontre pour les personnes désireuses de continuer à vivre cette aventure...</p>\r\n\r\n<p><br/>Maurice Wenger<br/>\r\nMai 2009</p>', '0', '', 0, 4),
(34, 16, 1, 'L''église de Valère et son orgue', '<p>Jusqu''à la fin du XVIIIe siècle, Valère servit de résidence au vénérable chapitre de la cathédrale de Sion. L''église collégiale, centre spirituel du bourg capitulaire revêtit son architecture gothique au XIIIe siècle tout en conservant nombre d''éléments antérieurs de style roman. Une vaste campagne de décoration (peintures murales, orgue) fut entreprise sous Guillaume de Rarogne, doyen du chapitre et futur évêque de Sion, dans les années 1430. Le XVIIe siècle adapta l''ensemble (nouvelles stalles, réfection de l''orgue, etc.) aux exigences de la contre-réforme. Peu à peu délaissé ensuite, le site parvint délabré mais préservé aux restaurateurs de la fin du XIXe siècle.\r\n<br/><br/>\r\n\r\nEn 1883 déjà, l''organologue anglais Arthur George Hill attira l''attention sur l''orgue, l''un des plus anciens ayant conservé une grande partie de son matériel sonore. Les soufflets étant crevés, il fallut cependant attendre la restauration de 1954 pour que l''instrument retrouve sa voix. Des problèmes d''étanchéité conduisirent à une nouvelle rénovation dès 2004.\r\n<br/></p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Le progrès des connaissances historiques sur Valère, les recherches du Dr. Friedrich Jakob (Die Valeria-Orgel, Verlag der Fachvereine Zürich, 1991) et quelques éclairages nouveaux apportés par la récente restauration ont permis d''écarter les nombreuses légendes entourant l''origine de l''instrument et de préciser les différentes interventions jalonnant le cours de sa longue histoire. Dès lors, on peut établir la chronologie suivante :<br/><br/></p>\r\n\r\n<p><strong>1435 environ</strong> : construction de l''orgue par un artisan inconnu pour l''église de Valère avec des volets peints par Peter Maggenberg. <br/>\r\n<br/>\r\n\r\n<strong>1630 environ</strong> : édification de la tribune en nid d''hirondelle fixée à la paroi ouest (on ignore la situation originelle de l''instrument dans l''église).<br><br/>\r\n\r\n<strong>1687</strong> : Christoph Aebi de Soleure réalise le sommier actuel à registres et modifie l''instrument en conservant cependant un maximum de matériel ancien. Le clavier s''élargit d''une octave et trouve son ambitus définitif.<br><br/>\r\n\r\n<strong>1786</strong> : Felix Carlen réalise quelques travaux dont la réfection totale de la soufflerie.<br><br/>\r\n\r\n<strong>1812</strong> : Johann Baptist Carlen ajoute les gros tuyaux de pédale que l''on voit derrière l''orgue et répare les soufflets.<br><br/>\r\n\r\n<strong>1954</strong> : Installation d''une soufflerie électrique. Remise en fonction de l''orgue par la maison Th. Kuhn de Maennedorf (Ernst Schiess, expert). Restauration des peintures des volets au musée d''art de Bâles (Dr. Rudolf Riggenbach et Dr. Paolo Cadorin).<br><br/>\r\n\r\n<strong>2004</strong> : Démontage total de l''instrument pour restauration par la manufacture Füglister Sàrl de Grimisuat (Norbert Julier contremaître). Remise en fonction de l''ancienne soufflerie à bras (un moteur électrique gonfle désormais les anciens soufflets cunéiformes au cas où l''on n''a pas de souffleur). Au cours de ces travaux, des analyses scientifiques ont permis de prouver que certaines pièces que l''on croyait du XVIIe siècle remontent en fait aux origines de l''instrument (bois de nombreuses touches du clavier, tuyaux de la Copel 4'', barrages du sommier).<br><br/>\r\nEdmond Voeffray</p>', '0', '', 0, 5),
(35, 16, 1, 'Engagement de l''agence', '<p><p>Gestions administrative, organisationnelle, promotionnelle et financière en collaboration avec le comité du festval.\r\n<br/><br/>\r\n<strong>Comité de l''association</strong><br/><br/></p>\r\n\r\n<table>\r\n<tr>\r\n<td><strong>Président</strong></td>\r\n<td> &nbspMaurice Wenger, directeur et fondateur</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Administrateur</strong></td>\r\n<td> &nbspFrédéric Studer</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Secrétaire</strong></td>\r\n<td> &nbspBerthy Wenger</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Membres</strong></td>\r\n<td> &nbspJean-Marc Aymon</td>\r\n</tr>\r\n<tr>\r\n<td></td>\r\n<td> &nbspVéronique Dubuis</td>\r\n</tr>\r\n<tr>\r\n<td></td>\r\n<td> &nbspJean-Pascal Fournier</td>\r\n</tr>\r\n<tr>\r\n<td></td>\r\n<td> &nbspJean-Jacques Gramm</td>\r\n</tr>\r\n<tr>\r\n<td></td>\r\n<td>&nbsp Chne Erwin Jossen</td>\r\n</tr>\r\n<tr>\r\n<td></td>\r\n<td> &nbspChristian Studer</td>\r\n</tr>\r\n<tr>\r\n<td></td>\r\n<td> &nbspEdmond Voeffray</td>\r\n</tr>\r\n<tr>\r\n<td></td>\r\n<td>&nbsp Roland Wenger</tr>\r\n<tr>\r\n<td><strong>Comptable</strong></td>\r\n<td> &nbspRosemarie Studer</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Preneur de son</strong></td>\r\n<td> &nbspJean-Pierre Rosset</td>\r\n</tr>\r\n</table>', '0', '', 0, 6),
(36, 14, 1, 'Engagement de l''agence', '<p><p><p>Gestions administrative, organisationnelle, promotionnelle et financière en collaboration avec le comité de l''association.\r\n<br/><br/>\r\n<strong>Comité de l''association</strong><br/><br/></p>\r\n\r\n<table>\r\n<tr>\r\n<td><strong>Président</strong></td>\r\n<td>&nbsp&nbspPhilippe Varone</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Administrateur</strong></td>\r\n<td>&nbsp&nbspFrédéric Studer</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Membres</strong></td>\r\n<td>&nbsp&nbspAndré Gillioz</td>\r\n</tr>\r\n<td></td>\r\n<td>&nbsp&nbspPierre Gillioz</td>\r\n</tr>\r\n</table>', '0', '', 0, 3),
(37, 17, 1, 'Engagement de l''agence', '<p><p>Gestions administrative, organisationnelle, promotionnelle et financière en collaboration avec le comité de l''association.\r\n<br/><br/>\r\n<strong>Comité de l''association</strong><br/><br/></p>\r\n\r\n<table>\r\n<tr>\r\n<td><strong>Président</strong></td>\r\n<td>  Jacques de Lavallaz</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Directeur musical</strong></td>\r\n<td>  Jean-Luc Follonier</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Metteur en scène</strong></td>\r\n<td>  Julie Beauvais</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Administrateur</strong></td>\r\n<td>  Frédéric Studer</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Membres</strong></td>\r\n<td>  Christian Bitchnau</td>\r\n</tr>\r\n<td></td>\r\n<td>  Pierre Gillioz</td>\r\n</tr>\r\n</table>', '0', '', 0, 4),
(38, 19, 1, 'Engagement de l''agence', '<p><p><p><p>Gestions administrative, organisationnelle, promotionnelle et financière en collaboration avec le bureau et le comité.\r\n<br/><br/></p>\r\n\r\n<table>\r\n<tr>\r\n<td><strong>Bureau</strong>\r\n<tr>\r\n<td><strong>Président</strong></td>\r\n<td>&nbsp&nbspAndré Gillioz</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Directeur musical</strong></td>\r\n<td>&nbsp&nbspMarc Bochud</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Administrateur</strong></td>\r\n<td>&nbsp&nbspFrédéric Studer</td>\r\n</tr>\r\n</table>', '0', '', 0, 5),
(40, 15, 1, 'Les musiciens', '<p><strong>Elie Fumeaux - saxophone soprano</strong><br/>\r\nNé en 1962, Elie Fumeaux fait ses classes de saxophone chez André Vivian, Michel Surget puis Jean-Georges Koerper, au Conservatoire de Lausanne. Il obtient en 1990 un 1er prix de virtuosité avec félicitations du Jury. En 1991, il obtient plusieurs prix au concours U.F.A.M. à Paris ainsi qu''au Mémorial Stéphane Clivaz en Suisse. Membre fondateur de l''ensemble de saxophone Saxophilie ainsi que du quatuor Marquis de Saxe, Elie Fumeaux a par ailleurs enregistré un CD en soliste avec l''orchestre de Craïova (Roumanie). Il enseigne le saxophone aux Conservatoires de Sion et Lausanne. Depuis septembre 2007, il est nommé professeur de pédagogie didactique à la HEM de Lausanne. Il dirige diverses formations instrumentales.![alt text][1]<br/>\r\n<br/>\r\n<strong>Philippe Savoy - saxophone alto</strong><br/>\r\nNé en 1976, Philippe Savoy obtient son diplôme de concert en 2000 à la Musikhochschule de Zürich dans la classe de J.-G. Koerper. Il obtient ensuite des 1ers prix au C.J.M.S., au Concours National d''Exécution Musicale à Riddes ainsi qu''au Concours Léopold Bellan à Paris. Depuis, Philippe Savoy a donné de nombreux concerts (récitals, tournées,...) en Suisse et à l''étranger (Colombie, Canada, Maroc, Brésil, Chine, Japon, Australie,...) et est régulièrement engagé comme soliste. À deux reprises, il a obtenu le prix des coopératives Migros ainsi que la bourse Friedl-Wald Stiftung. Il enseigne le saxophone au Conservatoire de Fribourg (Bulle) et collabore avec de nombreux orchestres (OCL, OSR, Orchestre de Verbier,...). Philippe Savoy dirige également des formations chorales (Choeur St-Michel de Fribourg, Chanson du Moulin de Neyruz) et instrumentales.<br/>\r\n<br/>\r\n<strong>Alain Dobler - saxophone ténor</strong><br/>\r\nNé en 1974 à Lucerne, Alain Dobler obtient en 1999 son diplôme d''enseignement avec distinction dans la classe de Beat Hofstetter (Lucerne). Il poursuit ses études à la Hochschule de Bâle dans la classe de Marcus Weiss et clôt ces dernières avec un diplôme de Concert. En 1999, il obtient le 2e prix du Concours National d''Exécution Musicale à Riddes et reçoit en 2000 le prix de la Friedl Wald Stiftung. Sa formation de saxophoniste est également ponctuée par des master-class auprès de Claude Delangle (Paris), Jean-Yves Fourmeau (Paris), Kyle Horch (London) et Johannes Ernst (Berlin). Alain Dobler collabore avec l''orchestre symphonique de Lucerne (LSO), le 21st Century Orchestra et l''Ensemble Beaufort. Il enseigne à l''école de musique de Lucerne.<br/>\r\n<br/>\r\n<strong>Nicolas Logoz - saxophone baryton</strong><br/>\r\nNé en 1968, Nicolas Logoz bénéficie des cours de Michel Surget et Jean-Georges Koerper au Conservatoire de Lausanne. Il clôt brillamment ses études avec un 1er prix de virtuosité et félicitations du Jury en 1997. Membre fondateur du quatuor Marquis de Saxe, Nicolas Logoz obtient, en 1994, le Brevet de maître de musique. Il est actuellement professeur de saxophone dans les écoles de musique de la région lémanique.</p>', 'uploads/img_marquis_de_saxe', '', 0, 2),
(41, 4, 1, 'Roberto Festa', '<p>Roberto Festa, flûtiste, s''est formé au Conservatoire G. B. Martini de Bologna (Italie) dans la classe de Giorgio Pacchioni avant d''être l''élève de Gabriel Garrido au Centre de Musique Ancienne de Genève. Il se perfectionne à la Schola Cantorum Basiliensis auprès de Michel Piguet. <br/><br/></p>\r\n\r\n<p>Sa participation à de nombreux stages conduits par Frans Bruggen, Kees Boeke, Sigiswald Kuijken, et les cours tenus par Nikolaus Harnoncourt au Mozarteum de Salzburg, l''orientent vers le répertoire baroque de musique de chambre. Il se produit en soliste avec le Collegio Italiano (dir. Gustav LeonharDt) et l''orchestre de la R.A.I.<br/><br/></p>\r\n\r\n<p>Il aborde, ensuite, le répertoire médiéval et renaissance grâce aux rencontres et aux collaborations avec Paul van Nevel et Dominique Vellard, figures déterminantes dans son évolution. Roberto Festa fonde en 1986 l''Ensemble Daedalus. Celui-ci se produit dans les plus prestigieux festivals européens et enregistre 12 disques. Dès 2009, Roberto Festa est le directeur artistique du Festival Muse Salentine (Specchia, Italie) et en 2011 est nommé Artiste invité au Festival du Haut-Jura (France).</p>', '0', '', 0, 2),
(42, 4, 1, 'Concerts ', '<p><p>L''Ensemble Daedalus s''est produit, entre autres, dans les Festivals suivants:<br/><br/></p>\r\n\r\n<table>\r\n<tr>\r\n<th align=left><strong>AUTRICHE</strong></th>\r\n</tr>\r\n<tr>\r\n<td>Graz</td>\r\n<td>Festival Eurograz ''93</td>\r\n<td>1993</td>\r\n</tr>\r\n<tr>\r\n<td>Wien</td>\r\n<td>Resonanzen</td>\r\n<td>1999-2000-2002</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n</tr>\r\n<tr>\r\n<th align=left><STRONG>BELGIQUE</STRONG></th>\r\n</tr>\r\n<tr>\r\n<td>Alst</td>\r\n<td>Festival Radio 3 in de Stad</td>\r\n<td>1992</td>\r\n</tr>\r\n<tr>\r\n<td>Antwerpen</td>\r\n<td>Antwerpen ''93</td>\r\n<td>1993-1998</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Festival Laus Poliphonie</td>\r\n<td>1996</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Festival van Vlaanderen (AMUZ)</td>\r\n<td>2011</td>\r\n</tr>\r\n<tr>\r\n<td>Bruxelles</td>\r\n<td>BoZar</td>\r\n<td>2002-2004</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Bozart</td>\r\n<td>2007</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Festival du Sablon</td>\r\n<td>2004</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Société Philarmonique de Bruxelles</td>\r\n<td>1999</td>\r\n</tr>\r\n<tr>\r\n<td>Brugge</td>\r\n<td>Festival van Vlaanderen</td>\r\n<td>1989-1991-1993-1995</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td> </td>\r\n<td>1996-1999-2006</td>\r\n<tr>\r\n<td> </td>\r\n<td>Festival de l''Ile de France</td>\r\n<td>1997-2000</td>\r\n</tr>\r\n<tr>\r\n<td>Gent</td>\r\n<td>Festival Van Vlaanderen</td>\r\n<td>1997</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>De Bijloke</td>\r\n<td>2002-2003-2004</td>\r\n</tr>\r\n<tr>\r\n<td>Liège</td>\r\n<td>Festival de Wallonie</td>\r\n<td>1997-1998</td>\r\n</tr>\r\n<tr>\r\n<td>Lowen</td>\r\n<td>Festival van Vlaanderen</td>\r\n<td>1997</td>\r\n</tr>\r\n<tr>\r\n<td>St-Niklaas</td>\r\n<td>Festival van Vlaanderen</td>\r\n<td>1996</td>\r\n</tr>\r\n<tr>\r\n<td>Ypres</td>\r\n<td>Festival van Vlaanderen</td>\r\n<td>1996</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n</tr>\r\n<th align=left><STRONG>ESPAGNE</STRONG></th>\r\n</tr>\r\n<tr>\r\n<td>Barcelona</td>\r\n<td>La Caixa Festival</td>\r\n<td>2003</td>\r\n</tr>\r\n<tr>\r\n<td>Gran Canaria</td>\r\n<td>Conciertos de Semana Santa</td>\r\n<td>2002</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n</tr>\r\n<tr>\r\n<th align=left><STRONG>FRANCE</STRONG></th>\r\n</tr>\r\n<tr>\r\n<td>Ambronay</td>\r\n<td>Festival d''Ambronay</td>\r\n<td>1994-2005</td>\r\n</tr>\r\n<tr>\r\n<td>Amiens</td>\r\n<td>Festival des Cathédrales</td>\r\n<td>1999-2000-2001-2002</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td> </td>\r\n<td>2003-2004-2005-2006</td>\r\n</tr>\r\n<tr>\r\n<td>Arques la Bataille</td>\r\n<td>Académie Bach</td>\r\n<td>2005-2006-2010</td>\r\n</tr>\r\n<tr>\r\n<td>Beaune</td>\r\n<td>Festival de Beaune</td>\r\n<td>1994</td>\r\n</tr>\r\n<tr>\r\n<td>Ecuen</td>\r\n<td>Festival d''Ecuen</td>\r\n<td>1998</td>\r\n</tr>\r\n<tr>\r\n<td>Erignac</td>\r\n<td>Festival du Périgord Noir</td>\r\n<td>2007</td>\r\n</tr>\r\n<tr>\r\n<td>Fontainebleau</td>\r\n<td>Institut National de l''Histoire de l''Art</td>\r\n<td>2011</td>\r\n</tr>\r\n<tr>\r\n<td>Fontevraud</td>\r\n<td>Festival de l''Abbaye de Fontevraud</td>\r\n<td>1998-1999</td>\r\n</tr>\r\n<tr>\r\n<td>Lille</td>\r\n<td>Archives départementales du Nord</td>\r\n<td>2010</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Festival Guillaume Dufay</td>\r\n<td>2002</td>\r\n</tr>\r\n<tr>\r\n<td>Nantes</td>\r\n<td>La Folle Journée</td>\r\n<td>2003</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Les Printemps Baroques</td>\r\n<td>2005</td>\r\n</tr>\r\n<tr>\r\n<td>Perpignan</td>\r\n<td>Festival de Musique Sacrée</td>\r\n<td>2003-2005</td>\r\n</tr>\r\n<tr>\r\n<td>Pigna</td>\r\n<td>Estivoce</td>\r\n<td>2001-2003</td>\r\n</tr>\r\n<tr>\r\n<td>Ribeauvillé</td>\r\n<td>Rencontres de Musique Ancienne</td>\r\n<td>1992-1994-2003-2010</td>\r\n</tr>\r\n<tr>\r\n<td>Royaumont</td>\r\n<td>Festival de l''Abbaye de Royaumont</td>\r\n<td>1993</td>\r\n</tr>\r\n<tr>\r\n<td>Saintes</td>\r\n<td>Académies Musicales</td>\r\n<td>1996-1998-2001-2004</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td> </td>\r\n<td>2006</td>\r\n</tr>\r\n<tr>\r\n<td>Savoie</td>\r\n<td>Musique et Patrimoine en Tarentaise</td>\r\n<td>2009</td>\r\n</tr>\r\n<tr>\r\n<td>St-Claude</td>\r\n<td>Festival du Haut-Jura</td>\r\n<td>1996-2011</td>\r\n</tr>\r\n<tr>\r\n<td>St-Philibert</td>\r\n<td>Musique Vagabonde</td>\r\n<td>2003</td>\r\n</tr>\r\n<tr>\r\n<td>Thoronet</td>\r\n<td>Festival du Thoronet</td>\r\n<td>1997-2001</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n</tr>\r\n<tr>\r\n<th align=left><strong>HOLLANDE</strong></th>\r\n</tr>\r\n<tr>\r\n<td>Alden-Biesen</td>\r\n<td>Internazionale Tage van de Oude Musick</td>\r\n<td>1992-1994-1996</td>\r\n</tr>\r\n<tr>\r\n<td>Rotterdam</td>\r\n<td>De Doelen</td>\r\n<td>2003</td>\r\n</tr>\r\n<tr>\r\n<td>Utrecht</td>\r\n<td>Concerts Spirituels</td>\r\n<td>2006</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Oude Muziek</td>\r\n<td>2011</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n</tr>\r\n<tr>\r\n<th align=left><STRONG>ITALIE</STRONG></th>\r\n</tr>\r\n<tr>\r\n<td>Arezzo</td>\r\n<td>Settembre Musicale</td>\r\n<td>2003-2004</td>\r\n</tr>\r\n<tr>\r\n<td>Bologna</td>\r\n<td>Feste Musicali Bolognesi</td>\r\n<td>1994-1997</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Festival di Musica Antica</td>\r\n<td>1988</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Teatro Comunale</td>\r\n<td>1994-2000</td>\r\n</tr>\r\n<tr>\r\n<td>Erice</td>\r\n<td>Musica Medievale e Rinascimentale</td>\r\n<td>1991-1994</td>\r\n</tr>\r\n<tr>\r\n<td>Messina</td>\r\n<td>Teatro Vittorio Emmanuele</td>\r\n<td>1994</td>\r\n</tr>\r\n<tr>\r\n<td>Milano</td>\r\n<td>Musica e Poesia a San Maurizio</td>\r\n<td>1988-1990-1992</td>\r\n</tr>\r\n<tr>\r\n<td>Napoli</td>\r\n<td>Centro di Musica Antica Pietà de Turchini</td>\r\n<td>2009</td>\r\n</tr>\r\n<tr>\r\n<td>Lucca</td>\r\n<td>Sagra Musica Lucchese</td>\r\n<td>1991</td>\r\n</tr>\r\n<tr>\r\n<td>Rome</td>\r\n<td>Villa Medici</td>\r\n<td>2003</td>\r\n</tr>\r\n<tr>\r\n<td>Segovia</td>\r\n<td>Festival de Segovia</td>\r\n<td>1994</td>\r\n</tr>\r\n<tr>\r\n<td>Specchia</td>\r\n<td>Muse Salentine</td>\r\n<td>2010</td>\r\n</tr>\r\n<tr>\r\n<td>Trento</td>\r\n<td>Trento Musica Antica</td>\r\n<td>1994</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n</tr>\r\n<tr>\r\n<th align=left><strong>SUISSE</strong></th>\r\n</tr>\r\n<tr>\r\n<td>Biasca e Ascoli</td>\r\n<td>Il Canto delle Pietre</td>\r\n<td>1992</td>\r\n</tr>\r\n<tr>\r\n<td>Fribourg</td>\r\n<td>Festival de Musique Sacrée</td>\r\n<td>1994-2000</td>\r\n</tr>\r\n<tr>\r\n<td>Genève</td>\r\n<td>Festival Amadeus</td>\r\n<td>2001</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Les Concerts Baroques</td>\r\n<td>1995</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Les concerts de Saint-Germain</td>\r\n<td>2007</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Les Concerts du Centre de Musique Ancienne</td>\r\n<td>1990-2003</td>\r\n</tr>\r\n<tr>\r\n<td>Lausanne</td>\r\n<td>Les Concerts de l''Évêché</td>\r\n<td>1988</td>\r\n</tr>\r\n<tr>\r\n<td>Rougemont</td>\r\n<td>La Folia</td>\r\n<td>2005-2006-2007</td>\r\n</tr>\r\n<tr>\r\n<td>Sion</td>\r\n<td>Festival Tibor Varga</td>\r\n<td>1997-2000</td>\r\n</tr>\r\n<tr>\r\n<td> </td>\r\n<td>Les Riches Heures de Valère</td>\r\n<td>2011</td>\r\n</tr>\r\n</table>', '0', '', 0, 3),
(44, 12, 1, 'Programmes', '<p><strong>DIE SCHÖNE MÜLLERIN</strong><br/>\r\nFranz Schubert<br/>\r\n<br/>\r\n<strong>BALADES EN FRANCE AVEC EMMANUEL CHABRIER</strong><br/>\r\nMélodies et duos d''Emmanuel Chabrier, Charles Gounod, Gabriel Fauré, Mel Bonis, Cécile Chaminade et autres trésors à la française.<br/>\r\n<br/>\r\n<strong>ECHOS ET AMBIANCES DE RUSSIE</strong><br/>\r\nSérénades, romances, Mélodies et Airs d''opéra russes des XIXe et XXe siècles.<br/><br/>\r\n<br/>\r\nDe plus amples infromations sont diponibles sur demande.</p>', '0', '', 0, 3),
(45, 13, 1, 'Programmes', '<p><p><strong>PEIWOH</strong><br/>\r\nCréation méditerranéenne et nordique inspirée de la légende taoíste sur une ancienne harpe orientale.<br/>\r\n<br/>\r\n<strong>KLANG DER STAUFER</strong><br/>\r\nVoyage musical dans l''Orient et l''Occident du moyen-âge.<br/>\r\n<br/>\r\n<strong>IL VIAGGIO D''AMORE</strong><br/>\r\nUn voyage d''Amour de la Renaissance à nos jours.<br/>\r\n<br/>\r\n<strong>SCHAFFE IN MIR, GOTT, EIN REINES HERZ</strong><br/>\r\nMusique sacrée germanique<br/>\r\n<br/>\r\n<strong>LE PÈLERINAGE, UN CHEMIN RITUEL DE PURIFICATION</STRONG><BR/>\r\nAlfonso X El Sabino Cantigas de Santa Maria, Llibre Vermell de Monserrat<br/>\r\n<br/>\r\n<strong>DIE SCHÖNE MÜLLERIN</strong> et <strong>DIE WINTEREISE</strong><br/>\r\nInterprétés par Petter Udland Johansen (ténor) et David Casanova (piano).<br/>\r\n<br/>\r\n<strong>MUSIQUES D''ARVO PÄRT ET HELENA TULVE</strong><br/>\r\nAvec Arianna Savall (soprano) et Vox Camantis.<br/>\r\nSortie d''un disque début 2012 (ECM New Series).<br/>\r\n<br/>\r\n<strong>MELPOMEN</strong><br/>\r\nInterprété avec l''Ensemble de Conrad Steinmann.<br/>\r\n<br/>\r\n<STRONG>CHANTS DU NORD ET DU SUD</STRONG><br/>\r\nVoyage entre la Mer Méditerranée et la Mer du Nord.<br/>\r\n<br/>\r\n<STRONG>BELLA TERRA</STRONG><br/>\r\n<br/>\r\n<STRONG>LIEDER DE BELLMAN</STRONG><BR/>\r\n<BR/>\r\n<BR/>\r\nDe plus amples informations sont disponibles sur demande.</p>', '0', '', 0, 7);
INSERT INTO `pages` (`page_id`, `profile_id`, `page_type`, `page_title`, `page_content`, `dir_name`, `media_url`, `discography_id`, `page_rank`) VALUES
(46, 19, 2, 'Extraits musicaux', '', 'uploads/sound_schola', '', 0, 3),
(47, 16, 2, 'Extraits musicaux', '', 'uploads/sound_orgue_ancien', '', 0, 3),
(48, 17, 3, 'Extrait vidéo', '<iframe width="420" height="315" src="http://www.youtube.com/embed/r9BZSG4joJQ?rel=0" frameborder="0" allowfullscreen></iframe>', '0', 'r9BZSG4joJQ', 0, 3),
(49, 13, 4, 'Discographie', '', '0', '', 2, 6),
(50, 4, 4, 'Discographie', '', '0', '', 7, 4),
(51, 15, 4, 'Discographie', '', 'uploads/discographies', '', 8, 4),
(52, 15, 1, 'Programmes', '<p><strong>CLAIR-OBSCUR</strong><br/>\r\nLes quatuors de saxophones Clair-Obscur (Allemagne) et Marquis de Saxe (Suisse) s''unissent pour présenter deux oeuvres symphoniques majeures dans l''histoire de la musique et adaptées pour une formation en octuor:<br/>\r\n<br/>\r\n<i>L''Apprenti Sorcier</i> de Paul Dukas<br/>\r\n<i>Les Planètes</i> de Gustav Holst <br/>\r\n<br/>\r\n<br/>\r\n<strong>STABAT MATER, PERGOLESI</strong><br/>\r\nLes deux cantatrices lucernoises Carmela Konrad (soprano) et Liliane Glanzmann (alto) se proposent de porter sur cetteoeuvre un nouvel éclairage, remplaçant les cordes et le continuo de la version originale par les quatre saxophones du quatuor Marquis de Saxe.<br/>\r\n<br/>\r\n<br/>\r\n<strong>LE CARNAVAL DES AMIMAUX</strong><br/>\r\nHonorer la vision de Saint-Saëns lorsqu''il composa ce carnaval durant ses vacances dans un petit village autrichien : faire rire, sans infantiliser. C''est le défis que se sont lancés Sandra Korol (textes), Sylviane Tille (mise en scène) et le Marquis de Saxe.\r\n<br/>\r\n<br/>\r\n<strong>L''HISTOIRE DE BABAR</strong><br/>\r\n<i>L''histoire de Babar</i> de Francis Poulenc et Jean de Brunhoff (arr. Marquis de Saxe)<br/>\r\nRevisité par Marquis de Saxe et Sylviane Tille (mise en scène), <i>L''histoire de Babar</i> saura enchanter les petits comme les grands par le récit des aventures de Babar, d''Arthur, de Céleste et de la vieille dame. <br/><br/>\r\n<i>Sports et divertissements</i> d''Erik Satie<br/>\r\n20 petites scénettes mises en espace par Christiane Sordet décrivent, grâce à la musique si caractéristique d''Erik Satie, le tango, le golf, la chasse ou encore le pique-nique.<br/><br/>\r\nCes deux programmes composent un spectacle d''environ 50 minutes. <br/>\r\n<br/>\r\n<br/>\r\n<strong>VARIATIONS GOLDBERG, BWV 988</strong><br/>\r\nL''intégrale des <i>Variations Goldberg</i> de Jean-Sébastien Bach a été arrangée spécialement par Marquis de Saxe à l''occasion de son 20e anniversaire, en 2008. Des poèmes, lus par Samuel Zumbühl (en allemand) ou par Miruna Coca-Cosma (en français), viennent enrichir l''oeuvre entre les différentes variations. <br/>\r\n<br/>\r\n<br/>\r\n<strong>SAXE AND THE CITY </strong><br/>\r\nCe spectacle musical et didactique s''adresse particulièrement aux adolescents. Mettant en scène les quatre musiciens du quatuor, il peut facilement être défini comme « musicopédagorigolo ». <br/>\r\n<br/>\r\n<br/>\r\n<br/>\r\nDe plus amples informations sont disponibles sur demande.</p>', '0', '', 0, 5),
(53, 19, 4, 'Discographie', '', 'uploads/discographies', '', 9, 4),
(54, 22, 1, 'Trio Nota Bene', '<p>Le trio suisse Nota Bene est formé du pianiste Lionel Monnet, du violoncelliste Xavier Pignat et du violoniste Julien Zufferey.<br/>\r\n<br/>\r\nAprès l''obtention d''une virtuosité de musique de chambre au Conservatoire de Lausanne, le groupe se perfectionne à Paris auprès du Trio Wanderer, qui loue son "étonnante maturité musicale" et suit les conseils de professeurs tels que Roberto Szidon, Menahem Pressler (Beaux-Arts Trio), Patrick Genet (Quatuor Sine Nomine), Christian Favre (Quatuor Schumann), Jean Balissat, Raphaël Wallfisch, Thomas Grossenbacher, Shmuel Ashkenasi (Quatuor Vermeer), Mauro Minguzzi, Christian Ivaldi, Claire Désert et Emmanuel Strosser.<br/>\r\n<br/>\r\nLe Nota Bene accède à la finale du 11ème Concours International "Carlo Soliva" à Casale Monferrato (Italie), remporte le 1er Prix du Concours International de musique de chambre de Hellevoetsluis-Rotterdam (Hollande), reçoit le Prix Culturel d''Encouragement de l''Etat du Valais, décroche le 1er Prix à l''unanimité du jury au 28ème Concours pour Trio Instrumental - Prix Géraldine Whittaker à Neuchâtel, se distingue en remportant le Prix Philippe Chaignat (récompensant la qualité de sa prestation lors des Sommets Musicaux de Gstaad) et s''adjuge le Prix du Public à l''édition 2009 du Prix Zulawski-Ville de Chamonix. En 2011, la bourse trisannuelle MusiquePro lui est, en outre, décernée par l''Etat du Valais.<br/>\r\n<br/>\r\nLe trio se produit au Festival Sine Nomine à Lausanne, aux Flâneries musicales de Champéry, au Festival des Haudères, au Festival d''Ernen, à la Tonhalle de Zurich, au Theater Basel, au studio Ernest Ansermet, à l''Auditorium du Conservatoire de Genève, au Musée d''Art et d''Histoire de Genève, à l''Octogone de Pully, à la Fondation Gianadda, au Festival International de la Roque d''Anthéron (France), à La Folle Journée de Nantes (France), au Concertgebouw d''Amsterdam (Hollande), au Festival de Hellevoetsluis (Hollande), au Teatro Sociale de Castiglione delle Stiviere (Italie), aux Zinettiadi de Vérone (Italie), ou encore au Festival D-Marin de Bodrum (Turquie) où les trois artistes apparaissent en solistes dans le Triple Concerto de Beethoven aux côtés du Dogus Youth Symphony Orchestra. Une récente tournée mène les trois musiciens au Recanati Hall de Tel Aviv, au Music Center de Jérusalem et à la Chamber Music Society de Haïfa.<br/>\r\n<br/>\r\nActif dans le domaine de la musique contemporaine, le trio Nota Bene crée régulièrement des oeuvres de compositeurs suisses et étrangers : citons les premières des trios de Roberto Sierra, Marie-Christine Raboud, Jean-Luc Darbellay, Gregorio Zanon ou encore Alfred Zimerlin.<br/>\r\n<br/>\r\nLe trio collabore avec des artistes de renom tels que Fabio di Càsola, Brigitte Fournier, Christoph Schiller, Shlomo Mintz, Nobuko Imai, Gérard Caussé, Pierre Amoyal ou encore Shmuel Ashkenasi.<br/>\r\n<br/>\r\nNota Bene a à son actif deux enregistrements parus sous le label Claves et chaleureusement salués par la critique. Le premier, «100% Russe», est dédié aux trios d''Arenski, Rachmaninov et Chostakovich; le second, «Swiss Perspective», est consacré aux compositeurs helvétiques J. Raff, A. Honegger, E. Bloch et F. Martin.<b/>\r\n<br/><br/>\r\n<a href="http://trionotabene.com">www.trionotabene.com</a></p>', 'uploads/img_trio_nota_bene', '', 0, 1),
(56, 22, 2, 'Extraits musicaux', '', 'uploads/sound_trio_nota_bene', '', 0, 2),
(57, 22, 3, 'Extrait vidéo', '<p><inframe width="420"height="315"src="http://youtube.com/embed/8n-TATNpUWA?rel=0"frameborder="0"allowfullscreen></inframe></p>', '0', '8n-TATNpUWA', 0, 3),
(58, 22, 4, 'Discographie', '', '0', '', 10, 4);

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
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
  `profile_status` tinyint(2) NOT NULL DEFAULT '1',
  `profile_creation` date NOT NULL,
  `profile_modification` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `profile`
--

INSERT INTO `profile` (`profile_id`, `dir_name`, `dir_name_2`, `media_url`, `profile_category_id`, `upload_file_id`, `profile_name`, `profile_surname`, `profile_short_biography`, `profile_function`, `profile_company`, `profile_company_url`, `profile_email_address`, `profile_phone_number`, `profile_address`, `profile_city`, `profile_postal_code`, `profile_country`, `profile_status`, `profile_creation`, `profile_modification`) VALUES
(4, 'uploads/img_ensemble_daedalus', '0', 'vvGmSv9J-jk', 2, 12, 'Ensemble', 'Daedalus', '', 'Musique ancienne', 'Ensemble Daedalus', '', '', '', '', '', '', 0, 1, '2011-03-19', '2011-11-17'),
(12, 'uploads/img_bertrand_bochud', 'uploads/sound_bertrand_bochud', '', 2, 0, 'Bertrand', 'Bochud', '<p>DÃ¨s lâ€™Ã¢ge de huit ans, Bertrand Bochud suit dÃ¨s des cours de piano, de chant et dâ€™orgue au Conservatoire de Fribourg. AprÃ¨s lâ€™obtention du diplÃ´me dâ€™enseignement en 2004, pour lequel il a reÃ§u le prix de la Fondation Max et Axelle Koch de Lucerne, il termine sa formation par la virtuositÃ© â€“ mention excellente avec fÃ©licitations du jury â€“ auprÃ¨s de Michel Brodard Ã  la Musikhochschule de Lucerne. Il se perfectionne actuellement auprÃ¨s de Tiny Westendorp.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Dans le domaine du rÃ©cital, son rÃ©pertoire comprend plusieurs cycles de Lieder romantiques allemands : Winterreise de Schubert ou Dichterliebe de Schumann ainsi que des mÃ©lodies franÃ§aises de FaurÃ©, Bizet, Duparc et Poulenc. Bertrand Bochud a prÃ©sentÃ© rÃ©cemment un rÃ©cital de musique russe au cÃ´tÃ© de la mezzo-soprano Brigitte Balleys. Cette collaboration se poursuit avec la prÃ©paration dâ€™un programme autour du compositeur franÃ§ais Emmanuel Chabrier. Le duo sera accompagnÃ© par le pianiste Laurent Martin.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Bertrand Bochud aborde Ã©galement volontiers des pages de musique contemporaine dont rÃ©cemment une crÃ©ation pour tÃ©nor et quatuor Ã  cordes de Dominique Gesseney-Rappo : le Nunc Dimitis interprÃ©tÃ© en collaboration avec le Quatuor Sine Nomine.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Durant lâ€™Ã©tÃ© 2008, il tient le rÃ´le de Rodolphe dans la production de La BohÃ¨me de Puccini pour lâ€™Association Ouverture-OpÃ©ra Ã  la Ferme Asile de Sion.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>DÃ¨s la rentrÃ©e 2010, il enseigne Ã  la Haute Ecole de Musique de Lausanne.</p>\r\n\r\n<p><br/><br/>\r\n<a href="http://www.bertrandbochud.ch" onclick="window.open(this.href, ''_blank''); return false;">www.bertrandbochud.ch</a></p>', 'Ténor', '', 'http://www.bertrandbochud.ch/', '', '', '', '', '', 214, 1, '2011-08-04', '2011-12-06'),
(13, 'uploads/img_hirundo_maris', 'uploads/sound_hirundo_maris', 'v3Xptfn2DnA', 2, 0, 'Hirundo', 'Maris', '<p>Arianna Savall et Petter Udland Johansen crÃ©ent Hirundo Maris en 2009. Leur souhait est de se spÃ©cialiser tout dâ€™abord dans la musique ancienne tout en gardant une place importante pour des crÃ©ations contemporaines de leur composition. </p>\r\n<p><br/></p>\r\n<p>Leur projet porte principalement sur la musique mÃ©diterranÃ©enne et nordique. A lâ€™image de lâ€™hirundo maris, un oiseau migrateur, les musiciens retrouvent, grÃ¢ce Ã  un travail menÃ© conjointement, les chemins de la mer et de la musique qui, depuis la nuit des temps, unissent les pays scandinaves Ã  la pÃ©ninsule ibÃ©rique. Il ne sâ€™agit pas seulement dâ€™un voyage musical unique entre les pays civilisÃ©s, l''Espagne et la NorvÃ¨ge, ou encore entre le Sud et le Nord, mais Ã©galement dâ€™un parcours Ã  travers les siÃ¨cles. </p>\r\n<p><br/></p>\r\n<p>Hirundo Maris, ensemble Ã  gÃ©omÃ©trie variable rassemblant diffÃ©rents solistes, enchante les amateurs de musique par sa diversitÃ© sonore. Son premier disque sera disponible au printemps 2012 sous le prestigieux labelÂ ECM.\r\n</p>', 'Musique ancienne & traditionnelle', 'Hirundo Maris', '', '', '', '', '', '', 214, 1, '2011-08-04', '2011-12-07'),
(14, 'uploads/img_les_riches_heures_de_valere', '', '', 1, 0, 'Les Riches Heures de Valère', '', '<p>CrÃ©Ã©e en 2008, lâ€™Association Les Riches Heures de ValÃ¨re a pour ambition, grÃ¢ce Ã  une programmation spÃ©cifique visant un niveau dâ€™excellence, de mettre en valeur le site exceptionnel de ValÃ¨re et de la vieille ville de Sion par lâ€™organisation de concerts de musique ancienne et baroque.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Les premiÃ¨res saisons ont notamment vu se produire Ã  Sion Jordi Savall(Temps retrouvÃ©), lâ€™Ensemble Vocal de Lausanne & Michel Corboz (Missa a quattro voci da cappella de Claudio Monteverdi), le Hilliard Ensemble(In Paradisum), le Quatuor Sine Nomine (Les sept derniÃ¨res paroles du Christ en croix, Joseph Haydn), Arianna Savall & Petter Udland Johansen (Il viaggio dâ€™Amore), Stile Antico(Song of songs), lâ€™Ensemble Daedalus & Roberto Festa (O Vergin Santa non mâ€™abbandonare), lâ€™Ensemble Musica Fiorita (Nascente Maria, Barbara Strozzi) ou encore le Huelgas Ensemble & Paul van Nevel (ApogÃ©e de la polyphonie sacrÃ©e). Concerto Soave, accompagnÃ© de Maria Cristina Kiehr et de Jean-Marc Aymes (Il Canto delle Dame), se produira en novembre. </p>\r\n\r\n<p><br/></p>\r\n\r\n<p><a href="http://www.lesrichesheuresdevalere.ch/">www.lesrichesheuresdevalere.ch</a> </p>', '', 'Les Riches Heures de Valère', '', '', '', '', '', '', 214, 1, '2011-08-04', '2011-12-05'),
(15, 'uploads/img_marquis_de_saxe', '0', '', 2, 0, 'Marquis de Saxe', '', '<p>FondÃ© en automne 1988 au Conservatoire de Lausanne et aprÃ¨s avoir connu divers changements, Marquis de Saxe est constituÃ© depuis 2000 de saxophonistes tous en possession dâ€™un 1er prix de virtuositÃ©. Ils travaillent comme pÃ©dagogues dans les Conservatoires de Sion, Lausanne, Fribourg et Morges (COV), ainsi quâ€™Ã  la HEM de Lausanne et Ã  lâ€™Ecole de Musique de Lucerne.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>En 1990, Marquis de Saxe remporte un 2Ã¨me prix au Concours National de Musique Contemporaine de la fondation B.A.T.; Ã  cette occasion, il interprÃ©tait entre autres la premiÃ¨re piÃ¨ce Ã©crite spÃ©cialement Ã  son intention par Alexis Chalier. Depuis, le quatuor entretient diverses collaborations avec les compositeurs Jean-FranÃ§ois Bovard, Andor Kovach, Jean-FranÃ§ois Michel, Claude Ferrier, Claude Prior ou encore avec Dominique Gesseney Rappo Ã  qui le quatuor a commandÃ© un concerto pour quatuor de saxophones et orchestre symphonique qui est crÃ©Ã© lors dâ€™une tournÃ©e de concerts en novembre 2011.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Les succÃ¨s obtenus en concerts dans toute la Suisse mais aussi en France, en Roumanie, en SlovÃ©nie et en Autriche encouragent le quatuor Ã  partir Ã  la recherche de nouvelles couleurs Ã  travers des rÃ©pertoires Ã©clectiques mÃªlant les grandes Å“uvres du rÃ©pertoire Ã  la musique contemporaine et au rire.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>\r\nEn 2004, il obtient le droit exceptionnel dâ€™arrangement et dâ€™interprÃ©tation de Lâ€™histoire de Babar de Francis Poulenc. Dans une mise en scÃ¨ne de Sylviane Tille, ce concert/spectacle continue de connaÃ®tre un succÃ¨s sans prÃ©cÃ©dent. ParallÃ¨lement, Marquis de Saxe initie les Ã©coles Ã  lâ€™univers du saxophone Ã  travers son spectacle maison Sax and the city. En 2007, il collabore avec le quatuor Clair-Obscur de Berlin pour une sÃ©rie de concerts en Suisse et dans la capitale allemande avec au programme un arrangement de Pierre et le Loup de Prokoviev pour huit saxophones. Ces deux derniÃ¨res annÃ©es, les Variations Goldberg de Jean-SÃ©bastien Bach ont reprÃ©sentÃ© le pilier de son activitÃ© dont le dernier concert a Ã©tÃ© donnÃ© en aoÃ»t 2011 au Festival Bach en Combrailles (Auvergne).</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Marquis de Saxe a, jusquâ€™Ã  ce jour, produit quatre disques.</p> \r\n\r\n<p><br/></p>\r\n\r\n<p>Actuellement, Marquis de Saxe travaille sur plusieurs nouveaux projets en collaboration avec des artistes de renoms et tous spÃ©cialisÃ©s dans leur art. Une tournÃ©e de plusieurs concerts est prÃ©vue en aoÃ»t 2012 avec le quatuor allemand Clair-Obscur pour prÃ©senter Lâ€™Apprenti Sorcier de Paul Dukas et Les PlanÃ¨tes de Gustav Holst. AccompagnÃ© de la soprano Carmela Konrad et lâ€™alto Lilian Glanzmann, il fera un nouveau passage dans le rÃ©pertoire baroque avec lâ€™interprÃ©tation du Stabat Mater de Pergolesi. Enfin, Marquis de Saxe souhaite faire revivre Le Carnaval des Animaux de Saint-SaÃ«ns avec des textes de Sandra Korol et sur une mise en scÃ¨ne de Sylviane Tille.</p> \r\n\r\n<p><br/><br/>\r\n<a href="http://www.marquisdesaxe.ch" onclick="window.open(this.href, ''_blank''); return false;">www.marquisdesaxe.ch</a></p>', 'Quatuor de saxophones', 'Marquis de Saxe', 'http://www.marquisdesaxe.ch/', '', '', '', '', '', 214, 1, '2011-08-04', '2011-12-05'),
(16, 'uploads/img_orgue_ancien', '', '', 1, 0, 'Festival de l''Orgue Ancien', '', '<p>Chaque samedi dâ€™Ã©tÃ©, depuis plus de 40 ans, le Festival International de lâ€™Orgue Ancien et de la Musique Ancienne de ValÃ¨re convie le public Ã  entendre en concert le plus ancien orgue encore jouable au monde (1435 env.). \r\n</p>\r\n\r\n<p><br/></p>\r\n<p>\r\nDes concertistes de renom prÃ©sentent aux auditeurs des programmes variÃ©s et originaux, et ils font vivre cet instrument vÃ©nÃ©rable installÃ© Ã  ValÃ¨re voilÃ  bientÃ´t 600Â ans. \r\n</p>\r\n\r\n<p><br/></p>\r\n<p>\r\nDurant les mois de juillet et aoÃ»t, ce haut-lieu sâ€™anime. Lors de ces rÃ©citals, câ€™est tout le vaisseau de pierre qui rÃ©sonne et qui vibreÂ : la musique magnifie lâ€™Å“uvre des bÃ¢tisseurs mÃ©diÃ©vaux. Les musiciens invitÃ©s se rÃ©jouissent de jouer sur cet orgue unique. Ils sâ€™ingÃ©nient Ã  prÃ©senter un rÃ©pertoire destinÃ© Ã  mettre en valeur les possibilitÃ©s Ã©tonnantes de cet orgue historique de ValÃ¨re.\r\n</p>\r\n\r\n<p>\r\n<br/>\r\n<a href="http://www.orgueancien-valere.ch " onclick="window.open(this.href, ''_blank''); return false;">www.orgueancien-valere.ch </a>\r\n</p>', '', 'Festival de l''Orgue Ancien', 'http://www.orgueancien-valere.ch/', '', '', '', '', '', 214, 1, '2011-08-04', '2011-11-17'),
(17, 'uploads/img_ouverture_opera', '', '', 1, 0, 'Ouverture-Opéra', '', '<p>Lâ€™association Ouverture-OpÃ©ra Å“uvre depuis 2006 Ã  la crÃ©ation et Ã  la promotion de spectacles lyriques. \r\n</p>\r\n\r\n<p><br/></p>\r\n<p>\r\nElle vise essentiellement deux buts: dâ€™une part de favoriser, dans un encadrement professionnel, le dÃ©veloppement de jeunes talents valaisans, principalement de chanteurs, mais Ã©galement de tout crÃ©ateur dont lâ€™art peut contribuer Ã  la rÃ©alisation dâ€™un opÃ©ra, et dâ€™autre part de rÃ©pondre Ã  lâ€™attente dâ€™un public valaisan amateur de chant et dâ€™art lyrique en lui offrant des productions originales et inhabituelles dâ€™un rÃ©pertoire Â«Â traditionnelÂ Â». \r\n</p>\r\n\r\n<p><br/></p>\r\n<p>\r\nSous la direction musicale de Jean-Luc Follonier et dans des mises en scÃ¨nes exceptionnelles de Julie Beauvais, Ouverture-OpÃ©ra a prÃ©sentÃ©, Ã  la Ferme-Asile de Sion, Les Noces de Figaro de Mozart (2006), La BohÃ¨me de Puccini (2008) et Don Giovanni de Mozart (2010). La troupe prÃ©sentera Alcina de Haendel du 22 aoÃ»t au 12 septembre 2012. \r\n</p>\r\n\r\n<p>\r\n<br/><br/>\r\n<a href="http://www.ouverture-opera.ch" onclick="window.open(this.href, ''_blank''); return false;">www.ouverture-opera.ch</a>\r\n</p>', 'opéra', 'Ouverture-Opéra', 'http://www.ouverture-opera.ch/', '', '', '', '', '', 214, 1, '2011-08-04', '2011-12-05'),
(18, 'uploads/img_petter_udland_johansen', '0', 'Rws7FsUvK2A', 2, 0, 'Petter ', 'Udland Johansen', '<p>NÃ© Ã  Oslo oÃ¹ il reÃ§oit sa premiÃ¨re formation vocale et instrumentale, Petter Udland Johannsen obtient un diplÃ´me de chant Ã  la MusikhÃ¸yskole Norges. Il se perfectionne ensuite avec Ingrid Bjoner et Svein BjÃ¸rkÃ¸y, puis Ã  la Schola Cantorum Basiliensis avec Richard Levitt. Le tÃ©nor Hans Peter Blochwitz lui apporte un supplÃ©ment de formation vocale.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Son rÃ©pertoire d''opÃ©ra et de concerts comprend les Å“uvres majeures de compositeurs tels que J.S. Bach, C. Monteverdi, W.A Mozart, F. Mendelssohn ou encore des piÃ¨ces de F. Schubert, E. Grieg, H. Wolf, G. Mahler, E. Grieg et J. Brahms. Petter Udland Johansen a travaillÃ© avec les chefs Rinaldo Alessandrini, Jordi Savall, Pep Prats, Christer LÃ¸vold, Tom et Tobias Kjellum Gossmann.</p> \r\n\r\n<p><br/></p>\r\n\r\n<p>Petter Udland Johannsen a participÃ© Ã  des concerts et des enregistrements de CD avec de nombreux ensembles, notamment Hirundo Maris, Pechrima, Sagene anneau, Capella Antiqua Bambergensis, Pratum Musicum, La Morra, Ferarra et Lucidarium.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>En 2009, il fonde avec sa partenaire, Arianna Savall, l''ensemble Hirundo Maris. Cette formation a une activitÃ© rÃ©guliÃ¨re de concerts dans la plupart des pays dâ€™Europe. Le premier CD de l''ensemble, Chants du Sud et du Nord, sera disponible au printemps 2012 sous le prestigieux label ECM.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>\r\nPetter Udland Johansen fonde, en collaboration avec Christer LÃ¸vold et Mark B. Lay, le trio vocal Pechrima dont les programmes allient compositions personnelles et rÃ©pertoire traditionnel. Leur premier disque sort en 2011.</p> \r\n\r\n<p>Petter Udland Johansen est Ã©galement reconnu comme compositeur et arrangeur. Il donne rÃ©guliÃ¨rement des cours de chant choral et de soliste.</p>\r\n\r\n<p><br/><br/>\r\n<a href="http://www.petterudland.com " onclick="window.open(this.href, ''_blank''); return false;"> www.petterudland.com </a></p>', 'TÃ©nor', '', 'http://www.petterudland.com', '', '', '', '', '', 214, 0, '2011-08-04', '2011-12-05'),
(19, 'uploads/img_schola', '', '', 1, 0, 'Schola de Sion', '', '<p>Depuis plus de 80 ans, la <strong>Schola de Sion</strong> initie des jeunes valaisans au chant choral (solfÃ¨ge, travail vocal, travail du rÃ©pertoire, prestations musicales publiques). </p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Elle forme actuellement prÃ¨s de 150 chanteuses et chanteurs rÃ©partis en diffÃ©rents chÅ“urs : le ChÅ“ur des Petits Nouveaux et le ChÅ“ur des Petites Nouvelles (6 Ã  9 ans), le Petit ChÅ“ur de filles (9 Ã  11 ans), le Grand ChÅ“ur de filles (dÃ¨s 12 ans), les Petits Chanteurs (dÃ¨s 9 ans), le ChÅ“ur dâ€™hommes (dÃ¨s la mue) et lâ€™Ensemble vocal.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>La Schola de Sion prÃ©sente environ 45 prestations publiques par annÃ©e (concerts et offices) et assure plus de 20 heures de formation musicale hebdomadaire.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p><a href="http://www.schola-sion.ch/">www.schola-sion.ch</a></p>', 'Chant', 'Schola', 'http://www.schola-sion.ch/', '', '', '', '', '', 214, 1, '2011-08-04', '2011-12-01');

-- --------------------------------------------------------

--
-- Structure de la table `profile_category`
--

CREATE TABLE IF NOT EXISTS `profile_category` (
  `profile_category_id` smallint(15) NOT NULL AUTO_INCREMENT,
  `profile_category_name_en` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `profile_category_name_fr` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  PRIMARY KEY (`profile_category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci AUTO_INCREMENT=5 ;

--
-- Contenu de la table `profile_category`
--

INSERT INTO `profile_category` (`profile_category_id`, `profile_category_name_en`, `profile_category_name_fr`) VALUES
(2, 'Production', 'Production'),
(1, 'Diffusion', 'Diffusion');

-- --------------------------------------------------------

--
-- Structure de la table `profile_description`
--

CREATE TABLE IF NOT EXISTS `profile_description` (
  `profile_description_id` int(255) NOT NULL AUTO_INCREMENT,
  `profile_id` int(255) NOT NULL,
  `language_id` smallint(10) NOT NULL DEFAULT '1',
  `profile_description_content` text COLLATE latin1_german1_ci NOT NULL,
  PRIMARY KEY (`profile_description_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci AUTO_INCREMENT=10 ;

--
-- Contenu de la table `profile_description`
--

INSERT INTO `profile_description` (`profile_description_id`, `profile_id`, `language_id`, `profile_description_content`) VALUES
(5, 1, 1, '<p>Stile Antico is an ensemble of young British singers, now established as one of the most original and exciting new voices in its field. Much in demand in concert, the group performs regularly throughout Europe and North America. Their recordings on the Harmonia Mundi label have enjoyed great success, receiving the Diapason d’Or de l\\\\\\''année, the Preis der deutschen Schallplattenkritik and twice attracting GRAMMY nominations. Their recent release Song of Songs won the 2009 Gramophone Award for Early Music and reached the top of the US Classical Chart.</p>'),
(6, 4, 2, '<p>FondÃ© Ã  GenÃ¨ve en 1986, Daedalus consacre les deux premiÃ¨res annÃ©es de son activitÃ© Ã  la recherche. Les programmes qui virent les dÃ©buts de l''ensemble, lors du prestigieux Festival des Flandres, et Ã  Milan, lors de Musica e poesia a San Maurizio, sont le rÃ©sultat concret de cette pÃ©riode d''Ã©tude. Le succÃ¨s rencontrÃ© Ã  Bruges ouvre la voie Ã  deux collaborations essentielles dans le parcours du groupe : avec Accent, tout d''abord, la maison de disques qui a enregistrÃ© 10 de ses CDs, et RTB 3, la chaÃ®ne culturelle de la radio belge, coproductrice de 4 d''entre eux. </p>'),
(7, 8, 2, '<p>María Cristina Kiehr s’est très vite imposée, auprès de la presse et du public, comme une des plus grandes interprètes du chant baroque. Elle sait en effet allier la suavité de son timbre unique à un fervent respect des textes poétiques qu’elle défend avec humilité et chaleur. Seraient-ce sa nationalité argentine et ses origines danoises qui mélangent à merveille cette suavité sans égale à la plus grande rigueur musicale et stylistique ? \r\nFormée à la Schola Cantorum de Bâle auprès de René Jacobs, elle est très vite invitée par les plus grands chefs (René Jacobs, Philippe Herreweghe, Franz Bruggen, Jordi Savall, Gustav Leonhardt, Nikolaus Harnoncourt...) et les formations les plus prestigieuses (Hesperion XXI, Concerto Köln, Ensemble 415, Seminario Musicale, Concerto Vocale, Elyma, La Fenice...).\r\nHormis sa participation à des productions d’opéras (Orontea de Cesti à Bâle, Incoronazione di Poppea de Monteverdi à Montpellier, Dorilla de Vivaldi à Nice...), elle voyage à travers le monde (en Europe, au Japon, en Australie, en Amérique Centrale et du Sud...) et a participé à plus d’une centaine d’enregistrements.\r\nMais sa double passion pour la polyphonie et la monodie italienne du XVIIe siècle s’épanouit pleinement avec Concerto Soave, dont elle est co-fondatrice. María Cristina Kiehr y révèle ses talents de conteuse, s’attachant à rendre les moindres intentions de la « nouvelle musique » monodique (la nuova musica). Celle-ci témoigne d’une période faste où les plus grands poètes (Tasso, Marino, Pétrarque...) étaient mis en musique par les plus grands compositeurs (Monteverdi, d’India, Mazzochi...) et où la musique sacrée s’adressait aux sens et au cœur avec la même rhétorique que la musique profane. Elle nous permet de découvrir non seulement une chanteuse unique, mais une artiste accomplie.</p>'),
(8, 7, 2, '<p>Né de la rencontre de Maria Cristina Kiehr et Jean-Marc Aymes, Concerto Soave fut au départ conçu comme un écrin de solistes enchâssant la voix unique de la soprano. Plus particulièrement voué à la musique italienne du seicento, ses concerts à travers le monde (France, Belgique, Hollande, Pologne, Angleterre, Canada, Italie, États-Unis, Autriche, Allemagne, Espagne, Portugal...) et ses enregistrements pour l’empreinte digitale, Harmonia Mundi ou le Label Ambronay marquent immanquablement le paysage musical baroque. L’ensemble est ainsi devenu une référence pour l’interprétation de la musique italienne, interprétation où le respect des œuvres n’a d’autre but que d’en décupler le pouvoir émotionnel, la suavité et le mystère.\r\nDepuis 2007, Concerto Soave a Marseille pour port d’attache, où il organise le festival Mars en Baroque. L’ensemble élargit son répertoire à toute la période baroque en faisant appel aux meilleurs instrumentistes et chanteurs. Il s’ouvre aussi à de nouveaux répertoires et collaborations : musique contemporaine (création de la Passion selon Marie de Zad Moultaka avec Les éléments ; Tresses &amp; détresse avec Musicatreize), musique extra-européenne (Vertiges du Sacré avec le chanteur Moneim Adwan), spectacles avec danse (Il Ballo della Ninfa avec Il Ballarino) ou déclamation (L’Amour de Madeleine avec Benjamin Lazar).</p>'),
(9, 9, 2, '<p>Jean-Marc Aymes est à la fois soliste, directeur artistique et enseignant. En tant que claveciniste et organiste, il a entrepris l’enregistrement intégral de la musique pour clavier de Girolamo Frescobaldi. Le quatrième et dernier volume (Fantasie, Recercari &amp; Canzoni Franzese, Fiori musicali), paru en novembre 2010, a été distingué par un Diapason 5. L’ensemble de cette intégrale a ainsi reçu un accueil enthousiaste de la critique internationale : deux diapasons d’or et 5 Goldberg (volumes 1 et 3), Joker de la revue belge Crescendo (volume 1).\r\nJean-Marc Aymes est le directeur artistique de Concerto Soave. Il a fondé cet ensemble, maintenant considéré comme une référence dans l’interprétation de la musique italienne du Seicento, avec la soprano argentine María Cristina Kiehr. Les enregistrements réalisés pour Harmonia Mundi ont recueilli les plus grandes récompenses internationales. Il voyage avec cet ensemble à travers le monde (Royaume-Uni, Pays-Bas, Allemagne, Suisse, Belgique, Espagne, Italie, Autriche, États-Unis, Canada...), se produisant dans les plus prestigieux festivals.\r\nJean-Marc Aymes est aussi connu pour sa participation à différents projets de musique contemporaine, en tant que soliste (création et dédicace de plusieurs pièces solo) ou avec l’ensemble Musicatreize, dirigé par Roland Hayrabédian. Il a bien entendu joué avec un grand nombre d’ensembles de musique ancienne (Janequin, Talens Lyriques, Grande Ecurie, Daedalus, Akademia...) et continue de se produire régulièrement avec l’ensemble La Fenice, dirigé par son grand ami Jean Tubéry. Il a ainsi participé à plus d’une soixantaine d’enregistrements et à d’innombrables concerts et émissions de radio.\r\nÀ Marseille, il est directeur musical du festival Mars en Baroque. En septembre 2009, il a été nommé professeur de clavecin du Conservatoire Supérieur de Musique et de Danse de Lyon.</p>');

-- --------------------------------------------------------

--
-- Structure de la table `profile_picture`
--

CREATE TABLE IF NOT EXISTS `profile_picture` (
  `profile_picture_id` int(55) NOT NULL AUTO_INCREMENT,
  `profile_id` int(55) NOT NULL,
  `profile_picture_name` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `profile_picture_ext` varchar(5) COLLATE latin1_german1_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`profile_picture_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci AUTO_INCREMENT=62 ;

--
-- Contenu de la table `profile_picture`
--

INSERT INTO `profile_picture` (`profile_picture_id`, `profile_id`, `profile_picture_name`, `profile_picture_ext`, `creation_date`) VALUES
(40, 61, 'borgeaud', '.jpg', '2010-03-11 17:47:37'),
(41, 64, 'hai', '.jpg', '2010-03-12 10:28:07'),
(42, 65, 'catherineschnydrig', '.jpg', '2010-03-12 16:42:02'),
(45, 69, 'fredericstuder', '.jpg', '2010-03-13 13:12:53'),
(46, 70, 'jeannoelmoulin', '.jpg', '2010-03-13 13:39:17'),
(61, 97, 'laubergraphics', '.gif', '2010-04-14 15:54:23'),
(60, 86, 'antidote', '.gif', '2010-04-01 20:52:40');

-- --------------------------------------------------------

--
-- Structure de la table `subcategory`
--

CREATE TABLE IF NOT EXISTS `subcategory` (
  `subcategory_id` smallint(3) NOT NULL AUTO_INCREMENT,
  `subcategory_parent_id` smallint(3) NOT NULL,
  `subcategory_name` varchar(55) COLLATE latin1_german1_ci NOT NULL,
  PRIMARY KEY (`subcategory_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci AUTO_INCREMENT=11 ;

--
-- Contenu de la table `subcategory`
--


-- --------------------------------------------------------

--
-- Structure de la table `subscriber`
--

CREATE TABLE IF NOT EXISTS `subscriber` (
  `subscriber_id` int(55) NOT NULL AUTO_INCREMENT,
  `subscriber_name` varchar(55) COLLATE latin1_german1_ci NOT NULL,
  `subscriber_surname` varchar(55) COLLATE latin1_german1_ci NOT NULL,
  `subscriber_email_address` varchar(55) COLLATE latin1_german1_ci NOT NULL,
  `pool_id` int(55) NOT NULL,
  PRIMARY KEY (`subscriber_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci AUTO_INCREMENT=13 ;

--
-- Contenu de la table `subscriber`
--

INSERT INTO `subscriber` (`subscriber_id`, `subscriber_name`, `subscriber_surname`, `subscriber_email_address`, `pool_id`) VALUES
(1, '', '', 'plnanchen@bluewin.ch', 0),
(2, '', '', 'andre.seppey@teltron.ch', 0),
(3, '', '', 'daninum22@gmail.com', 0),
(4, '', '', 'daninum22@gmail.com', 0),
(5, '', '', 'daninum22@gmail.com', 0),
(6, '', '', 'daninum22@gmail.com', 0),
(7, '', '', 'philippe.varone@varone.ch', 0),
(8, '', '', 'philippe.varone@varone.ch', 0),
(9, '', '', 'follonierjl@bluewin.ch', 0),
(10, '', '', 'follonierjl@bluewin.ch', 0),
(11, '', '', 'jasmina.kulaglich@wanadoo.fr', 0),
(12, '', '', 'jasmina.kulaglich@wanadoo.fr', 0);

-- --------------------------------------------------------

--
-- Structure de la table `template`
--

CREATE TABLE IF NOT EXISTS `template` (
  `template_id` int(255) NOT NULL AUTO_INCREMENT,
  `template_parent_id` int(255) NOT NULL,
  `template_name` varchar(55) NOT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=83 ;

--
-- Contenu de la table `template`
--

INSERT INTO `template` (`template_id`, `template_parent_id`, `template_name`) VALUES
(70, 0, 'Å“uvres_completes'),
(71, 70, 'Å“uvres_completes_recits'),
(78, 73, 'presentation_site'),
(72, 70, 'Å“uvres_completes_nouvelles_editions'),
(73, 0, 'association'),
(74, 0, 'fonds'),
(75, 74, 'fonds_crlr'),
(76, 74, 'fonds_bcu'),
(77, 73, 'presentation_association'),
(79, 0, 'citations'),
(80, 79, 'citations'),
(81, 0, 'notices'),
(82, 81, 'notice_biographique');

-- --------------------------------------------------------

--
-- Structure de la table `upload_file`
--

CREATE TABLE IF NOT EXISTS `upload_file` (
  `upload_file_id` int(55) NOT NULL AUTO_INCREMENT,
  `profile_id` int(55) NOT NULL DEFAULT '0',
  `dir_name` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `upload_file_name` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `upload_file_ext` varchar(5) COLLATE latin1_german1_ci NOT NULL,
  `language_id` tinyint(5) NOT NULL DEFAULT '1',
  `upload_file_title` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `upload_file_description` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `upload_file_rank` mediumint(25) NOT NULL DEFAULT '1',
  `upload_file_display` tinyint(1) NOT NULL DEFAULT '1',
  `upload_file_creation_date` date NOT NULL,
  `upload_file_modification_date` date NOT NULL,
  PRIMARY KEY (`upload_file_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci AUTO_INCREMENT=233 ;

--
-- Contenu de la table `upload_file`
--

INSERT INTO `upload_file` (`upload_file_id`, `profile_id`, `dir_name`, `upload_file_name`, `upload_file_ext`, `language_id`, `upload_file_title`, `upload_file_description`, `upload_file_rank`, `upload_file_display`, `upload_file_creation_date`, `upload_file_modification_date`) VALUES
(1, 0, 'uploads/images_artistes/stile_antico', 'stile_antico', '.jpg', 2, 'stile_antico', '', 1, 1, '2011-03-17', '0000-00-00'),
(2, 0, 'uploads/images_artistes/stile_antico', 'stileantico_vignette', '.jpg', 2, 'vignette', '', 2, 0, '2011-03-17', '2011-03-17'),
(3, 0, 'uploads/images_artistes/concerto_soave', 'ensemble_concerto_soave', '.jpg', 2, 'imagette', '', 1, 1, '2011-03-19', '0000-00-00'),
(4, 0, 'uploads/images_artistes/daedalus', 'ensemble_daedalus', '.jpg', 2, 'imagette', '', 1, 1, '2011-03-19', '0000-00-00'),
(5, 0, 'uploads/images_artistes/huelgas_ensemble', 'huelgas_ensemble', '.jpg', 2, 'imagette', '', 1, 1, '2011-03-19', '0000-00-00'),
(6, 0, 'uploads/images_artistes/musica_fiorita', 'musica_fiorita', '.jpg', 2, 'imagette', '', 1, 1, '2011-03-19', '0000-00-00'),
(27, 0, 'uploads/images_concerts/jeunes_artistes_valaisans_2011', 'jeunes_artistes_1', '.jpg', 2, 'jeunes_artistes_1', '', 1, 1, '2011-04-12', '0000-00-00'),
(28, 0, 'uploads/images_concerts/jeunes_artistes_valaisans_2011', 'jeunes_artistes_2', '.jpg', 2, 'jeunes_artistes_2', '', 2, 1, '2011-04-12', '0000-00-00'),
(9, 0, 'uploads/slideshows/detail_header', 'detail_header', '.gif', 2, 'header_1', '', 1, 1, '2011-03-23', '0000-00-00'),
(10, 0, 'uploads/slideshows/detail_header', 'detail_header_2', '.jpg', 2, 'header_2', '', 2, 1, '2011-03-23', '0000-00-00'),
(11, 0, 'uploads/slideshows/detail_header', 'detail_header_3', '.jpg', 2, 'header_3', '', 3, 1, '2011-03-23', '0000-00-00'),
(12, 0, 'uploads/images_archives_artistes', 'archives_daedalus', '.jpg', 1, 'daedalus', '', 1, 1, '2011-03-24', '0000-00-00'),
(13, 0, 'uploads/images_archives_artistes', 'maria_cristina_kiehr', '.jpg', 2, 'maria_cristina_kiehr', '', 1, 1, '2011-03-24', '0000-00-00'),
(14, 0, 'uploads/images_archives_artistes', 'jean_marc_aymes', '.jpg', 1, 'jean_marc_aymes', '', 1, 1, '2011-03-24', '0000-00-00'),
(15, 0, 'uploads/images_artistes', 'huelgas_ensemble', '.jpg', 1, 'huelgas_ensemble', '', 1, 1, '2011-03-24', '0000-00-00'),
(16, 0, 'uploads/images_archives_artistes', 'musica_fiorita', '.jpg', 1, 'musica_fiorita', '', 1, 1, '2011-03-24', '0000-00-00'),
(17, 0, 'uploads/images_archives_artistes', 'concerto_soave', '.jpg', 1, 'concerto_soave', '', 1, 1, '2011-03-24', '0000-00-00'),
(18, 0, 'uploads/images_archives_artistes', 'stile_antico', '.jpg', 1, 'stile_antico', '', 1, 1, '2011-03-24', '0000-00-00'),
(19, 0, 'uploads/slideshows/valere_header', 'valere', '.jpg', 2, 'header_valere', '', 1, 1, '2011-03-29', '0000-00-00'),
(20, 0, 'uploads/page_valere', 'valere_1', '.jpg', 2, 'valere_1', '', 1, 1, '2011-03-29', '0000-00-00'),
(21, 0, 'uploads/page_valere', 'valere_2', '.jpg', 2, 'valere_2', '', 2, 1, '2011-03-29', '0000-00-00'),
(22, 0, 'uploads/images_archives_artistes', 'ensemble_fratres', '.jpg', 2, 'imagette_ensemble_fratres', '', 1, 1, '2011-04-07', '0000-00-00'),
(23, 0, 'uploads/page_valere', 'valere_c_est_aussi', '.pdf', 2, 'Valère c''est aussi...', '', 1, 1, '2011-04-07', '0000-00-00'),
(24, 0, 'uploads/images_concerts/concerto_soave', 'soave_1', '.jpg', 2, 'soave_1', '', 1, 1, '2011-04-12', '0000-00-00'),
(25, 0, 'uploads/images_concerts/concerto_soave', 'soave_2', '.jpg', 2, 'soave_2', '', 2, 1, '2011-04-12', '0000-00-00'),
(26, 0, 'uploads/images_concerts/concerto_soave', 'soave_3', '.jpg', 2, 'soave_3', '', 3, 1, '2011-04-12', '0000-00-00'),
(29, 0, 'uploads/images_concerts/jeunes_artistes_valaisans_2011', 'jeunes_artistes_3', '.jpg', 2, 'jeunes_artistes_3', '', 3, 1, '2011-04-12', '0000-00-00'),
(30, 0, 'uploads/accueil', 'accueil_jeunes_artistes', '.jpg', 2, 'accueil_jeunes_artistes', '', 1, 1, '2011-04-12', '0000-00-00'),
(31, 0, 'uploads/images_concerts/huelgas', 'huelgas_1', '.jpg', 2, 'huelgas_1', '', 1, 1, '2011-04-12', '0000-00-00'),
(32, 0, 'uploads/images_concerts/huelgas', 'huelgas_2', '.jpg', 2, 'huelgas_2', '', 2, 1, '2011-04-12', '0000-00-00'),
(33, 0, 'uploads/images_concerts/stile_antico', 'stile_antico_1', '.jpg', 2, 'stile_antico_1', '', 1, 1, '2011-04-12', '0000-00-00'),
(34, 0, 'uploads/images_concerts/stile_antico', 'stile_antico_2', '.jpg', 2, 'stile_antico_2', '', 2, 1, '2011-04-12', '0000-00-00'),
(35, 0, 'uploads/images_concerts/stile_antico', 'stile_antico_3', '.jpg', 2, 'stile_antico_3', '', 3, 1, '2011-04-12', '0000-00-00'),
(36, 0, 'uploads/images_concerts/daedalus', 'daedalus_1', '.jpg', 2, 'daedalus_1', '', 1, 1, '2011-04-12', '0000-00-00'),
(37, 0, 'uploads/images_concerts/daedalus', 'daedalus_2', '.jpg', 2, 'daedalus_2', '', 2, 1, '2011-04-12', '0000-00-00'),
(38, 0, 'uploads/images_concerts/daedalus', 'daedalus_3', '.jpg', 2, 'daedalus_3', '', 3, 1, '2011-04-12', '0000-00-00'),
(39, 0, 'uploads/images_concerts/musica_fiorita', 'fiorita_1', '.jpg', 2, 'musica_fiorita_1', '', 1, 1, '2011-04-12', '0000-00-00'),
(40, 0, 'uploads/images_concerts/musica_fiorita', 'fiorita_2', '.jpg', 2, 'musica_fiorita_2', '', 2, 1, '2011-04-12', '0000-00-00'),
(41, 0, 'uploads/images_concerts/musica_fiorita', 'fiorita_3', '.jpg', 2, 'musica_fiorita_3', '', 3, 1, '2011-04-12', '0000-00-00'),
(42, 0, 'uploads/images_concerts/musica_fiorita', 'fiorita_4', '.jpg', 2, 'musica_fiorita_4', '', 4, 1, '2011-04-12', '0000-00-00'),
(43, 0, 'uploads/images_concerts/musica_fiorita', 'fiorita_5', '.jpg', 2, 'musica_fiorita_5', '', 5, 1, '2011-04-12', '0000-00-00'),
(44, 0, 'uploads/images_concerts/musica_fiorita', 'fiorita_6', '.jpg', 2, 'musica_fiorita_6', '', 6, 1, '2011-04-12', '0000-00-00'),
(45, 0, 'uploads/images_concerts/musica_fiorita', 'fiorita_76', '.jpg', 2, 'musica_fiorita_7', '', 7, 1, '2011-04-12', '0000-00-00'),
(46, 0, 'uploads/accueil', 'accueil_daedalus', '.jpg', 2, 'accueil_daedalus', '', 1, 1, '2011-04-12', '0000-00-00'),
(47, 0, 'uploads/images_archives_artistes', 'marie_marthe_claivaz', '.jpg', 2, 'marie_marthe_claivaz', '', 1, 1, '2011-04-12', '0000-00-00'),
(48, 0, 'uploads/biographies_concert', 'rhv_concerto_soave_cv_programme', '.pdf', 2, 'Biographie_Concerto_Soave', '', 1, 1, '2011-04-15', '0000-00-00'),
(49, 0, 'uploads/biographies_concert', 'rhv_daedalus_cv_programme', '.pdf', 2, 'bio_daedalus', '', 1, 1, '2011-04-18', '0000-00-00'),
(50, 0, 'uploads/biographies_concert', 'rhv_huelgas_cv_programme', '.pdf', 2, 'bio_huelgas', '', 1, 1, '2011-04-18', '0000-00-00'),
(51, 0, 'uploads/biographies_concert', 'rhv_jeunes_artistes_cv_programme', '.pdf', 2, 'bio_jeunes_artistes', '', 1, 1, '2011-04-18', '0000-00-00'),
(52, 0, 'uploads/biographies_concert/biographie_jeunes_artistes', 'rhv_jeunes_artistes_cv_programme', '.pdf', 2, 'bio_jeunes_artistes', '', 1, 1, '2011-04-18', '0000-00-00'),
(53, 0, 'uploads/biographies_concert/biographie_daedalus', 'rhv_daedalus_cv_programme', '.pdf', 2, 'bio_daedalus', '', 1, 1, '2011-04-18', '0000-00-00'),
(54, 0, 'uploads/biographies_concert/biographie_huelgas', 'rhv_huelgas_cv_programme', '.pdf', 2, 'bio_huelgas', '', 1, 1, '2011-04-18', '0000-00-00'),
(55, 0, 'uploads/biographies_concert/biographie_musica_fiorita', 'rhv_musica_fiorita_cv_programme', '.pdf', 2, 'bio_musica_fiorita', '', 1, 1, '2011-04-18', '0000-00-00'),
(56, 0, 'uploads/biographies_concert/biographie_stile_antico', 'rhv_stile_antico_cv_programme', '.pdf', 2, 'bio_stile_antico', '', 1, 1, '2011-04-18', '0000-00-00'),
(57, 0, 'uploads/biographies_concert/biographie_concerto_soave', 'rhv_concerto_soave_cv_programme', '.pdf', 2, 'bio_concerto_soave', '', 1, 1, '2011-04-18', '0000-00-00'),
(59, 0, 'uploads/biographies_concert/biographie_stile_antico', 'rhv_stile_antico_cv__plus__programme_2', '.pdf', 2, 'CV & programme Stile Antico 2', '', 1, 1, '2011-05-19', '0000-00-00'),
(60, 12, 'uploads/img_bertrand_bochud', 'bertrand_bochud_001', '.jpg', 2, 'Bertrand_Bochud_001', '', 1, 1, '2011-08-04', '2011-08-04'),
(61, 12, 'uploads/img_bertrand_bochud', 'bertrand_bochud_002', '.jpg', 2, 'Bertrand_Bochud_002', '', 2, 1, '2011-08-04', '2011-08-04'),
(62, 12, 'uploads/img_bertrand_bochud', 'bertrand_bochud_003', '.jpg', 2, 'Bertrand_Bochud_003', '', 3, 1, '2011-08-04', '2011-08-04'),
(65, 0, 'uploads/img_bertrand_bochud', 'bertrand_bochud_004', '.jpg', 2, 'Bertrand_Bochud_004', '', 4, 1, '2011-08-04', '2011-08-04'),
(66, 0, 'uploads/img_bertrand_bochud', 'bertrand_bochud_005', '.jpg', 2, 'Bertrand_Bochud_005', '', 5, 1, '2011-08-04', '2011-08-04'),
(67, 0, 'uploads/img_bertrand_bochud', 'bertrand_bochud_006', '.jpg', 2, 'Bertrand_Bochud_006', '', 6, 1, '2011-08-04', '2011-08-04'),
(68, 0, 'uploads/img_bertrand_bochud', 'bertrand_bochud_007', '.jpg', 2, 'Bertrand_Bochud_007', '', 7, 1, '2011-08-04', '2011-08-04'),
(69, 0, 'uploads/img_bertrand_bochud', 'bertrand_bochud_008', '.jpg', 2, 'Bertrand_Bochud_008', '', 8, 1, '2011-08-04', '2011-08-04'),
(70, 0, 'uploads/img_bertrand_bochud', 'bertrand_bochud_009', '.jpg', 2, 'Bertrand_Bochud_009', '', 9, 1, '2011-08-04', '2011-08-04'),
(71, 0, 'uploads/img_bertrand_bochud', 'bertrand_bochud_010', '.jpg', 2, 'Bertrand_Bochud_010', '', 10, 1, '2011-08-04', '0000-00-00'),
(72, 4, 'uploads/img_ensemble_daedalus', 'ensemble_daedalus_001', '.jpg', 2, 'ensemble_daedalus_001', '', 1, 1, '2011-08-04', '0000-00-00'),
(73, 4, 'uploads/img_ensemble_daedalus', 'ensemble_daedalus_002', '.jpg', 2, 'ensemble_daedalus_002', '', 2, 1, '2011-08-04', '0000-00-00'),
(74, 4, 'uploads/img_ensemble_daedalus', 'ensemble_daedalus_003', '.png', 2, 'ensemble_daedalus_003', '', 3, 1, '2011-08-04', '0000-00-00'),
(75, 4, 'uploads/img_ensemble_daedalus', 'ensemble_daedalus_004', '.png', 2, 'ensemble_daedalus_004', '', 4, 1, '2011-08-04', '0000-00-00'),
(76, 0, 'uploads/img_hirundo_maris', 'hirundo_maris_001', '.jpg', 2, 'hirundo_maris_001', '', 1, 1, '2011-08-04', '0000-00-00'),
(77, 0, 'uploads/img_hirundo_maris', 'hirundo_maris_002', '.jpg', 2, 'hirundo_maris_002', '', 2, 1, '2011-08-04', '0000-00-00'),
(78, 0, 'uploads/img_hirundo_maris', 'hirundo_maris_003', '.jpg', 2, 'hirundo_maris_003', '', 3, 1, '2011-08-04', '0000-00-00'),
(79, 0, 'uploads/img_hirundo_maris', 'hirundo_maris_004', '.jpg', 2, 'hirundo_maris_004', '', 4, 1, '2011-08-04', '0000-00-00'),
(80, 0, 'uploads/img_hirundo_maris', 'hirundo_maris_005', '.jpg', 2, 'hirundo_maris_005', '', 5, 1, '2011-08-04', '0000-00-00'),
(81, 0, 'uploads/img_les_riches_heures_de_valere', 'les_riches_heures_de_valere_001', '.jpg', 2, 'les_riches_heures_de_valere_001', '', 1, 1, '2011-08-04', '0000-00-00'),
(82, 0, 'uploads/img_les_riches_heures_de_valere', 'les_riches_heures_de_valere_002', '.jpg', 2, 'les_riches_heures_de_valere_002', '', 2, 1, '2011-08-04', '0000-00-00'),
(83, 0, 'uploads/img_les_riches_heures_de_valere', 'les_riches_heures_de_valere_003', '.jpg', 2, 'les_riches_heures_de_valere_003', '', 3, 1, '2011-08-04', '0000-00-00'),
(84, 0, 'uploads/img_les_riches_heures_de_valere', 'les_riches_heures_de_valere_004', '.jpg', 2, 'les_riches_heures_de_valere_004', '', 4, 1, '2011-08-04', '0000-00-00'),
(85, 0, 'uploads/img_les_riches_heures_de_valere', 'les_riches_heures_de_valere_005', '.jpg', 2, 'les_riches_heures_de_valere_005', '', 5, 1, '2011-08-04', '0000-00-00'),
(86, 0, 'uploads/img_les_riches_heures_de_valere', 'les_riches_heures_de_valere_006', '.jpg', 2, 'les_riches_heures_de_valere_006', '', 6, 1, '2011-08-04', '0000-00-00'),
(87, 0, 'uploads/img_les_riches_heures_de_valere', 'les_riches_heures_de_valere_007', '.jpg', 2, 'les_riches_heures_de_valere_007', '', 7, 1, '2011-08-04', '0000-00-00'),
(88, 0, 'uploads/img_les_riches_heures_de_valere', 'les_riches_heures_de_valere_008', '.jpg', 2, 'les_riches_heures_de_valere_008', '', 8, 1, '2011-08-04', '0000-00-00'),
(89, 0, 'uploads/img_les_riches_heures_de_valere', 'les_riches_heures_de_valere_009', '.jpg', 2, 'les_riches_heures_de_valere_009', '', 9, 1, '2011-08-04', '0000-00-00'),
(90, 0, 'uploads/img_les_riches_heures_de_valere', 'les_riches_heures_de_valere_010', '.jpg', 2, 'les_riches_heures_de_valere_010', '', 10, 1, '2011-08-04', '0000-00-00'),
(91, 0, 'uploads/img_les_riches_heures_de_valere', 'les_riches_heures_de_valere_011', '.jpg', 2, 'les_riches_heures_de_valere_011', '', 11, 1, '2011-08-04', '0000-00-00'),
(92, 0, 'uploads/img_les_riches_heures_de_valere', 'les_riches_heures_de_valere_012', '.jpg', 2, 'les_riches_heures_de_valere_012', '', 12, 1, '2011-08-04', '0000-00-00'),
(93, 0, 'uploads/img_les_riches_heures_de_valere', 'les_riches_heures_de_valere_013', '.jpg', 2, 'les_riches_heures_de_valere_013', '', 13, 1, '2011-08-04', '0000-00-00'),
(94, 0, 'uploads/sound_bertrand_bochud', '01_stabat_mater_dolorosa', '.mp3', 2, '01_stabat_mater_dolorosa', '<strong>Stabat Mater</strong><br/>\r\n<i>Stabat Mater dolorosa</i><br/>\r\nJoseph Haydn\r\n', 1, 1, '2011-08-04', '2011-12-09'),
(95, 0, 'uploads/sound_bertrand_bochud', '02_stabat_mater_vidit_suum_dulcem_natum', '.mp3', 2, '02_stabat_mater_vidit_suum_dulcem_natum', '<strong>Stabat Mater</strong><br/>\r\n<i>Vidit suum dulcem natum</i><br/>\r\nJoseph Haydn', 2, 1, '2011-08-04', '2011-12-09'),
(96, 0, 'uploads/sound_bertrand_bochud', '03_die_schopfung', '.mp3', 2, '03_die_schopfung', '<strong>Die Schöpfung</strong><br/>\r\n<i>In Vollem Glanze steiget jetzt di Sonne strahlend auf</i><br/>\r\nJoseph Haydn', 3, 1, '2011-08-04', '2011-12-09'),
(97, 0, 'uploads/sound_bertrand_bochud', '04_davidde_penitente_a_te', '.mp3', 2, '04_davidde_penitente_a_te', '<strong>Davidde penitente</strong><br/>\r\n<i>A te, fra tanti affanni</i><br/>\r\nWolfgang Amadeus Mozart', 4, 1, '2011-08-04', '2011-12-09'),
(98, 0, 'uploads/sound_bertrand_bochud', '05_davidde_penitente_partie_rapide', '.mp3', 2, '05_davidde_penitente_partie_rapide', '<strong>Davidde penitent</strong><br/>\r\npartie rapide<br/>Wolfgang Amadeus Mozart', 5, 1, '2011-08-04', '2011-12-09'),
(99, 0, 'uploads/sound_bertrand_bochud', '06_le_laudi_di_sf_1', '.mp3', 2, '06_le_laudi_di_SF_1', '<strong>Le Laudi di San Francesco d''Assisi</strong><br/>\r\nn°1<br/>Hermann Suter', 6, 1, '2011-08-04', '2011-12-09'),
(100, 0, 'uploads/sound_bertrand_bochud', '07_le_laudi_di_sf_7', '.mp3', 2, '07_le_laudi_di_SF_7', '<strong>Le Laudi di San Francesco d''Assisi</strong><br/>n°7<br/>Hermann Suter', 7, 1, '2011-08-04', '2011-12-09'),
(101, 0, 'uploads/sound_bertrand_bochud', '08_petite_messe_solennelle', '.mp3', 2, '08_petite_messe_solennelle', '<strong>Petite Messe Solennelle</strong><br/>\r\n<i>Domine Deus</i><br/>Gioachino Rossini\r\n', 8, 1, '2011-08-04', '2011-12-09'),
(102, 0, 'uploads/img_orgue_ancien', 'orgue_ancien_001', '.jpg', 2, 'orgue_ancien_001', '', 1, 1, '2011-08-04', '0000-00-00'),
(103, 0, 'uploads/img_orgue_ancien', 'orgue_ancien_002', '.jpg', 2, 'orgue_ancien_002', '', 2, 1, '2011-08-04', '0000-00-00'),
(104, 0, 'uploads/img_orgue_ancien', 'orgue_ancien_003', '.jpg', 2, 'orgue_ancien_003', '', 3, 1, '2011-08-04', '0000-00-00'),
(105, 0, 'uploads/img_orgue_ancien', 'orgue_ancien_004', '.jpg', 2, 'orgue_ancien_004', '', 4, 1, '2011-08-04', '0000-00-00'),
(106, 0, 'uploads/img_orgue_ancien', 'orgue_ancien_005', '.jpg', 2, 'orgue_ancien_005', '', 5, 1, '2011-08-04', '0000-00-00'),
(107, 0, 'uploads/img_orgue_ancien', 'orgue_ancien_006', '.jpg', 2, 'orgue_ancien_006', '', 6, 1, '2011-08-04', '0000-00-00'),
(108, 0, 'uploads/img_orgue_ancien', 'orgue_ancien_007', '.jpg', 2, 'orgue_ancien_007', '', 7, 1, '2011-08-04', '0000-00-00'),
(109, 0, 'uploads/img_orgue_ancien', 'orgue_ancien_008', '.jpg', 2, 'orgue_ancien_008', '', 8, 1, '2011-08-04', '0000-00-00'),
(110, 0, 'uploads/img_orgue_ancien', 'orgue_ancien_009', '.jpg', 2, 'orgue_ancien_009', '', 9, 1, '2011-08-04', '0000-00-00'),
(111, 0, 'uploads/img_marquis_de_saxe', 'marquis_de_saxe_001', '.jpg', 2, 'marquis_de_saxe_001', '', 1, 1, '2011-08-05', '0000-00-00'),
(112, 0, 'uploads/img_marquis_de_saxe', 'marquis_de_saxe_002', '.jpg', 2, 'marquis_de_saxe_002', '', 2, 1, '2011-08-05', '0000-00-00'),
(113, 0, 'uploads/img_marquis_de_saxe', 'marquis_de_saxe_003', '.jpg', 2, 'marquis_de_saxe_003', '', 3, 1, '2011-08-05', '0000-00-00'),
(114, 0, 'uploads/img_marquis_de_saxe', 'marquis_de_saxe_004', '.jpg', 2, 'marquis_de_saxe_004', '', 4, 1, '2011-08-05', '0000-00-00'),
(115, 0, 'uploads/img_marquis_de_saxe', 'marquis_de_saxe_005', '.jpg', 2, 'marquis_de_saxe_005', '', 5, 1, '2011-08-05', '0000-00-00'),
(116, 0, 'uploads/img_marquis_de_saxe', 'marquis_de_saxe_006', '.jpg', 2, 'marquis_de_saxe_006', '', 6, 1, '2011-08-05', '0000-00-00'),
(117, 0, 'uploads/img_marquis_de_saxe', 'marquis_de_saxe_007', '.jpg', 2, 'marquis_de_saxe_007', '', 7, 1, '2011-08-05', '0000-00-00'),
(118, 0, 'uploads/img_marquis_de_saxe', 'marquis_de_saxe_008', '.jpg', 2, 'marquis_de_saxe_008', '', 8, 1, '2011-08-05', '0000-00-00'),
(119, 0, 'uploads/img_ouverture_opera', 'ouverture_opera_001', '.jpg', 2, 'ouverture_opera_001', '', 1, 1, '2011-08-05', '0000-00-00'),
(120, 0, 'uploads/img_ouverture_opera', 'ouverture_opera_002', '.jpg', 2, 'ouverture_opera_002', '', 2, 1, '2011-08-05', '0000-00-00'),
(121, 0, 'uploads/img_ouverture_opera', 'ouverture_opera_003', '.jpg', 2, 'ouverture_opera_003', '', 3, 1, '2011-08-05', '0000-00-00'),
(122, 0, 'uploads/img_ouverture_opera', 'ouverture_opera_004', '.jpg', 2, 'ouverture_opera_004', '', 4, 1, '2011-08-05', '0000-00-00'),
(123, 0, 'uploads/img_ouverture_opera', 'ouverture_opera_005', '.jpg', 2, 'ouverture_opera_005', '', 5, 1, '2011-08-05', '0000-00-00'),
(124, 0, 'uploads/img_ouverture_opera', 'ouverture_opera_006', '.jpg', 2, 'ouverture_opera_006', '', 6, 1, '2011-08-05', '0000-00-00'),
(125, 0, 'uploads/img_ouverture_opera', 'ouverture_opera_007', '.jpg', 2, 'ouverture_opera_007', '', 7, 1, '2011-08-05', '0000-00-00'),
(126, 0, 'uploads/img_ouverture_opera', 'ouverture_opera_008', '.jpg', 2, 'ouverture_opera_008', '', 8, 1, '2011-08-05', '0000-00-00'),
(127, 0, 'uploads/img_ouverture_opera', 'ouverture_opera_009', '.jpg', 2, 'ouverture_opera_009', '', 9, 1, '2011-08-05', '0000-00-00'),
(128, 0, 'uploads/img_schola', 'schola_001', '.jpg', 2, 'schola_001', '', 1, 1, '2011-08-05', '0000-00-00'),
(129, 0, 'uploads/img_schola', 'schola_002', '.jpg', 2, 'schola_002', '', 2, 1, '2011-08-05', '0000-00-00'),
(130, 0, 'uploads/img_schola', 'schola_003', '.jpg', 2, 'schola_003', '', 3, 1, '2011-08-05', '0000-00-00'),
(131, 0, 'uploads/img_schola', 'schola_004', '.jpg', 2, 'schola_004', '', 4, 1, '2011-08-05', '0000-00-00'),
(132, 0, 'uploads/img_schola', 'schola_005', '.jpg', 2, 'schola_005', '', 5, 1, '2011-08-05', '0000-00-00'),
(133, 0, 'uploads/img_schola', 'schola_006', '.jpg', 2, 'schola_006', '', 6, 1, '2011-08-05', '0000-00-00'),
(134, 0, 'uploads/img_schola', 'schola_007', '.jpg', 2, 'schola_007', '', 7, 1, '2011-08-05', '0000-00-00'),
(135, 0, 'uploads/img_schola', 'schola_008', '.jpg', 2, 'schola_008', '', 8, 1, '2011-08-05', '0000-00-00'),
(136, 0, 'uploads/img_schola', 'schola_009', '.jpg', 2, 'schola_009', '', 9, 1, '2011-08-05', '0000-00-00'),
(137, 0, 'uploads/img_schola', 'schola_010', '.jpg', 2, 'schola_010', '', 10, 1, '2011-08-05', '0000-00-00'),
(138, 0, 'uploads/img_petter_udland_johansen', 'petter_udland_j_001', '.png', 2, 'petter_udland_j_001', '', 1, 1, '2011-08-05', '2011-08-05'),
(139, 0, 'uploads/img_petter_udland_johansen', 'petter_udland_j_002', '.png', 2, 'petter_udland_j_002', '', 2, 1, '2011-08-05', '2011-08-05'),
(140, 0, 'uploads/img_petter_udland_johansen', 'petter_udland_j_003', '.png', 2, 'petter_udland_j_003', '', 3, 1, '2011-08-05', '0000-00-00'),
(141, 0, 'uploads/img_petter_udland_johansen', 'petter_udland_j_004', '.png', 2, 'petter_udland_j_004', '', 4, 1, '2011-08-05', '0000-00-00'),
(142, 0, 'uploads/sound_hirundo_maris', 'hirundo_maris_001', '.mp3', 2, 'hirundo_maris_001', '<strong>Cantiga de Santa Maria</strong>\r\n <br/><i>Rosa des Rosas</i>\r\n<br/>avec la Capella Antiqua Bambergensis\r\n<br/>extrait de <i>Klang der Staufer</i> (CAB Records CAB - 12)\r\n', 1, 1, '2011-08-05', '2011-12-09'),
(143, 0, 'uploads/sound_hirundo_maris', 'hirundo_maris_002', '.mp3', 2, 'hirundo_maris_002', '<strong><i>Rolandskvadet</i></strong>\r\n<br/>Traditionnel norvégien\r\n<br/>Arr. Petter Udland Johansen \r\n<br/>Avec la Capella Antiqua Bambergensis\r\n<br/>extrait de <i>Klang der Staufer</i> (CAB Records CAB - 12)\r\n', 2, 1, '2011-08-05', '2011-12-09'),
(144, 0, 'uploads/sound_hirundo_maris', 'hirundo_maris_003', '.mp3', 2, 'hirundo_maris_003', '<strong><i>Dov''io credea le mie speranze vere</i> </strong>\r\n<br/>avec l''Ensemble Tom Ring\r\n<br/>Francesca Caccini\r\n<br/>extrait de <i>Bilder Hären</i> (abec-0100)', 3, 1, '2011-08-05', '2011-12-09'),
(145, 0, 'uploads/sound_hirundo_maris', 'hirundo_maris_004', '.mp3', 2, 'hirundo_maris_004', '<strong><i>In Darkness Let Me Dwell</i></strong>\r\n<br/>avec Thomas Boysen \r\n<br/>John Dowland', 4, 1, '2011-08-05', '2011-12-09'),
(146, 0, 'uploads/sound_hirundo_maris', 'hirundo_maris_005', '.mp3', 2, 'hirundo_maris_005', '<strong><i>El Mariner</i></strong>\r\n<br/>Traditionnel Catalan\r\n<br/>Arr. Arianna Savall\r\n<br/>avec Hirundo Maris\r\n<br/>extrait de <i>Chant du Sud et du Nord</i> : sortie au printemps 2012 (ECM New Series)\r\n', 5, 1, '2011-08-05', '2011-12-09'),
(147, 0, 'uploads/sound_hirundo_maris', 'hirundo_maris_006', '.mp3', 2, 'hirundo_maris_006', '<strong><i>Preghiera</i></strong>\r\n<br/>avec Hirundo Maris \r\n<br/>Francis of Assisi et Arianna Savall\r\n<br/>extrait de <i>Peiwoh</i> (Alia Vox, AV 9869)', 6, 1, '2011-08-05', '2011-12-09'),
(148, 0, 'uploads/img_arianna_savall', 'arianna_savall_1', '.jpg', 2, 'Arianna Savall 1', '', 1, 1, '2011-08-06', '0000-00-00'),
(149, 0, 'uploads/img_arianna_savall', 'arianna_savall_2', '.jpg', 2, 'Arianna Savall 2', '', 2, 1, '2011-08-06', '0000-00-00'),
(150, 0, 'uploads/sound_marquis_de_saxe', '01__piste_1', '.mp3', 2, 'marquis_de_saxe_001', '<strong>Cuarteto latinoamericano</strong>\r\n<br/><i>Fandango</i><br/>Aldemaro Romero (Vénézuela/*1928)<br/>', 1, 1, '2011-12-07', '2011-12-09'),
(151, 0, 'uploads/sound_marquis_de_saxe', '02_piste_2', '.mp3', 2, 'marquis_de_saxe_002', '<strong>Cuarteto latinoamericano</strong>\r\n<br/><i>Serenata</i><br/>Aldemaro Romero (Vénézuela/*1928)<br/>', 2, 1, '2011-12-07', '2011-12-09'),
(152, 0, 'uploads/sound_marquis_de_saxe', '03__piste_3', '.mp3', 2, 'marquis_de_saxe_003', '<strong>Cuarteto latinoamericano</strong>\r\n<br/><i>Choro y tango</i><br/>Aldemaro Romero (Vénézuela/*1928)<br/>', 3, 1, '2011-12-07', '2011-12-09'),
(153, 0, 'uploads/sound_marquis_de_saxe', '04__piste_4', '.mp3', 2, 'marquis_de_saxe_004', '<strong>Trois pièces</strong>\r\n<br/><i>Berceuse</i><br/>Isaac Albeniz (Espagne/1860-1909)<br/>', 4, 1, '2011-12-07', '2011-12-09'),
(154, 0, 'uploads/sound_marquis_de_saxe', '05_piste_5', '.mp3', 2, 'marquis_de_saxe_005', '<i>L''Eté</i><br/>Isaac Albeniz(Espagne/1860-1909)<br/>', 5, 1, '2011-12-07', '2011-12-09'),
(155, 0, 'uploads/sound_marquis_de_saxe', '06_piste_6', '.mp3', 2, 'marquis_de_saxe_006', '<strong>Canonic Suite</strong>\r\n<br/><i>Fanfare</i><br/>Elliott Carter (Etats-Unis/*1908)<br/>', 6, 1, '2011-12-07', '2011-12-09'),
(156, 0, 'uploads/sound_marquis_de_saxe', '07__piste_7', '.mp3', 2, 'marquis_de_saxe_007', '<strong>Suite de l''Ange</strong>\r\n<br/><i>Resurección del Angel</i><br/>Astor Piazzolla (Argentine/1921-1992)<br/>', 7, 1, '2011-12-07', '2011-12-09'),
(157, 0, 'uploads/sound_marquis_de_saxe', '08_piste_8', '.mp3', 2, 'marquis_de_saxe_008', '<strong>Faust</strong>\r\n<br/><i>Yearning</i><br/>Carleton Macy (Etats-Unis/*1944)<br/>', 8, 1, '2011-12-07', '2011-12-09'),
(158, 0, 'uploads/sound_marquis_de_saxe', '09__piste_9', '.mp3', 2, 'marquis_de_saxe_009', '<i>Pequeña Czarda</i><br/>Pedro Itturalde (Espagne/*1929)<br/>', 9, 1, '2011-12-07', '2011-12-09'),
(159, 0, 'uploads/sound_marquis_de_saxe', 'berceuse', '.mp3', 2, 'marquis_de_saxe_010', '<i>Berceuse</i><br/>Isaac Albeniz (Espagne/1860-1909)<br/>', 10, 1, '2011-12-07', '2011-12-09'),
(160, 0, 'uploads/sound_marquis_de_saxe', '11_piste_11', '.mp3', 2, 'marquis_de_saxe_011', '<strong>Variations Goldberg</strong>\r\n<br/><i>Aria</i><br/>Johann Sebastian Bach(1685-1750)<br/>', 11, 1, '2011-12-07', '2011-12-09'),
(161, 0, 'uploads/sound_marquis_de_saxe', '12_piste_12', '.mp3', 2, 'marquis_de_saxe_012', '<strong>Variations Goldberg</strong>\r\n<br/><i>Variation 1</i><br/>Johann Sebastian Bach(1685-1750)<br/>', 12, 1, '2011-12-07', '2011-12-09'),
(162, 0, 'uploads/sound_marquis_de_saxe', '13__piste_13', '.mp3', 2, 'marquis_de_saxe_013', '<strong>Variations Goldberg</strong>\r\n<br/><i>Variation 2</i><br/>Johann Sebastian Bach(1685-1750)<br/>', 13, 1, '2011-12-07', '2011-12-09'),
(163, 0, 'uploads/sound_marquis_de_saxe', '14__piste_14', '.mp3', 2, 'marquis_de_saxe_014', '<strong>Variations Goldberg</strong>\r\n<br/><i>Variation 5</i><br/>Johann Sebastian Bach(1685-1750)<br/>', 14, 1, '2011-12-07', '2011-12-09'),
(164, 0, 'uploads/sound_marquis_de_saxe', '15_piste_15', '.mp3', 2, 'marquis_de_saxe_015', '<strong>Variations Goldberg</strong>\r\n<br/><i>Variation 18</i><br/>Johann Sebastian Bach(1685-1750)<br/>', 15, 1, '2011-12-07', '2011-12-09'),
(165, 0, 'uploads/sound_marquis_de_saxe', '16__piste_16', '.mp3', 2, 'marquis_de_saxe_016', '<strong>Variations Goldberg</strong>\r\n<br/><i>Variation 25</i><br/>Johann Sebastian Bach(1685-1750)<br/>', 16, 1, '2011-12-07', '2011-12-09'),
(166, 0, 'uploads/sound_marquis_de_saxe', '17__piste_17', '.mp3', 2, 'marquis_de_saxe_017', '<strong>Variations Goldberg</strong>\r\n<br/><i>Variation 30</i><br/>Johann Sebastian Bach(1685-1750)<br/>', 17, 1, '2011-12-07', '2011-12-09'),
(167, 0, 'uploads/affiche_concerts', 'schola_noel_11_a5', '.jpg', 2, 'Schola_Noël 11', '', 1, 1, '2011-12-07', '0000-00-00'),
(168, 0, 'uploads/img_orgue_ancien', 'oa_rosace_et_orgue', '.jpg', 2, 'OA_photo rosace et orgue', '', 1, 1, '2011-12-15', '0000-00-00'),
(169, 0, 'uploads/sound_schola', '14___piste_14', '.mp3', 2, 'Agnus Dei - Carlo Boller', '<i><strong>Agnus dei</strong></i><br/>\r\nTiré de la <i>Missa à Notre-Dame des Mayens</i><br/>\r\nCarlo Boller<br/>\r\nChoeur d''hommes', 1, 1, '2011-12-27', '2011-12-27'),
(170, 0, 'uploads/sound_schola', '18__', '.mp3', 2, 'L''Amour - FX Delacoste', '<strong><i>L''Amour</i></strong><br/>\r\nd''après Isaie, 54, 10<br/>\r\nFrançois-Xavier Delacoste<br/>\r\nDaniel Rausis<br/>\r\nPetits Chanteurs', 2, 1, '2011-12-27', '2012-01-04'),
(171, 0, 'uploads/sound_schola', '04___piste_4', '.mp3', 2, 'O pulcherrima Virgo - Costanzo Festa', '<strong><i>O pulcherima Virgo</i></strong><br/>\r\nCostanzo Festa<br/>\r\nChoeur d''hommes', 3, 1, '2011-12-27', '2011-12-27'),
(172, 0, 'uploads/sound_schola', '07__', '.mp3', 2, 'Panis angelicus - Giuseppe Baini', '<strong><i>Panis angelicus</i></strong><br/>\r\nGiuseppe Baini <br/>\r\nGrand Choeur de filles', 4, 1, '2011-12-27', '2011-12-27'),
(173, 0, 'uploads/sound_schola', '23__', '.mp3', 2, 'Rorate Caeli desuper - gregorien', '<strong><i>Rorate Caeli desuper</strong></i><br/>\r\nGrégorien<br/>\r\nGrand Choeur de filles', 5, 1, '2011-12-27', '2011-12-27'),
(174, 0, 'uploads/sound_schola', '12__', '.mp3', 2, 'Sicut cervus - Palestrina', '<strong><i>Sicut cervus</strong></i><br/>\r\nGiovanni Pierluigi da Palestrina<br/>\r\nPetits Chanteurs', 6, 1, '2011-12-27', '0000-00-00'),
(175, 0, 'uploads/sound_schola', '15__', '.mp3', 2, 'Ubi caritas - Maurice Duruflé', '<strong><i>Ubi caritas</strong></i><br/>\r\nMaurice Duruflé<br/>\r\nPetits Chanteurs', 7, 1, '2011-12-27', '0000-00-00'),
(176, 0, 'uploads/sound_orgue_ancien', '02___piste_2', '.mp3', 2, 'Wer will uns scheiden ... - Heinrich Schütz', '<strong><i>Wer will uns scheiden von der Liebe Gottes</i></strong><br/>\r\nHeinrich Schütz (1585-1672)<br/>\r\nEnsemble vocal de la Schola de Sion<br/>\r\nMarc Bochud, direction<br/>\r\nPhilippe Despont, orgue', 1, 1, '2011-12-27', '2011-12-27'),
(177, 0, 'uploads/sound_orgue_ancien', '03___piste_3', '.mp3', 2, 'The New Bergomask - John Bull', '<strong><i>The New Bergomask</strong></i><br/>John Bull (1562-1628)<br/>\r\nEnsemble vocal de la Schola de Sion<br/>\r\nMarc Bochud, direction<br/>\r\nPhilippe Despont, orgue', 2, 1, '2011-12-27', '2011-12-27'),
(178, 0, 'uploads/sound_orgue_ancien', '04___piste_4', '.mp3', 2, 'Partite diverse di Follia', '<strong><i>Partite diverse di Follia</strong></i><br/>\r\nBernardo Pasquini (1637-1710)<br>\r\nVijnand van de Pol', 3, 1, '2011-12-27', '0000-00-00'),
(179, 0, 'uploads/sound_orgue_ancien', '05___piste_5', '.mp3', 2, 'Aria sopra il Rossignolo - Alessandro Poglietti', '<strong><i>Aria sopra il Rossignolo</strong></i><br/>Alessandro Poglietti (ca. 1620-1683)<br/>\r\nJosef Stolz', 4, 1, '2011-12-27', '0000-00-00'),
(180, 0, 'uploads/discographies', 'hm_sappho_and_her_time', '.jpg', 2, 'HM_sappho_and_her_time', '', 1, 1, '2011-12-29', '2012-01-04'),
(181, 0, 'uploads/discographies', 'hm_klang_der_staufer', '.jpg', 2, 'HM_klang_der_stauffer', '', 1, 1, '2011-12-29', '2012-01-04'),
(182, 0, 'uploads/discographies', 'hm_chants_du_sud_et_du_nord', '.jpg', 2, 'HM_chants_du_sud_et_du_nord', '', 1, 1, '2011-12-29', '2012-01-04'),
(184, 0, 'uploads/discographies', 'hm_peiwoh', '.jpg', 2, 'HM_peiwoh', '', 1, 1, '2012-01-02', '2012-01-04'),
(185, 0, 'uploads/discographies', 'hm_bellmann', '.jpg', 2, 'HM_Bellmann', '', 5, 1, '2012-01-04', '0000-00-00'),
(186, 0, 'uploads/discographies', 'hm_bella_terra', '.jpg', 2, 'HM_Bella_Terra', '', 6, 1, '2012-01-04', '0000-00-00'),
(187, 0, 'uploads/discographies', 'hm_nuove_musiche', '.jpg', 2, 'HM_Nuove_Musiche', '', 7, 1, '2012-01-04', '0000-00-00'),
(188, 0, 'uploads/discographies', 'hm_joyssance_vous_donneray', '.jpg', 2, 'HM_Joyssance_vous_donneray', '', 8, 1, '2012-01-04', '0000-00-00'),
(189, 0, 'uploads/discographies', 'cd_musa_latina', '.jpg', 2, 'Daedalus_Musa_latina', '', 1, 1, '2012-01-04', '0000-00-00'),
(190, 0, 'uploads/discographies', 'cd_oracula', '.gif', 2, 'Daedalus_Oracula', '', 2, 1, '2012-01-04', '0000-00-00'),
(191, 0, 'uploads/discographies', 'cd_ssaturn_and_polyphony', '.jpg', 2, 'Daedalus_Saturne_and_polyphony', '', 3, 1, '2012-01-04', '0000-00-00'),
(192, 0, 'uploads/discographies', 'cd_the_anatomy_of_melancholy', '.jpg', 2, 'Daedalus_The_anatomy_of_melancoly', '', 4, 1, '2012-01-04', '0000-00-00'),
(193, 0, 'uploads/discographies', 'es_de_salomon', '.gif', 2, 'Daedalus_Les_deux_ames_de_salomon', '', 5, 1, '2012-01-04', '0000-00-00'),
(194, 0, 'uploads/discographies', 'cd_la_favola_di_orlando', '.gif', 2, 'Daedalus_La_favola_di_Orlando', '', 6, 1, '2012-01-04', '0000-00-00'),
(195, 0, 'uploads/discographies', 'cd_canzoni_villanesche_alla_napolitana', '.gif', 2, 'Daedalus_Canzoni_villanesche_alla_napolitana', '', 7, 1, '2012-01-04', '0000-00-00'),
(196, 0, 'uploads/discographies', 'O Vergina santa', '.gif', 2, 'Daedalus_O_vergina_santa_non_m''abbandonare', '', 8, 1, '2012-01-04', '0000-00-00'),
(197, 0, 'uploads/discographies', 'cd_el_cancionero_de_la_catedral_de_segovia', '.jpg', 2, 'Daedalus_el_cancionero_de_la_catedral_de_segovia', '', 9, 1, '2012-01-04', '0000-00-00'),
(198, 0, 'uploads/discographies', 'cd_il_cantar_moderno', '.gif', 2, 'Daedalus_Il_cantar_moderno', '', 10, 1, '2012-01-04', '0000-00-00'),
(199, 0, 'uploads/discographies', 'cd_missa_super_allez_regrets', '.gif', 2, 'Daedalus_Johannes_prioris', '', 11, 1, '2012-01-04', '0000-00-00'),
(200, 0, 'uploads/discographies', 'cd_delizie_napoletane', '.jpg', 2, 'Daedalus_Delizie_napoletane', '', 12, 1, '2012-01-04', '0000-00-00'),
(202, 0, 'uploads/discographies', 'cd_resonanzen__99', '.jpg', 2, 'Daedalus_Rezonanzen_99', '', 13, 1, '2012-01-04', '0000-00-00'),
(203, 0, 'uploads/discographies', 'cd_millennium_of_music', '.jpg', 2, 'Daedalus_Millenium_of_music', '', 14, 1, '2012-01-04', '0000-00-00'),
(204, 0, 'uploads/discographies', 'cd_festivoce', '.jpg', 2, 'Daedalus_Festivoce', '', 15, 1, '2012-01-04', '0000-00-00'),
(205, 0, 'uploads/discographies', 'mds_ange_et_demon', '.jpg', 2, 'MdS_Ange_et_démons', '', 1, 1, '2012-01-04', '0000-00-00'),
(206, 0, 'uploads/discographies', 'mds_bonus_track', '.jpg', 2, 'MdS_Bonus_track', '', 2, 1, '2012-01-04', '0000-00-00'),
(207, 0, 'uploads/discographies', 'mds_marquis_de_saxe', '.jpg', 2, 'MdS_Marquis_de_saxe', '', 3, 1, '2012-01-04', '0000-00-00'),
(208, 0, 'uploads/discographies', 'mds_variations_goldberg', '.jpg', 2, 'MdS_Variations_goldberg', '', 4, 1, '2012-01-04', '0000-00-00'),
(209, 0, 'uploads/discographies', 'schola__musique_sacree_a_cappella', '.jpg', 2, 'Schola_Musique_sacrée_a_capella', '', 1, 1, '2012-01-04', '0000-00-00'),
(210, 0, 'uploads/discographies', 'schola_etoiles__etoiles_resplendissez', '.jpg', 2, 'Schola_Etoiles_etoiles_resplendissez', '', 2, 1, '2012-01-04', '0000-00-00'),
(211, 0, 'uploads/img_trio_nota_bene', 'photo0', '.jpg', 2, 'trio_nota_bene_001', '', 1, 1, '2012-01-04', '0000-00-00'),
(212, 0, 'uploads/img_trio_nota_bene', 'photo1', '.jpg', 2, 'trio_nota_bene_002', '', 2, 1, '2012-01-04', '0000-00-00'),
(213, 0, 'uploads/img_trio_nota_bene', 'photo2', '.jpg', 2, 'trio_nota_bene_003', '', 3, 1, '2012-01-04', '0000-00-00'),
(214, 0, 'uploads/img_trio_nota_bene', 'photo3', '.jpg', 2, 'trio_nota_bene_004', '', 1, 1, '2012-01-04', '0000-00-00'),
(215, 0, 'uploads/img_trio_nota_bene', 'photo4', '.jpg', 2, 'trio_nota_bene_005', '', 5, 1, '2012-01-04', '0000-00-00'),
(216, 0, 'uploads/img_trio_nota_bene', 'photo5', '.jpg', 2, 'trio_nota_bene_006', '', 6, 1, '2012-01-04', '0000-00-00'),
(217, 0, 'uploads/sound_trio_nota_bene', 'tnb_1_rasch__joachim_raff', '.mp3', 2, 'trio_nota_bene_001', '<strong><i>Rasch</i></strong><br/>\r\nPiano Trio No. 1 in C Minor, Op. 102<br/>\r\nJoachim Raff', 1, 1, '2012-01-04', '2012-01-04'),
(218, 0, 'uploads/sound_trio_nota_bene', 'tnb_2_andante_quietto__ernest_boloch', '.mp3', 2, 'trio_nota_bene_002', '<strong><i>Andante Quietto</i></strong><br/>\r\nThree Nocturnes<br/>\r\nErnst Bloch', 2, 1, '2012-01-04', '2012-01-04'),
(219, 0, 'uploads/sound_trio_nota_bene', 'tnb_3_allegro_moderato__frank_martin', '.mp3', 2, 'trio_nota_bene_003', '<strong><i>Andante moderato</i></strong><br/>\r\nTrio on Popular Irish Folk Tunes<br/>\r\nFrank Martin', 3, 1, '2012-01-04', '2012-01-04'),
(220, 0, 'uploads/sound_trio_nota_bene', 'tnb_4_lento_lugubre_rachmaninov', '.mp3', 2, 'trio_nota_bene_004', '<strong><i>Lento Lugubre</i></strong><br/>\r\nTrio Elégiaque no 1 en sol mineur<br/>\r\nSergeï Rachmaninov', 4, 1, '2012-01-04', '0000-00-00'),
(221, 0, 'uploads/sound_trio_nota_bene', 'tnb_5_allegro_moderato_arenski', '.mp3', 2, 'trio_nota_bene_005', '<strong><i>Allegro moderato</i></strong><br/>\r\nTrio en ré mineur op. 32<br/>\r\nAnton Stepanovich Arensky', 1, 1, '2012-01-04', '0000-00-00'),
(222, 0, 'uploads/sound_trio_nota_bene', 'tnb_6_andante_shostakovich', '.mp3', 2, 'trio_nota_bene_006', '<strong><i>Andante</i></strong><br/>\r\nTrio no 2 op. 67<br>\r\nDmitri Shostakovich', 6, 1, '2012-01-04', '0000-00-00'),
(223, 0, 'uploads/sound_trio_nota_bene', 'tnb_7_scherzando_daetwyler', '.mp3', 2, 'trio_nota_bene_007', '<strong><i>Scherzando</i></strong><br/>\r\nConcertino pour violon, violoncelle et piano<br/>\r\nJean Daetwyler', 7, 1, '2012-01-04', '0000-00-00'),
(224, 0, 'uploads/discographies', '100%_russian_cd_2720', '.png', 2, 'CD_TNB_100% Russian', '', 1, 1, '2012-02-07', '0000-00-00'),
(225, 0, 'uploads/discographies', 'swiss_perspectives_cd_2912', '.png', 2, 'Swiss Perspective_TNB', '', 1, 1, '2012-02-07', '0000-00-00'),
(226, 0, 'uploads/discographies', 'jean_daetwyler_trios_cd1216', '.jpg', 2, 'TNB_JEAN DAETWYLER TRIOS', '', 1, 1, '2012-02-07', '0000-00-00'),
(227, 0, 'uploads/discographies', '100%_russian_cd_2720', '.jpg', 2, 'TNB_100 Russian', '', 1, 1, '2012-02-07', '0000-00-00'),
(228, 0, 'uploads/discographies', 'tnb_russe', '.jpg', 2, 'TNB_russe', '', 1, 1, '2012-02-07', '0000-00-00'),
(229, 0, 'uploads/illustrations', 'cingria_turban', '.jpg', 2, 'Cingria turban', '', 1, 1, '2012-02-21', '0000-00-00'),
(230, 0, 'uploads/illustrations', 'cingria_chapeau', '.jpg', 2, 'cingria_chapeau', '', 1, 1, '2012-02-21', '0000-00-00'),
(232, 0, 'uploads/documents', 'bulletin_d_inscription', '.pdf', 2, 'Bulletin d''inscription Ã  l''Association', '', 1, 1, '2012-02-28', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `username`, `first_name`, `last_name`) VALUES
(1, 'al-eck', 'aleck', 'nowitzki'),
(2, '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `writing`
--

CREATE TABLE IF NOT EXISTS `writing` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Contenu de la table `writing`
--

INSERT INTO `writing` (`writing_id`, `template_id`, `language_id`, `writing_title`, `writing_description`, `writing_content`, `upload_file_id`, `dir_name`, `media_url`, `writing_public_date`, `admin_id`, `writing_status`, `writing_rank`, `writing_publication_start_date`, `writing_publication_end_date`, `writing_creation_date`, `writing_modification_date`) VALUES
(5, 59, 2, 'Agence de concerts', '', '<p><strong>agencedeconcerts.ch</strong> œuvre dans le domaine de la production de concerts (organisation, financement, promotion) et de la diffusion de musiciens et d''ensembles, principalement dans le milieu de la musique classique et ancienne.</p> \r\n\r\n<p><br /></p>\r\n\r\n<p>Fondée en 2011 par Frédéric Studer, <strong>agencedeconcerts.ch</strong> poursuit les activités initiées depuis plus de dix ans par son fondateur dans le milieu musical professionnel, souhaitant ainsi répondre au mieux aux attentes des musiciens pour lesquels elle s''engage.</p>\r\n\r\n<p><br /></p>\r\n\r\n<p>L''agence occupe actuellement deux personnes, son fondateur à plein-temps ainsi qu''une collaboratrice à 80%.</p>', 0, '0', '', '', 0, 1, 1, '2011-07-19', '2021-07-19', '2011-07-19', '2011-12-14'),
(8, 63, 2, 'Agence de concerts', '', '<p><strong>agencedeconcerts.ch</strong> œuvre dans le domaine de la production de concerts (organisation, financement, promotion) et de la diffusion de musiciens et d''ensembles, principalement dans le milieu de la musique classique et ancienne.</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>Fondée en 2011 par Frédéric Studer, <strong>agencedeconcerts.ch</strong> poursuit les activités initiées depuis plus de dix ans par son fondateur dans le milieu musical professionnel, souhaitant ainsi répondre au mieux aux attentes des musiciens pour lesquels elle s''engage.</p> \r\n\r\n<p><br/></p>\r\n\r\n<p><strong>agencedeconcerts.ch</strong> gère la production (organisation et financement) et la promotion de concerts pour différentes associations. Son activité s''étend principalement autour du site exceptionnel de Valère (Sion- Valais- Suisse).</p> \r\n\r\n<p><br/></p>\r\n\r\n<p><strong>agencedeconcerts.ch</strong> soutient des artistes et des ensembles dans la promotion de leurs activités musicales professionnelles. Ce soutien peut aller de la recherche de concerts à une aide plus importante (gestion administrative et financière).</p>\r\n\r\n<p><br/></p>\r\n\r\n<p>L''agence occupe actuellement deux personnes : son fondateur, Frédéric Studer, à plein-temps ainsi qu''une collaboratrice, Mélanie Sauthier, à 80%.</p> ', 0, '0', '', '', 0, 1, 1, '2011-09-23', '2021-09-23', '2011-09-23', '2011-12-14'),
(9, 65, 2, 'Production', '', '<p>\r\nagencedeconcerts.ch gère la production et la promotion de concerts pour différentes associations.\r\n<br/><br/>Son activité s''étend principalement autour du site exceptionnel de Valère (Sion - Valais - Suisse). </p>', 0, '0', '', '', 1, 1, 1, '2011-10-11', '2021-10-11', '2011-10-11', '2011-12-06'),
(10, 67, 2, 'Diffusion', '', '<p>agencedeconcerts.ch soutient des artistes et des ensembles dans la promotion de leurs activités musicales professionnelles.\r\n<br/><br/>Ce soutien peut aller de la recherche de concerts à une aide plus importante (gestion administrative et financière). </p>', 0, '0', '', '', 1, 1, 1, '2011-10-11', '2014-10-11', '2011-10-11', '2011-12-06'),
(13, 78, 2, 'Chapeau', '', 'La parution des <em>Å’uvres complÃ¨tes critiques de Charles-Albert Cingria</em> est lâ€™occasion pour lâ€™Association des amis de CAC de lancer un site Internet dÃ©diÃ© Ã  lâ€™Ã©crivain. Il se veut un lieu dâ€™informations et de rÃ©fÃ©rences, ainsi quâ€™une faÃ§on de continuer Ã  faire vivre et rayonner lâ€™Å“uvre originale et encore mÃ©connue de cet auteur qui Ã©chappe aux Ã©tiquettes et aux catÃ©gories, et rÃ©jouit ceux qui le dÃ©couvrent.', 0, '0', '', '', 19, 1, 1, '2012-02-21', '2022-02-21', '2012-02-21', '2012-02-21'),
(14, 78, 2, 'Corps', '', '<br/><img src="uploads/illustrations/cingria_turban.jpg" alt="" class="align_left" /><strong>Un vÃ©lo au plafond</strong>\r\n\r\n<p>\r\nLes amateurs de Cingria ont un signe de ralliementÂ : ils parlent de leur auteur prÃ©fÃ©rÃ© comme dâ€™un ami trÃ¨s proche, et le dÃ©signent par son simple prÃ©nom. En littÃ©rature il y a Marcel, il y a Blaise, il y a Gustave, il y a Alfred, il y a Jean-Jacques. Et il y a Charles-Albert. Câ€™est un mythe, Charles-Albert. Une silhouette trapue immÃ©diatement reconnaissable croquÃ©e par GÃ©a Augsbourg, une rÃ©putation de dandy pique-assiette, une poignÃ©e de livres serrÃ©s sur une Ã©tagÃ¨re de bouquinerie, des blagues devenues anecdotes devenues aventures devenues histoires devenues lÃ©gendes devenuesâ€¦ Charles-Albert Cingria.\r\n</p>\r\n<p>\r\nIl faut le lire, et le relireÂ : ouvrir Cingria, câ€™est se poser en complice, en interlocuteur, câ€™est lâ€™Ã©couter causer, deviser, rire, sâ€™indigner, houspiller, enseigner, chanter, jouer du virginal. En rade sur le pierrier oÃ¹ Cingria sâ€™Ã©chappe, deux cents mÃ¨tres en avant, il faut continuer. Le jeu en vaut la chandelle.\r\n</p>\r\n<p>\r\nPourquoi Charles-Albert fascine-t-ilÂ ? On dit que lâ€™Ã©crivain, en Suisse romande, nâ€™a pas vraiment pour habitude de jouer les agitateurs, les gais lurons, les extravertis. La fonction troublionne nâ€™est pas sa tasse de thÃ©. Cingria fait figure dâ€™exception (et ce trait est chez lui une constante). Dâ€™ailleurs il nâ€™est pas Â«Â Suisse romandÂ Â»Â ; il est Â«Â Italo-franc levantinÂ Â». Il Ã©volue hors de lâ€™espace et du temps, prodigieusement libre. Son Å“uvre parle. Elle sâ€™Ã©parpille, se morcelle mais abonde. Une Å“uvre palimpsesteÂ ; il en vient de partout, des chroniques, des billets, des plaquettes de cinq pages, des articles dispersÃ©s aux quatre coins de lâ€™Europe, des comptes rendus, des ouvrages de musicologie et dâ€™histoire mÃ©diÃ©valeâ€¦ Une fois rassemblÃ©e, cette masse crie pourtant sa cohÃ©rence, son originalitÃ©, son intemporalitÃ© et sa mordante actualitÃ©.\r\n</p>\r\n\r\n<p>\r\nOn sâ€™est Ã©chinÃ© Ã  dÃ©finir la maniÃ¨re de Cingria. Toujours dans la dualitÃ©. CingriaÂ : classique et baroque Ã  la fois. Antique et moderne. Profond et dÃ©sinvolte. Elitiste et populaire. Erudit et libre. Latin et oriental. Nationaliste et cosmopolite. Solidaire et dÃ©tachÃ©. Mature et Ã©ternel enfant. Charles-Albert, câ€™est les <em>pizzicati</em> et le <em>swing</em> rÃ©unis, les salons parisiens et les banquettes des trains, les bibliothÃ¨ques monacales et le Buffet de la gare, le pacha Ã  turban et le tramp griffonnant au bord dâ€™un filet dâ€™eau. Le paradoxe pour festin.\r\n</p>\r\n<img src="uploads/illustrations/cingria_chapeau.jpg" alt="" class="align_right" />\r\n<p>\r\nCingria cultive les Ã©longations. Son goÃ»t pour lâ€™histoire, la recherche, la glose et la musique savante nâ€™est pas dissociable de sa veine burlesque, ironique, onirique. Son Ã©rudition phÃ©nomÃ©nale nâ€™a dâ€™Ã©gale que sa capacitÃ© Ã  discourir Â«Â <em>positivement</em> sur rienÂ Â». Lâ€™Ã©criture est une premiÃ¨re nature. Lâ€™improvisation â€“ il y a du jazz chez Cingria â€“ est sa ligne de conduite (dâ€™autres disent Â«Â digressionÂ Â», et froncent les sourcils). Mais il y a du plaisir dans ces lignes solides, et, derriÃ¨re les anecdotes et les saillies, un sens profond de lâ€™<em>Ãªtre</em>Â : celui des gens, des objets, des lieux, des Ã©poques. Une attention sans faille Ã  ce qui <em>est</em>, et Ã  ce qui est <em>lÃ </em>. Une cosmogonie aussi, un lien lyrique entretenu avec lâ€™Univers, une pensÃ©e mÃ©taphysique qui se dÃ©ploie, par moments, sous lâ€™autoritÃ© des astres.\r\n</p>\r\n<p>\r\nCingria est un rÃ©actif. Comme chez tout polÃ©miste, sa mauvaise foi est pleinement assumÃ©e. La partialitÃ© extrÃªme de ses dÃ©clarations et de ses positionnements, sur tout et sur nâ€™importe quoi â€“ femmes, politique, machines Ã  Ã©crire, facteurs, voitures, chats, typographes, rÃ©chauds Ã  gaz, chemises â€“ est contrebalancÃ©e par une propension Ã  retourner son veston et se dÃ©dire comme on taille son crayon. Car le vrai est mobile.\r\n</p>\r\n<p>\r\nCingria a marquÃ© ses contemporains. Modigliani, Jarry, Strawinsky, Satie, Cocteau, Jouhandeau, Artaud, LÃ©autaud, Ansermet, Dubuffet, LÃ©gerâ€¦ Et Blaise Cendrars, avec qui il sâ€™est brouillÃ© Ã  mort. Chez Charles-Albert, comme chez le poÃ¨te Ã  la main coupÃ©e, lâ€™Ã©chappÃ©e dÃ©clenche souvent le flot de lâ€™Ã©criture. Mais Cingria est de la race des promeneurs, plus vagabond que voyageurÂ : un mÃ¨tre carrÃ© dâ€™herbe ou de bitume lui suffit pour un aprÃ¨s-midi de soleil, un crÃ©puscule dâ€™Ã©toiles. Lâ€™aventure Ã  portÃ©e de main, entre Amsterdam et Rome. Câ€™est dans le <em>minuscule</em> quâ€™excelle Cingria, dans lâ€™esquisse et le croquis Ã  main levÃ©e. Le pÃ©tard qui Ã©clate au visage.\r\n</p>\r\n<p>\r\nUne lÃ©gende sâ€™est faite au sujet de Cingria comme il y en a au sujet de Blaise Cendrars, de Jack London ou dâ€™HomÃ¨re. Une mise en scÃ¨ne de soi, qui confÃ¨re Ã  lâ€™homme derriÃ¨re lâ€™Ã©crivain une dimension dâ€™insaisissable proximitÃ©. Cingria dissimule, et continuera de le faireÂ : lâ€™important Ã©tant ce quâ€™il veut nous montrer, et ce quâ€™il fait surgir.\r\n</p>\r\n<p>  \r\nLâ€™observation comme nourritureÂ : le monde vient Ã  Charles-Albert, qui le reÃ§oit, le distord et le rend en rÃ©cits dÃ©bridÃ©s, en chroniques ramassÃ©es, ferrugineuses, parfois limpides comme de lâ€™eau de grotte. Et ces centaines de stalactites, dÃ©sordonnÃ©es dans les annÃ©es, dÃ©posÃ©es au cÅ“ur des campagnes, en Valais, en Haute-Savoie, dans le PiÃ©mont, au bord de la Loire, de lâ€™Oise, du RhÃ´ne, dans les citÃ©s, Ã  Constantinople, Ã  GenÃ¨ve, Ã  Lausanne, Ã  Venise, Ã  Saint-Gall, Ã  BÃ´ne, Ã  Paris, forment une cathÃ©drale. Et Cingria lâ€™occupe, modestement debout Ã  Ã©grener des neumes, encore surpris de son succÃ¨s, un vÃ©lo au plafond.\r\n</p>\r\n<p>\r\n<br/>\r\n<strong>Daniel Vuataz</strong>\r\n</p>', 0, '0', '', '', 19, 1, 1, '2012-02-21', '2022-02-21', '2012-02-21', '2012-02-22'),
(27, 82, 2, 'Notice biographique', '', 'Ecrivain inclassable, Charles-Albert Cingria (1883-1954), nÃ© Ã  GenÃ¨ve, a vÃ©cu et publiÃ© en Suisse et en France des textes de diverse nature : essais historiques, traitÃ©s de musicologie, propos variÃ©s, chroniques dâ€™humeurâ€¦<div id="more_less"><br/>Ses Å’uvres complÃ¨tes (11 volumes, plus cinq volumes de correspondance et un de bibliographie) ont paru Ã  Lausanne, aux Editions de Lâ€™Age dâ€™Homme, entre 1967 et 1981."Brumaire savoisien", qui y est rÃ©Ã©ditÃ© dans le volume VI â€” auquel renvoie ma pagination â€” faisait originellement partie du recueil Stalactites (Lausanne, La Guilde du Livre, 1941). Cette prose a Ã©tÃ© reprise dans La Fourmi rouge et autres textes, Lausanne, Lâ€™Age dâ€™Homme, "Poche suisse" (1978, 2e rÃ©Ã©d. 1995).</div>', 0, '0', '', '', 19, 1, 1, '2012-02-21', '2022-02-21', '2012-02-21', '0000-00-00'),
(15, 80, 2, 'Â«Â GraffitiÂ Â», 1941', 'Â«Â GraffitiÂ Â», 1941', 'Â«Â Câ€™est dans cet Ã©tat quâ€™il faut Ãªtre. Divinement neuf et calme, comme une pÃªche en juillet dans la nuit dâ€™un verger quâ€™aucun vent ne remue.Â Â»', 0, '0', '', '', 19, 1, 1, '2012-02-21', '2022-02-21', '2012-02-21', '0000-00-00'),
(16, 80, 2, 'Â«Â Brumaire savoisienÂ Â», 1941', 'Â«Â Brumaire savoisienÂ Â», 1941', 'Â«Â Le paysage existe dÃ©jÃ  en tant quâ€™aventure ou intrigue vÃ©gÃ©tale dâ€™un intÃ©rÃªt fou [â€¦]Â Â»\r\n', 0, '0', '', '', 19, 1, 2, '2012-02-21', '2022-02-21', '2012-02-21', '0000-00-00'),
(17, 80, 2, 'Petit labyrinthe harmonique, 1929', '<em>Petit labyrinthe harmonique</em>, 1929', 'Â«Â Moi qui ai un lieu, une vieillesse dâ€™autres, des tÃ©rÃ©binthes, dâ€™immenses biens, des flottilles de lourd cÃ¨dre oÃ¹ passent de fantomatiques fastueux poissons, au fond de la mer, mais qui suis ailleurs, seul avec ce plectre Ã  faire chuter les Ã©toiles ; ne voulant pas, ne pouvant plus, me laissant vivre : de rien : de bonjours, de bonsoirs, de verres et de rÃ©ciprocitÃ©s de verres Ã  droite et Ã  gauche, de bouts de pain trouvÃ©s chez moi sous des caisses ; mâ€™avilissant, me faisant aimable alors que je suis tueur, me faisant pittoresque alors que je suis roi.Â Â»', 0, '0', '', '', 19, 1, 3, '2012-02-21', '2022-02-21', '2012-02-21', '0000-00-00'),
(18, 80, 2, 'Â«Â [Lâ€™Ame antique]Â Â», vers 1932', 'Â«Â [Lâ€™Ame antique]Â Â», vers 1932', 'Â«Â Nous avions, tous, Ã  la maison, lâ€™Ã¢me antique.Â Â»', 0, '0', '', '', 19, 1, 4, '2012-02-21', '2022-02-21', '2012-02-21', '0000-00-00'),
(19, 80, 2, 'Â«Â [Je suis peut-Ãªtre diffÃ©rentâ€¦]Â Â», sans date', 'Â«Â [Je suis peut-Ãªtre diffÃ©rentâ€¦]Â Â», sans date', 'Â«Â Je ne puis comprendre par exemple que lâ€™on ne se rende pas compte que chaque minute est une concession de pulsation divine dont nous avons le bonheur de pouvoir nous servir, et que câ€™est donc non un Ã©tat ordinaire, non un Ã©tat naturel, mais un Ã©tat miraculeux dont nous bÃ©nÃ©ficions ou plutÃ´t dont nous ne bÃ©nÃ©ficions pas assez. Une chance sur cent milliards de probabilitÃ©s ou le nÃ©ant absolu.Â Â»', 0, '0', '', '', 19, 1, 5, '2012-02-21', '2022-02-21', '2012-02-21', '0000-00-00'),
(20, 80, 2, 'Le Seize Juillet, 1929', '<em>Le Seize Juillet</em>, 1929', 'Â«Â Entre le nÃ©ant et le surnaturel, ce quâ€™il y a de stupÃ©fiant est le rÃ©el. Entre bouger le petit doigt et faire tomber une cheminÃ©e dâ€™usine il nâ€™y a pas une diffÃ©rence si grande.Â Â»', 0, '0', '', '', 19, 1, 6, '2012-02-21', '2022-02-21', '2012-02-21', '0000-00-00'),
(21, 80, 2, 'Petit labyrinthe harmonique, 1929', '<em>Petit labyrinthe harmonique</em>, 1929', 'Â«Â Je suis un cristal qui ne respire pas : qui existe [â€¦]. Par le bas, je reste animal, mais je suis une boule. Jâ€™ai frais aux cuisses. Je nâ€™ai plus besoin de voir. câ€™est adorable. Jâ€™ai aussi un peu peur. Câ€™est adorable. Je vais excessivement vite. [â€¦] Je suis heureux de ce siÃ¨cle, heureux de ce sable, heureux de ma selle Brooks aux exquis craquements.Â Â»', 0, '0', '', '', 19, 1, 7, '2012-02-21', '2022-02-21', '2012-02-21', '0000-00-00'),
(22, 80, 2, 'Â«Â La Fourmi rougeÂ Â», 1931', 'Â«Â La Fourmi rougeÂ Â», 1931', 'Â«Â Rien. Je suis absolument libre, un peu seul. Jâ€™ai faim. Je suis un Ãªtre  comme les autres. Jâ€™ai besoin de mâ€™asseoir et de mâ€™Ã©tendre. Je suis fou de joie.Â Â»', 0, '0', '', '', 19, 1, 8, '2012-02-21', '2022-02-21', '2012-02-21', '0000-00-00'),
(23, 80, 2, 'Â«Â EpisseaÂ Â», 1939', 'Â«Â <em>Epissea</em>Â Â», 1939', 'Â«Â Faire quoi alors ? Des poÃ¨mes ? Je nâ€™y tiens pas : je suis persuadÃ© quâ€™ils ne vaudraient rien â€“ rien en ce moment â€“ : le dÃ©pit de ne pouvoir mâ€™exprimer sur un argument qui est le seul oÃ¹ je me sens une naturelle maÃ®trise abolit en moi toute Ã©motion, toute verve. Des travaux alors, de ces travaux de cave, historiques ou scientifiques ou palimpsestiques qui saturent lâ€™Ãªtre de dÃ©lire-dÃ©lice faisant tout oublier ?  certainement, mais il faut vivre, et ces travaux, aussi opportuns, urgents quâ€™ils soient, nâ€™intÃ©ressent ni les Ã©diteurs, ni le public, ni personne. Il vaut mieux nâ€™y pas penser.Â Â»', 0, '0', '', '', 19, 1, 9, '2012-02-21', '2022-02-21', '2012-02-21', '0000-00-00'),
(24, 80, 2, 'Â«Â Voyage de Saint-Gall Ã  OuchyÂ Â», 1943', 'Â«Â Voyage de Saint-Gall Ã  OuchyÂ Â», 1943', 'Â«Â Est-ce que jâ€™aime lâ€™hiver ? Oui, je suis obligÃ© de vous dire que jâ€™aime lâ€™hiver. Jâ€™aime aussi lâ€™Ã©tÃ© et sa suite, lâ€™automne, prodigieusement. Le printemps ? Absolument pas â€“ Ã  cause de malaises astrologiques-physiques quâ€™il mâ€™est impossible de vaincre. Il faut vous dire que je suis nÃ© en fÃ©vrier et le 10, et que pour les sujets nÃ©s Ã  ces degrÃ©s ou coins de degrÃ©s, câ€™est Ã  ce moment une mauvaise passe. Il faudrait que je prenne des tisanes ou Dieu sait quoi. Jâ€™aime mieux continuer Ã  prendre lâ€™apÃ©ritif Ã  votre santÃ© et surtout Ã  la mienneâ€¦ et attendre.Â Â»', 0, '0', '', '', 19, 1, 10, '2012-02-21', '2022-02-21', '2012-02-21', '0000-00-00'),
(25, 80, 2, 'Â«Â MÃ©taphysiqueÂ Â», vers 1950', 'Â«Â MÃ©taphysiqueÂ Â», vers 1950', 'Â«Â Il me semble que je nais aujourdâ€™hui Ã  lâ€™instant mÃªme. Je sais bien que je suis destinÃ© Ã  pÃ©rir mais il y a cette minute quand mÃªme maintenant oÃ¹ je suis Ã©ternel et illimitÃ© si je prends la peine dâ€™en prendre conscience. Et rien ne rÃ©pond Ã  cet instant-lÃ  que lâ€™expÃ©rience des autres sera la mienne. Je suis peut-Ãªtre dâ€™une qualitÃ© tout Ã  fait diffÃ©rente. Il se peut que lâ€™univers sombre avec moi comme il nâ€™existait pas avant que je fusse nÃ©.Â Â»', 0, '0', '', '', 19, 1, 11, '2012-02-21', '2022-02-21', '2012-02-21', '0000-00-00'),
(26, 80, 2, 'Appendices Ã  Bois sec Bois vert, vers 1948', 'Appendices Ã  <em>Bois sec Bois vert</em>, vers 1948', 'Â«Â Ce que je fais, câ€™est des petits livres sur le plein air et les ferrailles et un peu de pensÃ©e â€“ dialectique pure â€“, et des voyages dans lâ€™histoire quand cette passion me prend et me reprend. Ma poÃ©sie est bien furtive, aussi jâ€™arrÃªte dÃ¨s que le flot sâ€™arrÃªte. Et sâ€™il continue, jâ€™arrÃªte nÃ©anmoins.Â Â» ', 0, '0', '', '', 19, 1, 12, '2012-02-21', '2022-02-21', '2012-02-21', '0000-00-00'),
(28, 77, 2, 'Chapeau', 'Chapeau', 'Lâ€™Association des Amis de Charles-Albert Cingria a Ã©tÃ© fondÃ©e Ã  Romont (Fribourg) le 11 mai 1963. Elle a statutairement pour but de maintenir vivantes la mÃ©moire et lâ€™Å“uvre de Charles-Albert Cingria, de favoriser la diffusion de ses textes et de travailler Ã  la constitution dâ€™un fonds documentaire mis Ã  la disposition des chercheurs.', 0, '0', '', '', 19, 1, 1, '2012-02-23', '2022-02-23', '2012-02-23', '0000-00-00'),
(29, 77, 2, 'Corps', 'Corps', '<p>Son premier comitÃ© Ã©tait constituÃ© du neveu de lâ€™auteur Albert Cingria (prÃ©sident), de sa niÃ¨ce Isabelle Melley (secrÃ©taire) et du professeur Pierre-Olivier Walzer (vice-prÃ©sident). Ce noyau dâ€™origine comprenait aussi Jacques Chessex, Georges Anex, Jean-Luc Seylaz, Henry-Louis Mermod, Aloyse Margot et GisÃ¨le Peyron, laquelle sâ€™Ã©tait dÃ©jÃ  attelÃ©e Ã  la recherche  et la transcription dâ€™une grande partie de la production de Cingria, Ã©parpillÃ©e dans une centaine de revues et journaux.\r\n</p>\r\n<p>\r\nEntre 1967 et 1969, les dix premiers volumes des <a href="?p=oeuvres_completes" class="inline_link"><span>Å’uvres complÃ¨tes</span></a> paraissent Ã  lâ€™enseigne des <a href="http://www.lagedhomme.com/" onclick="window.open(this.href, ''_blank''); return false;" class="inline_link"><span>Editions de l''Age d''Homme</span></a>, fondÃ©es lâ€™annÃ©e prÃ©cÃ©dente par Vladimir Dimitrijevic. Isabelle Melley et Pierre-Olivier Walzer, devenu prÃ©sident de lâ€™Association en 1968 (poste quâ€™il occupera plus de vingt ans), prennent une part majeure Ã  cette publication. En 1981, une partie de la correspondance de Cingria est rÃ©unie en cinq volumes, enrichis de deux derniers volumes, lâ€™un dâ€™inÃ©dits et lâ€™autre consacrÃ© Ã  la bibliographie et Ã  lâ€™index gÃ©nÃ©ral. Au total, ce sont dix-sept volumes sous reliure ocre dorÃ©, qui constituent les premiÃ¨res <em>Å’uvres complÃ¨tes</em> de lâ€™auteur.\r\n</p>\r\n<p>\r\nAu printemps 1983, lâ€™Association organise lâ€™exposition du centenaire de la naissance de Cingria, qui se tient Ã  la BibliothÃ¨que nationale suisse et sâ€™exporte au printemps suivant Ã  la BibliothÃ¨que nationale de Paris. Les catalogues illustrÃ©s publiÃ©s Ã  cette occasion tÃ©moignent de la richesse de la documentation rÃ©unie alors â€“ oÃ¹ se signalent en particulier les portraits classiques dâ€™Alexandre, le frÃ¨re de lâ€™Ã©crivain, de RenÃ© Auberjonois, de ThÃ©odore Strawinsky, de Modigliani et de Jean Dubuffet.\r\n</p>\r\n<p>\r\nAvec la progressive disparition des tÃ©moins directs, la mise Ã  disposition dâ€™une bonne partie du Fonds Cingria Ã  Lausanne au Centre de recherche sur les lettres romandes (CRLR) et la direction, dÃ¨s 1991, de sa nouvelle prÃ©sidente Maryke de Courten, lâ€™Association des Amis de Charles-Albert Cingria prend un virage universitaire, concrÃ©tisÃ© par le premier colloque international consacrÃ© Ã  Cingria, Ã  lâ€™UniversitÃ© de Lausanne, les 16 et 17 octobre 1997. Une exposition au MusÃ©e historique de Lausanne, du 16 octobre 1997 au 4 janvier 1998, accompagne la manifestation. Les actes du colloque sont publiÃ©s Ã  Paris trois ans plus tard. Lâ€™Association organise encore dâ€™autres manifestationsÂ : Ã  la SociÃ©tÃ© de lecture de GenÃ¨ve le 26 novembre 2004, une soirÃ©e consacrÃ©e Ã  Charles-Albert Cingria intitulÃ©e Â«Â Quelque bonne secousse salubreÂ Â» propose des confÃ©rences de Jacques RÃ©da et Michel Butor, une prÃ©sentation de deux manuscrits par Charles MÃ©la et des mises en voix dâ€™extraits de lâ€™auteur par Caroline Gasser.\r\n</p>\r\n<p>\r\nLe projet de lâ€™Ã©dition critique des <em>Å’uvres complÃ¨tes</em> est lancÃ© le 17 juin 2000 lors de la dix-huitiÃ¨me assemblÃ©e gÃ©nÃ©rale de lâ€™Association. Il se concrÃ©tise au mois de janvier 2012, avec la parution, aux Editions de Lâ€™Age dâ€™Homme, des deux premiers tomes de <em>RÃ©cits</em>. Quatre autres volumes suivront.</p>', 0, '0', '', '', 19, 1, 1, '2012-02-23', '2022-02-23', '2012-02-23', '0000-00-00'),
(30, 72, 2, 'Chapeau', 'Chapeau', 'Conduite par une Ã©quipe internationale de chercheurs dont les travaux ont Ã©tÃ© soutenus par le Fonds National Suisse de la Recherche Scientifique et par des institutions privÃ©es, la nouvelle Ã©dition des <em>Å’uvres complÃ¨tes</em> de Charles-Albert Cingria a Ã©tÃ© rÃ©alisÃ©e dans le cadre du Centre de recherches sur les lettres romandes de lâ€™UniversitÃ© de Lausanne oÃ¹ est conservÃ©e la plus grande partie des manuscrits de lâ€™Ã©crivain. Elle est Ã©ditÃ©e par Lâ€™Age dâ€™Homme dans la collection Â«Â CaryatidesÂ Â».', 0, '0', '', '', 19, 1, 1, '2012-02-24', '2022-02-24', '2012-02-24', '0000-00-00'),
(31, 72, 2, 'Corps', 'Corps', '<p>Les caractÃ©ristiques principales des <em>OC</em> sont les suivantesÂ :\r\n<ul>\r\n<li><p>Pour la premiÃ¨re fois, l''ensemble de l''Å“uvre de Cingria est pris en compteÂ ; Ã  la totalitÃ© des textes que l''auteur a publiÃ©s de son vivant s''ajoutent un grand nombre d''inÃ©dits restÃ©s jusque-lÃ  Ã  l''Ã©tat de manuscrits.</p>\r\n</li>\r\n<li>\r\n<p>L''Ã©dition adopte des principes scientifiques aussi bien dans l''Ã©tablissement des textes que dans leur accompagnementÂ ; des notes explicatives, des relevÃ©s de variantes, des notes sur le texte et des commentaires critiques proposent des Ã©clairages gÃ©nÃ©tiques, des Ã©claircissements thÃ©matiques, des prÃ©cisions intertextuelles, des pistes interprÃ©tatives.</p>\r\n</li>\r\n<li>\r\n<p>Soucieuse de reflÃ©ter les diffÃ©rentes pulsions et postures d''Ã©criture de Cingria, qui aboutissent Ã  des solutions stylistiques et gÃ©nÃ©riques variÃ©es, la nouvelle Ã©dition ne se contente pas de suivre  la chronologie de la production de l''Ã©crivain, mais regroupe ses rÃ©cits selon trois axes qui justifient le partage en trois partiesÂ : les Â«Â RÃ©citsÂ Â» (dans les deux premiers volumes), oÃ¹ l''on observe comment Cingria est tentÃ© par la fictionÂ ; les Â«Â EssaisÂ Â» (volume 3 et 4), rÃ©unissent les contributions historiques et musicologiques Ã©rudites portant essentiellement sur le Moyen AgeÂ ; les Â«Â ProposÂ Â» (volumes 5 et 6) enfin, lieu d''une Ã©criture davantage en prise sur l''actualitÃ© et souvent destinÃ©e Ã  la presse pÃ©riodique.</p></li>\r\n<li>\r\n<p>Dans chaque volume, un cahier iconographique reproduit, Ã  l''Ã©chelle de la collection, les illustrations des Ã©ditions originales.</p>\r\n</li>\r\n<li><p>Un systÃ¨me d''index et de repÃ¨res permet au lecteur de circuler d''un volume Ã  l''autre, et de s''orienter aisÃ©ment dans une Å“uvre Ã©tendue et complexe.</p></li>\r\n</ul>\r\n</p>\r\n<p>\r\nPar sa rigueur, son exhaustivitÃ©, sa volontÃ© d''aider le lecteur dans sa dÃ©couverte, son souci constant de lisibilitÃ©, cette nouvelle Ã©dition est une rÃ©alisation qui rÃ©pond aux critÃ¨res scientifiques que l''on attend d''une entreprise de cette nature, tout en restant accessible Ã  un public non spÃ©cialisÃ©. Elle est donc Ã  mÃªme de mieux faire connaÃ®tre un des plus grands Ã©crivains du XX<sup>e</sup> siÃ¨cle, dont elle permet de mesurer la qualitÃ© esthÃ©tique, la richesse des contenus et des sujets, ainsi que l''ampleur de l''Ã©critureÂ : elle valorise par lÃ  en le prenant en charge de maniÃ¨re exemplaire, un moment clÃ© du patrimoine culturel suisse.</p>', 0, '0', '', '', 19, 1, 1, '2012-02-24', '2022-02-24', '2012-02-24', '2012-02-25');
