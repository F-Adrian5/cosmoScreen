<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
</script>

<template>
  <header class="p-3 bg-light">
    <div class="container d-flex flex-wrap justify-content-center">
      <RouterLink to="/" class="nav-link px-2 link-secondary">Home</RouterLink>
      <RouterLink to="/about" class="nav-link px-2 link-secondary">About</RouterLink>
    </div>
  </header>

  <main class="container mt-5">
    <RouterView />
  </main>
</template>