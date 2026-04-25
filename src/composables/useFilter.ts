import { ref } from "vue";
import type { Movie } from "@/types/Movie";
import { movieService } from "@/services/programListServices";
import { createScreeningDays } from "@/utils/programListHelper";

/** This is the main function, that will connect our scheduled film's list
 * and our filter function together
 */
export function useFilter() {

  // declaring variables
  const movies = ref<Movie[]>([]),
        allMovies = ref<Movie[]>([]),
        genres = ref<string[]>([]),
        days = [ "Hétfő", "Kedd", "Szerda", "Csütörtök",
                 "Péntek", "Szombat", "Vasárnap"];

  /** This function will find the movies that match the filters
   * @param {string} day this has a default value of monday, in other cases we give it a day value
   * @param {string} genre has a default value of all, other cases it has some value
   */
  function filter(day: string = "Hétfő", genre: string = "all") {

    // returns that film whitch matches the day and genre
    const filtered = allMovies.value.filter(movie => {

      const dayMatch = movie.screeningDay === day;
      const genreMatch = genre === "all" || movie.genre === genre;

      return dayMatch && genreMatch;
    });

    // assigns the movies value to the filtered ones
    movies.value = filtered;
  }

  /** this function will load the data
   * gets the programs, generates the week
   */
  const loadData = async () => {

    // declaring variables
    const rawMovies = await movieService.getPrograms(),
          week = createScreeningDays(rawMovies, days),
          flattened: Movie[] = [];

    // goes through the days
    for (const day of days) {

      // assumes that the week[day] has a value
      // and goes thourgh it
      for (const movie of week[day]!) {

        // pushes the value
        flattened.push(movie);
      };
    };

    // we add the values of the list
    allMovies.value = flattened;
    movies.value = flattened;

    // gets the genres
    let rawGenres = await movieService.getGenres();
    for (let i = 0; i < rawGenres.length; i++) {
      genres.value.push(rawGenres[i].genre);
    };
  };

  /** This function will get all the genres that is screening
   * at the given day
   * @param {string} day a given day
   * @returns {Array} that contains all the unique genres
   */
  function getAvailableGenresForDay(day: string): string[] {

    // storing all the movies for the selected day
    const moviesForDay = [];
  
    for (let i = 0; i < allMovies.value.length; i++) {

      // checking what movies have the same day of screening that we selected
      if (allMovies.value[i]!.screeningDay === day) {
        moviesForDay.push(allMovies.value[i]);
      }
    }

    // getting all the genres, that are in the movies for selected day
    const genres = [];

    for (let i = 0; i < moviesForDay.length; i++) {
      genres.push(moviesForDay[i]!.genre);
    }

    // creating a new set
    const uniqueGenres = new Set<string>();
    
    //adding all the genres to the Set
    for (let i = 0; i < genres.length; i++) {
      uniqueGenres.add(genres[i]!);
    }
    
    // converting and returning the uniqueGenres Set in a Array form
    return Array.from(uniqueGenres);
  }

  // returns the data we will use
  return {
    movies,
    allMovies,
    genres,
    days,
    filter,
    loadData,
    getAvailableGenresForDay
  };
}