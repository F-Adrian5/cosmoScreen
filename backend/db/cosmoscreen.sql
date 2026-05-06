-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2026 at 10:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cosmoscreen`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `info_link` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`id`, `name`, `info_link`) VALUES
(1, 'Marlon Brando', 'https://www.imdb.com/name/nm0000008/?ref_=nv_sr_srsg_7_tt_0_nm_8_in_0_q_marlo'),
(2, 'Al Pacino', 'https://www.imdb.com/name/nm0000199/?ref_=nv_sr_srsg_0_tt_0_nm_8_in_0_q_al%20'),
(3, 'Robert De Niro', 'https://www.imdb.com/name/nm0000134/?ref_=nv_sr_srsg_8_tt_0_nm_8_in_0_q_rober'),
(4, 'Leonardo DiCaprio', 'https://www.imdb.com/name/nm0000138/?ref_=nv_sr_srsg_4_tt_1_nm_6_in_0_q_leo'),
(5, 'Tom Hanks', 'https://www.imdb.com/name/nm0000158/?ref_=nv_sr_srsg_0_tt_0_nm_8_in_0_q_tom%20h'),
(6, 'Morgan Freeman', 'https://www.imdb.com/name/nm0000151/?ref_=nv_sr_srsg_0_tt_0_nm_8_in_0_q_morga'),
(7, 'Christian Bale', 'https://www.imdb.com/name/nm0000288/?ref_=nv_sr_srsg_1_tt_0_nm_7_in_0_q_chri'),
(8, 'Heath Ledger', 'https://www.imdb.com/name/nm0005132/?ref_=nv_sr_srsg_0_tt_0_nm_8_in_0_q_heath'),
(9, 'Scarlett Johansson', 'https://www.imdb.com/name/nm0424060/?ref_=nv_sr_srsg_1_tt_1_nm_6_in_0_q_scarl'),
(10, 'Brad Pitt', 'https://www.imdb.com/name/nm0000093/?ref_=nv_sr_srsg_0_tt_0_nm_8_in_0_q_brad'),
(11, 'Natalie Portman', 'https://www.imdb.com/name/nm0000204/?ref_=nv_sr_srsg_1_tt_1_nm_6_in_0_q_natali'),
(12, 'Keanu Reeves', 'https://www.imdb.com/name/nm0000206/?ref_=nv_sr_srsg_1_tt_0_nm_7_in_0_q_kea'),
(13, 'Harrison Ford', 'https://www.imdb.com/name/nm0000148/?ref_=nv_sr_srsg_0_tt_2_nm_6_in_0_q_harr'),
(14, 'Johnny Depp', 'https://www.imdb.com/name/nm0000136/?ref_=nv_sr_srsg_6_tt_0_nm_8_in_0_q_joh'),
(15, 'Emma Stone', 'https://www.imdb.com/name/nm1297015/?ref_=nv_sr_srsg_2_tt_1_nm_5_in_0_q_emma'),
(16, 'Matt Damon', 'https://www.imdb.com/name/nm0000354/?ref_=nv_sr_srsg_3_tt_0_nm_8_in_0_q_matt'),
(17, 'Denzel Washington', 'https://www.imdb.com/name/nm0000243/?ref_=nv_sr_srsg_0_tt_0_nm_8_in_0_q_denz'),
(18, 'Cate Blanchett', 'https://www.imdb.com/name/nm0000949/?ref_=nv_sr_srsg_1_tt_0_nm_7_in_0_q_cate'),
(19, 'Anthony Hopkins', 'https://www.imdb.com/name/nm0000164/?ref_=nv_sr_srsg_6_tt_0_nm_8_in_0_q_antho'),
(20, 'Joaquin Phoenix', 'https://www.imdb.com/name/nm0001618/?ref_=nv_sr_srsg_0_tt_0_nm_8_in_0_q_joaq'),
(21, 'John Travolta', 'https://www.imdb.com/name/nm0000237/?ref_=nv_sr_srsg_0_tt_1_nm_7_in_0_q_john%20tr'),
(22, 'Samuel L. Jackson', 'https://www.imdb.com/name/nm0000168/?ref_=nv_sr_srsg_3_tt_0_nm_8_in_0_q_samuel'),
(23, 'Liam Neeson', 'https://www.imdb.com/name/nm0000553/?ref_=nv_sr_srsg_0_tt_0_nm_8_in_0_q_liam'),
(24, 'Elijah Wood', 'https://www.imdb.com/name/nm0000704/?ref_=nv_sr_srsg_1_tt_0_nm_7_in_0_q_elij'),
(25, 'Matthew McConaughey', 'https://www.imdb.com/name/nm0000190/?ref_=nv_sr_srsg_3_tt_0_nm_8_in_0_q_matthew'),
(26, 'Cillian Murphy', 'https://www.imdb.com/name/nm0614165/?ref_=nv_sr_srsg_1_tt_0_nm_7_in_0_q_cilian'),
(27, 'Adam Sandler', 'https://www.imdb.com/name/nm0001191/?ref_=nv_sr_srsg_0_tt_0_nm_8_in_0_q_adam'),
(28, 'Bill Skarsgård', 'https://www.imdb.com/name/nm0803889/?ref_=nv_sr_srsg_0_tt_0_nm_8_in_0_q_bill'),
(29, 'Jesse Eisenberg', 'https://www.imdb.com/name/nm0251986/?ref_=nv_sr_srsg_0_tt_1_nm_7_in_0_q_jesse%20e'),
(30, 'Woody Harrelson', 'https://www.imdb.com/name/nm0000437/?ref_=nv_sr_srsg_0_tt_0_nm_8_in_0_q_woody'),
(31, 'Timothée Chalamet', 'https://www.imdb.com/name/nm3154303/?ref_=nv_sr_srsg_2_tt_0_nm_6_in_0_q_timot'),
(32, 'Robert Downey Jr.', 'https://www.imdb.com/name/nm0000375/?ref_=nv_sr_srsg_6_tt_0_nm_8_in_0_q_robert%20d'),
(33, 'Diego Luna', 'https://www.imdb.com/name/nm0526019/?ref_=nv_sr_srsg_0_tt_1_nm_7_in_0_q_diego'),
(34, 'Andrew Garfield', 'https://www.imdb.com/name/nm1940449/?ref_=nv_sr_srsg_3_tt_0_nm_8_in_0_q_andrew'),
(35, 'Arnold Schwarzenegger', 'https://www.imdb.com/name/nm0000216/?ref_=nv_sr_srsg_1_tt_1_nm_6_in_0_q_arnold'),
(36, 'Tom Cruise', 'https://www.imdb.com/name/nm0000129/?ref_=nv_sr_srsg_0_tt_0_nm_8_in_0_q_tom'),
(37, 'Matthew Lillard', 'https://www.imdb.com/name/nm0000498/?ref_=nv_sr_srsg_0_tt_0_nm_8_in_0_q_matth'),
(38, 'Cary Elwes', 'https://www.imdb.com/name/nm0000144/?ref_=nv_sr_srsg_0_tt_0_nm_8_in_0_q_cary'),
(39, 'Hugh Jackman', 'https://www.imdb.com/name/nm0413168/?ref_=nv_sr_srsg_0_tt_1_nm_7_in_0_q_hug'),
(40, 'Shameik Moore', 'https://www.imdb.com/name/nm4271336/?ref_=nv_sr_srsg_0_tt_5_nm_3_in_0_q_shameik'),
(41, 'Viggo Mortensen', 'https://www.imdb.com/name/nm0001557/?ref_=nv_sr_srsg_0_tt_1_nm_7_in_0_q_viggo'),
(42, 'Dwayne Johnson', 'https://www.imdb.com/name/nm0425005/?ref_=nv_sr_srsg_0_tt_1_nm_7_in_0_q_dwa'),
(43, 'Taron Egerton', 'https://www.imdb.com/name/nm5473782/?ref_=nv_sr_srsg_0_tt_2_nm_6_in_0_q_taron'),
(44, 'Bradley Cooper', 'https://www.imdb.com/name/nm0177896/?ref_=nv_sr_srsg_0_tt_0_nm_8_in_0_q_bradley%20'),
(45, 'Jim Carrey', 'https://www.imdb.com/name/nm0000120/?ref_=nv_sr_srsg_1_tt_0_nm_7_in_0_q_ji');

-- --------------------------------------------------------

--
-- Table structure for table `actor_in_movie`
--

CREATE TABLE `actor_in_movie` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `actor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `actor_in_movie`
--

