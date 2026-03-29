import type { Movie } from "@/types/Movie";

/** shuffles a given array. By copying the given array than sorting and randomizing it
 * @param {Array} array gets an array to shuffle
 * @returns {Array} an array that is shuffeled
 */
function shuffle (array:any): any {
  return [...array].sort(() => Math.random() - 0.5);
};

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
  return `${hours >= 10 ? hours : '0' + hours}:${minutes >= 10 ? minutes : '0' + minutes }`;
};

/** This will schedule the movies for a given day
 * @param {Movie} movies takes in the movies that we want to schedule
 * @returns {Movie} the list of the movies that can be shown without any time conflict
 */
function generateTimes(movies: Movie[]): Movie {

  // setting variables
  let openingTime = 8 * 60,
      closingTime = 23 * 60 + 30,
      breaksBetweenFilms = 15,
      current = openingTime;

  // creating a var that will store all the scheduled movies
  const scheduledMovies:any = [];

  // going through the movies
  for (const movie of movies) {

    let runtime = movie.runtime;

    // checking if when the film ends, we will be open
    if (!(current + runtime > closingTime)) {

      // if yes -> setting some variables
      const start = current,
            end = current + runtime;

      // calculating the time for the start and end
      movie.start = runtimeToTime(start);
      movie.end = runtimeToTime(end);

      // pushing the movie to the scheduled list
      scheduledMovies.push(movie);

      // setting the current time to the films end + the break
      current = end + breaksBetweenFilms;
    } else {

      // if no, than the cycle will break, exit.
      break;
    };
  };

  // The function will return a list of the movies that can be shown on a given day
  return scheduledMovies;
};

/**
 * This function will create a cheduled week with every day having at least 5 films
 * if there are some left than it will randomly assing it to a day.
 * This function will also take runtime into a count so we dont have any timing conflicts
 * @param {Movie} movieList, takes the movies
 * @param {string[]} days, takes the days
 * @returns {Movie} the scheduled week
 */
export function createScreeningDays(movieList: Movie[], days: string[]) {

  // declaring the minimum films per day
  // creating a week, that has a "object" type
  // Record<keyType, valueType> -> its like an object, but you can set the key-value type
  const minNumFilmPerDay = 5,
        week: Record<string, Movie[]> = {},
        movies = shuffle(movieList); // shuffles the list

  // declaring a helper index
  let index = 0;

  // going through all of the days
  for (const day of days) {

    // each day we set an empthy list to that specific day
    week[day] = [];

    // This for will run as many times as the min num. of films is reached
    for (let i = 0; i < minNumFilmPerDay; i++) {
      
      // if we still have a movie
      if (movies[index]) {

        // than we ensoure our program that the week[day] cant be null
        // and we set the value
        week[day]!.push(movies[index]!);

        // than we increment the index to prevent giving the same movie
        index++;
      } else {

        // if we dont have any movies left than we break out of the cycle
        break;
      };
    };
  };

  // if we still have movies to set
  while (index < movies.length) {

    // we select a random day
    const randomDay = days[Math.floor(Math.random() * days.length)]!;

    // that random day cant be null, so we push the movie data to it.
    week[randomDay]!.push(movies[index]!);

    // than we increment the index to prevent giving the same movie
    index++;
  };

  // we go through all the days
  for (const day of days) {

    // select a day and generate the time for the screening
    const scheduled:any = generateTimes(week[day]!);

    // setting the screeningDay's value to the current day for all of our films
    for (const movie of scheduled) {
      movie.screeningDay = day;
    };

    // setting that week's day to the scheduled movie screening time list
    week[day] = scheduled;
  };

  // in the end we return the week, that will determine 
  // each day what we will show and at what time
  return week;
};