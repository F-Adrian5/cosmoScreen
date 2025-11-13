<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
import Navbar from './views/Navbar.vue';
</script>

<template>
  <header>
    <Navbar/>
  </header>

  <main class="container mt-5">
    <RouterView />
  </main>
</template>