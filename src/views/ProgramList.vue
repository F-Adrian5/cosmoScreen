<script setup lang="ts">
  import { onMounted, ref } from 'vue';
  import { useFilter } from '@/composables/useFilter';
  import { movieService } from '@/services/programListServices';

  // pulling the items from the composable, that will be needed
  const { movies, genres, days, filter, loadData } = useFilter();

  const selectedMovie = ref<any>(null);

  function openMovie(movie:any){
    selectedMovie.value = movie;
  };

  // local states
  const day = ref("Hétfő");
  const genre = ref("all");

  // when the DOM loads
  onMounted(async () => {
    
    // fills allMovies and movies with data
    await loadData();

    console.log(await movieService.getSeats());
    
    // calling the filter function
    filter();
  });
</script>

<template>
  <div class="container my-5">
    
    <!-- dates -->
    <div class="row justify-content-center">
      
      <!-- title -->
      <div class="col-12">
        <h1 class="text-center text-white mb-5">
          {{ $t('programListPage.title') }}
        </h1>
      
        <hr class="text-white my-3 mt-4">
      </div>
  
      <!-- selection -->
      <div class="row text-center fs-2">

        <h3 class="text-light">
          {{ $t('programListPage.screeningFilter') }}
        </h3>

        <!-- day -->
        <div class="col-12 col-md-6 my-2">
          <label for="daySelect" 
               class="text-light">
            {{ $t('programListPage.day') }}
          </label>

          <select name="daySelect" 
                  id="daySelect"
                  class="text-center mx-2 select"
                  @change="filter(day,genre); console.log(movies);"
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
           {{ $t('programListPage.genre') }}
          </label>

          <select name="genreSelect" 
                  id="genreSelect"
                  class="text-center mx-2 select"
                  @change="filter(day,genre); console.log(movies);"
                  v-model="genre">

              <option value="all">
                Összes Műfaj
              </option>
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
               v-for="movie in movies"
               :key="movie.id"
               @click="openMovie(movie)"
               data-bs-toggle="modal"
               data-bs-target="#movieModal">
        
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

    <!-- if there is no film with filter -->
    <div>
      <h1 class="text-center text-warning fw-bold my-5"
          v-show="!movies.length">
        {{ $t('programListPage.notFound') }}
      </h1>
    </div>

  </div>

  <!-- modal -->
  <div class="modal" 
       id="movieModal" 
       tabindex="-1" 
       aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content bg-dark">
        <div class="modal-header">
          <h5 class="modal-title text-white">
            {{ selectedMovie?.movie_title }}
          </h5>
        </div>
        <div class="modal-body text-white">
          <p>Terem - ido</p>
          <p>vaszon</p>
          <p>szekek</p>
          <p>jegyek tipusai</p>
        </div>
        <div class="modal-footer">
          <button type="button" 
                  class="btn btn-outline-light px-4 fs-4" 
                  data-bs-dismiss="modal">
                <i class="fa-solid fa-xmark mx-1"></i>
              Bezárás
          </button>
          <button type="button" 
                  class="btn btn-outline-success px-4 fs-4">
              <i class="fa-solid fa-check"></i>
            Foglalás
          </button>
        </div>
      </div>
    </div>
  </div>

</template>

<style>
  .programList-bg {
    background-image: radial-gradient(circle, #8ab5b6, #82aaab, #7a9fa0, #729596, #6a8a8b, #5e7a7f, #546a71, #4b5a63, #3e424b, #2e2d32, #1c191b, #000000);
  };

</style>