<script setup lang="ts">
  
  // imports the carousel.css and the carousel
  import '../assets/styles/carousel.css';
  import Carousel from '../components/CardCarousel.vue';
</script>

<template>
  <main>
    <h2 class="text-center text-light mb-5 mt-5">{{ $t('texts.welcome') }}</h2>
    <p class="fw-bold text-light fs-3">{{ $t('texts.onShow') }}</p>
    
    <!-- loads the carousel component -->
    <Carousel /> 
  </main>
</template>