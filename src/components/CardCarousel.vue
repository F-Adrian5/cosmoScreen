<template>
  <div class="container">
    <div class="row align-text-center">
      <div class="carousel w-100">
        <div class="card movie-card"
             v-for="(movie, index) in movies" :key="movie.id" :style="{ '--i': index }">
          <img :src="movie.image" class="card-img-top" :alt="movie.title" />
          <div class="card-body">
            <h5 class="card-title">{{ movie.title }}</h5>
            <p class="card-text">{{ movie.description }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>


<script lang="ts">
import { defineComponent, ref } from 'vue'
import '../assets/carousel.css'

interface Movie {
  id: number
  title: string
  description: string
  image: string
  link: string
}

export default defineComponent({
  name: 'MovieCarousel',
  setup() {
    const movies = ref<Movie[]>([
      {
        id: 1,
        title: 'Inception',
        description: 'A mind-bending thriller about dreams within dreams.',
        image: 'https://dummyimage.com/280x200/000/fff&text=Inception',
        link: '#',
      },
      {
        id: 2,
        title: 'Interstellar',
        description: 'Exploration of space and time to save humanity.',
        image: 'https://dummyimage.com/280x200/000/fff&text=Interstellar',
        link: '#',
      },
      {
        id: 3,
        title: 'The Dark Knight',
        description: 'Batman faces his greatest enemy, the Joker.',
        image: 'https://dummyimage.com/280x200/000/fff&text=Dark+Knight',
        link: '#',
      },
      {
        id: 4,
        title: 'The Matrix',
        description: 'A hacker discovers the shocking truth about reality.',
        image: 'https://dummyimage.com/280x200/000/fff&text=Matrix',
        link: '#',
      },
      {
        id: 5,
        title: 'Avatar',
        description: 'A visually stunning journey to Pandora.',
        image: 'https://dummyimage.com/280x200/000/fff&text=Avatar',
        link: '#',
      },
      {
        id: 6,
        title: 'Titanic',
        description: 'A tragic love story aboard the doomed ship.',
        image: 'https://dummyimage.com/280x200/000/fff&text=Titanic',
        link: '#',
      },
      {
        id: 7,
        title: 'Gladiator',
        description: 'A Roman general seeks revenge as a gladiator.',
        image: 'https://dummyimage.com/280x200/000/fff&text=Gladiator',
        link: '#',
      },
      {
        id: 8,
        title: 'Jurassic Park',
        description: 'Dinosaurs brought back to life with chaos ensuing.',
        image: 'https://dummyimage.com/280x200/000/fff&text=Jurassic+Park',
        link: '#',
      },
      {
        id: 9,
        title: 'The Lord of the Rings',
        description: 'An epic quest to destroy the One Ring.',
        image: 'https://dummyimage.com/280x200/000/fff&text=LOTR',
        link: '#',
      },
      {
        id: 10,
        title: 'Star Wars',
        description: 'The battle between Jedi and Sith across galaxies.',
        image: 'https://dummyimage.com/280x200/000/fff&text=Star+Wars',
        link: '#',
      },
    ])
    return { movies }
  },
})
</script>
