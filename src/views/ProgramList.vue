<template>
  <div class="container my-4">
    
  <!-- dates -->
  <div class="row justify-content-center">
    <div class="col-12">
      <h1 class="text-center text-white">
        Vetítési szűrő
      </h1>
    
      <hr class="text-white my-3">
    </div>
  
    <!-- selection -->
    <div class="row text-center fs-4">

      <!-- day -->
      <div class="w-50">       
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
      <div class="w-50">
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

    <!-- movie div -->
    <div class="row g-3">
      <div v-for="movie in movies" :key="movie.id"
           class="p-2 h-100 px-2 py-2 col-12 col-md-6 col-lg-4 col-xl-3">

        <!-- movie -->
        <div class="movie-card d-flex flex-row flex-md-column border
                    align-items-md-center border-black
                    text-md-center bg-primary-subtle">
          
          <!-- movie image -->
          <img :src="`./src/assets/media/images/movie_posters/${movie.poster}`" 
               class="movie-image">

          <!-- movie content -->
          <div class="mt-2 mx-3">
            <h3 class="fs-3 my-1 fw-bold">{{ movie.movie_title }}</h3>
            <p class="fs-4 mb-1 text-muted">{{ movie.genre }} | {{ movie.runtime }} perc</p>
            <p class="fs-4 mb-1 text-muted">{{ movie.start }} - {{ movie.end }}</p>
            <p class="fs-4 mb-2 text-muted">Terem: {{ movie.room_id}}</p>
          
            <!-- movie time -->
            <div class="movie-times d-flex flex-wrap gap-1 
                        justify-content-start 
                        justify-content-md-center fs-5">

              <!-- movie time display -->
              <span class="badge bg-secondary mb-1"> 
                {{ movie.showing_in }}
              </span>
              <span class="badge bg-warning mb-1"> {{ movie.language }}</span>
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
  let movies = ref<Movie[]>([]);
  const days = ["Hétfő", "Kedd", "Szerda", "Csütörtök", "Péntek", "Szombat", "Vasárnap"];
  const genres = ref<string[]>([]);
  let genre = ref(),
      day = ref();
  
  // setting up the default values
  genre.value = "all"
  day.value = "Hétfő"
  filter(day.value, genre.value);

  // filter function
  function filter(day:string="Hétfő", genre:string="all") {
    day = day
    genre = genre

  }

  // when the app runs, this will be called
  onMounted(async ()=> {

    // a get request to the server
    const data = await axios.get("http://localhost:3000/getPrograms");
    movies.value = data.data;
    console.log(movies);

    // get genres 
    const genresData = await axios.get("http://localhost:3000/getGenres");
    for (let i = 0; i < genresData.data.length; i++) {
      
      // fill the genres ref with data
      genres.value.push(genresData.data[i].genre);
    }

    console.log(genres);

  })
</script>