INSERT INTO `actor_in_movie` (`id`, `movie_id`, `actor_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 2, 3),
(5, 3, 7),
(6, 3, 8),
(7, 4, 21),
(8, 4, 22),
(9, 5, 23),
(10, 6, 5),
(11, 7, 4),
(12, 8, 10),
(13, 9, 24),
(14, 10, 24),
(15, 11, 24),
(16, 12, 12),
(17, 13, 13),
(18, 14, 13),
(19, 15, 13),
(20, 16, 20),
(21, 17, 20),
(22, 18, 19),
(23, 19, 25),
(24, 20, 26),
(25, 21, 6),
(26, 22, 9),
(27, 23, 11),
(28, 24, 14),
(29, 25, 15),
(30, 26, 16),
(31, 27, 17),
(32, 9, 18),
(33, 28, 28),
(34, 29, 30),
(35, 29, 29),
(36, 29, 6),
(37, 25, 30),
(38, 30, 31),
(39, 31, 32),
(40, 32, 33),
(41, 33, 34),
(42, 34, 35),
(43, 35, 12),
(44, 36, 14),
(45, 37, 36),
(46, 38, 4),
(47, 38, 5),
(48, 39, 34),
(49, 40, 37),
(50, 43, 40),
(51, 44, 41),
(52, 45, 42),
(53, 46, 43),
(54, 46, 22),
(55, 47, 27),
(56, 48, 44),
(57, 49, 36),
(58, 50, 45),
(59, 42, 39),
(60, 41, 38);

-- --------------------------------------------------------

--
-- Table structure for table `buffet`
--

CREATE TABLE `buffet` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(5) NOT NULL,
  `description` varchar(250) NOT NULL,
  `type` varchar(25) NOT NULL,
  `img` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `buffet`
--

INSERT INTO `buffet` (`id`, `name`, `price`, `description`, `type`, `img`) VALUES
(1, 'Kis Üdítő', 1300, 'Fél liter frissítő kortyolnivaló – tökéletes a mozizás indításához!', 'Üdítő', 'small_drink.jpg'),
(2, 'Közepes Üdítő', 1500, 'Több korty, több élmény – az ideális mozis társ!', 'Üdítő', 'medium_drink.jpg'),
(3, 'Nagy Üdítő', 1700, 'Egy liter hűsítő ital, hogy kitarts a film végéig!', 'Üdítő', 'large_drink.jpg'),
(4, 'Kis Cola', 1300, 'Klasszikus szénsavas cola kis pohárban – a mozi íze!', 'Üdítő', 'small_cola.jpg'),
(5, 'Nagy Cola', 1700, 'Nagy buborékok, intenzív íz – cola, ami végigkísér a filmen!', 'Üdítő', 'large_cola.jpg'),
(6, 'Kis Víz', 900, 'Maradj hidratált – kicsi, tiszta frissesség.', 'Víz', 'small_water.jpg'),
(7, 'Nagy Víz', 1200, 'Tiszta, friss víz, ami lehűt az izgalmak közben.', 'Víz', 'large_water.jpg'),
(8, 'Cukormentes Cola', 1400, 'Minden a buborék, semmi a cukor – bűntudatmentes frissítő!', 'Üdítő', 'sugarfree_cola.jpg'),
(9, 'Kis Sprite', 1300, 'Citrom-lime szikra kis pohárban – könnyed és frissítő!', 'Üdítő', 'small_sprite.jpg'),
(10, 'Nagy Sprite', 1700, 'Üdítően buborékos – Sprite, ami feldobja a hangulatot!', 'Üdítő', 'large_sprite.jpg'),
(11, 'Espresso', 1000, 'Erős és intenzív – egy löket energia a film előtt!', 'Kávé', 'espresso.jpg'),
(12, 'Cappuccino', 1400, 'Selymes hab, gazdag íz – a tökéletes bemelegítés a mozihoz.', 'Kávé', 'cappuccino.jpg'),
(13, 'Latte', 1500, 'Krémes kényelem egy csészében – a legjobb társ a filmhez.', 'Kávé', 'latte.jpg'),
(14, 'Kis Sós Popcorn', 1600, 'Klasszikus sós ropogás mini kiszerelésben – időtlen íz a mozirajongóknak!', 'Popcorn', 'small_salted_popcorn.jpg'),
(15, 'Közepes Sós Popcorn', 1800, 'Aranyszínű, sós tökéletesség – a legjobb mozis nasi!', 'Popcorn', 'medium_salted_popcorn.jpg'),
(16, 'Nagy Sós Popcorn', 2000, 'Egy vödörnyi sós boldogság, ami kitart a film végéig!', 'Popcorn', 'large_salted_popcorn.jpg'),
(17, 'Kis Cheddar Popcorn', 1800, 'Intenzív cheddar íz, ropogós popcorn – sajtos csavar a klasszikusban!', 'Popcorn', 'small_cheddar_popcorn.jpg'),
(18, 'Közepes Cheddar Popcorn', 2000, 'Cheddar bevonatú ropogás – igazi sztárnasi!', 'Popcorn', 'medium_cheddar_popcorn.jpg'),
(19, 'Nagy Cheddar Popcorn', 2200, 'Extra sajtos, extra nagy adag – az íz és móka bajnoka!', 'Popcorn', 'large_cheddar_popcorn.jpg'),
(20, 'Kis Nachos', 1800, 'Mini nachos, maximális íz – tökéletes gyors harapnivaló!', 'Nachos', 'small_nachos.jpg'),
(21, 'Közepes Nachos', 2200, 'Ropogós, sajtos és ellenállhatatlan – nachos, ami ellopja a show-t!', 'Nachos', 'medium_nachos.jpg'),
(22, 'Nagy Nachos', 2400, 'Nagy íz, nagy ropogás – a bátor nassolóknak!', 'Nachos', 'large_nachos.jpg'),
(23, 'Üveges Ital', 900, 'Retró hangulat, modern frissesség – pattintsd le a kupakot és élvezd!', 'Üdítő', 'glass_bottle.jpg'),
(24, 'TOMA PET', 900, 'Gyümölcsös frissesség palackban – TOMA, a legjobb szomjoltó!', 'Üdítő', 'toma_pet.jpg'),
(25, 'Red Bull', 900, 'Szárnyakat ad a filmhez – turbózd fel a moziélményt!', 'Energia Ital', 'red_bull.jpg'),
(27, 'Gyerek Menü', 2500, 'Kis popcorn + kis üdítő + meglepetés nasi – a kis mozirajongóknak!', 'Menü', 'kids_combo.jpg'),
(28, 'Tini Menü', 2900, 'Közepes cheddar popcorn + közepes cola – merész ízek merész nézőknek!', 'Menü', 'teen_combo.jpg'),
(29, 'Páros Menü', 5200, 'Nagy popcorn közösen + 2 közepes üdíto – tökéletes randi a moziban!', 'Menü', 'couples_combo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `runtime` int(3) NOT NULL,
  `director` varchar(200) NOT NULL,
  `production` varchar(25) NOT NULL,
  `age_restriction` int(2) NOT NULL,
  `showing_in` varchar(11) NOT NULL,
  `poster` varchar(200) NOT NULL,
  `description` varchar(250) NOT NULL,
  `release_date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `genre`, `runtime`, `director`, `production`, `age_restriction`, `showing_in`, `poster`, `description`, `release_date`) VALUES
