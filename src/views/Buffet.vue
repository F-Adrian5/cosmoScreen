<template>
  <div class="container">

    <!-- title -->
    <div class="row">
      <h1 class="text-center text-light mt-5 mb-3">
        {{ $t('buffetPage.buffetTitle') }}
      </h1>
    </div>

    <hr class="text-light">
    
    <!-- select item -->
    <div class="text-center d-flex 
                flex-wrap justify-content-center my-3">
      <button class="m-2 fs-4 p-2 btn buffetTypes"
              :class="{ active: defaultBuffetType === buffetType.type }" 
              v-for="buffetType in offerType"
              :key="buffetType.type"
              @click="buffetClick(buffetType.type)">
          {{ buffetType.type }}
      </button>
    </div>
  
    <hr class="text-light">

    <!-- items list -->
    <div class="container-fluid">
      <div class="row align-items-center border border-info-subtle py-3 item_bg mt-3"
           v-for="offer in displayedOffers" :key="offer.id">
    
        <!-- image -->
        <div class="col-12 col-md-3 col-lg-2 d-flex 
                    justify-content-center mb-2 mb-md-0">
          <img :src="`./src/assets/media/images/buffet/${offer.img}`"
               class="buffet-img"
               alt="buffet item image">
        </div>
      
        <!-- name + description -->
        <div class="col-12 col-md-6 col-lg-7 
                    text-center text-md-start">
          
          <h5 class="offer-name mb-1 item_name">
            {{ offer.name }}
          </h5>

          <p class="offer-desc mb-1 text-white">
            {{ offer.description }}
          </p>
        </div>
      
        <!-- price -->
        <div class="col-12 col-md-3 col-lg-3
                    text-center text-md-end pe-4">
          <span class="offer-price text-white">
            {{ offer.price }} Ft
          </span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { onMounted } from "vue";
import { useBuffet } from "@/composables/useBuffet";

// using the useBuffet items
const { offerType, defaultBuffetType, displayedOffers, buffetClick, loadBuffetData } = useBuffet();

// when the DOM runs...
onMounted(() => {
  loadBuffetData();
});
</script>