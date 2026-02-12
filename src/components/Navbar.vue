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
             {{ $t('navbar.programList') }}
            </RouterLink>
          </li>

          <!-- buffet -->
          <li class="nav-item mx-1 my-1">
            <RouterLink class="nav-link px-2" 
                        @click="closeMenu" 
                        to="/buffet">
              {{ $t('navbar.buffet') }}
            </RouterLink>
          </li>

          <!-- about us -->
          <li class="nav-item mx-1 my-1">
            <RouterLink class="nav-link px-2"
                        @click="closeMenu"
                        to="/about">
                {{ $t('navbar.aboutUs') }}
            </RouterLink>
          </li>
        </ul>

        <!-- right side of the navbar -->
        <ul class="navbar-nav fs-4">

          <!-- language select -->
          <li class="nav-item ms-1" @mouseleave="showLangMenu = false">
            <div class="nav-link px-2 d-flex align-items-center"
                 style="cursor: pointer;"
                 @click="showLangMenu = !showLangMenu">
              <i class="fa-solid fa-language me-1"></i>
              {{ $t('navbar.language') }}
            </div>
            
            <ul v-if="showLangMenu" class="dropdown-menu dropdown-menu-end show">
              <li>
                <button class="dropdown-item"
                        :class="{ active: $lang.lang === 'hu' }"
                        @click="setLanguage('hu')">
                        HU
                </button>
              </li>
              <li>
                <button class="dropdown-item"
                        :class="{ active: $lang.lang === 'en' }"
                        @click="setLanguage('en')">
                        EN
                </button>
              </li>
            </ul>
          </li>
        
          <!-- login -->
          <li class="nav-item ms-1" 
              v-if="!isLoggedIn">
            <RouterLink class="nav-link px-2 d-flex align-items-center"
                        @click="closeMenu"
                        to="/login">
              <i class="fa-regular fa-address-card me-1"></i>
                {{ $t('navbar.login') }}
            </RouterLink>
          </li>

          <!-- profile -->
          <li class="nav-item ms-1" 
              v-else>
            <RouterLink class="nav-link px-2 d-flex align-items-center"
                        @click="closeMenu"
                        to="/profile">
              <i class="fa-regular fa-circle-user me-1"></i>
                {{ $t('navbar.profile') }}
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
  import { defineComponent } from 'vue'
  import { useAuthStore } from '@/stores/auth'

  // exporting and creating a new vue component
  export default defineComponent ({

    // component name
    name: 'Navbar',

    // reactive state
    data() {
      return {

        // hamburger icon toggle state
        isOpen: false,

        // this is where we are going to save bootstrap's collapse element
        bsCollapse: null,

        showLangMenu: false
      }
    },

    // when the component runs, this runs as well (lifecycle hook)
    mounted() {

      // creating a new collapse element to the navbar (ref="navbar")
      this.bsCollapse = new Collapse(this.$refs.navbar, {
        toggle: false // when it runs this will be the default state
      })
    },

    setup() {
      const auth = useAuthStore()
      return { auth }
    },

    computed: {
      isLoggedIn() {
        return this.auth.isLoggedIn
      }
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
      },

      // method that sets the language
      setLanguage(lang) {
        this.$setLang(lang);  //sets the language to hu or en
        this.showLangMenu = false; //closes the dropdown
        this.closeMenu(); //closes the hamburger nav
      },
    }
  })
</script>