<template>
  <div class="container py-4">
    <h1 class="text-center mb-2">Műsorlista</h1>
    <p class="text-center text-secondary fs-5 mb-4">
      Ezeket a műsorokat vetítjük!
    </p>

    <div class="d-flex flex-wrap justify-content-center gap-2">
      <button v-for="day in days" :key="day" 
              @click="selectDay(day)" 
              :class="['btn', selectedDay === day ? 'btn-secondary' : 'btn-outline-secondary']">
        {{ day }}
      </button>
    </div>

    <p class="text-center mt-3">
      Kiválasztott nap: <strong>{{ selectedDay || 'nincs kiválasztva' }}</strong>
    </p>
  </div>

  <!-- movie -->
  <!-- <div class="d-flex gap-3 align-items-start">
    <img src="https://dummyimage.com/200x300/000000/fff" 
         class="img-fluid rounded" 
         style="width: 200px;">

    <div class="d-flex flex-column justify-content-between">

      <div>
        <h1 class="mb-3">Oppenh.</h1>
        <p class="text-muted mb-5 fs-3">akció, történelmi | 180p</p>
      </div>

      <div>
        <div class="badge bg-secondary mb-3 fs-6">3D – 16:00</div>
        <br>
        <div class="badge bg-secondary fs-6">2D – 18:00</div>
      </div>
    </div>
  </div> -->

  <div class="row g-4">

    <div class="col-12 col-md-6 col-lg-4" v-for="movie in movies" :key="movie.id">
      
      <!-- movie card -->
      <div class="movie-card d-flex gap-3 align-items-start p-3 border rounded h-100">
        
        <img 
          :src="movie.image" 
          class="img-fluid rounded"
          style="width: 120px; height: auto;"
        >

        <div class="d-flex flex-column justify-content-between">

          <div>
            <h2 class="mb-2 fs-3">{{ movie.title }}</h2>
            <p class="text-muted mb-4">{{ movie.genre }} | {{ movie.length }}p</p>
          </div>

          <div>
            <div class="badge bg-secondary mb-2" v-for="time in movie.times" :key="time">
              {{ time }}
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
      image: "https://dummyimage.com/200x300/000000/fff",
      times: ["3D – 16:00", "2D – 18:00"]
    },
    {
      id: 2,
      title: "Batman",
      genre: "akció",
      length: 140,
      image: "https://dummyimage.com/200x300/222222/fff",
      times: ["2D – 14:00", "IMAX – 19:00"]
    }
  ]

  const selectedDay = ref(days[0]);

  function selectDay(day) {
    selectedDay.value = day;
  }
</script>
