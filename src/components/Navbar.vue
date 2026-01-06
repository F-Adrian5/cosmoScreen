<template>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top">
    <div class="container-fluid ">

      <!-- brand -->
      <RouterLink class="navbar-brand fs-2" @click="closeMenu" to="/">
        CosmoScreen
      </RouterLink>

      <!-- hamburger icon -->
      <button class="navbar-toggler"
              type="button"
              style="border: none !important;"
              data-bs-target="#navbarNav"
              aria-controls="navbarNav"
              aria-expanded="false"
              aria-label="Toggle navigation"
              @click="toggleMenu">
          <div class="nav-icon1" :class="{ open: isOpen }">
            <span></span>
            <span></span>
            <span></span>
          </div>
      </button>

      <!-- content -->
      <div class="collapse navbar-collapse" 
           id="navbarNav"
           ref="navbar">
        
        <!-- pages -->
        <ul class="navbar-nav mx-auto fs-3">
          
          <!-- program List -->
          <li class="nav-item mx-1 my-1">
            <RouterLink class="nav-link" 
                        @click="closeMenu" 
                        to="/programList">
              Műsorlista
            </RouterLink>
          </li>

          <!-- buffet -->
          <li class="nav-item mx-1 my-1">
            <RouterLink class="nav-link" 
                        @click="closeMenu" 
                        to="/buffet">
              Büfé
            </RouterLink>
          </li>

          <!-- about us -->
          <li class="nav-item mx-1 my-1">
            <RouterLink class="nav-link" 
                        @click="closeMenu" 
                        to="/about">
                Rólunk
            </RouterLink>
          </li>
        </ul>

        <!-- right side of the navbar -->
        <ul class="navbar-nav fs-4">

          <!-- language select -->
          <li class="nav-item ms-3">
            <RouterLink class="nav-link d-flex align-items-center" to="#">
              <font-awesome-icon :icon="['fas', 'language']" class="me-1"/>
                Nyelv
            </RouterLink>
          </li>
        
          <!-- login -->
          <li class="nav-item ms-3">
            <RouterLink class="nav-link d-flex align-items-center"
                        @click="closeMenu"
                        to="/login">
              <font-awesome-icon :icon="['far', 'address-card']" 
                                 class="me-1"/>
                Login
            </RouterLink>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
import { Collapse } from 'bootstrap'

export default {
  name: 'Navbar',

  data() {
    return {
      isOpen: false,
      bsCollapse: null
    }
  },

  mounted() {
    this.bsCollapse = new Collapse(this.$refs.navbar, {
      toggle: false
    })
  },

  methods: {
    toggleMenu() {
      this.isOpen = !this.isOpen
      this.bsCollapse.toggle()
    },

    closeMenu() {
      if (this.bsCollapse && this.isOpen) {
        this.bsCollapse.hide()
        this.isOpen = false
      }
    }
  }
}
</script>

<!-- <script setup>
  // importing elements from bootstrap and vue
  // Collapse: bootstrap's collaps js component
  // onMounted: it only runs if the component appeared on the DOM
  import { Collapse } from 'bootstrap'
  import { ref, onMounted } from 'vue'

  // DOM element
  // this is where the navbar will go, inside this variable
  const navbar = ref(null)

  // defining variable
  let bsCollapse = null

  onMounted(() => {
    // connecting the js with html collapse element, can controll the toggle
    bsCollapse = new Collapse(navbar.value, { toggle: false })
  })

  // closeMenu function
  function closeMenu() {
    bsCollapse.hide()
  }
</script> -->