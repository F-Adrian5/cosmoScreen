<template>
  <nav class="navbar navbar-expand-md bg-body-tertiary fixed-top">
    <div class="container-fluid">

      <RouterLink class="navbar-brand fs-2" to="/">CosmoScreen</RouterLink>

      <button class="navbar-toggler"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#navbarNav"
              aria-controls="navbarNav"
              aria-expanded="false"
              aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- itt kellett a ref="navbar" -->
      <div class="collapse navbar-collapse" 
           id="navbarNav"
           ref="navbar">
        
        <ul class="navbar-nav mx-auto fs-4">
          <li class="nav-item">
            <RouterLink class="nav-link" 
                        @click="closeMenu" 
                        to="/programList">
              Műsorlista
            </RouterLink>
          </li>

          <li class="nav-item">
            <RouterLink class="nav-link" 
                        @click="closeMenu" 
                        to="/buffet">
              Büfé
            </RouterLink>
          </li>

          <li class="nav-item">
            <RouterLink class="nav-link" 
                        @click="closeMenu" 
                        to="/about">
              Rólunk
            </RouterLink>
          </li>
        </ul>

        <ul class="navbar-nav fs-5">
          <li class="nav-item ms-3">
            <font-awesome-icon :icon="['fas', 'language']"/> Nyelv
          </li>
          <li class="nav-item ms-3">
            <font-awesome-icon :icon="['far', 'address-card']"/> Profil
          </li>
        </ul>

      </div>
    </div>
  </nav>
</template>

<script setup>
  import { Collapse } from 'bootstrap'
  import { ref, onMounted } from 'vue'

  const navbar = ref(null) // DOM element
  let bsCollapse = null

  onMounted(() => {
    // connecting the js with html collapse element, can controll the toggle
    bsCollapse = new Collapse(navbar.value, { toggle: false })
  })

  function closeMenu() {
    bsCollapse.hide()
  }
</script>