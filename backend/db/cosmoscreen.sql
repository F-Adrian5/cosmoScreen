-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Nov 21. 08:24
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `cosmoscreen`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `actors`
--

CREATE TABLE `actors` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `actors`
--

INSERT INTO `actors` (`id`, `name`) VALUES
(1, 'Marlon Brando'),
(2, 'Al Pacino'),
(3, 'Robert De Niro'),
(4, 'Leonardo DiCaprio'),
(5, 'Tom Hanks'),
(6, 'Morgan Freeman'),
(7, 'Christian Bale'),
(8, 'Heath Ledger'),
(9, 'Scarlett Johansson'),
(10, 'Brad Pitt'),
(11, 'Natalie Portman'),
(12, 'Keanu Reeves'),
(13, 'Harrison Ford'),
(14, 'Johnny Depp'),
(15, 'Emma Stone'),
(16, 'Matt Damon'),
(17, 'Denzel Washington'),
(18, 'Cate Blanchett'),
(19, 'Anthony Hopkins'),
(20, 'Joaquin Phoenix'),
(21, 'John Travolta'),
(22, 'Samuel L. Jackson'),
(23, 'Liam Neeson'),
(24, 'Elijah Wood'),
(25, 'Matthew McConaughey'),
(26, 'Cillian Murphy'),
(27, 'Adam Sandler');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `actor_in_movie`
--

CREATE TABLE `actor_in_movie` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `actor_in_movie`
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
(38, 9, 18);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `buffet`
--

CREATE TABLE `buffet` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(5) NOT NULL,
  `description` varchar(250) NOT NULL,
  `img` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `buffet`
--

