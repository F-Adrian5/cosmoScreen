import { ref } from "vue";
import type { Movie } from "@/types/Movie";
import { movieService } from "@/services/programListServices";
import { createScreeningDays } from "@/utils/programListHelper";

export function useFilter() {

  const movies = ref<Movie[]>([]),
        allMovies = ref<Movie[]>([]),
        genres = ref<string[]>([]),
        days = [ "Hétfő", "Kedd", "Szerda", "Csütörtök",
                 "Péntek", "Szombat", "Vasárnap"];

  /**
   * filter function
   */
  function filter(day: string = "Hétfő", genre: string = "all") {

    const filtered = allMovies.value.filter(movie => {

      const dayMatch = movie.screeningDay === day;
      const genreMatch = genre === "all" || movie.genre === genre;

      return dayMatch && genreMatch;

    });

    movies.value = filtered;

  }

  /**
   * load data
   */
  const loadData = async () => {

    const rawMovies = await movieService.getPrograms();

    const week = createScreeningDays(rawMovies, days);

    const flattened: Movie[] = [];

    for (const day of days) {

      for (const movie of week[day]!) {

        flattened.push(movie);

      }

    }

    allMovies.value = flattened;
    movies.value = flattened;

    const rawGenres = await movieService.getGenres();

    genres.value = rawGenres.map((g: any) => g.genre);

  };

  return {
    movies,
    allMovies,
    genres,
    days,
    filter,
    loadData
  };
}