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

const selectedDay = ref(null)

function selectDay(day) {
  selectedDay.value = day
}
</script>
