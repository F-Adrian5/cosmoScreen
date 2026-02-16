import { ref } from "vue";
import type { Movie } from "@/types/Movie";
import { movieService } from "@/services/programListServices";
import { createScreeningDays } from "@/utils/programListHelper";

export function useFilter() {

  // declaring the variables that the function will use
  const movies = ref<Movie[]>([]),
        allMovies = ref<Movie[]>([]),
        genres = ref<string[]>([]),
        days = ["Hétfő", "Kedd", "Szerda", "Csütörtök", "Péntek", "Szombat", "Vasárnap"];

  /** filter function
   * @param {string} day
   * @param {string} genre
   */
  function filter(day: string = "Hétfő", genre: string = "all") {
    console.log(day, genre);
    let filteredMovies = [];

    // if there is a selected genre
    if (genre != "all" && day) {

      // iterating through all the movies and finding those who mach the genre and the given day
      for (let i = 0; i < allMovies.value.length; i++) {
        if ( allMovies.value[i]?.genre == genre &&
             allMovies.value[i]?.screeningDay == day) {

          // pushing the values of the correct item to the filteredMovies
          filteredMovies.push(allMovies.value[i]);
        }
      }
      
      // setting the main DOM movies value to the filtered one
      movies.value = JSON.parse(JSON.stringify(filteredMovies));
    } else {

      // iterating through all the movies and finding those who mach the given day
      for (let i = 0; i < allMovies.value.length; i++) {
        if (allMovies.value[i]?.screeningDay == day) {

          // pushing the values of the correct item to the filteredMovies
          filteredMovies.push(allMovies.value[i])
        }
        
        // setting the main DOM movies value to the filtered one
        movies.value = JSON.parse(JSON.stringify(filteredMovies));
      }
    }
  }

  // fetching the data
  const loadData = async () => {

    // getting the programs
    const rawMovies = await movieService.getPrograms();
    
    // setting values
    movies.value = rawMovies;
    allMovies.value = rawMovies;
    
    // creating the random days
    createScreeningDays(allMovies.value, days);
  
    // getting the genres
    const rawGenres = await movieService.getGenres();
    
    // filling the genres with the api data
    for (let i = 0; i < rawGenres.length; i++) {
      genres.value.push(rawGenres[i].genre);
    }
  };

  // exporting what the programList.vue will need
  return {
    movies,
    allMovies,
    genres,
    days,
    filter,
    loadData
  };
}