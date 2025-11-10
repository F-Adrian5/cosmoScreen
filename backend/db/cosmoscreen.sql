-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2025 at 02:43 PM
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
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `actors`
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
(20, 'Joaquin Phoenix');

-- --------------------------------------------------------

--
-- Table structure for table `actor_in_movie`
--

CREATE TABLE `actor_in_movie` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
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
(7, 4, 10),
(8, 4, 3),
(9, 5, 6),
(10, 6, 5),
(11, 7, 4),
(12, 8, 10),
(13, 9, 10),
(14, 10, 10),
(15, 11, 10),
(16, 12, 12),
(17, 13, 13),
(18, 14, 13),
(19, 15, 13),
(20, 16, 20),
(21, 17, 20),
(22, 18, 19),
(23, 19, 5),
(24, 20, 4);

-- --------------------------------------------------------

--
-- Table structure for table `buffet`
--

CREATE TABLE `buffet` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(5) NOT NULL,
  `description` varchar(250) NOT NULL,
  `img` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `buffet`
--

INSERT INTO `buffet` (`id`, `name`, `price`, `description`, `img`) VALUES
(1, 'Small Drink', 1300, 'A splash of refreshment in half a liter – perfect to kick off your movie night!', 'small_drink.jpg'),
(2, 'Medium Drink', 1500, 'More sips, more fun – your ideal cinema companion!', 'medium_drink.jpg'),
(3, 'Large Drink', 1700, 'One liter of chill to power through the trailers and the plot twists!', 'large_drink.jpg'),
(4, 'Small Cola', 1300, 'Classic fizzy cola in a small cup – the taste of cinema!', 'small_cola.jpg'),
(5, 'Large Cola', 1700, 'Big bubbles, bold flavor – cola that lasts the whole movie!', 'large_cola.jpg'),
(6, 'Small Water', 900, 'Stay hydrated with pure refreshment – small and simple.', 'small_water.jpg'),
(7, 'Large Water', 1200, 'Clean, crisp water to keep you cool through the action.', 'large_water.jpg'),
(8, 'Sugar-Free Cola', 1400, 'All the fizz, none of the sugar – guilt-free refreshment!', 'sugarfree_cola.jpg'),
(9, 'Small Sprite', 1300, 'Lemon-lime sparkle in a small cup – light and refreshing!', 'small_sprite.jpg'),
(10, 'Large Sprite', 1700, 'Zesty and bubbly – Sprite that keeps the vibe alive!', 'large_sprite.jpg'),
(11, 'Espresso', 1000, 'Bold and intense – a shot of energy before the show!', 'espresso.jpg'),
(12, 'Cappuccino', 1400, 'Smooth foam, rich flavor – the perfect movie warm-up.', 'cappuccino.jpg'),
(13, 'Latte', 1500, 'Creamy comfort in a cup – your cozy cinema companion.', 'latte.jpg'),
(14, 'Small Salted Popcorn', 1600, 'Classic salted crunch in a mini size – timeless flavor for true cinema fans!', 'small_salted_popcorn.jpg'),
(15, 'Medium Salted Popcorn', 1800, 'Golden, salty perfection – the ultimate movie munch!', 'medium_salted_popcorn.jpg'),
(16, 'Large Salted Popcorn', 2000, 'A bucket of salty joy to last through every twist and turn!', 'large_salted_popcorn.jpg'),
(17, 'Small Cheddar Popcorn', 1800, 'Bold cheddar flavor meets crispy popcorn – a cheesy twist on a classic!', 'small_cheddar_popcorn.jpg'),
(18, 'Medium Cheddar Popcorn', 2000, 'Cheddar-coated crunch that steals the show – snack like a star!', 'medium_cheddar_popcorn.jpg'),
(19, 'Large Cheddar Popcorn', 2200, 'Epic-sized cheesy goodness – for those who crave flavor and fun!', 'large_cheddar_popcorn.jpg'),
(20, 'Small Nachos', 1800, 'Mini nachos, maximum flavor – perfect for a quick crunch!', 'small_nachos.jpg'),
(21, 'Medium Nachos', 2200, 'Crunchy, cheesy, and dangerously addictive – nachos that steal the spotlight!', 'medium_nachos.jpg'),
(22, 'Large Nachos', 2400, 'Big flavor, big crunch – for those who snack like a star!', 'large_nachos.jpg'),
(23, 'Glass Bottle Drink', 900, 'Retro vibes, modern refreshment – pop the cap and enjoy!', 'glass_bottle.jpg'),
(24, 'TOMA PET', 900, 'Fruity freshness in a bottle – TOMA, your go-to thirst quencher!', 'toma_pet.jpg'),
(25, 'Red Bull', 900, 'Wings for your story – energize your cinema experience!', 'red_bull.jpg'),
(26, 'Adult Combo', 3200, 'Large salted popcorn + large drink – the classic cinema power duo!', 'adult_combo.jpg'),
(27, 'Kids Combo', 2500, 'Small popcorn + small drink + surprise treat – made for little movie lovers!', 'kids_combo.jpg'),
(28, 'Teen Combo', 2900, 'Medium cheddar popcorn + medium cola – bold flavor for bold stories!', 'teen_combo.jpg'),
(29, 'Couples Combo', 5200, 'Large popcorn to share + 2 medium drinks – perfect for date night at the movies!', 'couples_combo.jpg');

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
  `showing_in_id` int(11) NOT NULL,
  `poster` varchar(200) NOT NULL,
  `trailer` varchar(200) NOT NULL,
  `description` varchar(250) NOT NULL,
  `release_date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `genre`, `runtime`, `director`, `production`, `age_restriction`, `showing_in_id`, `poster`, `trailer`, `description`, `release_date`) VALUES
(1, 'The Godfather', 'Crime', 175, 'Francis Ford Coppola', 'Paramount', 18, 1, 'godfather.jpg', 'godfather.mp4', 'A mafia family\'s rise and fall.', '1972-03-24'),
(2, 'The Godfather Part II', 'Crime', 202, 'Francis Ford Coppola', 'Paramount', 18, 1, 'godfather2.jpg', 'godfather2.mp4', 'The Corleone family legacy continues.', '1974-12-20'),
(3, 'The Dark Knight', 'Action', 152, 'Christopher Nolan', 'Warner', 16, 2, 'dark_knight.jpg', 'dark_knight.mp4', 'Batman faces the Joker\'s chaos.', '2008-07-18'),
(4, 'Pulp Fiction', 'Crime', 154, 'Quentin Tarantino', 'Miramax', 18, 5, 'pulp_fiction.jpg', 'pulp_fiction.mp4', 'Intertwined crime tales.', '1994-10-14'),
(5, 'Schindler\'s List', 'Drama', 195, 'Steven Spielberg', 'Universal', 16, 5, 'schindlers_list.jpg', 'schindlers_list.mp4', 'A man saves Jews during WWII.', '1993-12-15'),
(6, 'Forrest Gump', 'Drama', 142, 'Robert Zemeckis', 'Paramount', 12, 5, 'forrest_gump.jpg', 'forrest_gump.mp4', 'A simple man experiences big history.', '1994-07-06'),
(7, 'Inception', 'Sci-Fi', 148, 'Christopher Nolan', 'Warner', 13, 3, 'inception.jpg', 'inception.mp4', 'Dreams within dreams.', '2010-07-16'),
(8, 'Fight Club', 'Drama', 139, 'David Fincher', 'Fox', 18, 5, 'fight_club.jpg', 'fight_club.mp4', 'An underground club becomes chaos.', '1999-10-15'),
(9, 'The Lord of the Rings: The Fellowship of the Ring', 'Fantasy', 178, 'Peter Jackson', 'New Line', 12, 3, 'lotr1.jpg', 'lotr1.mp4', 'A hobbit carries a cursed ring.', '2001-12-19'),
(10, 'The Lord of the Rings: The Two Towers', 'Fantasy', 179, 'Peter Jackson', 'New Line', 12, 3, 'lotr2.jpg', 'lotr2.mp4', 'The fellowship is scattered.', '2002-12-18'),
(11, 'The Lord of the Rings: The Return of the King', 'Fantasy', 201, 'Peter Jackson', 'New Line', 12, 3, 'lotr3.jpg', 'lotr3.mp4', 'The final battle for Middle-earth.', '2003-12-17'),
(12, 'The Matrix', 'Sci-Fi', 136, 'Lana Wachowski/Lilly Wachowski', 'Warner', 16, 2, 'matrix.jpg', 'matrix.mp4', 'A hacker discovers reality is illusion.', '1999-03-31'),
(13, 'Star Wars: A New Hope', 'Sci-Fi', 121, 'George Lucas', 'Lucasfilm', 10, 6, 'starwars4.jpg', 'starwars4.mp4', 'A farmboy becomes a hero.', '1977-05-25'),
(14, 'Star Wars: The Empire Strikes Back', 'Sci-Fi', 124, 'Irvin Kershner', 'Lucasfilm', 10, 6, 'starwars5.jpg', 'starwars5.mp4', 'The rebellion suffers great losses.', '1980-05-21'),
(15, 'Star Wars: Return of the Jedi', 'Sci-Fi', 131, 'Richard Marquand', 'Lucasfilm', 10, 6, 'starwars6.jpg', 'starwars6.mp4', 'The emperor faces his downfall.', '1983-05-25'),
(16, 'Gladiator', 'Historical', 155, 'Ridley Scott', 'Dreamworks', 16, 4, 'gladiator.jpg', 'gladiator.mp4', 'A betrayed general seeks revenge.', '2000-05-05'),
(17, 'Joker', 'Drama', 122, 'Todd Phillips', 'Warner', 16, 4, 'joker.jpg', 'joker.mp4', 'A man descends into madness.', '2019-10-04'),
(18, 'The Silence of the Lambs', 'Crime', 118, 'Jonathan Demme', 'Orion', 18, 5, 'silence_lambs.jpg', 'silence_lambs.mp4', 'A detective hunts a serial killer.', '1991-02-14'),
(19, 'Interstellar', 'Sci-Fi', 169, 'Christopher Nolan', 'Warner', 10, 1, 'interstellar.jpg', 'interstellar.mp4', 'Humanity searches for a new home.', '2014-11-07'),
(20, 'Oppenheimer', 'Drama', 180, 'Christopher Nolan', 'Universal', 16, 1, 'oppenheimer.jpg', 'oppenheimer.mp4', 'The story of the atomic bomb.', '2023-07-21');

-- --------------------------------------------------------

--
-- Table structure for table `movie_screening`
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
-- Dumping data for table `movie_screening`
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
(1, 99),
(2, 125);

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `seat_row` int(2) NOT NULL,
  `seat_column` int(2) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `seats`
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
-- Table structure for table `showing_in`
--

CREATE TABLE `showing_in` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `showing_in`
--

INSERT INTO `showing_in` (`id`, `type`) VALUES
(1, 'IMAX'),
(2, '4DX'),
(3, 'SCREENX'),
(4, 'VIP'),
(5, '2D'),
(6, '3D');

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `showing_in_id` (`showing_in_id`);

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
-- Indexes for table `showing_in`
--
ALTER TABLE `showing_in`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `actor_in_movie`
--
ALTER TABLE `actor_in_movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `buffet`
--
ALTER TABLE `buffet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `movie_screening`
--
ALTER TABLE `movie_screening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `showing_in`
--
ALTER TABLE `showing_in`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actor_in_movie`
--
ALTER TABLE `actor_in_movie`
  ADD CONSTRAINT `actor_in_movie_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`),
  ADD CONSTRAINT `actor_in_movie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`showing_in_id`) REFERENCES `showing_in` (`id`);

--
-- Constraints for table `movie_screening`
--
ALTER TABLE `movie_screening`
  ADD CONSTRAINT `movie_screening_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `movie_screening_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`screening_id`) REFERENCES `movie_screening` (`id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`);

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`id`) REFERENCES `reservation` (`seat_id`),
  ADD CONSTRAINT `seats_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
