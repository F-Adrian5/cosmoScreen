<template>
  <div class="container">
    <div class="row align-text-center">
      <div class="carousel w-100">
        
        <!-- card -->
        <div class="card carousel-card mt-3 rounded-3"
             v-for="(movie, index) in movies" 
             :key="movie.id" 
             :style="{ '--i': index }"
             data-bs-toggle="modal"
             data-bs-target="#exampleModal"
             @click="selectMovie(movie)">
          
          <!-- image -->
          <img :src="`./src/assets/media/images/movie_posters/${movie.poster}`"
               class="card-img-top h-75"
               :alt="movie.title" />
          
          <!-- card body -->
          <div class="card-body h-25 justify-content-center rounded-3">

            <!-- title -->
            <h5 class="card-title text-center fs-4">
              {{ movie.title }}
            </h5>
          </div>
        </div>
      </div>

      <!-- Modal -->
      <div class="modal fade"
           id="exampleModal"
           tabindex="-1"
           aria-labelledby="exampleModalLabel">

        <div class="modal-dialog modal-dialog-centered modal-lg 
                    modal-fullscreen-sm-down modal-dialog-scrollable">
          <div class="modal-content bg-dark text-light rounded-4 shadow-lg">
          
            <!-- Header -->
            <div class="modal-header border-0">
              <h1 class="modal-title fs-2 fw-bold mx-auto w-100 text-center" 
                  id="exampleModalLabel">
                {{ selectedMovie?.title }}
              </h1>
            </div>
            
            <hr class="border-secondary">
            
            <!-- Body -->
            <div class="modal-body">
              <div class="row g-3">
              
                <!-- Image -->
                <div class="col-12 col-md-5 text-center">
                  <img :src="`./src/assets/media/images/movie_posters/${selectedMovie?.poster}`"
                       class="img-fluid rounded-3 shadow"
                       alt="Movie image">
                </div>
              
                <!-- Movie details -->
                <div class="col-12 col-md-7">
                  <p class="fs-4">
                    <strong>
                      Film műfaja:
                    </strong>
                    {{ selectedMovie?.genre }}
                  </p>

                  <p class="fs-4">
                    <strong>
                      Játékidő:
                    </strong> 
                    {{ selectedMovie?.runtime }}p
                  </p>

                  <p class="fs-4">
                    <strong>
                      Studió:
                    </strong> 
                    {{ selectedMovie?.production }}
                  </p>

                  <p class="fs-4">
                    <strong>
                      Korhatár:
                    </strong> 
                    {{ selectedMovie?.age_restriction }}+
                  </p>

                  <p class="fs-4">
                    <strong>
                      Megjelenés:
                    </strong> 
                    {{ selectedMovie?.release_date }}
                  </p>
                </div>
                
                <hr class="border-secondary">
                
                <div class="col-12 col-md-12">
                  <p class="text-secondary fs-3">
                    {{ selectedMovie?.description }}
                  </p>
                </div>
              </div>
            </div>
          
            <!-- Footer -->
            <div class="modal-footer border-0">
              <button type="button"
                      class="btn btn-outline-light px-4 fs-4"
                      data-bs-dismiss="modal"
                      @click="($event.currentTarget as HTMLElement).blur()">
                  Close
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">

  // importing from vue and carousel.css
  // defineComponent: this is how we define components
  // ref: every time if something changes ref reacts
  import { ref, onMounted } from "vue";
  import axios from "axios";
  import "../assets/styles/carousel.css";

  // this will make a Movie object, and we can set what records it can have
  interface Movie {
    id: number
    title: string
    genre: string
    runtime: number
    director: string
    production: string
    age_restriction: number
    poster: string
    trailer: string
    description: string
    release_date: string
  }

  // movies will be a reactive variable
  // it is basically a variable, 
  // that if you change it will automatically change in the HTML
  // so if we modify the data, the UI will automatically update
  const movies = ref<Movie[]>([]);
  const selectedMovie = ref<Movie | null>(null);

  function selectMovie(movie: Movie) {
    selectedMovie.value = movie;
  }

  // when the site runs than we get the movies
  onMounted(async ()=> {
    const response = await axios.get("http://localhost:3000/getMovies")
    movies.value = response.data;
  })  
</script>