// this will make a Movie object, and we can set what records it can have
export interface Movie {
  id: number;
  poster: string;
  movie_title: string;
  genre: string;
  runtime: number;
  start: string;
  end: string;
  showing_in: string;
  language: string;
  room_id: number;
  screeningDay?: string; // Optional, not all movies interface will have a value for this one
}