<template>
  <div class="container">
    <div class="row align-text-center">
      <div class="carousel w-100"
           :style="{'--items': movies.length}">
        
        <!-- card -->
        <div class="card carousel-card mt-3 rounded-2"
             v-for="(movie, index) in movies" 
             :key="movie.id"
             :style="{
                '--i': index,
                '--carousel-duration': movies.length * 5 + 's'
              }"
             data-bs-toggle="modal"
             data-bs-target="#movieModal"
             @click="selectMovie(movie)">
          
          <!-- image -->
          <img :src="`./src/assets/media/images/movie_posters/${movie.poster}`"
               class="card-img h-100"
               :alt="movie.title" />
        </div>
      </div>

      <!-- Modal -->
      <div class="modal fade"
           id="movieModal"
           tabindex="-1"
           aria-labelledby="movieModalLabel">

        <div class="modal-dialog modal-dialog-centered modal-lg 
                    modal-fullscreen-sm-down modal-dialog-scrollable">
          <div class="modal-content bg-dark text-light rounded-4 shadow-lg">
          
            <!-- Header -->
            <div class="modal-header border-0">
              <h1 class="modal-title fs-2 fw-bold mx-auto w-100 text-center" 
                  id="movieModalLabel">
                {{ selectedMovie?.title }}
              </h1>
            </div>
            
            <hr class="border-secondary">
            
            <!-- Body -->
            <div class="modal-body">
              <div class="row g-3">
              
                <!-- Image -->
                <div class="col-12 col-md-5 text-center">
                  <img :src="`./src/assets/media/images/movie_posters/${selectedMovie?.poster}`"
                       class="img-fluid rounded-3 shadow"
                       alt="Movie image">
                </div>
              
                <!-- Movie details -->
                <div class="col-12 col-md-7">
                  <p class="fs-4">
                    <i class="fa-solid fa-masks-theater mx-2"></i>
                    <strong>
                      {{$t('homePage.movieGenre') }}
                    </strong>
                    {{ selectedMovie?.genre }}
                  </p>

                  <p class="fs-4">
                    <i class="fa-regular fa-clock mx-2"></i>
                    <strong>
                      {{$t('homePage.runtime') }}
                    </strong> 
                    {{ selectedMovie?.runtime }}p
                  </p>

                  <p class="fs-4">
                    <i class="fa-regular fa-building mx-2"></i>
                    <strong>
                      {{$t('homePage.production') }}
                    </strong> 
                    {{ selectedMovie?.production }}
                  </p>

                  <p class="fs-4">
                    <i class="fa-solid fa-tv mx-2"></i>
                    <strong>
                      {{$t('homePage.ageRestriction') }}
                    </strong> 
                    {{ selectedMovie?.age_restriction }}+
                  </p>

                  <p class="fs-4">
                    <i class="fa-regular fa-calendar mx-2"></i>
                    <strong>
                      {{$t('homePage.releaseDate') }}
                    </strong> 
                    {{ selectedMovie?.release_date }}
                  </p>
                  <p class="fs-4">
                    <i class="fa-solid fa-video mx-2"></i>
                    <strong>
                      {{$t('homePage.director') }}
                    </strong> 
                    {{ selectedMovie?.director }}
                  </p>
                  <p class="fs-4">
                    <i class="fa-solid fa-user-group mx-2"></i>
                    <strong>Fő szerepben:</strong>
                    <span v-if="actorsByMovie[selectedMovie?.id || 0]">
                      <span v-for="actor in actorsByMovie[selectedMovie?.id || 0]"
                            :key="actor.actor_id">
                        <a class="link-underline link-underline-opacity-0"
                           style="color: lightseagreen;" 
                           :href="actor.info_link" 
                           target="_blank">
                          &nbsp; {{ actor.name }}
                        </a>
                        <span>{{ actorsByMovie[selectedMovie?.id || 0]!?.length > 1 ? "," : "" }}</span>
                      </span>
                    </span>
                  </p>
                </div>
                
                <hr class="border-secondary">
                
                <div class="col-12 col-md-12">
                  <p class="text-secondary fs-3">
                    {{ selectedMovie?.description }}
                  </p>
                </div>
              </div>
            </div>
          
            <!-- Footer -->
            <div class="modal-footer border-0">
              <button type="button"
                      class="btn btn-outline-light px-4 fs-4"
                      data-bs-dismiss="modal">
                  <i class="fa-solid fa-xmark mx-1"></i>
                  {{$t('homePage.closeBtn') }}
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">

  // importing from vue and carousel.css
  // defineComponent: this is how we define components
  // ref: every time if something changes ref reacts
  import { ref, onMounted } from "vue";
  import type { CarouselMovie, actorsInMovie } from "@/types/Movie";
  import { carouselMovieServices } from "@/services/cardCarouselServices";
  import "../assets/styles/carousel.css";

  // movies will be a reactive variable
  // it is basically a variable, 
  // that if you change it will automatically change in the HTML
  // so if we modify the data, the UI will automatically update
  const movies = ref<CarouselMovie[]>([]);
  const actorsInMovieCard = ref<actorsInMovie[]>([]);
  const selectedMovie = ref<CarouselMovie | null>(null);
  const actorsByMovie = ref<Record<number, actorsInMovie[]>>({});


  function selectMovie(movie: CarouselMovie) {
    selectedMovie.value = movie;
  }

  // when the site runs than we get the movies
  onMounted(async ()=> {

    // get the data from the services and assigning the values 
    // to the movies, and logging the number of films
    const response = await carouselMovieServices.getMovies();
    movies.value = response;
    console.log("Number of films: " + movies.value.length);

    const actors = await carouselMovieServices.getActors();
    actorsInMovieCard.value = actors;
    console.log(actors);

    const grouped: Record<number, actorsInMovie[]> = {};

    actors.forEach((actor: actorsInMovie) => {
      if (!grouped[actor.movie_id]) {
        grouped[actor.movie_id] = [];
      }
      grouped[actor.movie_id]!.push(actor);
    });
  
    actorsByMovie.value = grouped;
  
    console.log(actorsByMovie.value);

  })  
</script>