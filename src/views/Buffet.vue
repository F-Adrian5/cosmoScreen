<template>
  <div class="container">
    <div class="row">
      <h1 class="text-center text-light mt-5">Büfés ajánlataink</h1>
      <hr>
    </div>

    <!-- buffet item -->
    <div class="d-flex mt-2"
         v-for="(offer, index) in offers"
         :key="index">
      
      <!-- image -->
      <div>
        <img :src="offer.img">
      </div>
      
      <!-- text -->
      <div>
        <p class="ms-3 text-light">{{ offer.text }}</p>
      </div>
    </div>
  </div>
</template>

<script setup>
  
  // data holder
  const offers = [
    {
      img: "https://dummyimage.com/250x200/000/fff",
      text: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum minus molestiae doloremque soluta vero optio. Cupiditate facere delectus nemo inventore quibusdam perspiciatis tempore reiciendis, repudiandae, culpa deserunt fuga veniam expedita!"
    },
    {
      img: "https://dummyimage.com/250x200/000/fff",
      text: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum minus molestiae doloremque soluta vero optio. Cupiditate facere delectus nemo inventore quibusdam perspiciatis tempore reiciendis, repudiandae, culpa deserunt fuga veniam expedita!"
    },
    {
      img: "https://dummyimage.com/250x200/000/fff",
      text: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum minus molestiae doloremque soluta vero optio. Cupiditate facere delectus nemo inventore quibusdam perspiciatis tempore reiciendis, repudiandae, culpa deserunt fuga veniam expedita!"
    }
  ]
</script>