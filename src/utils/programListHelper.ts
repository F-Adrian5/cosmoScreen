import type { Movie } from "@/types/Movie";

/** shuffles a given array. By copying the given array than sorting and randomizing it
 * @param {Array} array gets an array to shuffle
 * @returns {Array} an array that is shuffeled
 */
function shuffle (array:any): any {
  return [...array].sort(() => Math.random() - 0.5);
}

/** This function will make the runtime to hours and minutes
 * @param {number} runtime a number that refers to the number of minutes, that a film is played 
 * @returns {string} the time of the screening: 02:05, 11:11, 15:15
 */
function runtimeToTime(runtime: number): string {

  // declaring variables
  // counting the hours and minutes
  const hours = Math.floor(runtime / 60);
  const minutes = runtime % 60;

  // returns the time in string
  return `${hours >= 10 ? hours : '0' + hours}:${minutes >= 10 ? minutes : '0' + minutes }`
}

/** This will 
 * @param {Movie} movies 
 * @returns 
 */
function generateTimes(movies: Movie[]) {

  let openingTime = 8 * 60,
      closingTime = 23 * 60 + 30,
      breaksBetweenFilms = 15,
      current = openingTime;

  const scheduledMovies: Movie[] = [];

  for (const movie of movies) {

    let runtime = movie.runtime;

    if (!(current + runtime > closingTime)) {
      const start = current,
            end = current + runtime;

      movie.start = runtimeToTime(start);
      movie.end = runtimeToTime(end);

      scheduledMovies.push(movie);

      current = end + breaksBetweenFilms;
    } else {
      break;
    }


  }
  return scheduledMovies;
}

/**
 * This function...
 * @param {Movie} movieList, takes the movies as a type
 * @param {string[]} days, takes the days
 * @returns {Movie} 
 */
export function createScreeningDays(movieList: Movie[], days: string[]) {

  const MIN_PER_DAY = 5;

  const week: Record<string, Movie[]> = {};

  for (const day of days) {
    week[day] = [];
  }

  const movies = shuffle(movieList);

  let index = 0;

  /**
   * minimum films per day
   */
  for (const day of days) {

    for (let i = 0; i < MIN_PER_DAY; i++) {

      if (!movies[index]) break;

      week[day]!.push(movies[index]!);

      index++;

    }

  }

  /**
   * remaining movies
   */
  while (index < movies.length) {

    const randomDay = days[Math.floor(Math.random() * days.length)]!;

    week[randomDay]!.push(movies[index]!);

    index++;

  }

  /**
   * generate times
   */
  for (const day of days) {

    const scheduled = generateTimes(week[day]!);

    for (const movie of scheduled) {
      movie.screeningDay = day;
    }

    week[day] = scheduled;

  }

  return week;

}