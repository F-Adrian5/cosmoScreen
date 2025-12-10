<template>
  <div class="container my-3">
    <div class="row g-3">
      <div v-for="movie in movies" :key="movie.id"
           class="movie-card p-2 h-100 px-2 py-2
                  col-12 col-md-6 col-lg-4 col-xl-3">

        <div class="movie-content d-flex flex-row 
                    flex-md-column border
                    align-items-md-center border-black
                    text-md-center">
          <img :src="movie.image" class="movie-image">

          <div class="mt-2 mx-2">
            <h3 class="fs-3 mb-1 fw-bold">{{ movie.title }}</h3>
            <p class="fs-5 mb-1 text-muted">{{ movie.genre }}</p>
            <p class="fs-5 mb-3 text-muted">| {{ movie.length }} perc</p>
          
            <div class="movie-times d-flex flex-wrap gap-1 
                        justify-content-start 
                        justify-content-md-center fs-5">

              <span v-for="time in movie.times" :key="time"
                    class="badge bg-secondary me-1 mb-1">
                {{ time }}
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
  import { ref } from 'vue'

  const days = [
  "Hétfő",
  "Kedd",
  "Szerda",
  "Csütörtök",
  "Péntek",
  "Szombat",
  "Vasárnap"
  ]

  const movies = [
    {
      id: 1,
      title: "Oppenheimer",
      genre: "akció, történelmi",
      length: 180,
      image: "../../public/movie_posters/jojo_rabbit.jpg",
      times: ["3D – 16:00", "2D – 18:00", "IMAX – 19:00"]
    },
    {
      id: 2,
      title: "Batman",
      genre: "akció",
      length: 140,
      image: "../../public/movie_posters/starwars5.jpg",
      times: ["2D – 14:00", "IMAX – 19:00"]
    },
    {
      id: 2,
      title: "2012",
      genre: "akció",
      length: 100,
      image: "../../public/movie_posters/starwars4.jpg",
      times: ["2D – 14:00"]
    },
    {
      id: 4,
      title: "Titanic",
      genre: "akció",
      length: 240,
      image: "../../public/movie_posters/starwars6.jpg",
      times: ["IMAX – 19:00"]
    }
  ]

  const selectedDay = ref(days[0]);

  function selectDay(day) {
    selectedDay.value = day;
  }
</script>