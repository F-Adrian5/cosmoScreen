<template>
  <div class="d-flex justify-content-center align-items-center mt-5">
    <form class="p-4 shadow rounded mt-5"
          style="width: 100%; max-width: 500px;">

      <div class="position-relative mb-4">

          <!--title-->
          <h4 class="text-center fw-bold mb-0">
              {{ $t('profilePage.profileTitle') }}
          </h4>

          <!--Edit btn-->
          <button type="button"
                    class="btn btn_submit btn-sm px-3 fw-semibold 
                           position-absolute top-50 end-0 translate-middle-y"
                    @click="isDisabled = !isDisabled">
                <i class="fa-regular fa-pen-to-square"></i>
          </button>
      </div>

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
               :disabled="isDisabled"
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
               :disabled="isDisabled"
               required>

        <!--Email error-->
        <div class="text-danger mt-1 small" 
             style="min-height: 22px;">
          <span v-if="email && !validEmail">
           {{ $t('profilePage.emailError') }}
          </span>
        </div>
      </div>

      <!-- Password row -->
      <!-- <div class="row mt-3"> -->
        <!-- Új jelszó -->
        <!-- <div class="col-md-6 mb-3">
          <label class="form-label fw-semibold">
            {{ $t('profilePage.newPassword') }}
          </label>
        
          <div class="position-relative">
            <input
              :type="showPassword1 ? 'text' : 'password'"
              class="form-control form-control-lg"
              v-model="new_password"
              maxlength="20"
              style="padding-right: 2.5rem;"/>
          
            <button type="button"
                    @click="showPassword1 = !showPassword1"
                    class="btn position-absolute top-0 end-0 h-100 border-0 bg-transparent">
              <i :class="showPassword1 ? 'bi bi-eye-slash' : 'bi bi-eye'"></i>
            </button>
          </div>
        
          <div class="text-danger small mt-1" style="min-height: 22px;">
            <span v-if="new_password && !validPassword">
              {{ $t('profilePage.passwordError') }}
            </span>
          </div>
        </div> -->
      
        <!-- Jelszó újra -->
        <!-- <div class="col-md-6 mb-3">
          <label class="form-label fw-semibold">
            {{ $t('profilePage.newPasswordAgain') }}
          </label>
        
          <div class="position-relative">
            <input
              :type="showPassword2 ? 'text' : 'password'"
              class="form-control form-control-lg"
              v-model="new_password_again"
              maxlength="20"
              style="padding-right: 2.5rem;"/>
          
            <button type="button"
                    @click="showPassword2 = !showPassword2"
                    class="btn position-absolute top-0 end-0 h-100 border-0 bg-transparent">
              <i :class="showPassword2 ? 'bi bi-eye-slash' : 'bi bi-eye'"></i>
            </button>
          </div>
        
          <div class="text-danger small mt-1" style="min-height: 22px;">
            <span v-if="new_password_again && new_password !== new_password_again">
              {{ $t('profilePage.passwordAgainError') }}
            </span>
          </div>
        </div>
      </div> -->

      <button type="button"
              class="btn btn-primary w-100 fw-semibold">
          {{ $t('profilePage.modifyPassword') }}
      </button>

      <div class="row mt-3">
        <div class="col-md-6 mb-3">
          <!-- change data btn-->
          <button type="button"
                  class="btn btn_submit w-100 fw-semibold mt-2"
                 >
              {{$t('profilePage.changeDataButton')}}
          </button>
        </div>
         <div class="col-md-6 mb-3">
          <!--logout btn-->
          <button type="button"
                  class="btn btn-danger w-100 fw-semibold mt-2"
                  @click="logout()">
              {{ $t('profilePage.logoutButton') }}
          </button>
         </div>
      </div>
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
        isDisabled: true
        // new_password: '',
        // new_password_again: '',
        // showPassword1: false,
        // showPassword2: false,
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