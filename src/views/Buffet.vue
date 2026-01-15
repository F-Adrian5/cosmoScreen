<template>
  <div class="container">

    <!-- title -->
    <div class="row">
      <h1 class="text-center text-light mt-5">{{ $t('buffetPage.buffetTitle') }}</h1>
      <hr class="text-light">
    </div>

    <!-- items grid -->
    <!-- <div class="row">
      <div class="col-12 col-sm-6 col-lg-4 col-xl-3 mb-4"
           v-for="(offer, index) in offers"
           :key="index">
        <div class="border rounded h-100 p-3 d-flex 
                    flex-column image-wrapper"> -->

          <!-- image -->
          <!-- <img :src="`./src/assets/media/images/buffet/${offer.img}`"
               class="img-fluid mb-3 rounded w-100 buffet-img"
               alt="buffe item image"> -->

          <!-- text -->
          <!-- <h3 class="text-primary text-center">{{ offer.name }}</h3>
          <hr class="text-info my-2">
          <p class="text-warning fs-6">
            Ára: {{ offer.price }} Ft
          </p>
          <p class="text-light flex-grow-1">
            {{ offer.description }}
          </p>

        </div>
      </div> -->
    <!-- </div> -->

    <div class="text-white text-center d-flex 
                flex-wrap justify-content-center">
      <button class="m-2 fs-4 p-2 btn buffetTypes" 
            v-for="buffetType in offerType"
            :key="buffetType.type"
            @click="buffetClick()"> 
        {{ buffetType.type }}
      </button>
    </div>
    
    <hr class="text-light">

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

  // offerType interface
  interface OfferType {
    type: string
  }

  // creating reactive state for the offers
  const offers = ref<Offer[]>([]);
  const offerType = ref<OfferType[]>([]);

  function buffetClick() {
    console.log("test")
  }

  //when the app runs this function is called
  onMounted(async ()=>{

    //get request to the backend
    const buffetItem = await axios.get("http://localhost:3000/getBuffet")
    const buffetTypes = await axios.get("http://localhost:3000/getBuffetTypes")
    
    // assigning values
    offers.value = buffetItem.data;
    offerType.value = buffetTypes.data;

    // DEBUG
    // for (let i = 0; i < offerType.value.length; i++) {
    //   console.log(offerType.value[i]?.type);
    // }
  })
</script>