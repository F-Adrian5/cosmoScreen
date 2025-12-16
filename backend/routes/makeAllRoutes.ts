import { Router } from 'express';
import db from '../db.ts';
import { createRoute } from '../utils/createRoute.ts';

const router = Router();

// stores all the table url and query's
const getData = [
  { url: '/getActors', query: 'SELECT id, name FROM actors' },
  { url: '/getBuffet', query: 'SELECT id, name, price, description, img FROM buffet' },
  { url: '/getMovies', query: 'SELECT id, title, genre FROM movies' },
  { url: '/getActorInMovie', query: 'SELECT id, movie_id, actor_id FROM actor_in_movie' },
  { url: '/getMovieScreening', query: 'SELECT `id`,`movie_id`,`room_id`,`language`,`start`,`end` FROM `movie_screening`' },
  { url: '/getReservation', query: 'SELECT `id`,`user_id`,`total_amount`,`screening_id`,`reservation_date`,`ticket_id`,`seat_id` FROM `reservation`' },
  { url: '/getRooms', query: 'SELECT `id`,`capacity` FROM `rooms`' },
  { url: '/getSeats', query: 'SELECT `id`,`room_id`,`seat_row`,`seat_column`,`status` FROM `seats`' },
  { url: '/getTickets', query: 'SELECT `id`,`type`,`price` FROM `tickets`' },
  { url: '/getUsers', query: 'SELECT `id`,`name`,`email`,`password`,`admin` FROM `users`' },
];

// ciklus minden tábla számára
getData.forEach(t => {
  router.use(createRoute(t.url, t.query));
});

export default router;