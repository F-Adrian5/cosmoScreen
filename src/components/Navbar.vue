<template>
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid ">

      <!-- brand -->
      <RouterLink class="navbar-brand fs-2" @click="closeMenu" to="/">
        CosmoScreen
      </RouterLink>

      <!-- hamburger icon -->
      <button class="navbar-toggler"
              type="button"
              style="border: none;"
              data-bs-target="#navbarNav"
              aria-controls="navbarNav"
              aria-expanded="false"
              aria-label="Toggle navigation"
              @click="toggleMenu">
          <div class="nav-icon1" :class="{ open: isOpen }">
            <span v-for="n in 3" :key="n"></span>
          </div>
      </button>

      <!-- content -->
      <div class="collapse navbar-collapse" 
           id= "navbarNav"
           ref="navbar">
        
        <!-- pages -->
        <ul class="navbar-nav mx-auto fs-3">
          
          <!-- program List -->
          <li class="nav-item mx-1 my-1">
            <RouterLink class="nav-link px-2" 
                        @click="closeMenu" 
                        to="/programList">
              Műsorlista
            </RouterLink>
          </li>

          <!-- buffet -->
          <li class="nav-item mx-1 my-1">
            <RouterLink class="nav-link px-2" 
                        @click="closeMenu" 
                        to="/buffet">
              Büfé
            </RouterLink>
          </li>

          <!-- about us -->
          <li class="nav-item mx-1 my-1">
            <RouterLink class="nav-link px-2"
                        @click="closeMenu"
                        to="/about">
                Rólunk
            </RouterLink>
          </li>
        </ul>

        <!-- right side of the navbar -->
        <ul class="navbar-nav fs-4">

          <!-- language select -->
          <li class="nav-item ms-1">
            <RouterLink class="nav-link d-flex align-items-center px-2" to="#">
              <font-awesome-icon :icon="['fas', 'language']" class="me-1"/>
                Nyelv
            </RouterLink>
          </li>
        
          <!-- login -->
          <li class="nav-item ms-1">
            <RouterLink class="nav-link px-2 d-flex align-items-center"
                        @click="closeMenu"
                        to="/login">
              <font-awesome-icon :icon="['far', 'address-card']" 
                                 class="me-1"/>
                Bejelentkezés
            </RouterLink>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
  // inporting collapse from bootstrap
  import { Collapse } from 'bootstrap'

  // exporting and creating a new vue component
  export default {

    // component name
    name: 'Navbar',

    // reactive state
    data() {
      return {

        // hamburger icon toggle state
        isOpen: false,

        // this is where we are going to save bootstrap's collapse element
        bsCollapse: null
      }
    },

    // when the component runs, this runs as well (lifecycle hook)
    mounted() {

      // creating a new collapse element to the navbar (ref="navbar")
      this.bsCollapse = new Collapse(this.$refs.navbar, {
        toggle: false // when it runs this will be the default state
      })
    },

    methods: {

      // toggle menu method
      toggleMenu() {
        this.isOpen = !this.isOpen // true - false (open - close)
        this.bsCollapse.toggle() // open - closes the menu
      },

      // close menu method
      closeMenu() {

        // checks if the menu is open or not and the element is defined
        if (this.bsCollapse && this.isOpen) {
          this.bsCollapse.hide() //closes the menu
          this.isOpen = false // update the state to be closed
        }
      }
    }
  }
</script>