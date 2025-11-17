<template>
  <nav class="navbar navbar-expand-sm bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" 
         href="#">
        CosmoScreen
      </a>
      
      <!-- hamburger -->
      <button class="navbar-toggler" 
              type="button" 
              data-bs-toggle="collapse" 
              data-bs-target="#navbarNav" 
              aria-controls="navbarNav" 
              aria-expanded="false" 
              aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="collapse navbar-collapse" 
           id="navbarNav">

        <!-- pages -->
        <ul class="navbar-nav">
          
          <li class="nav-item">
            <a class="nav-link active" 
               aria-current="page"
               href="#">Műsorlista</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="#">Büfé</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="#">Rólunk</a>
          </li>
        </ul>
      </div>

      <div class="collapse navbar-collapse">
        <ul class="navbar-nav">

          <span></span>
          <li class="nav-item ms-3">Nyelv</li>
          
          <span></span>
          <li class="nav-item ms-3">Profil</li>
        </ul>
      </div>
    </div>
  </nav>
</template>