INSERT INTO `buffet` (`id`, `name`, `price`, `description`, `img`) VALUES
(1, 'Kis Üdítő', 1300, 'Fél liter frissítő kortyolnivaló – tökéletes a mozizás indításához!', 'small_drink.jpg'),
(2, 'Közepes Üdítő', 1500, 'Több korty, több élmény – az ideális mozis társ!', 'medium_drink.jpg'),
(3, 'Nagy Üdítő', 1700, 'Egy liter hűsítő ital, hogy kitarts a film végéig!', 'large_drink.jpg'),
(4, 'Kis Cola', 1300, 'Klasszikus szénsavas cola kis pohárban – a mozi íze!', 'small_cola.jpg'),
(5, 'Nagy Cola', 1700, 'Nagy buborékok, intenzív íz – cola, ami végigkísér a filmen!', 'large_cola.jpg'),
(6, 'Kis Víz', 900, 'Maradj hidratált – kicsi, tiszta frissesség.', 'small_water.jpg'),
(7, 'Nagy Víz', 1200, 'Tiszta, friss víz, ami lehűt az izgalmak közben.', 'large_water.jpg'),
(8, 'Cukormentes Cola', 1400, 'Minden a buborék, semmi a cukor – bűntudatmentes frissítő!', 'sugarfree_cola.jpg'),
(9, 'Kis Sprite', 1300, 'Citrom-lime szikra kis pohárban – könnyed és frissítő!', 'small_sprite.jpg'),
(10, 'Nagy Sprite', 1700, 'Üdítően buborékos – Sprite, ami feldobja a hangulatot!', 'large_sprite.jpg'),
(11, 'Espresso', 1000, 'Erős és intenzív – egy löket energia a film előtt!', 'espresso.jpg'),
(12, 'Cappuccino', 1400, 'Selymes hab, gazdag íz – a tökéletes bemelegítés a mozihoz.', 'cappuccino.jpg'),
(13, 'Latte', 1500, 'Krémes kényelem egy csészében – a legjobb társ a filmhez.', 'latte.jpg'),
(14, 'Kis Sós Popcorn', 1600, 'Klasszikus sós ropogás mini kiszerelésben – időtlen íz a mozirajongóknak!', 'small_salted_popcorn.jpg'),
(15, 'Közepes Sós Popcorn', 1800, 'Aranyszínű, sós tökéletesség – a legjobb mozis nasi!', 'medium_salted_popcorn.jpg'),
(16, 'Nagy Sós Popcorn', 2000, 'Egy vödörnyi sós boldogság, ami kitart a film végéig!', 'large_salted_popcorn.jpg'),
(17, 'Kis Cheddar Popcorn', 1800, 'Intenzív cheddar íz, ropogós popcorn – sajtos csavar a klasszikusban!', 'small_cheddar_popcorn.jpg'),
(18, 'Közepes Cheddar Popcorn', 2000, 'Cheddar bevonatú ropogás – igazi sztárnasi!', 'medium_cheddar_popcorn.jpg'),
(19, 'Nagy Cheddar Popcorn', 2200, 'Extra sajtos, extra nagy adag – az íz és móka bajnoka!', 'large_cheddar_popcorn.jpg'),
(20, 'Kis Nachos', 1800, 'Mini nachos, maximális íz – tökéletes gyors harapnivaló!', 'small_nachos.jpg'),
(21, 'Közepes Nachos', 2200, 'Ropogós, sajtos és ellenállhatatlan – nachos, ami ellopja a show-t!', 'medium_nachos.jpg'),
(22, 'Nagy Nachos', 2400, 'Nagy íz, nagy ropogás – a bátor nassolóknak!', 'large_nachos.jpg'),
(23, 'Üveges Ital', 900, 'Retró hangulat, modern frissesség – pattintsd le a kupakot és élvezd!', 'glass_bottle.jpg'),
(24, 'TOMA PET', 900, 'Gyümölcsös frissesség palackban – TOMA, a legjobb szomjoltó!', 'toma_pet.jpg'),
(25, 'Red Bull', 900, 'Szárnyakat ad a filmhez – turbózd fel a moziélményt!', 'red_bull.jpg'),
(26, 'Felnőtt Menü', 3200, 'Nagy sós popcorn + nagy üdítő – a klasszikus mozi páros!', 'adult_combo.jpg'),
(27, 'Gyerek Menü', 2500, 'Kis popcorn + kis üdítő + meglepetés nasi – a kis mozirajongóknak!', 'kids_combo.jpg'),
(28, 'Tini Menü', 2900, 'Közepes cheddar popcorn + közepes cola – merész ízek merész nézőknek!', 'teen_combo.jpg'),
(29, 'Páros Menü', 5200, 'Nagy popcorn közösen + 2 közepes üdítő – tökéletes randi a moziban!', 'couples_combo.jpg'),
(30, 'Pizza', 4000, 'Finom ropogós tészta, songokus feltétekkel', 'pizza.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `movies`
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
  `trailer` varchar(200) NOT NULL,
  `description` varchar(250) NOT NULL,
  `release_date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `movies`
--

INSERT INTO `movies` (`id`, `title`, `genre`, `runtime`, `director`, `production`, `age_restriction`, `showing_in`, `poster`, `trailer`, `description`, `release_date`) VALUES
(1, 'A Keresztapa', 'Bűnügyi', 175, 'Francis Ford Coppola', 'Paramount Pictures', 18, 'IMAX', 'godfather.jpg', 'godfather.mp4', 'Egy maffiacsalád felemelkedése és bukása.', '1972-03-24'),
(2, 'A Keresztapa II.', 'Bűnügyi', 202, 'Francis Ford Coppola', 'Paramount Pictures', 18, 'IMAX', 'godfather2.jpg', 'godfather2.mp4', 'A Corleone család öröksége folytatódik.', '1974-12-20'),
(3, 'A Sötét Lovag', 'Akció', 152, 'Christopher Nolan', 'Warner Bros.', 16, '4DX', 'dark_knight.jpg', 'dark_knight.mp4', 'Batman szembeszáll a Joker káoszával.', '2008-07-18'),
(4, 'Ponyvaregény', 'Bűnügyi', 154, 'Quentin Tarantino', 'Miramax', 18, '3D', 'pulp_fiction.jpg', 'pulp_fiction.mp4', 'Egymásba fonódó bűntörténetek.', '1994-10-14'),
(5, 'Schindler listája', 'Dráma', 195, 'Steven Spielberg', 'Universal Pictures', 16, '3D', 'schindlers_list.jpg', 'schindlers_list.mp4', 'Egy férfi zsidókat ment meg a II. világháborúban.', '1993-12-15'),
(6, 'Forrest Gump', 'Dráma', 142, 'Robert Zemeckis', 'Paramount Pictures', 12, '3D', 'forrest_gump.jpg', 'forrest_gump.mp4', 'Egy egyszerű ember nagy történelmet él meg.', '1994-07-06'),
(7, 'Eredet', 'Sci-Fi', 148, 'Christopher Nolan', 'Warner', 16, '3', 'inception.jpg', 'inception.mp4', 'Álmok az álmokban.', '2010-07-16'),
(8, 'Harcosok klubja', 'Dráma', 139, 'David Fincher', 'Twentieth Century Fox', 18, '5', 'fight_club.jpg', 'fight_club.mp4', 'Egy titkos klub káoszba torkollik.', '1999-10-15'),
(9, 'A Gyűrűk ura: A Gyűrű Szövetsége', 'Fantasy', 178, 'Peter Jackson', 'New Line Cinema', 12, 'SCREENX', 'lotr1.jpg', 'lotr1.mp4', 'Egy hobbit viszi a megátkozott gyűrűt.', '2001-12-19'),
(10, 'A Gyűrűk ura: A Két Torony', 'Fantasy', 179, 'Peter Jackson', 'New Line Cinema', 12, 'SCREENX', 'lotr2.jpg', 'lotr2.mp4', 'A Szövetség tagjai különválnak.', '2002-12-18'),
(11, 'A Gyűrűk ura: A Király Visszatér', 'Fantasy', 201, 'Peter Jackson', 'New Line Cinema', 12, 'SCREENX', 'lotr3.jpg', 'lotr3.mp4', 'A végső csata Középföldéért.', '2003-12-17'),
(12, 'Mátrix', 'Sci-Fi', 136, 'Lana Wachowski / Lilly Wachowski', 'Warner Bros.', 16, '4DX', 'matrix.jpg', 'matrix.mp4', 'Egy hacker rájön, hogy a valóság csak illúzió.', '1999-03-31'),
(13, 'Csillagok háborúja: Egy új remény', 'Sci-Fi', 121, 'George Lucas', 'Lucasfilm', 12, '3D', 'starwars4.jpg', 'starwars4.mp4', 'Egy farmfiú hőssé válik.', '1977-05-25'),
(14, 'Csillagok háborúja: A Birodalom visszavág', 'Sci-Fi', 124, 'Irvin Kershner', 'Lucasfilm', 12, '3D', 'starwars5.jpg', 'starwars5.mp4', 'A lázadás súlyos veszteségeket szenved.', '1980-05-21'),
(15, 'Csillagok háborúja: A Jedi visszatér', 'Sci-Fi', 131, 'Richard Marquand', 'Lucasfilm', 12, '3D', 'starwars6.jpg', 'starwars6.mp4', 'A császár végzete közeleg.', '1983-05-25'),
(16, 'Gladiátor', 'Történelmi', 155, 'Ridley Scott', 'Dreamworks', 16, '2D', 'gladiator.jpg', 'gladiator.mp4', 'Egy elárult tábornok bosszút forral.', '2000-05-05'),
(17, 'Joker', 'Dráma', 122, 'Todd Phillips', 'Warner Bros.', 16, '2D', 'joker.jpg', 'joker.mp4', 'Egy férfi lassan az őrületbe süllyed.', '2019-10-04'),
(18, 'A bárányok hallgatnak', 'Bűnügyi', 118, 'Jonathan Demme', 'Orion Pictures', 18, '2D', 'silence_lambs.jpg', 'silence_lambs.mp4', 'Egy nyomozó sorozatgyilkost üldöz.', '1991-02-14'),
(19, 'Csillagok között', 'Sci-Fi', 169, 'Christopher Nolan', 'Warner Bros.', 12, 'IMAX', 'interstellar.jpg', 'interstellar.mp4', 'Az emberiség új otthont keres a csillagok között.', '2014-11-07'),
(20, 'Oppenheimer', 'Dráma', 180, 'Christopher Nolan', 'Universal Pictures', 16, '3D', 'oppenheimer.jpg', 'oppenheimer.mp4', 'Az atombomba megalkotásának története.', '2023-07-21'),
(21, 'A remény rabjai', 'Dráma', 142, 'Frank Darabont', 'Warner Bros.', 18, '2D', 'shawshank_redeption.jpg', 'shawshank_redeption.mp4', 'Egy ártatlanul elítélt férfi a Shawshank börtönben barátságot köt, és reményt talál a szabadságra.', '1994-09-23'),
(22, 'Jojo nyuszi', 'Dráma', 108, 'Taika Waititi', 'Twentieth Century Fox', 12, '2D', 'jojo_rabbit.jpg', 'jojo_rabbit.mp4', 'Egy fiatal náci fiú képzeletbeli barátja, Adolf Hitler segítségével fedezi fel az emberiességet és a háború kegyetlenségét.', '2019-10-18'),
(23, 'Csillagok háborúja: Baljós árnyak', 'Sci-Fi', 136, 'George Lucas', 'Lucasfilm', 12, '3D', 'starwars1.jpg', 'starwars1.mp4', 'Egy fiatal jedi, Qui-Gon Jinn és tanítványa, Obi-Wan Kenobi megpróbálják megvédeni a Galaktikus Köztársaságot és felfedezik a titokzatos Sith-ek fenyegetését.', '1999-05-19'),
(24, 'Titkos ablak', 'Thriller', 96, 'David Koepp', 'Columbia Pictures', 16, 'IMAX', 'secret_window.jpg', 'secret_window.mp4', 'Egy író magánélete felborul, amikor egy titokzatos idegen vádolja plágiummal, és a helyzet egyre veszélyesebbé válik.', '2004-07-16'),
(25, 'Zombieland', 'Akció', 88, 'Ruben Fleischer', 'Columbia Pictures', 16, '3D', 'zombieland.jpg', 'zombieland.mp4', 'Egy apokaliptikus zombivilágban túlélők különös társasága próbál életben maradni, miközben humoros kalandokba keverednek.', '2009-10-02'),
(26, 'Jason Bourne', 'Akció', 123, 'Paul Greengrass', 'Universal Pictures', 16, '2D', 'jason_bourne.jpg', 'jason_bourne.mp4', 'Jason Bourne visszatér, hogy felderítse múltja titkait, miközben a CIA üldözi, és életre-halálra menő akciókba keveredik.', '2016-07-29'),
(27, 'Az egyenlítő', 'Akció', 132, 'Antoine Fuqua', 'Sony Pictures', 18, '3D', 'equalizer.jpg', 'equalizer.mp4', 'Egy visszavonult ügynök igazságot szolgáltat a gyengékért, miközben szembeszáll a maffiával.\r\n', '2014-09-26');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `movie_screening`
--

CREATE TABLE `movie_screening` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `language` varchar(50) NOT NULL,
  `start` varchar(5) NOT NULL,
  `end` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `movie_screening`
--

INSERT INTO `movie_screening` (`id`, `movie_id`, `room_id`, `language`, `start`, `end`) VALUES
(1, 1, 1, 'English', '18:00', '21:00'),
(2, 2, 2, 'English', '20:00', '23:20'),
(3, 3, 1, 'English', '17:00', '19:30'),
(4, 4, 2, 'English', '19:00', '21:30'),
(5, 5, 1, 'English', '15:00', '18:00'),
(6, 6, 2, 'English', '14:00', '16:30'),
(7, 7, 1, 'English', '18:00', '20:30'),
(8, 8, 2, 'English', '21:00', '23:20'),
(9, 9, 1, 'English', '13:00', '16:00'),
(10, 10, 2, 'English', '16:30', '19:30'),
(11, 11, 1, 'English', '20:00', '23:20'),
(12, 12, 2, 'English', '18:00', '20:20'),
(13, 13, 1, 'English', '12:00', '14:10'),
(14, 14, 2, 'English', '14:30', '16:40'),
(15, 15, 1, 'English', '17:00', '19:10'),
(16, 16, 2, 'English', '20:00', '23:00'),
(17, 17, 1, 'English', '19:00', '21:10'),
(18, 18, 2, 'English', '22:00', '24:00'),
(19, 19, 1, 'English', '15:00', '17:50'),
(20, 20, 2, 'English', '18:00', '21:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reservation`
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
-- A tábla adatainak kiíratása `reservation`
--

INSERT INTO `reservation` (`id`, `user_id`, `total_amount`, `screening_id`, `reservation_date`, `ticket_id`, `seat_id`) VALUES
(1, 2, 3000, 1, '2025-01-01', 5, 1),
(2, 3, 2500, 2, '2025-01-02', 1, 2),
(3, 4, 3000, 3, '2025-01-03', 5, 3),
(4, 5, 3000, 4, '2025-01-04', 5, 4),
(5, 6, 2500, 5, '2025-01-05', 1, 5),
(6, 7, 2500, 6, '2025-01-06', 1, 6),
(7, 8, 2500, 7, '2025-01-07', 1, 7),
(8, 9, 3000, 8, '2025-01-08', 5, 8),
(9, 10, 2500, 9, '2025-01-09', 1, 9),
(10, 11, 2500, 10, '2025-01-10', 1, 10);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `capacity` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `rooms`
--

INSERT INTO `rooms` (`id`, `capacity`) VALUES
(1, 99),
(2, 125);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `seats`
--

CREATE TABLE `seats` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `seat_row` int(2) NOT NULL,
  `seat_column` int(2) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `seats`
--

INSERT INTO `seats` (`id`, `room_id`, `seat_row`, `seat_column`, `status`) VALUES
(1, 1, 1, 1, 0),
(2, 1, 1, 2, 1),
(3, 1, 1, 3, 0),
(4, 1, 2, 1, 0),
(5, 2, 1, 1, 0),
(6, 2, 1, 2, 1),
(7, 2, 1, 3, 0),
(8, 2, 2, 1, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `price` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `tickets`
--

INSERT INTO `tickets` (`id`, `type`, `price`) VALUES
(1, 'student', 2500),
(2, 'junior', 2200),
(3, 'senior', 2500),
(4, 'disabled', 2500),
(5, 'normal', 3000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(20) NOT NULL,
  `admin` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `admin`) VALUES
(1, 'admin', 'a@a.aa', '1234Aa', 1),
(2, 'Anna Kovács', 'annakovacs@freemail.hu', 'AnnaK2025', 0),
(3, 'Bence Tóth', 'bencetoth@gmail.com', 'BenT_84x', 0),
(4, 'Csilla Horváth', 'csillahorvath@citromail.hu', 'CsillaH91', 0),
(5, 'Dávid Kiss', 'davidkiss@outlook.com', 'DkPass2023', 0),
(6, 'Eszter Farkas', 'eszter_farkas@protonmail.com', 'EszF_77a', 0),
(7, 'Ferenc Varga', 'ferencvarga@t_online.hu', 'FvSecure1', 0),
(8, 'Gábor Szabó', 'gaborszabo@yahoo.com', 'GaborS2024', 0),
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
(21, 'Ivan Petrov', 'ivanpetrov@mail.ru', 'IvanP_2024', 0);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `actor_in_movie`
--
ALTER TABLE `actor_in_movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `actor_id` (`actor_id`);

--
-- A tábla indexei `buffet`
--
ALTER TABLE `buffet`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `movie_screening`
--
ALTER TABLE `movie_screening`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `room_id` (`room_id`);

--
-- A tábla indexei `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `screening_id` (`screening_id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `seat_id` (`seat_id`);

--
-- A tábla indexei `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- A tábla indexei `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `actors`
--
ALTER TABLE `actors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT a táblához `actor_in_movie`
--
ALTER TABLE `actor_in_movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT a táblához `buffet`
--
ALTER TABLE `buffet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT a táblához `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT a táblához `movie_screening`
--
ALTER TABLE `movie_screening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `actor_in_movie`
--
ALTER TABLE `actor_in_movie`
  ADD CONSTRAINT `actor_in_movie_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`),
  ADD CONSTRAINT `actor_in_movie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

--
-- Megkötések a táblához `movie_screening`
--
ALTER TABLE `movie_screening`
  ADD CONSTRAINT `movie_screening_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `movie_screening_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Megkötések a táblához `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`screening_id`) REFERENCES `movie_screening` (`id`);

--
-- Megkötések a táblához `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `seats_ibfk_2` FOREIGN KEY (`id`) REFERENCES `reservation` (`seat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
