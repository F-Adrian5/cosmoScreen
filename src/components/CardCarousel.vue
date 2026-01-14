<template>
  <div class="container">
    <div class="row align-text-center">
      <div class="carousel w-100">
        
        <!-- card -->
        <div class="card carousel-card mt-3 rounded-3"
             v-for="(movie, index) in movies" 
             :key="movie.id" 
             :style="{ '--i': index }">
          
          <!-- image -->
          <img :src="`./src/assets/media/images/movie_posters/${movie.poster}`"
               class="card-img-top h-75" 
               :alt="movie.title" />
          
          <!-- card body -->
          <div class="card-body h-25 justify-content-center rounded-3">

            <!-- title -->
            <h5 class="card-title text-center fs-4">{{ movie.title }}</h5>
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
    poster: string
    title: string
  }

  // movies will be a reactive variable
  // it is basically a variable, 
  // that if you change it will automatically change in the HTML
  // so if we modify the data, the UI will automatically update
  const movies = ref<Movie[]>([]);

  // when the site runs than we get the movies
  onMounted(async ()=> {
    const response = await axios.get("http://localhost:3000/getHome")
    movies.value = response.data;
  })
</script>