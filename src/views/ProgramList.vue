<script setup lang="ts">
  import { onMounted, ref } from 'vue';
  import { useFilter } from '@/composables/useFilter';
  import { movieService } from '@/services/programListServices';

  // pulling the items from the composable, that will be needed
  const { movies, genres, days, filter, loadData } = useFilter();

  const selectedMovie = ref<any>(null);

  let seats = ref<any[]>([]);
  let room1 = ref<any[]>([]);
  let room2 = ref<any[]>([]);
  let room1SeatRow = ref<any[]>([]);
  let room2SeatRow = ref<any[]>([]);

  function openMovie(movie:any){
    selectedMovie.value = movie;
    
    console.log(movie);

  };

  setTimeout(async()=>{
    seats.value = await movieService.getSeats();
    console.log(seats)
    for (let i = 0; i < seats.value.length; i++) {
      if (seats.value[i].room_id === 1) {
        room1.value.push(seats.value[i]);
      } else if (seats.value[i].room_id === 2) {
        room2.value.push(seats.value[i]);
      }
    }
    console.log(room1.value.length);
    console.log(room1.value[1].seat_row);
    console.log(room2);

    for (let i = 0; i < room1.value.length; i++) {
      room1SeatRow.value.push(room1.value[i].seat_row);
    }
  }, 200);
  
  let rowsSET = new Set()

  console.log(rowsSET)

  function selectSeat() {
    
  }

  // local states
  const day = ref("Hétfő");
  const genre = ref("all");

  // when the DOM loads
  onMounted(async () => {
    
    // fills allMovies and movies with data
    await loadData();

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
        <div class="modal-body text-white"
             style="padding: 14px;">

          <!-- info (time,room) -->
          <div class="row mx-3">
            <div class="col-12 col-md-6 mb-2 mb-md-0">
              <span>
                <i class="fa-solid fa-people-roof"></i>
                Terem: {{ selectedMovie?.room_id }}. 
              </span>
            </div>

            <div class="col-12 col-md-6 text-md-end">
              <span>
                <i class="fa-regular fa-clock"></i>
                {{selectedMovie?.start}} - {{selectedMovie?.end}} ({{ selectedMovie?.runtime }}p)
              </span>
            </div>
          </div>

          <hr>

          <!-- wrapper (screen + seats) -->
          <div class="w-100 d-flex flex-column align-items-center">
          
            <!-- screen -->
            <div class=" bg-light d-flex justify-content-center align-items-center w-75 my-3"
                 style="height: 30px;">
              <span class="text-black">
                Vászon
              </span>
            </div>
          
            <br>
            <br class=" d-md-none">

            <!-- seats -->
            <div class="w-100">
            
              <!-- row -->
              <div v-for="row in room1.length" 
                   class="d-flex align-items-center mb-2">
              
                <!-- row number -->
                <div style="width: 30px;" 
                     class="text-center">
                  {{ row }}
                </div>
              
                <!-- seats -->
                <div class="d-flex flex-grow-1 justify-content-between">
                
                  <div v-for="screen in 8"
                       class="flex-fill mx-1 text-center bg-white text-black rounded"
                       @click="selectSeat()">
                    {{ screen }}
                  </div>
                
                </div>
              </div>
            
            </div>
          </div>

          <br>
          <br class="d-md-none">

          <!-- tickets -->
          <div>
            <p>tickets</p>
          </div>

          <!-- selected seat(s) -->

        </div>

        <!-- footer -->
        <div class="modal-footer">
          <div class="row w-100 g-2">
          
            <div class="col-12 col-md-6">
              <button type="button"
                      class="btn btn-outline-light fs-4 w-100"
                      data-bs-dismiss="modal">
                <i class="fa-solid fa-xmark mx-1"></i>
                Bezárás
              </button>
            </div>
          
            <div class="col-12 col-md-6">
              <button type="button"
                      class="btn btn-outline-success fs-4 w-100">
                <i class="fa-solid fa-check mx-1"></i>
                Foglalás
              </button>
            </div>
          </div>
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