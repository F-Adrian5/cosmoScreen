<template>
  <div class="container py-5">
    
    <!-- Title -->
    <div class="row mb-5">
      <div class="col text-center">
        <h1 class="text-light">
          {{ $t('aboutUsPage.aboutUsTitle') }}
        </h1>
        <p class="text-secondary">
          {{ $t('aboutUsPage.aboutUsSubtitle') }}
        </p>
        <hr class="text-light w-50 mx-auto">
      </div>
    </div>

    <!-- History -->
    <div class="row mb-5">
      <div class="col-lg-8 mx-auto">
        <h3 class="text-light mb-3">
          {{ $t('aboutUsPage.theStory') }}
        </h3>
        <p class="text-light">
         {{ $t('aboutUsPage.storyOne') }}
        </p>
        <p class="text-light">
          {{ $t('aboutUsPage.storyTwo') }}
        </p>
        <p class="text-light">
          {{ $t('aboutUsPage.storyThree') }}
        </p>
      </div>
    </div>

    <!-- Section -->
    <div class="row mb-5">
      <div class="col-lg-10 mx-auto">
        <h2 class="text-light mb-4 text-center">
          {{ $t('aboutUsPage.goalAndMotivation') }}
        </h2>
        <div class="row">
          
          <!-- Goals -->
          <div class="col-md-4 mb-4">
            <div class="p-4 border border-secondary rounded-3 h-100 bg">
              <h3 class="text-light text-center mb-4">
                {{ $t('aboutUsPage.goalTitle') }}
              </h3>
              <p class="text-light mb-0">
                {{ $t('aboutUsPage.goalText') }}
              </p>
            </div>
          </div>

          <!-- Motivations -->
          <div class="col-md-4 mb-4">
            <div class="p-4 border border-secondary rounded-3 h-100 bg">
              <h3 class="text-light text-center mb-">
                {{ $t('aboutUsPage.motivationTitle') }}
              </h3>
              <p class="text-light mb-0">
                {{ $t('aboutUsPage.motivationText') }}
              </p>
            </div>
          </div>

          <!-- Visions -->
          <div class="col-md-4 mb-4">
            <div class="p-4 border border-secondary rounded-3 h-100 bg">
              <h3 class="text-light text-center mb-4">
                {{ $t('aboutUsPage.visionTitle') }}
              </h3>
              <p class="text-light mb-0">
                {{ $t('aboutUsPage.visionText') }}
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Team -->
    <div class="row">
      <div class="col-lg-10 mx-auto">
        <h2 class="text-light mb-4 text-center">
          {{ $t('aboutUsPage.theTeam') }}
        </h2>

        <div class="row justify-content-center">
          <div class="col-md-5 mb-4">
            <div class="card bg-dark text-light border-secondary h-100 text-center">
              <img src="../assets/media/images/aboutUs/krivan_balazs.jpg" 
                   class="card-img-top" 
                   alt="Kriván Balázs">
              <div class="card-body">
                <h5 class="card-title">
                  Kriván Balázs
                </h5>
                <p class="card-text text-secondary">
                  {{ $t('aboutUsPage.teamMember') }}
                </p>
              </div>
            </div>
          </div>

          <div class="col-md-5 mb-4">
            <div class="card bg-dark text-light border-secondary h-100 text-center">
              <img src="../assets/media/images/aboutUs/fodor_adrian_laszlo.jpg" 
                   class="card-img-top" 
                   alt="Fodor Adrián László">
              <div class="card-body">
                <h5 class="card-title">
                  Fodor Adrián László
                </h5>
                <p class="card-text text-secondary">
                  {{ $t('aboutUsPage.projectManager') }}
                </p>
              </div>
            </div>
          </div>
        </div>

        <p class="text-light text-center mt-4">
          {{ $t('aboutUsPage.finalText') }}
        </p>
      </div>
    </div>
  </div>
</template>

<style>
  .about-bg {
    background-image: linear-gradient(to top, #7cb9b8, #68929c, #596c79, #464a52, #2c2c2c);
  };
</style>