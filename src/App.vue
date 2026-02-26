<script setup lang="ts">
// importing
import { RouterView } from 'vue-router'
import Navbar from './components/Navbar.vue'
import FooterView from './components/Footer.vue'
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