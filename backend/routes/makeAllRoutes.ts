import { Router } from 'express';
import { createRoute } from '../utils/createRoute.ts';

const router = Router();

// stores all the table url and query's
const getData = [
  { 
    url: '/getActors', 
    query: 'SELECT id, name FROM actors' 
  },
  { 
    url: '/getBuffet', 
    query: 'SELECT id, name, type, price, description, img FROM buffet' 
  },
  { 
    url: '/getBuffetTypes', 
    query: 'SELECT DISTINCT type FROM buffet' 
  },
  { 
    url: '/getGenres', 
    query: 'SELECT DISTINCT genre FROM movies' 
  },
  { 
    url: '/getMovies', 
    query: 'SELECT id, title, genre, runtime, director, production, age_restriction, poster, description, release_date FROM movies' 
  },
  { 
    url: '/getActorInMovie', 
    query: 'SELECT id, movie_id, actor_id FROM actor_in_movie' 
  },
  { 
    url: '/getMovieScreening', 
    query: 'SELECT `id`,`movie_id`,`room_id`,`language` FROM `movie_screening`' 
  },
  { 
    url: '/getReservation', 
    query: 'SELECT `id`,`user_id`,`total_amount`,`screening_id`,`reservation_date`,`ticket_id`,`seat_id` FROM `reservation`' 
  },
  { 
    url: '/getRooms', 
    query: 'SELECT `id`,`capacity` FROM `rooms`' 
  },
  { 
    url: '/getSeats', 
    query: 'SELECT `id`,`room_id`,`seat_row`,`seat_column`,`status` FROM `seats`' 
  },
  { 
    url: '/getTickets', 
    query: 'SELECT `id`,`type`,`price` FROM `tickets`' 
  },
  { 
    url: '/getUsers', 
    query: 'SELECT `id`,`name`,`email`,`password`,`admin` FROM `users`' 
  },
  {
    url: '/getPrograms',
    query: 'SELECT `movie_screening`.`id` AS "screening_id", `movie_id` AS "movie_id", `movies`.`title` AS "movie_title", `movies`.`poster`, `movies`.`runtime`, `movies`.`genre`, `movies`.`showing_in`, `room_id`, `language` FROM `movie_screening` JOIN `movies` ON `movie_id` = `movies`.`id`'
  }
];

// forEach for every item, to create the route
getData.forEach(route => {
  router.use(createRoute(route.url, route.query));
});

export default router;