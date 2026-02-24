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
      <div>
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

      <!--Modify password btn-->
      <button type="button"
              class="btn btn-primary w-100 fw-semibold">
        <RouterLink class="text-light px-2 link-underline 
                           link-underline-opacity-0"
                    to="/password">
          {{ $t('profilePage.modifyPassword') }}
        </RouterLink>
      </button>

      <div class="row mt-3">
        <div class="col-md-6 mb-3">
          <!-- change data btn-->
          <button type="button"
                  class="btn btn_submit w-100 fw-semibold mt-2"
                  @click="updateProfile()"
                  :disabled="!canSubmit">
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
  import { defineComponent, reactive, computed } from 'vue'
  import { useAuthStore } from '@/stores/auth'
  import { useRouter } from 'vue-router'
  import axios from 'axios'

  export default defineComponent({
    data() {
      return {
        name: '',     //connects to v-model="name"
        email: '',    //connects to v-model="email"
        isDisabled: true,
        originalName: '',
        originalEmail: ''
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

      isChanged() {
        return (
          this.name !== this.originalName ||
          this.email !== this.originalEmail
        );
      },

      canSubmit() {
        return (
         this.isChanged &&
         this.name.trim() !== '' &&
         this.validEmail
        );
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

        this.originalName = this.auth.user.name
        this.originalEmail = this.auth.user.email
      }
    },

    methods: {

      //Update function
      async updateProfile() {


        if (!this.canSubmit) return;

        const auth = useAuthStore()

        try {

          // Send data to backend
          const response = await axios.put("http://localhost:3000/profile", {
            id: auth.user.id,
            name: this.name,
            email: this.email
          })

          // Refresh the store and the local storage
          auth.login(response.data)

          //Feedback
          alert("Profil frissítve!")

          // Disable the inputs
          this.isDisabled = true

        } catch (err: any) {
            console.error(err)
            alert(err.response?.data?.message || "Hiba a profil frissítésénél")
          }
      }
    }
  })
</script>