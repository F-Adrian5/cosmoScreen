<template>
  <div class="container my-4">
    <div class="row g-3">
      <div v-for="movie in movies" :key="movie.id"
           class="movie-card p-2 h-100 px-2 py-2
                  col-12 col-md-6 col-lg-4 col-xl-3">

        <!-- movie -->
        <div class="movie-content d-flex flex-row 
                    flex-md-column border
                    align-items-md-center border-black
                    text-md-center bg-primary-subtle">
          
          <!-- movie image -->
          <img :src="`./src/assets/media/images/movie_posters/${movie.poster}`" class="movie-image">

          <!-- movie content -->
          <div class="mt-2 mx-2">
            <h3 class="fs-3 mb-1 fw-bold">{{ movie.title }}</h3>
            <p class="fs-5 mb-1 text-muted">{{ movie.genre }}</p>
            <p class="fs-5 mb-3 text-muted">| {{ movie.runtime }} perc</p>
          
            <!-- movie time -->
            <div class="movie-times d-flex flex-wrap gap-1 
                        justify-content-start 
                        justify-content-md-center fs-5">

              <!-- movie time display -->
              <span class="badge bg-secondary me-1 mb-1"> 
                {{ movie.showing_in }}
              </span>
              
              <!-- <span v-for="time in movie.showing_in" :key="time"
                    class="badge bg-secondary me-1 mb-1">
                {{ time }}
              </span> -->
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
    description: string
    title: string
    genre: string
    runtime: number
    start: string
    end: string
    showing_in: string
  }

  const movies = ref<Movie[]>([]);

  onMounted(async ()=> {

    const data = await axios.get("http://localhost:3000/getPrograms")
    movies.value = data.data;
    console.log(movies)
  })

</script>