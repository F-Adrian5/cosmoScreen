<template>
  <div class="d-flex justify-content-center align-items-center mt-5">
    <form class="p-4 shadow rounded mt-5"
          style="width: 100%; max-width: 380px;"
          @submit.prevent="register">

      <h4 class="text-center mb-4 fw-bold">
        {{ $t('texts.register') }}
      </h4>

      <!--name-->
      <div class="mb-3">
        <label for="register_name" 
               class="form-label fw-semibold">
          {{ $t('labels.name') }}
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
           {{ $t('errorMessages.nameError') }}
          </span>
        </div>
      </div>

      <!-- Email -->
      <div class="mb-3">
        <label for="register_email" 
               class="form-label fw-semibold">
          {{ $t('labels.email') }}
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
           {{ $t('errorMessages.emailError') }}
          </span>
        </div>
      </div>

      <!-- password -->
      <div class="mb-3 position-relative">
        <label for="register_password" 
               class="form-label fw-semibold">
          {{ $t('labels.password') }}
        </label>

        <div class="d-flex align-items-center position-relative">
          <input :type="showPassword ? 'text' : 'password'"
                 class="form-control form-control-lg"
                 id="register_password"
                 v-model="password"
                 name="password"
                 maxlength="20"
                 required
                 style="padding-right: 2.5rem;">

          <!-- show password -->
          <button type="button"
                  @click="showPassword = !showPassword"
                  class="btn position-absolute border-0 bg-transparent d-flex 
                         align-items-center justify-content-center p-0"
                  style="width: 2.5rem; height: 100%; right: 0; cursor: pointer;">
            <i :class="showPassword ? 'bi bi-eye-slash' : 'bi bi-eye'"
               style="font-size: 1.2rem; color: black;">
            </i>
          </button>
        </div>

        <!-- password error -->
        <div class="text-danger mt-1 small" 
             style="min-height: 42px;">
          <span v-if="password && !validPassword">
            {{ $t('errorMessages.passwordError') }}
          </span>
        </div>
      </div>

      <!-- registration btn-->
      <button type="submit"
              class="btn btn_submit w-100 fw-semibold"
              :disabled="!name || !email || !password || 
                         !validEmail || !validPassword">
          {{ $t('buttons.register') }}
      </button>

       <!-- registration link-->
       <div class="text-center mt-3">
        <span>{{ $t('texts.existingAccount') }} 
          <RouterLink to="/login"
                      class="login-link">
            {{ $t('texts.loginLink') }}
          </RouterLink>
          !
        </span>
      </div>
    </form>
  </div>
</template>

<script>
  import axios from "axios";

  // exporting the component
  export default {

    // this function returns the current state, this is a tempelate
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

    // methods are like events, like click or submit...
   methods: {
      async register() {
        try {
          // Send post request to the server
          const response = await axios.post("http://localhost:3000/register", {

            // Name, email and password entered by the user
            name: this.name,
            email: this.email,
            password: this.password
          });

          // Receive data from the server
          const data = response.data;
          console.log("Sikeres regisztráció:", data);

          // Store user data
          localStorage.setItem("user", JSON.stringify(data));

          // Redirect to the home page after registration
          this.$router.push("/");

        } catch (err) {

          // Server response error
          if (err.response) {
            alert(err.response.data.message);
          } else {
            alert("Szerver nem elérhető");
          }
          console.error("Register hiba részlete:", err);
        }
      }
    }
  };
</script>