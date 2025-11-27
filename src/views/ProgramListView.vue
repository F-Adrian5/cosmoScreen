<template>
  <div class="container py-4">
    <h1 class="text-center mb-2">Műsorlista</h1>
    <p class="text-center text-secondary fs-5 mb-4">
      Ezeket a műsorokat vetítjük!
    </p>

    <!-- Nap választó gombok -->
    <div class="d-flex flex-wrap justify-content-center gap-2 mb-4">
      <button v-for="day in days" :key="day" 
              @click="selectDay(day)" 
              :class="['btn', selectedDay === day ? 
                        'btn-secondary' : 'btn-outline-secondary']">
          {{ day }}
      </button>
    </div>

    <p class="text-center mb-4">
      Kiválasztott nap: <strong>{{ selectedDay || 'nincs kiválasztva' }}</strong>
    </p>

    <!-- Filmek listája -->
    <div class="container my-3">
      <div v-for="movie in movies" :key="movie.id" 
           class="card mb-3 movie-card">
        <div class="row g-3 align-items-start">

          <!-- Kép -->
          <div class="col-auto">
            <img :src="movie.image" 
                 class="img-fluid rounded movie-image">
          </div>
        
          <!-- Szöveg és időpontok -->
          <div class="col">
            <h3 class="mt-3 fs-5 mb-1">{{ movie.title }}</h3>
            <p class="fs-6 mb-1 text-muted">{{ movie.genre }}</p>
            <p class="fs-6 mb-1 text-muted">| {{ movie.length }}p</p>
          
            <!-- Időpontok -->
            <div>
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