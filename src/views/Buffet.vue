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
    <div class="text-white text-center d-flex 
                flex-wrap justify-content-center my-3">
      <button class="m-2 fs-4 p-2 btn buffetTypes" 
            v-for="buffetType in offerType"
            :key="buffetType.type"
            @click="buffetClick(buffetType.type)"> 
        {{ buffetType.type }}
      </button>
    </div>
  
    <hr class="text-light">

    <!-- items list -->
    <div class="container-fluid">
      <div class="row align-items-center border-bottom py-3"
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
          
          <h5 class="offer-name mb-1 text-warning">
            {{ offer.name }}
          </h5>

          <p class="offer-desc mb-1 text-danger">
            {{ offer.description }}
          </p>
        </div>
      
        <!-- price -->
        <div class="col-12 col-md-3 col-lg-3 
                    text-center text-md-end">
          <span class="offer-price text-primary">
            {{ offer.price }} Ft
          </span>
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
    type: string
    description: string
    img: string
  }

  // offerType interface
  interface OfferType {
    type: string
  }

  // creating reactive state for the offers
  const offers = ref<Offer[]>([]),
        offerType = ref<OfferType[]>([]),
        displayedOffers = ref<Offer[]>([]);

  function buffetClick(buffetType:string) {
    console.log(buffetType);
    displayedOffers.value = [];

    for (let i = 0; i < offers.value.length; i++) {
      
      let offer = offers.value[i]
      
      if (offer && offer.type === buffetType) {
        displayedOffers.value.push(offer)
      }
    }
  }

  //when the app runs this function is called
  onMounted(async ()=>{

    //get request to the backend
    const buffetItem = await axios.get("http://localhost:3000/getBuffet")
    const buffetTypes = await axios.get("http://localhost:3000/getBuffetTypes")
    
    // assigning values
    offers.value = buffetItem.data;
    offerType.value = buffetTypes.data;

    // Setting a default value for the page to show
    buffetClick("Popcorn");

    // DEBUG
    for (let i = 0; i < offers.value.length; i++) {
      console.log(offers.value[i]?.type);
    }
  })
</script>