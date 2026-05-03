<script setup lang="ts">
  import { onMounted, ref, watch } from 'vue';
  import { useFilter } from '@/composables/useFilter';
  import { movieService } from '@/services/programListServices';

  const { movies, genres, days, filter, loadData, getAvailableGenresForDay } = useFilter();

  const selectedMovie = ref<any>(null);
  const seats = ref<any[]>([]);
  const selectedSeats = ref<any[]>([]);

  const day = ref("Hétfő");
  const genre = ref("all");

  /** This function will only run if the user selects a film
   * the parameter is the selected film's value
   * @param movie selected film's value
   */
  function openMovie(movie: any) {
    
    // storing the selected movie's data for the modal to show
    selectedMovie.value = movie;
    
    // if the user clicks on a new film then the value will be empthy
    selectedSeats.value = [];
  }

  /** This function gets the selected film's room and seats ordered by rows
   * @return {Object} an ordered object whit the rows and seats in it.
   */
  function getSeatsByRow() {

    // if there is no seleceted movie than return an empty object
    if (!selectedMovie.value) return {};

    // we selcet only the seats witch has the same room_id as our selected movie
    const roomSeats = seats.value.filter(
      seat => seat.room_id === selectedMovie.value.room_id
    );

    const rows: any = {};


    for (const seat of roomSeats) {

      // fills every row with the current amount of seats with an array each
      if (!rows[seat.seat_row]) {
        rows[seat.seat_row] = [];
      }

      // pushes the seat's value to the current seat
      rows[seat.seat_row].push(seat);
    }

    // returns the rows
    return rows;
  }

  /** The function only runs when the user selects a seat
   * @param {any} seat selected seat's data
   */
  function selectSeat(seat: any) {

    // searching if the current seat is in the selectedSeats
    // findIndex gives back the seat's id in the array if it exists
    // if not, than it will give a -1 index
    const idx = selectedSeats.value.findIndex(s => s.id === seat.id);

    // checks if the seat is exists
    if (idx === -1) {

      // if not than it will give the selecetedSeats the current seat's value
      selectedSeats.value.push(seat);
    } else {

      // if the seat exists, than it will remove it from selecetedSeats
      // splice(index, number): this will remove a given "index", a number of items
      selectedSeats.value.splice(idx, 1);
    }
  }

  /** This function returns if the seat is selected or not
   * @param {any} seat the selected seat
   * @returns {boolean} true if it is selected, false if it's not 
   */
  function isSeatSelected(seat: any) {

    // some() will go thourgh the selected seats and if it finds at least one that
    // matches the id of the seat that is selected, than it gives a true value, else it gives a false
    return selectedSeats.value.some(s => s.id === seat.id);
  }

  // this watches the day ref, if it changes, 
  // than the following function will be called
  watch(day, () => {

    // when we change date than our gender gets the "all" value
    genre.value = "all";

    // This function will find the movies that match the filters
    // the film's list will update
    filter(day.value, "all");
  });

  // when the DOM loads
  onMounted(async () => {
    
    // loads the films data form db
    await loadData();
    
    // calls the filter function
    filter();
    
    // gets all the seat data form db
    seats.value = await movieService.getSeats();
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
                      :value="genre"
                      :disabled="!getAvailableGenresForDay(day).includes(genre)">
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
              <div v-for="(rowSeats, rowLabel) in getSeatsByRow()" :key="rowLabel"
                   class="d-flex align-items-center mb-2">
                
                <!-- sor száma -->
                <div style="width: 30px;" 
                     class="text-center text-white">
                  {{ rowLabel }}
                </div>

                <!-- székek -->
                <div class="d-flex flex-grow-1 justify-content-between">
                  <div v-for="seat in rowSeats" :key="seat.id"
                       class="flex-fill mx-1 text-center rounded"
                       :class="isSeatSelected(seat) ? 'bg-success text-white' : 'bg-secondary text-black'"
                       @click="selectSeat(seat)"
                       style="cursor: pointer;">
                    {{ seat.seat_column }}
                  </div>
                </div>
              </div>
            </div>

            <!-- kiválasztott székek -->
            <div class="text-white mb-2 mx-3 text-center" 
                 v-if="selectedSeats.length > 0">
              <p class="my-1 text-center">
                {{selectedSeats.length > 1 ? "Kiválasztott székek:" : "Kiválasztott szék:"}}
              </p>
              <span v-for="seat in selectedSeats" :key="seat.id"
                    class="badge bg-secondary me-2">

                {{ seat.seat_row }}. sor, {{ seat.seat_column }}. szék
              </span>
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