(1, 'A Keresztapa', 'Bűnügyi', 175, 'Francis Ford Coppola', 'Paramount Pictures', 18, 'IMAX', 'godfather.jpg', 'Egy szervezett bűnözéssel foglalkozó dinasztia idősödő pátriárkája titkos birodalma feletti irányítást vonakodó fiára ruházza át.', '1972-03-24'),
(2, 'A Keresztapa II.', 'Bűnügyi', 202, 'Francis Ford Coppola', 'Paramount Pictures', 18, 'IMAX', 'godfather2.jpg', 'Vito Corleone korai életét és karrierjét az 1920-as évek New Yorkjában mutatja be a film, miközben fia, Michael kiterjeszti és szorosabbra fűzi hatalmát a családi bűnszövetkezet felett.', '1974-12-20'),
(3, 'A Sötét Lovag', 'Akció', 152, 'Christopher Nolan', 'Warner Bros.', 16, '4DX', 'dark_knight.jpg', 'Amikor egy Joker néven ismert fenyegetés káoszt és pusztítást végez Gotham népén, Batmannek, James Gordonnak és Harvey Dentnek együtt kell működniük, hogy véget vessenek az őrületnek.', '2008-07-18'),
(4, 'Ponyvaregény', 'Bűnügyi', 154, 'Quentin Tarantino', 'Miramax', 18, '3D', 'pulp_fiction.jpg', 'Két maffiabérlő, egy bokszoló, egy gengszter és felesége, valamint két étkezdei bandita élete fonódik össze négy erőszakról és megváltásról szóló történetben.', '1994-10-14'),
(5, 'Schindler listája', 'Dráma', 195, 'Steven Spielberg', 'Universal Pictures', 16, '3D', 'schindlers_list.jpg', 'A második világháború alatt a németek által megszállt Lengyelországban Oskar Schindler iparmágnás fokozatosan aggódni kezd zsidó munkaerejéért, miután tanúja volt a nácik üldöztetésének.', '1993-12-15'),
(6, 'Forrest Gump', 'Dráma', 142, 'Robert Zemeckis', 'Paramount Pictures', 12, '3D', 'forrest_gump.jpg', 'Az Egyesült Államok történelme az 1950-es és 70-es évek között egy 75-ös IQ-val rendelkező alabamai férfi szemszögéből bontakozik ki, aki vágyik arra, hogy újra találkozhasson gyerekkori szerelmével.', '1994-07-06'),
(7, 'Eredet', 'Sci-Fi', 148, 'Christopher Nolan', 'Warner', 16, '2D', 'inception.jpg', 'Egy tolvaj, aki álommegosztó technológia segítségével lop el vállalati titkokat, azzal a fordított feladattal szembesül, hogy egy ötletet ültessen egy vezérigazgató fejébe, de tragikus múltja katasztrófára ítélheti a projektet és csapatát.', '2010-07-16'),
(8, 'Harcosok klubja', 'Dráma', 139, 'David Fincher', 'Twentieth Century Fox', 18, '3D', 'fight_club.jpg', 'Egy álmatlanságban szenvedő irodai dolgozó és egy ördögtől fogva aggódó szappanfőző egy földalatti verekedős klubot alapít, amely sokkal jobban fejlődik.', '1999-10-15'),
(9, 'A Gyűrűk ura: A Gyűrű Szövetsége', 'Fantasy', 178, 'Peter Jackson', 'New Line Cinema', 12, 'SCREENX', 'lotr1.jpg', 'Egy szelíd Megyéből származó hobbit és nyolc társa útra kel, hogy elpusztítsa a hatalmas Egy Gyűrűt, és megmentse Középföldét Sauron Sötét Nagyúrtól.', '2001-12-19'),
(10, 'A Gyűrűk ura: A Két Torony', 'Fantasy', 179, 'Peter Jackson', 'New Line Cinema', 12, 'SCREENX', 'lotr2.jpg', 'Miközben Frodó és Samu a ravasz Gollum segítségével közelebb araszolnak Mordorhoz, a megosztott társaság szembeszáll Sauron új szövetségesével, Szarumánnal és isengardi hordáival.', '2002-12-18'),
(11, 'A Gyűrűk ura: A Király Visszatér', 'Fantasy', 201, 'Peter Jackson', 'New Line Cinema', 12, 'SCREENX', 'lotr3.jpg', 'Gandalf és Aragorn az Emberek Világát vezetik Sauron serege ellen, hogy eltereljék tekintetét Frodóról és Samről, miközben az Egy Gyűrűvel közelednek a Végzet Hegyéhez.', '2003-12-17'),
(12, 'Mátrix', 'Sci-Fi', 136, 'Lana Wachowski / Lilly Wachowski', 'Warner Bros.', 16, '4DX', 'matrix.jpg', 'Amikor egy gyönyörű idegen elvezeti a számítógépes hackert, Neót egy félelmetes alvilágba, felfedezi a sokkoló igazságot – az élet, amit ismer, egy gonosz kiberintelligencia bonyolult megtévesztése.', '1999-03-31'),
(13, 'Csillagok háborúja: Egy új remény', 'Sci-Fi', 121, 'George Lucas', 'Lucasfilm', 12, '3D', 'starwars4.jpg', 'Luke Skywalker egyesíti erőit egy Jedi lovaggal, egy öntelt pilótával, egy wookiee-vel és két droiddal, hogy megmentsék a galaxist a Birodalom világpusztító harci állomásától, miközben megpróbálja megmenteni Leia hercegnőt a titokzatos Darth Vadertől', '1977-05-25'),
(14, 'Csillagok háborúja: A Birodalom visszavág', 'Sci-Fi', 124, 'Irvin Kershner', 'Lucasfilm', 12, '3D', 'starwars5.jpg', 'Miután a Birodalom legyőzi a Lázadók Szövetségét, Luke Skywalker Yoda Jedi mesterrel kezdi meg a kiképzést, miközben Darth Vader és Boba Fett fejvadász a galaxisban üldözi Luke barátait.', '1980-05-21'),
(15, 'Csillagok háborúja: A Jedi visszatér', 'Sci-Fi', 131, 'Richard Marquand', 'Lucasfilm', 12, '3D', 'starwars6.jpg', 'Miután megmentik Han Solót Jabba, a Hutt karmai közül, a Lázadók Szövetsége megpróbálja elpusztítani a második Halálcsillagot, miközben Luke küzd, hogy segítsen Darth Vadernek visszatérni a sötét oldalról.', '1983-05-25'),
(16, 'Gladiátor', 'Történelmi', 155, 'Ridley Scott', 'DreamWorks Pictures', 16, '2D', 'gladiator.jpg', 'Egy korábbi római hadvezér bosszút áll a korrupt császáron, aki meggyilkolta családját és rabszolgasorba küldte őt.', '2000-05-05'),
(17, 'Joker', 'Dráma', 122, 'Todd Phillips', 'Warner Bros.', 16, '2D', 'joker.jpg', 'Arthur Fleck, egy partibohóc és egy sikertelen stand-up komikus, szegénységben él beteg édesanyjával. Amikor azonban a társadalom elutasítja és különcnek bélyegzi, úgy dönt, hogy Gotham City káoszával teli életét vállalja.', '2019-10-04'),
(18, 'A bárányok hallgatnak', 'Bűnügyi', 118, 'Jonathan Demme', 'Orion Pictures', 18, '2D', 'silence_lambs.jpg', 'Egy fiatal FBI-kadétnak egy bebörtönzött és manipulatív kannibálgyilkos segítségét kell kérnie, hogy elkapjon egy másik sorozatgyilkost, egy őrültet, aki lenyúzza áldozatait.', '1991-02-14'),
(19, 'Csillagok között', 'Sci-Fi', 169, 'Christopher Nolan', 'Warner Bros.', 12, 'IMAX', 'interstellar.jpg', 'Amikor a Föld a jövőben lakhatatlanná válik, Joseph Cooper, a farmer és egykori NASA-pilóta feladata egy űrhajó vezénylése egy kutatócsoporttal együtt, hogy új bolygót találjanak az emberek számára.', '2014-11-07'),
(20, 'Oppenheimer', 'Dráma', 180, 'Christopher Nolan', 'Universal Pictures', 16, '3D', 'oppenheimer.jpg', 'J. Robert Oppenheimer, a második világháborút lezáró atombombák kifejlesztésében nagy szerepet játszó fizikus életének dramatizálása.', '2023-07-21'),
(21, 'A remény rabjai', 'Dráma', 142, 'Frank Darabont', 'Warner Bros.', 18, '2D', 'shawshank_redemption.jpg', 'Egy uxoricide-ért elítélt bankár negyed évszázadon át barátságot köt egy megrögzött fegyenccsel, miközben ártatlanságát megőrizve az egyszerű együttérzés révén próbál reménykedni.', '1994-09-23'),
(22, 'Jojo nyuszi', 'Dráma', 108, 'Taika Waititi', 'Twentieth Century Fox', 12, '2D', 'jojo_rabbit.jpg', 'Egy fiatal német fiú a Hitlerjugendből, akinek hőse és képzeletbeli barátja az ország diktátora, megdöbbenve fedezi fel, hogy édesanyja egy zsidó lányt rejteget otthonukban.', '2019-10-18'),
(23, 'Csillagok háborúja: Baljós árnyak', 'Sci-Fi', 136, 'George Lucas', 'Lucasfilm', 12, '3D', 'starwars1.jpg', 'Két Jedi megszökik egy ellenséges blokádból, hogy szövetségeseket találjon, és egy fiatal fiúra bukkan, aki egyensúlyt hozhat az Erőbe, de a régóta szunnyadó Sith-ek újra felbukkannak, hogy visszaszerezzék korábbi dicsőségüket.\n', '1999-05-19'),
(24, 'Titkos ablak', 'Thriller', 96, 'David Koepp', 'Columbia Pictures', 16, 'IMAX', 'secret_window.jpg', 'Rejtélyes események sújtanak egy bajba jutott írót, miután egy fenyegető idegen plágiummal vádolja meg.', '2004-07-16'),
(25, 'Zombieland', 'Akció', 88, 'Ruben Fleischer', 'Columbia Pictures', 16, '3D', 'zombieland.jpg', 'Egy félénk diák, aki Ohioban próbálja elérni családját, egy fegyvert cipelő bandatag, aki az utolsó Twinkie-t keresi, és két nővér, akik egy vidámparkba igyekszenek eljutni, egyesítik erőiket egy zombiktól hemzsegő Amerikában.\n', '2009-10-02'),
(26, 'Jason Bourne', 'Akció', 123, 'Paul Greengrass', 'Universal Pictures', 16, '2D', 'jason_bourne.jpg', 'A CIA legveszélyesebb egykori ügynökét előcsalogatják rejtekhelyéről, hogy további robbanékony igazságokat fedjen fel múltjával kapcsolatban.\n', '2016-07-29'),
(27, 'Az egyenlítő', 'Akció', 132, 'Antoine Fuqua', 'Sony Pictures', 18, '3D', 'equalizer.jpg', 'Egy férfi, aki azt hiszi, hogy maga mögött hagyta titokzatos múltját, nem nézheti tétlenül, amikor találkozik egy fiatal lánnyal, akit ultraerőszakos orosz gengszterek irányítanak.', '2014-09-26'),
(28, 'It', 'Horror', 135, 'Andy Muschietti', 'New Line Cinema', 18, '3D', 'it.jpg', '1989 nyarán egy csapat zaklatott gyerek összefog, hogy elpusztítson egy alakváltó szörnyeteget, amely bohócnak álcázza magát, és Derry, a maine-i kisvárosuk gyermekeire vadászik.', '2017-09-08'),
(29, 'Szemfényvesztők', 'Thriller', 115, 'Louis Leterrier', 'Summit Entertainment', 12, '3D', 'now_you_see_me.jpg', 'Egy FBI-ügynök és egy Interpol nyomozó egy illuzionista csapatot követ nyomon, akik előadásaik során bankrablásokat hajtanak végre, és a pénzzel jutalmazzák a közönséget.', '2013-05-31'),
(30, 'Wonka', 'Musical', 116, 'Paul King', 'Warner Bros.', 6, '2D', 'wonka.jpg', 'A fiatal és szegény Willy Wonka arról álmodik, hogy boltot nyit egy csokoládéjáról híres városban, amikor rájön, hogy az iparágat kapzsi csokoládékészítők kartellje irányítja.', '2023-12-15'),
(31, 'Vasember', 'Akció', 126, 'Jon Favreau', 'Marvel Studios', 12, '3D', 'ironman.jpg', 'Miután fogságba ejtették egy afgán barlangban, Tony Stark milliárdos mérnök egy egyedi, fegyverré alakított páncélt hoz létre, hogy felvegye a harcot a gonosz ellen.', '2008-05-02'),
(32, 'Zsivány Egyes: Egy Star Wars-történet', 'Sci-Fi', 133, 'Gareth Edwards', 'Lucasfilm', 12, '3D', 'rogue_one.jpg', 'Egy konfliktus idején egy csapat valószínűtlen hős összefog, hogy ellopják a Halálcsillag, a Birodalom végső pusztító fegyverének terveit.', '2016-12-16'),
(33, 'A csodálatos Pókember', 'Akció', 136, 'Marc Webb', 'Sony Pictures', 12, '3D', 'the_amazing_spiderman.jpg', 'Miután Peter Parkert megcsípi egy genetikailag módosított pók, új, pókszerű képességekre tesz szert, és elindul, hogy megmentse a várost egy titokzatos hüllő ellenség machinációitól.', '2012-07-03'),
(34, 'Terminátor 2. Az ítélet napja', 'Sci-Fi', 137, 'James Cameron', 'Carolco Pictures', 16, '2D', 'terminator2.jpg', 'Egy jövőbeli kiborg, aki ugyanolyan, mint aki nem tudta megölni Sarah Connort, most meg kell védenie tízéves fiát, Johnt egy még fejlettebb és erősebb kiborgtól.', '1991-07-03'),
(35, 'John Wick', 'Akció', 101, 'Chad Stahelski', 'Summit Entertainment', 18, '3D', 'john_wick.jpg', 'John Wick egykori bérgyilkos gyászolja igaz szerelme elvesztését. Amikor betörnek a házába, kirabolják, és megölik a kutyáját, kénytelen visszatérni a tettekhez, hogy bosszút álljon.', '2014-10-24'),
(36, 'A Karib-tenger kalózai: Salazar bosszúja', 'Akció', 129, 'Joachim Rønning / Espen Sandberg', 'Walt Disney Pictures', 12, '2D', 'potc_salazar.jpg', 'Jack Sparrow kapitány Poszeidón háromszögét keresi, hogy uralja a tengert, miközben régi riválisa, Salazar kapitány és egy halálos szellemekből álló legénység üldözi, akik megszöktek az Ördög Háromszögéből.', '2017-05-26'),
(37, 'Top Gun: Maverick', 'Akció', 130, 'Joseph Kosinski', 'Paramount Pictures', 12, '3D', 'top_gun.jpg', 'A történetben Maverick szembeszáll a múltjával, miközben egy veszélyes küldetésre képez ki egy csoport fiatalabb Top Gun-végzettet, köztük elhunyt legjobb barátja fiát.', '2022-05-27'),
(38, 'Kapj el, ha tudsz', 'Dráma', 141, 'Steven Spielberg', 'DreamWorks Pictures', 12, '2D', 'catch_me_if_you_can.jpg', 'Alig 17 éves Frank képzett hamisító, aki orvosként, ügyvédként és pilótaként végzett. Carl, az FBI-ügynök megszállottan próbálja felkutatni a szélhámost, aki csak élvezi az üldözést.', '2002-12-25'),
(39, 'A fegyvertelen katona', 'Történelmi', 139, 'Mel Gibson', 'Summit Entertainment', 18, '2D', 'hacksaw_ridge.jpg', 'Desmond T. Doss, az okinawai csatában szolgáló amerikai hadsereg orvosa megtagadja az emberek megölését, és ő lesz az első ember az amerikai történelemben, aki lövés nélkül kapta meg a Becsületrendet.', '2016-11-04'),
(40, 'Sikoly', 'Horror', 111, 'Wes Craven', 'Dimension Films', 18, 'IMAX', 'scream.jpg', 'A kaliforniai Woodsboro kisvárosában egy Szellemarc néven ismert álarcos gyilkos középiskolás diákokat kezd gyilkolni, és egy baráti társaságnak a horrorfilmekben szerzett tudását kell felhasználnia a gyilkos leleplezésére.', '1996-12-20'),
(41, 'Fűrész', 'Horror', 103, 'James Wan', 'Twisted Pictures', 18, '3D', 'saw.jpg', 'Két férfi egy holttest két oldalán ébred, és mindegyiküknek konkrét utasítása van arra, hogy megölje a másikat, elmeneküljön, vagy szembenézzen a következményekkel. Ez a két férfi Jigsaw játékainak legújabb versenyzői.', '2004-10-29'),
(42, 'A legnagyobb showman', 'Musical', 95, 'Michael Gracey', 'Twentieth Century Fox', 12, '2D', 'the_greatest_showman.jpg', 'A show-biznisz születését ünnepli, és egy látnokról mesél, aki a semmiből emelkedett fel, hogy egy világméretű szenzációvá vált látványosságot alkosson.', '2017-12-20'),
(43, 'Pókember: A Pókverzumon át', 'Animáció', 140, 'Joaquim Dos Santos/ Kemp Powers/ Justin K. Thompson', 'Sony Pictures', 12, '3D', 'spiderman_atsv.jpg', 'A multiverzumon át utazva Miles Morales egy új Pókemberekből álló csapattal találkozik, akik különböző dimenziókból származó hősökből állnak. De amikor a hősök összecsapnak azon, hogyan kezeljék az új fenyegetést, Miles válaszút elé kerül.', '2023-06-02'),
(44, 'Zöld könyv: Útmutató az élethez', 'Dráma', 130, 'Peter Farrelly', 'DreamWorks Pictures', 12, '2D', 'green_book.jpg', 'Egy olasz-amerikai munkásosztálybeli kidobó egy afroamerikai klasszikus zongorista sofőrje lesz, miközben az 1960-as évek amerikai Délén turnézik.', '2018-11-16'),
(45, 'Jumanji: Vár a dzsungel', 'Fantasy', 119, 'Jake Kasdan', 'Columbia Pictures', 12, '3D', 'jumanji.jpg', 'Négy tinédzsert szippant be egy varázslatos videojáték, és az egyetlen módja a menekülésnek, ha együttműködnek a játék befejezésében.', '2017-12-20'),
(46, 'Kingsman: A titkos szolgálat', 'Akció', 129, 'Matthew Vaughn', 'Twentieth Century Fox', 16, '3D', 'kingsman.jpg', 'Egy kémszervezet egy ígéretes utcagyereket toboroz be a kiképzőprogramjába, miközben egy eltorzult techzseni globális fenyegetést jelent.', '2014-02-13'),
(47, 'Nagyfiúk', 'Komédia', 102, 'Dennis Dugan', 'Columbia Pictures', 12, '2D', 'grownups.jpg', 'Miután középiskolai kosárlabdaedzőjük meghal, öt jó barát és korábbi csapattárs újra együtt töltik a július negyediki ünnepi hétvégét.', '2010-06-25'),
(48, 'Másnaposok', 'Komédia', 100, 'Todd Phillips', 'Warner Bros.', 18, '2D', 'hangover.jpg', 'Három haver egy legénybúcsúról ébred Las Vegasban, és semmire sem emlékszik az előző éjszakából, a legény pedig eltűnt. Körbe kell barangolniuk a városban, hogy megtalálják barátjukat az esküvőjére.', '2009-06-05'),
(49, 'Mission: Impossible - Titkos nemzet', 'Akció', 131, 'Christopher McQuarrie', 'Paramount Pictures', 16, '3D', 'mi_secret_nation.jpg', 'Ethan és csapata eddigi leglehetetlenebb küldetésükre vállalkoznak: fel kell számolniuk egy hozzájuk hasonlóan magasan képzett, az IMF megsemmisítésére elkötelezett nemzetközi gazemberszervezetet.', '2015-07-31'),
(50, 'Truman Show', 'Dráma', 103, 'Peter Weir', 'Paramount Pictures', 12, '2D', 'trueman_show.jpg', 'Egy biztosítási ügynök gyanítani kezdi, hogy az egész élete valójában egy valóságshow.', '1998-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `movie_screening`
--

CREATE TABLE `movie_screening` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `room_id` int(11) NOT NULL,
  `language` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `movie_screening`
--

INSERT INTO `movie_screening` (`id`, `movie_id`, `room_id`, `language`) VALUES
(1, 1, 1, 'English'),
(2, 2, 2, 'English'),
(3, 3, 1, 'English'),
(4, 4, 2, 'English'),
(5, 5, 1, 'English'),
(6, 6, 2, 'English'),
(7, 7, 1, 'English'),
(8, 8, 2, 'English'),
(9, 9, 1, 'English'),
(10, 10, 2, 'English'),
(11, 11, 1, 'English'),
(12, 12, 2, 'English'),
(13, 13, 1, 'English'),
(14, 14, 2, 'English'),
(15, 15, 1, 'English'),
(16, 16, 2, 'English'),
(17, 17, 1, 'English'),
(18, 18, 2, 'English'),
(19, 19, 1, 'English'),
(20, 20, 2, 'English'),
(21, 21, 1, 'Magyar'),
(22, 22, 2, 'Magyar'),
(23, 23, 1, 'Magyar'),
(24, 24, 2, 'English'),
(25, 25, 1, 'Magyar'),
(26, 26, 2, 'Magyar'),
(27, 27, 1, 'Magyar'),
(28, 28, 2, 'Magyar'),
(29, 29, 1, 'Magyar'),
(30, 30, 2, 'English'),
(31, 31, 1, 'Magyar'),
(32, 32, 2, 'Magyar'),
(33, 33, 1, 'Magyar'),
(34, 34, 2, 'Magyar'),
(35, 35, 1, 'Magyar'),
(36, 36, 2, 'Magyar'),
(37, 37, 1, 'Magyar'),
(38, 38, 2, 'Magyar'),
(39, 39, 1, 'Magyar'),
(40, 40, 2, 'English'),
(41, 41, 1, 'Magyar'),
(42, 42, 2, 'English'),
(43, 43, 1, 'Magyar'),
(44, 44, 2, 'Magyar'),
(45, 45, 1, 'Magyar'),
(46, 46, 2, 'Magyar'),
(47, 47, 1, 'Magyar'),
(48, 48, 2, 'Magyar'),
(49, 49, 1, 'Magyar'),
(50, 50, 2, 'English');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` int(5) NOT NULL,
  `screening_id` int(11) NOT NULL,
  `reservation_date` varchar(10) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `user_id`, `total_amount`, `screening_id`, `reservation_date`, `ticket_id`, `seat_id`) VALUES
(1, 2, 2500, 1, '2025-03-01', 1, 5),
(2, 4, 3000, 2, '2025-05-11', 5, 50),
(3, 6, 2500, 3, '2025-12-14', 1, 12),
(4, 8, 2200, 4, '2025-02-08', 2, 60),
(5, 10, 3000, 5, '2025-09-01', 5, 20),
(6, 12, 2500, 6, '2025-03-01', 3, 70),
(7, 14, 2500, 7, '2025-03-01', 1, 33),
(8, 16, 3000, 8, '2025-03-01', 5, 80),
(9, 18, 2200, 9, '2025-03-01', 2, 28),
(10, 20, 3000, 10, '2025-03-01', 5, 45),
(11, 3, 2500, 1, '2026-02-14', 1, 17),
(12, 18, 3000, 1, '2026-02-14', 5, 10),
(13, 14, 3000, 1, '2026-04-01', 5, 16),
(14, 5, 2500, 1, '2025-07-20', 1, 24),
(15, 9, 2200, 1, '2026-03-22', 2, 20),
(16, 13, 2500, 1, '2025-09-05', 4, 14),
(17, 3, 2200, 2, '2025-06-15', 2, 86),
(18, 2, 2500, 2, '2025-06-15', 3, 45),
(19, 18, 2500, 2, '2025-12-20', 4, 51),
(20, 20, 3000, 2, '2025-06-15', 5, 87),
(21, 20, 3000, 2, '2026-03-22', 5, 71),
(22, 14, 2500, 2, '2025-11-03', 3, 65),
(23, 19, 2500, 2, '2025-12-20', 3, 63),
(24, 9, 3000, 2, '2026-04-01', 5, 58),
(25, 11, 2500, 3, '2026-02-14', 1, 36),
(26, 18, 2500, 3, '2025-09-05', 4, 27),
(27, 2, 2200, 3, '2026-04-01', 2, 39),
(28, 11, 2500, 3, '2025-07-20', 1, 24),
(29, 17, 2500, 3, '2026-03-22', 3, 2),
(30, 14, 3000, 3, '2025-08-10', 5, 29),
(31, 6, 3000, 3, '2025-12-20', 5, 25),
(32, 7, 2500, 3, '2025-12-20', 3, 28),
(33, 12, 2500, 3, '2025-06-15', 1, 23),
(34, 9, 3000, 4, '2026-03-22', 5, 83),
(35, 21, 3000, 4, '2026-04-15', 5, 77),
(36, 8, 3000, 4, '2025-08-10', 5, 64),
(37, 17, 2500, 4, '2025-06-15', 4, 84),
(38, 5, 2500, 4, '2025-08-10', 4, 82),
(39, 18, 3000, 4, '2025-08-10', 5, 54),
(40, 2, 2200, 5, '2025-08-10', 2, 17),
(41, 4, 3000, 5, '2026-04-15', 5, 3),
(42, 20, 2500, 5, '2026-01-08', 4, 6),
(43, 9, 2500, 5, '2025-07-20', 1, 13),
(44, 6, 2500, 5, '2025-11-03', 3, 35),
(45, 5, 2500, 5, '2025-12-20', 3, 12),
(46, 2, 3000, 5, '2026-04-15', 5, 19),
(47, 8, 2500, 5, '2026-04-15', 1, 1),
(48, 20, 3000, 5, '2025-10-12', 5, 8),
(49, 10, 2500, 5, '2026-03-22', 3, 22),
(50, 18, 2200, 6, '2025-12-20', 2, 72),
(51, 17, 2500, 6, '2025-11-03', 3, 90),
(52, 19, 2500, 6, '2025-07-20', 3, 75),
(53, 20, 2500, 6, '2026-04-15', 3, 51),
(54, 6, 2200, 6, '2026-02-14', 2, 43),
(55, 9, 2500, 6, '2025-09-05', 3, 50),
(56, 13, 2500, 6, '2025-12-20', 1, 78),
(57, 7, 2500, 6, '2026-04-15', 4, 55),
(58, 14, 2200, 6, '2026-04-15', 2, 52),
(59, 7, 2500, 7, '2026-02-14', 4, 8),
(60, 13, 3000, 7, '2026-03-22', 5, 11),
(61, 12, 2500, 7, '2025-10-12', 1, 18),
(62, 3, 2500, 7, '2025-12-20', 1, 15),
(63, 14, 2500, 7, '2025-12-20', 1, 17),
(64, 14, 2500, 7, '2026-02-14', 1, 27),
(65, 21, 2500, 7, '2025-11-03', 1, 23),
(66, 15, 2500, 7, '2025-07-20', 4, 10),
(67, 19, 2500, 8, '2025-09-05', 1, 79),
(68, 9, 2500, 8, '2025-09-05', 1, 84),
(69, 20, 2500, 8, '2026-04-01', 3, 67),
(70, 19, 3000, 8, '2025-12-20', 5, 86),
(71, 18, 2500, 8, '2026-02-14', 3, 90),
(72, 5, 2500, 8, '2025-10-12', 1, 69),
(73, 21, 2200, 8, '2025-09-05', 2, 65),
(74, 17, 2500, 9, '2025-07-20', 3, 14),
(75, 20, 2500, 9, '2025-10-12', 3, 37),
(76, 11, 3000, 9, '2025-12-20', 5, 27),
(77, 15, 2200, 9, '2025-08-10', 2, 1),
(78, 15, 2500, 9, '2026-04-01', 3, 5),
(79, 3, 2200, 9, '2026-01-08', 2, 38),
(80, 17, 2500, 9, '2025-06-15', 4, 34),
(81, 20, 2200, 10, '2026-04-15', 2, 57),
(82, 4, 2500, 10, '2025-08-10', 4, 82),
(83, 19, 2500, 10, '2026-04-15', 3, 46),
(84, 11, 2500, 10, '2025-08-10', 4, 89),
(85, 21, 3000, 10, '2025-09-05', 5, 65),
(86, 10, 2500, 10, '2026-01-08', 4, 75),
(87, 20, 2500, 10, '2026-01-08', 1, 63),
(88, 8, 2200, 10, '2025-07-20', 2, 69),
(89, 17, 2500, 10, '2026-04-15', 1, 74),
(90, 10, 2200, 10, '2025-10-12', 2, 50),
(91, 17, 2200, 11, '2025-12-20', 2, 10),
(92, 14, 2500, 11, '2026-03-22', 3, 29),
(93, 13, 3000, 11, '2025-11-03', 5, 5),
(94, 6, 3000, 11, '2025-11-03', 5, 1),
(95, 3, 2500, 11, '2025-07-20', 1, 12),
(96, 9, 2500, 11, '2025-06-15', 3, 23),
(97, 7, 2200, 11, '2025-10-12', 2, 17),
(98, 16, 2500, 11, '2025-10-12', 4, 37),
(99, 8, 3000, 11, '2025-08-10', 5, 34),
(100, 13, 3000, 12, '2026-01-08', 5, 76),
(101, 12, 2500, 12, '2025-06-15', 1, 75),
(102, 19, 2200, 12, '2025-06-15', 2, 73),
(103, 5, 2200, 12, '2025-07-20', 2, 85),
(104, 14, 2500, 12, '2025-10-12', 3, 77),
(105, 7, 2500, 12, '2025-12-20', 4, 61),
(106, 14, 2500, 12, '2025-08-10', 4, 80),
(107, 13, 3000, 12, '2025-07-20', 5, 89),
(108, 3, 2500, 12, '2025-07-20', 3, 87),
(109, 5, 3000, 13, '2026-02-14', 5, 17),
(110, 3, 2500, 13, '2026-01-08', 4, 19),
(111, 4, 3000, 13, '2025-12-20', 5, 2),
(112, 4, 2500, 13, '2026-03-22', 1, 23),
(113, 7, 2500, 13, '2025-08-10', 4, 31),
(114, 6, 2500, 13, '2025-09-05', 3, 12),
(115, 21, 3000, 14, '2025-12-20', 5, 68),
(116, 21, 3000, 14, '2025-08-10', 5, 69),
(117, 21, 3000, 14, '2025-12-20', 5, 54),
(118, 12, 2500, 14, '2026-03-22', 3, 70),
(119, 11, 3000, 14, '2026-04-15', 5, 90),
(120, 13, 2500, 14, '2025-07-20', 1, 64),
(121, 21, 2500, 14, '2026-04-01', 3, 71),
(122, 18, 2500, 15, '2026-04-15', 3, 17),
(123, 4, 2500, 15, '2025-12-20', 3, 19),
(124, 21, 2500, 15, '2026-04-01', 1, 1),
(125, 7, 2200, 15, '2026-04-15', 2, 26),
(126, 20, 2200, 15, '2025-06-15', 2, 16),
(127, 20, 2500, 15, '2026-04-01', 4, 11),
(128, 7, 2500, 15, '2025-06-15', 4, 2),
(129, 6, 3000, 16, '2026-01-08', 5, 61),
(130, 11, 2500, 16, '2025-06-15', 3, 76),
(131, 18, 2500, 16, '2025-08-10', 4, 53),
(132, 8, 3000, 16, '2025-11-03', 5, 71),
(133, 5, 2200, 16, '2025-06-15', 2, 54),
(134, 11, 3000, 16, '2025-09-05', 5, 50),
(135, 8, 2500, 16, '2025-12-20', 4, 63),
(136, 19, 2200, 17, '2025-10-12', 2, 8),
(137, 9, 3000, 17, '2025-09-05', 5, 23),
(138, 5, 2500, 17, '2026-01-08', 4, 25),
(139, 13, 2500, 17, '2026-02-14', 4, 31),
(140, 6, 2200, 17, '2025-08-10', 2, 15),
(141, 14, 3000, 17, '2025-10-12', 5, 16),
(142, 18, 2500, 17, '2026-02-14', 3, 29),
(143, 12, 2500, 17, '2026-01-08', 3, 40),
(144, 6, 3000, 17, '2025-11-03', 5, 38),
(145, 8, 2500, 18, '2025-11-03', 3, 47),
(146, 13, 3000, 18, '2026-04-15', 5, 63),
(147, 17, 2500, 18, '2025-10-12', 1, 77),
(148, 13, 2500, 18, '2025-07-20', 3, 81),
(149, 11, 2500, 18, '2025-09-05', 3, 66),
(150, 12, 2500, 18, '2026-01-08', 3, 62),
(151, 8, 3000, 18, '2025-12-20', 5, 43),
(152, 12, 2500, 18, '2025-11-03', 4, 88),
(153, 18, 2500, 18, '2025-10-12', 4, 58),
(154, 10, 2500, 19, '2025-11-03', 3, 22),
(155, 12, 2500, 19, '2026-04-01', 1, 36),
(156, 16, 2200, 19, '2026-03-22', 2, 17),
(157, 4, 2500, 19, '2026-04-01', 1, 28),
(158, 4, 3000, 19, '2025-10-12', 5, 15),
(159, 5, 2500, 19, '2026-04-15', 4, 12),
(160, 12, 2500, 19, '2025-06-15', 1, 9),
(161, 11, 2500, 19, '2025-10-12', 1, 11),
(162, 3, 2500, 19, '2025-06-15', 4, 35),
(163, 17, 3000, 20, '2025-08-10', 5, 67),
(164, 8, 2200, 20, '2025-07-20', 2, 66),
(165, 21, 2500, 20, '2026-02-14', 1, 81),
(166, 20, 3000, 20, '2025-10-12', 5, 65),
(167, 14, 2500, 20, '2025-11-03', 3, 80),
(168, 9, 2500, 20, '2026-03-22', 3, 60),
(169, 14, 3000, 20, '2025-08-10', 5, 62),
(170, 2, 2500, 20, '2026-04-15', 4, 88),
(171, 17, 2500, 20, '2026-01-08', 3, 72),
(172, 11, 2500, 20, '2026-02-14', 3, 83),
(173, 11, 2500, 21, '2025-11-03', 1, 37),
(174, 2, 2200, 21, '2026-04-01', 2, 10),
(175, 15, 3000, 21, '2026-04-15', 5, 26),
(176, 15, 2500, 21, '2026-03-22', 4, 36),
(177, 9, 2500, 21, '2026-04-01', 3, 8),
(178, 15, 2500, 21, '2025-10-12', 1, 31),
(179, 21, 2500, 21, '2025-12-20', 1, 15),
(180, 2, 2200, 21, '2026-01-08', 2, 1),
(181, 20, 3000, 21, '2025-11-03', 5, 40),
(182, 11, 2500, 22, '2026-02-14', 3, 87),
(183, 21, 2500, 22, '2025-07-20', 1, 49),
(184, 9, 2500, 22, '2025-11-03', 1, 48),
(185, 19, 2500, 22, '2026-01-08', 4, 42),
(186, 4, 2200, 22, '2026-02-14', 2, 58),
(187, 9, 2500, 22, '2025-11-03', 1, 66),
(188, 13, 2500, 22, '2026-03-22', 4, 46),
(189, 18, 3000, 22, '2025-08-10', 5, 56),
(190, 17, 2500, 22, '2025-07-20', 3, 53),
(191, 7, 2500, 23, '2026-01-08', 3, 38),
(192, 12, 2200, 23, '2026-03-22', 2, 24),
(193, 7, 2500, 23, '2026-01-08', 1, 40),
(194, 16, 2500, 23, '2025-09-05', 4, 16),
(195, 10, 2500, 23, '2025-06-15', 3, 34),
(196, 19, 3000, 24, '2025-07-20', 5, 61),
(197, 14, 2500, 24, '2026-02-14', 3, 81),
(198, 4, 2500, 24, '2026-04-01', 4, 55),
(199, 8, 2500, 24, '2025-09-05', 1, 79),
(200, 13, 3000, 24, '2026-04-01', 5, 71),
(201, 10, 2500, 24, '2025-10-12', 3, 44),
(202, 13, 2500, 24, '2025-12-20', 4, 85),
(203, 13, 3000, 24, '2025-09-05', 5, 62),
(204, 10, 2200, 24, '2026-04-15', 2, 59),
(205, 3, 2500, 24, '2025-07-20', 1, 89),
(206, 3, 2500, 25, '2025-06-15', 3, 11),
(207, 9, 2500, 25, '2025-12-20', 3, 16),
(208, 21, 2200, 25, '2025-11-03', 2, 21),
(209, 12, 2500, 25, '2026-04-01', 1, 10),
(210, 20, 3000, 25, '2025-06-15', 5, 20),
(211, 4, 2500, 25, '2025-08-10', 1, 12),
(212, 16, 2500, 25, '2026-03-22', 4, 18),
(213, 12, 2200, 25, '2026-01-08', 2, 24),
(214, 2, 2500, 25, '2025-08-10', 4, 4),
(215, 11, 3000, 25, '2026-04-01', 5, 31),
(216, 9, 3000, 26, '2025-11-03', 5, 62),
(217, 19, 2200, 26, '2025-11-03', 2, 46),
(218, 14, 2200, 26, '2026-01-08', 2, 66),
(219, 9, 2500, 26, '2025-11-03', 4, 70),
(220, 10, 2500, 26, '2026-03-22', 3, 55),
(221, 16, 3000, 26, '2026-04-15', 5, 59),
(222, 13, 2500, 26, '2026-02-14', 3, 72),
(223, 17, 3000, 27, '2025-06-15', 5, 12),
(224, 16, 3000, 27, '2025-12-20', 5, 17),
(225, 8, 3000, 27, '2026-04-01', 5, 37),
(226, 16, 2500, 27, '2026-02-14', 4, 27),
(227, 15, 3000, 27, '2025-10-12', 5, 39),
(228, 6, 2500, 27, '2025-11-03', 4, 26),
(229, 20, 2500, 28, '2026-01-08', 3, 82),
(230, 21, 2500, 28, '2026-04-01', 3, 73),
(231, 21, 3000, 28, '2026-01-08', 5, 87),
(232, 2, 2500, 28, '2025-09-05', 4, 71),
(233, 8, 3000, 28, '2025-12-20', 5, 65),
(234, 6, 2200, 28, '2025-09-05', 2, 57),
(235, 10, 2500, 28, '2025-09-05', 1, 67),
(236, 10, 2500, 29, '2026-01-08', 4, 30),
(237, 2, 2500, 29, '2026-02-14', 3, 5),
(238, 9, 2200, 29, '2026-01-08', 2, 32),
(239, 4, 2500, 29, '2025-07-20', 1, 3),
(240, 5, 2500, 29, '2025-11-03', 3, 2),
(241, 10, 2500, 29, '2025-11-03', 1, 10),
(242, 7, 2500, 30, '2025-09-05', 1, 44),
(243, 9, 2500, 30, '2026-04-01', 1, 47),
(244, 17, 2500, 30, '2025-07-20', 3, 77),
(245, 2, 3000, 30, '2025-07-20', 5, 52),
(246, 3, 2200, 30, '2025-07-20', 2, 71),
(247, 11, 3000, 30, '2026-02-14', 5, 83),
(248, 5, 2500, 30, '2026-03-22', 4, 45),
(249, 18, 2200, 31, '2025-08-10', 2, 32),
(250, 2, 2500, 31, '2025-10-12', 3, 17),
(251, 9, 2500, 31, '2025-12-20', 4, 21),
(252, 4, 2500, 31, '2026-04-15', 1, 28),
(253, 9, 3000, 31, '2026-02-14', 5, 26),
(254, 7, 2200, 31, '2026-04-15', 2, 24),
(255, 16, 2500, 32, '2025-09-05', 3, 79),
(256, 15, 2500, 32, '2025-09-05', 3, 50),
(257, 13, 2500, 32, '2026-01-08', 1, 62),
(258, 21, 2200, 32, '2025-06-15', 2, 84),
(259, 5, 2500, 32, '2026-02-14', 3, 49),
(260, 6, 3000, 32, '2026-03-22', 5, 47),
(261, 8, 3000, 32, '2025-11-03', 5, 53),
(262, 17, 2200, 32, '2025-07-20', 2, 59),
(263, 18, 3000, 32, '2026-03-22', 5, 60),
(264, 6, 2200, 32, '2025-06-15', 2, 77),
(265, 11, 3000, 33, '2025-10-12', 5, 18),
(266, 11, 2500, 33, '2025-10-12', 4, 8),
(267, 11, 2500, 33, '2026-04-15', 3, 11),
(268, 15, 2500, 33, '2025-11-03', 3, 36),
(269, 19, 3000, 33, '2026-03-22', 5, 6),
(270, 21, 2200, 33, '2025-08-10', 2, 10),
(271, 3, 2200, 33, '2025-07-20', 2, 19),
(272, 10, 3000, 33, '2025-07-20', 5, 17),
(273, 16, 2200, 34, '2026-04-15', 2, 48),
(274, 18, 2500, 34, '2025-12-20', 3, 90),
(275, 15, 3000, 34, '2025-06-15', 5, 63),
(276, 12, 2200, 34, '2025-10-12', 2, 47),
(277, 17, 2500, 34, '2026-04-01', 4, 84),
(278, 12, 2500, 34, '2026-01-08', 4, 86),
(279, 15, 2500, 34, '2026-04-15', 1, 77),
(280, 14, 2500, 34, '2026-01-08', 3, 68),
(281, 2, 2200, 34, '2026-04-01', 2, 41),
(282, 20, 2500, 34, '2026-04-15', 4, 45),
(283, 20, 2200, 35, '2025-09-05', 2, 15),
(284, 7, 2500, 35, '2026-04-15', 1, 14),
(285, 4, 2500, 35, '2025-12-20', 4, 39),
(286, 4, 3000, 35, '2025-10-12', 5, 35),
(287, 19, 2200, 35, '2026-04-15', 2, 16),
(288, 7, 2500, 35, '2025-11-03', 3, 18),
(289, 2, 2500, 35, '2026-02-14', 4, 30),
(290, 5, 2500, 35, '2025-10-12', 3, 28),
(291, 5, 2500, 35, '2025-11-03', 1, 36),
(292, 6, 2500, 35, '2025-07-20', 4, 26),
(293, 18, 2200, 36, '2025-11-03', 2, 45),
(294, 6, 2500, 36, '2026-03-22', 4, 41),
(295, 13, 2200, 36, '2025-08-10', 2, 71),
(296, 2, 3000, 36, '2026-01-08', 5, 70),
(297, 14, 2500, 36, '2025-12-20', 1, 78),
(298, 8, 2200, 36, '2026-02-14', 2, 87),
(299, 18, 2500, 36, '2026-04-01', 1, 59),
(300, 14, 2200, 36, '2026-02-14', 2, 90),
(301, 12, 3000, 37, '2025-08-10', 5, 9),
(302, 12, 3000, 37, '2025-12-20', 5, 38),
(303, 6, 3000, 37, '2026-03-22', 5, 39),
(304, 15, 2500, 37, '2025-09-05', 1, 18),
(305, 14, 2500, 37, '2025-07-20', 3, 13),
(306, 7, 3000, 37, '2025-09-05', 5, 14),
(307, 3, 3000, 37, '2026-04-15', 5, 12),
(308, 9, 2500, 37, '2026-03-22', 4, 36),
(309, 16, 2500, 38, '2026-04-01', 3, 69),
(310, 15, 2500, 38, '2026-04-01', 4, 76),
(311, 21, 2200, 38, '2025-11-03', 2, 55),
(312, 3, 2500, 38, '2025-10-12', 3, 46),
(313, 19, 2500, 38, '2026-04-15', 4, 87),
(314, 18, 2500, 38, '2025-12-20', 4, 86),
(315, 14, 2500, 38, '2026-04-15', 1, 70),
(316, 14, 2500, 38, '2025-11-03', 1, 64),
(317, 20, 2500, 38, '2025-09-05', 4, 48),
(318, 7, 3000, 39, '2025-11-03', 5, 16),
(319, 8, 2200, 39, '2025-07-20', 2, 37),
(320, 5, 2500, 39, '2025-12-20', 1, 29),
(321, 12, 3000, 39, '2026-03-22', 5, 12),
(322, 17, 2200, 39, '2025-10-12', 2, 6),
(323, 10, 2500, 40, '2026-04-01', 1, 53),
(324, 7, 2500, 40, '2025-06-15', 4, 57),
(325, 6, 3000, 40, '2025-11-03', 5, 59),
(326, 3, 2500, 40, '2025-06-15', 1, 70),
(327, 6, 2500, 40, '2026-02-14', 4, 88),
(328, 10, 2500, 41, '2026-04-15', 1, 16),
(329, 19, 2500, 41, '2026-04-15', 4, 13),
(330, 18, 3000, 41, '2026-04-01', 5, 39),
(331, 11, 2500, 41, '2026-04-01', 3, 11),
(332, 20, 2500, 41, '2026-03-22', 1, 21),
(333, 3, 2500, 41, '2026-03-22', 3, 14),
(334, 17, 2500, 42, '2025-06-15', 3, 52),
(335, 15, 2500, 42, '2025-07-20', 1, 56),
(336, 11, 2500, 42, '2026-02-14', 3, 47),
(337, 5, 2500, 42, '2025-11-03', 1, 81),
(338, 7, 3000, 42, '2025-11-03', 5, 64),
(339, 21, 2500, 43, '2026-04-01', 3, 11),
(340, 8, 2200, 43, '2025-06-15', 2, 24),
(341, 18, 2500, 43, '2025-08-10', 4, 15),
(342, 13, 2200, 43, '2026-04-01', 2, 26),
(343, 8, 2200, 43, '2025-10-12', 2, 23),
(344, 4, 2500, 43, '2026-01-08', 3, 37),
(345, 5, 2500, 43, '2026-04-01', 4, 5),
(346, 13, 3000, 43, '2025-09-05', 5, 31),
(347, 5, 3000, 43, '2026-01-08', 5, 10),
(348, 14, 2500, 43, '2025-07-20', 4, 1),
(349, 19, 2500, 44, '2025-07-20', 3, 65),
(350, 16, 2200, 44, '2026-01-08', 2, 87),
(351, 8, 2500, 44, '2026-02-14', 4, 54),
(352, 3, 2500, 44, '2025-07-20', 3, 45),
(353, 9, 2500, 44, '2025-07-20', 1, 51),
(354, 8, 2500, 44, '2025-07-20', 4, 76),
(355, 2, 2500, 44, '2025-09-05', 3, 89),
(356, 19, 3000, 44, '2025-07-20', 5, 85),
(357, 10, 2500, 44, '2026-02-14', 4, 81),
(358, 15, 2500, 44, '2025-06-15', 4, 86),
(359, 3, 2500, 45, '2025-09-05', 3, 18),
(360, 4, 2500, 45, '2025-11-03', 3, 17),
(361, 7, 3000, 45, '2025-11-03', 5, 7),
(362, 17, 2500, 45, '2026-02-14', 3, 28),
(363, 15, 2500, 45, '2025-08-10', 4, 4),
(364, 9, 2500, 45, '2025-08-10', 1, 13),
(365, 12, 2500, 45, '2025-06-15', 1, 8),
(366, 16, 3000, 46, '2026-04-15', 5, 45),
(367, 3, 3000, 46, '2025-09-05', 5, 52),
(368, 20, 2500, 46, '2026-01-08', 3, 75),
(369, 3, 2200, 46, '2025-07-20', 2, 66),
(370, 17, 3000, 46, '2025-11-03', 5, 68),
(371, 18, 2500, 46, '2025-07-20', 4, 49),
(372, 8, 2500, 46, '2025-08-10', 4, 47),
(373, 13, 2500, 46, '2025-11-03', 3, 55),
(374, 7, 2500, 47, '2025-09-05', 4, 38),
(375, 2, 2500, 47, '2026-03-22', 1, 11),
(376, 4, 2500, 47, '2026-01-08', 3, 22),
(377, 6, 2500, 47, '2025-07-20', 4, 31),
(378, 14, 3000, 47, '2026-04-01', 5, 32),
(379, 5, 2500, 47, '2026-01-08', 1, 2),
(380, 17, 2500, 48, '2025-08-10', 1, 51),
(381, 14, 2500, 48, '2025-07-20', 4, 44),
(382, 3, 3000, 48, '2025-12-20', 5, 67),
(383, 17, 2500, 48, '2026-01-08', 3, 88),
(384, 20, 2500, 48, '2025-09-05', 3, 62),
(385, 2, 2500, 48, '2025-11-03', 1, 47),
(386, 2, 2500, 48, '2025-07-20', 4, 48),
(387, 9, 2500, 48, '2025-12-20', 3, 80),
(388, 9, 2500, 49, '2026-02-14', 1, 11),
(389, 7, 2500, 49, '2026-01-08', 1, 6),
(390, 17, 3000, 49, '2025-07-20', 5, 26),
(391, 3, 2500, 49, '2025-09-05', 4, 33),
(392, 11, 2200, 49, '2025-07-20', 2, 22),
(393, 21, 2500, 49, '2026-04-01', 1, 37),
(394, 10, 3000, 49, '2025-11-03', 5, 38),
(395, 4, 2500, 49, '2025-10-12', 4, 25),
(396, 6, 2500, 49, '2025-07-20', 3, 36),
(397, 20, 2500, 49, '2025-12-20', 3, 15),
(398, 13, 2500, 50, '2025-08-10', 4, 69),
(399, 12, 2200, 50, '2025-12-20', 2, 50),
(400, 5, 2200, 50, '2025-12-20', 2, 85),
(401, 14, 2500, 50, '2026-03-22', 1, 68),
(402, 7, 2500, 50, '2025-07-20', 3, 82);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `capacity` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `capacity`) VALUES
(1, 40),
(2, 50);

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `seat_row` int(2) NOT NULL,
  `seat_column` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `room_id`, `seat_row`, `seat_column`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 2),
(3, 1, 1, 3),
(4, 1, 1, 4),
(5, 1, 1, 5),
(6, 1, 1, 6),
(7, 1, 1, 7),
(8, 1, 1, 8),
(9, 1, 2, 1),
(10, 1, 2, 2),
(11, 1, 2, 3),
(12, 1, 2, 4),
(13, 1, 2, 5),
(14, 1, 2, 6),
(15, 1, 2, 7),
(16, 1, 2, 8),
(17, 1, 3, 1),
(18, 1, 3, 2),
(19, 1, 3, 3),
(20, 1, 3, 4),
(21, 1, 3, 5),
(22, 1, 3, 6),
(23, 1, 3, 7),
(24, 1, 3, 8),
(25, 1, 4, 1),
(26, 1, 4, 2),
(27, 1, 4, 3),
(28, 1, 4, 4),
(29, 1, 4, 5),
(30, 1, 4, 6),
(31, 1, 4, 7),
(32, 1, 4, 8),
(33, 1, 5, 1),
(34, 1, 5, 2),
(35, 1, 5, 3),
(36, 1, 5, 4),
(37, 1, 5, 5),
(38, 1, 5, 6),
(39, 1, 5, 7),
(40, 1, 5, 8),
(41, 2, 1, 1),
(42, 2, 1, 2),
(43, 2, 1, 3),
(44, 2, 1, 4),
(45, 2, 1, 5),
(46, 2, 1, 6),
(47, 2, 1, 7),
(48, 2, 1, 8),
(49, 2, 1, 9),
(50, 2, 1, 10),
(51, 2, 2, 1),
(52, 2, 2, 2),
(53, 2, 2, 3),
(54, 2, 2, 4),
(55, 2, 2, 5),
(56, 2, 2, 6),
(57, 2, 2, 7),
(58, 2, 2, 8),
(59, 2, 2, 9),
(60, 2, 2, 10),
(61, 2, 3, 1),
(62, 2, 3, 2),
(63, 2, 3, 3),
(64, 2, 3, 4),
(65, 2, 3, 5),
(66, 2, 3, 6),
(67, 2, 3, 7),
(68, 2, 3, 8),
(69, 2, 3, 9),
(70, 2, 3, 10),
(71, 2, 4, 1),
(72, 2, 4, 2),
(73, 2, 4, 3),
(74, 2, 4, 4),
(75, 2, 4, 5),
(76, 2, 4, 6),
(77, 2, 4, 7),
(78, 2, 4, 8),
(79, 2, 4, 9),
(80, 2, 4, 10),
(81, 2, 5, 1),
(82, 2, 5, 2),
(83, 2, 5, 3),
(84, 2, 5, 4),
(85, 2, 5, 5),
(86, 2, 5, 6),
(87, 2, 5, 7),
(88, 2, 5, 8),
(89, 2, 5, 9),
(90, 2, 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `price` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `type`, `price`) VALUES
(1, 'student', 2500),
(2, 'junior', 2200),
(3, 'senior', 2500),
(4, 'disabled', 2500),
(5, 'normal', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(20) NOT NULL,
  `admin` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `admin`) VALUES
(1, 'admin', 'admin@gmail.com', 'Admin_1234', 1),
(2, 'Anna Kovács', 'annakovacs@freemail.hu', 'Anna_K2025', 0),
(3, 'Bence Tóth', 'bencetoth@gmail.com', 'BenT_86x', 0),
(4, 'Csilla Horváth', 'csillahorvath@citromail.hu', 'Csilla-H91', 0),
(5, 'Dávid Kiss', 'davidkiss@outlook.com', 'Dk:Pass2023', 0),
(6, 'Eszter Farkas', 'eszter_farkas@protonmail.com', 'EszF_77a', 0),
(7, 'Ferenc Varga', 'ferencvarga@t_online.hu', 'Fv#Secure1', 0),
(8, 'Gábor Szabó', 'gaborszabo@yahoo.com', 'Gabor_S2024', 0),
(9, 'Hanna Molnár', 'hannamolnar@icloud.com', 'HannaM_88', 0),
(10, 'István Nagy', 'istvannagy@vipmail.hu', 'IstvanN_19', 0),
(11, 'Judit Kovács', 'judit_kovacs@aol.com', 'JuditK_03', 0),
(12, 'Laura Németh', 'lauranemeth@freemail.hu', 'LauraN_55', 0),
(13, 'Akira Tanaka', 'akiratanaka@rakuten.jp', 'AkiraT_2025', 0),
(14, 'Emily Johnson', 'emilyjohnson@yahoo.com', 'EmJ_1994', 0),
(15, 'Carlos Ramirez', 'carlos_ramirez@outlook.es', 'CarRam_88', 0),
(16, 'Priya Singh', 'priyasingh@rediffmail.com', 'PriyaS_77', 0),
(17, 'Luca Bianchi', 'lucabianchi@libero.it', 'LucaB_2023', 0),
(18, 'Sophie Dubois', 'sophiedubois@orange.fr', 'SophieD_11', 0),
(19, 'Chen Wei', 'chenwei@163.com', 'ChenW_66', 0),
(20, 'Fatima Al-Mansouri', 'fatimaal_mansouri@emirates.net.ae', 'FatimaM_99', 0),
(21, 'Ivan Petrov', 'ivanpetrov@mail.ru', 'IvanP_2024', 0),
(22, 'Kriván Balázs', 'krivan.balazs-2021@keri.mako.hu', 'K_balazs2021', 1),
(23, 'Fodor Adrián László', 'fodor.adrian-2021@keri.mako.hu', 'F_adrian2021', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `actor_in_movie`
--
ALTER TABLE `actor_in_movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `actor_id` (`actor_id`);

--
-- Indexes for table `buffet`
--
ALTER TABLE `buffet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_screening`
--
ALTER TABLE `movie_screening`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `screening_id` (`screening_id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `seat_id` (`seat_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `actor_in_movie`
--
ALTER TABLE `actor_in_movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `buffet`
--
ALTER TABLE `buffet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `movie_screening`
--
ALTER TABLE `movie_screening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actor_in_movie`
--
ALTER TABLE `actor_in_movie`
  ADD CONSTRAINT `actor_in_movie_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`),
  ADD CONSTRAINT `actor_in_movie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `movie_screening`
--
ALTER TABLE `movie_screening`
  ADD CONSTRAINT `movie_screening_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `movie_screening_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_reservation_seat` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`screening_id`) REFERENCES `movie_screening` (`id`);

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
