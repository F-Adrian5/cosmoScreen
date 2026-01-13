<template>
  <div class="container">
    <div class="row">
      <h1 class="text-center text-light mt-5">Büfés ajánlataink</h1>
      <hr class="text-light">
    </div>

    <!-- items grid -->
    <div class="row">
      <div class="col-12 col-sm-6 col-lg-4 col-xl-3 mb-4"
           v-for="(offer, index) in offers"
           :key="index">
        <div class="border rounded h-100 p-3 d-flex 
                    flex-column image-wrapper">

          <!-- image -->
          <img :src="`./src/assets/media/images/buffet/${offer.img}`"
               class="img-fluid mb-3 rounded w-100 buffet-img"
               alt="buffe item image">

          <!-- text -->
          <h3 class="text-primary text-center">{{ offer.name }}</h3>
          <hr class="text-info my-2">
          <p class="text-warning fs-6">
            Ára: {{ offer.price }} Ft
          </p>
          <p class="text-light flex-grow-1">
            {{ offer.description }}
          </p>

        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">

  // importing.
  import { ref, onMounted } from "vue";
  import axios from "axios";

  // offers interface
  interface Offer {
    id: number
    name: string
    price: number
    description: string
    img: string
  }

  const offers = ref<Offer[]>([]);

  onMounted(async ()=>{
    const offersData = await axios.get("http://localhost:3000/getBuffet")
    offers.value = offersData.data;
  })
</script>