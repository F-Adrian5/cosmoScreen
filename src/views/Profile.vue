<template>
  <div class="d-flex justify-content-center align-items-center mt-5">
    <form class="p-4 shadow rounded mt-5"
          style="width: 100%; max-width: 500px;">

      <!--title-->
      <h4 class="text-center mb-4 fw-bold">
        {{ $t('profilePage.profileTitle') }}
      </h4>

      <!--name-->
      <div class="mb-3">
        <label for="register_name" 
               class="form-label fw-semibold">
          {{ $t('profilePage.name') }}
        </label>

        <input type="text"
               class="form-control form-control-lg"
               id="register_name"
               v-model="name"
               name="name"
               maxlength="100"
               required>

        <!--name error-->
        <div class="text-danger mt-1 small" 
             style="min-height: 42px;">
          <span v-if="name && !/^[a-zA-ZáéíóöőúüűÁÉÍÓÖŐÚÜŰ -]+$/.test(name)">
           {{ $t('profilePage.nameError') }}
          </span>
        </div>
      </div>

      <!-- Email -->
      <div class="mb-3">
        <label for="register_email" 
               class="form-label fw-semibold">
          {{ $t('profilePage.email') }}
        </label>

        <input type="email"
               class="form-control form-control-lg"
               id="register_email"
               v-model="email"
               name="email"
               maxlength="150"
               required>

        <!--Email error-->
        <div class="text-danger mt-1 small" 
             style="min-height: 22px;">
          <span v-if="email && !validEmail">
           {{ $t('profilePage.emailError') }}
          </span>
        </div>
      </div>

      <!-- change data btn-->
      <button type="submit"
              class="btn btn_submit w-100 fw-semibold"
              :disabled="!name || !email ||  
                         !validEmail">
          {{ $t('profilePage.changeDataButton') }}
      </button>

      <!--logout btn-->
      <button type="button"
              class="btn btn-danger w-100 fw-semibold mt-2"
               @click="logout()">
          {{ $t('profilePage.logoutButton') }}
      </button>
    </form>
  </div>
</template>

<script lang="ts">
  import { defineComponent } from 'vue'
  import { useAuthStore } from '@/stores/auth'
  import { useRouter } from 'vue-router'

  export default defineComponent({
    data() {
      return {
        name: '',     //connects to v-model="name"
        email: '',    //connects to v-model="email"
        password: '',
        showPassword: false,
      };
    },

    // this section will do calculations
    // it wont store data
    // automatically it will update the DOM
    computed: {

      // this.email -> will show the current email
      // regex.test(x) -> this will test that specific 'x' value,
      // and it will return us a true or false value
      validEmail() {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.email);
      },

      //password validation
      validPassword() {
        return /(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*_\-?:+]).{6,}/.test(this.password);
      }
    },

    setup() {
      const auth = useAuthStore() // Store the user condition in auth varriable 
      const router = useRouter() // Use it for navigation

      // Logout function
      const logout = () => {
        auth.logout() // Log out
        router.push('/') // Redirect to home page
      }

      return { auth, logout }
    },

    // Runs when the component is loaded in
    mounted() {
      const auth = useAuthStore()

      if (auth.user) { // Check if there is a logged in user
        this.name = auth.user.name // Take the user name from store and copy it
        this.email = auth.user.email // Take the user email from store and copy it
      }
    },
  })
</script>