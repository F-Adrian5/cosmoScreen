<template>
  <nav class="navbar navbar-expand-md bg-body-tertiary fixed-top">
    <div class="container-fluid">

      <!-- brand -->
      <RouterLink class="navbar-brand" to="/">CosmoScreen</RouterLink>

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

      <!-- menu -->
      <div class="collapse navbar-collapse" 
           id="navbarNav">
        
        <!-- middle side -->
        <ul class="navbar-nav mx-auto">
          <li class="nav-item">
            <RouterLink class="nav-link" 
                        to="/programList">
                  Műsorlista
            </RouterLink>
          </li>

          <li class="nav-item">
            <RouterLink class="nav-link" 
                        to="/buffet">
                  Büfé
            </RouterLink>
          </li>
          
          <li class="nav-item">
            <RouterLink class="nav-link" 
                        to="/about">
                  Rólunk
            </RouterLink>
          </li>
        </ul>

        <!-- right side -->
        <ul class="navbar-nav ms-auto">
          
          <li class="nav-item ms-3">
            <font-awesome-icon :icon="['fas', 'language']"/> 
            Nyelv
          </li>
          
          <li class="nav-item ms-3">
            <font-awesome-icon :icon="['far', 'address-card']"/> 
            Profil
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>