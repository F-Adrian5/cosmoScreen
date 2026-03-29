import { ref } from "vue";
import type { Movie } from "@/types/Movie";
import { movieService } from "@/services/programListServices";
import { createScreeningDays } from "@/utils/programListHelper";

/** This is the main function, that will connect our scheduled film's list
 * and our filter function together
 * @returns 
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

  // returns the data we will use
  return {
    movies,
    allMovies,
    genres,
    days,
    filter,
    loadData
  };
}