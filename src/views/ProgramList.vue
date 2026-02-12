<template>
  <div class="container my-5">
    
    <!-- dates -->
    <div class="row justify-content-center">
      
      <!-- title -->
      <div class="col-12">
        <h1 class="text-center text-white mb-5">
          Vetítési szűrő
        </h1>
      
        <hr class="text-white my-3 mt-4">
      </div>
  
      <!-- selection -->
      <div class="row text-center fs-2">

        <!-- day -->
        <div class="col-12 col-md-6 my-2">
          <label for="daySelect" 
               class="text-light">
            Nap:
          </label>

          <select name="daySelect" 
                  id="daySelect"
                  class="text-center mx-2"
                  @change="filter(day,genre)"
                  v-model="day">

            <option v-for="day in days"
                    :value="day">
              {{ day }}
            </option>
          </select>
        </div>

        <!-- genre -->
        <div class="col-12 col-md-6 my-2">
          <label for="genreSelect" 
                 class="text-light">
            Műfaj:
          </label>

          <select name="genreSelect" 
                  id="genreSelect"
                  class="text-center mx-2"
                  @change="filter(day,genre)"
                  v-model="genre">

              <option value="all">Összes Műfaj</option>
              <option v-for="genre in genres"
                      :key="genre"
                      :value="genre">
                  {{ genre }}
              </option>
          </select>
        </div>
      </div>
    
      <div class="col-12">
        <hr class="text-white my-3">
      </div>
    </div>

    <!-- movies -->
    <div class="container my-2">
      <div class="row justify-content-center">
        <div class="col-11 col-sm-8 col-md-10 col-lg-10 
                    col-xl-10 col-xxl-12">
          <div class="movie-card d-flex flex-column flex-md-row 
                      align-items-center p-2 shadow-lg my-5"
               v-for="movie in movies">
        
            <!-- Poster -->
            <div class="poster-wrapper">
              <img :src="`./src/assets/media/images/movie_posters/${movie.poster}`"
                   class="movie-image">
            </div>
          
            <!-- Content -->
            <div class="movie-content ms-md-4 mt-4 mt-md-0 text-center text-md-start">
            
              <h1 class="fw-bold mb-3">
                {{ movie.movie_title }}
              </h1>
            
              <p class="fs-3 text-muted mb-2">
                {{ movie.genre }} | {{ movie.runtime }} perc
              </p>
            
              <p class="fs-3 text-muted mb-2">
                {{ movie.start }} - {{ movie.end }}
              </p>
            
              <p class="fs-3 text-muted mb-3">
                Terem: {{ movie.room_id }}
              </p>
            
              <div class="d-flex flex-wrap gap-2 fs-4 
                          justify-content-center 
                          justify-content-md-start">
            
                <span class="badge bg-success">
                  {{ movie.showing_in }}
                </span>
              
                <span class="badge bg-info">
                  {{ movie.language }}
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">

  // importing.
  import { ref, onMounted } from "vue";
  import axios from "axios";

  // this will make a Movie object, and we can set what records it can have
  interface Movie {
    id: number
    poster: string
    movie_title: string
    genre: string
    runtime: number
    start: string
    end: string
    showing_in: string
    language: string
    room_id: number
  }

  // creating a reactive array
  let movies = ref<Movie[]>([]),
      genres = ref<string[]>([]),
      genre = ref("all"), // setting default value for genre
      day = ref("Hétfő"); // setting default value for day
    
  const allMovies = ref<Movie[]>([]),
        days = ["Hétfő", "Kedd", "Szerda", "Csütörtök", "Péntek", "Szombat", "Vasárnap"];
    
  /** filter function
   * @param {string} day 
   * @param {string} genre 
   */
  function filter(day:string="Hétfő", genre:string="all") {
    console.log(day,genre)
    let filteredMovies = []
    
    //checking if there is any selected genre
    if (genre != "all") {

      // goes through the movies one by one
      for (let i = 0; i < allMovies.value.length; i++) {
        
        // and if the movie's and the selected genre is equal
        // than the movie will be pushed to a different list
        if (allMovies.value[i]?.genre == genre) {
          filteredMovies.push(allMovies.value[i])
        }
      }

      // setting the value of movies to the filtered list
      movies.value = JSON.parse(JSON.stringify(filteredMovies))
    } else {
      
      // if the genre is 'all'
      movies.value = allMovies.value;
    }

  }

  /**
   * this function will get the movies and assign a random day to it
   * considering the runtime and timing of the movies
   */
  function createScreeningDays() {
    console.log(allMovies.value.length);


  }

  // when the app runs, this will be called
  onMounted(async ()=> {

    // geting the programs
    const moviesData = await axios.get("http://localhost:3000/getPrograms");
    movies.value = moviesData.data;
    allMovies.value = moviesData.data;
    console.log(movies.value);

    // get genres 
    const genresData = await axios.get("http://localhost:3000/getGenres");
    for (let i = 0; i < genresData.data.length; i++) {
      
      // fill the genres ref with data
      genres.value.push(genresData.data[i].genre);
    }

    createScreeningDays();
    console.log(genres.value);
  })
</script>