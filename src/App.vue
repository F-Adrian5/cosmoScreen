<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
import Navbar from './views/NavbarView.vue'
import FooterView from './views/FooterView.vue'
</script>

<template>
  <div class="app-wrapper">
    <header>
      <Navbar />
    </header>

    <main class="flex-fill container">
      <div class="row">
        <RouterView />
      </div>
    </main>

    <footer>
      <FooterView />
    </footer>
  </div>
</template>