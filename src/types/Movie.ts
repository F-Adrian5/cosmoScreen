// this will make a Movie object, and we can set what records it can have
export interface Movie {
  id: number,
  poster: string,
  movie_title: string,
  genre: string,
  runtime: number,
  showing_in: string,
  language: string,
  room_id: number,
  
  start?: string,
  end?: string,
  screeningDay?: string
}

export interface CarouselMovie {
  id: number,
  title: string,
  genre: string,
  runtime: number,
  director: string,
  production: string,
  age_restriction: number,
  poster: string,
  description: string,
  release_date: string
}

export interface actorsInMovie {
  name: string,
  actor_id: number,
  info_link: string,
  movie_id: number
}