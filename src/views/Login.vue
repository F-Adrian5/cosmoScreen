<template>
  <div class="d-flex justify-content-center align-items-center mt-5">
    <form @submit.prevent="login"
          class="p-4 shadow rounded mt-5"
          style="width: 100%; max-width: 380px;">

      <h4 class="text-center mb-4 fw-bold">Bejelentkezés</h4>

      <!--Email-->
      <div class="mb-3">
        <label for="login_email" 
               class="form-label fw-semibold">
          Email cím
        </label>

        <input type="email"
               class="form-control form-control-lg"
               id="login_email"
               v-model="email"
               maxlength="150"
               required>

        <!--Email error-->
        <div class="text-danger mt-1 small" 
             style="min-height: 22px;">
          <span v-if="email && !validEmail">
            Érvénytelen email formátum
          </span>
        </div>
      </div>

      <!-- password -->
      <div class="mb-3">
        <label for="login_password" 
               class="form-label fw-semibold">
          Jelszó
        </label>

        <div class="d-flex align-items-center position-relative">
          <input :type="showPassword ? 'text' : 'password'"
                 class="form-control form-control-lg"
                 id="login_password"
                 v-model="password"
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

        <!--password error -->
        <div class="text-danger mt-1 small" 
             style="min-height: 42px;">
          <span v-if="password && !validPassword">
            Minimum 6 karakter, nagybetű, szám, speciális karakter
          </span>
        </div>
      </div>

      <!--login btn-->
      <button type="submit"
              class="btn btn_submit w-100 py-2 fw-semibold"
              :disabled="!email || 
                         !password ||
                         !validEmail ||
                         !validPassword">
          Bejelentkezés
      </button>
      
      <!--register link-->
      <div class="text-center mt-3">
        <span>Ha még nincs fiókja 
          <RouterLink to="/register"
                      class="register-link">
              regisztráljon
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
        email: "",            //connects to v-model="email"
        password: "",         //connects to v-model="password"
        showPassword: false,  //connects to v-model="showPassword"
      };
    },

    // this section will do calculations
    // it wont store data
    // automatically it will update the DOM
    computed: {

      //Email validation
      validEmail() {

        // this.email -> will show the current email
        // regex.test(x) -> this will test that specific 'x' value,
        // and it will return us a true or false value
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.email);
      },

      //password validation
      validPassword() {
        return /(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*_\-?:+]).{6,}/.test(this.password);
      }
    },

    // methods are like events, like click or submit...
    methods: {
      async login() {
        try {

          // Send post request to the server
          const response = await axios.post("http://localhost:3000/login", {

            // Email and password entered by the user
            email: this.email,
            password: this.password
          });

          // Recieve data from the server
          const data = response.data;
          console.log("Bejelentkezve:", data);

          // Store user data
          localStorage.setItem("user", JSON.stringify(data));

          // Redirect to the home page after login
          this.$router.push("/");

        } catch (err) {

          // Server response error
          if (err.response) {
            alert(err.response.data.message);
          } else {
            alert("Szerver nem elérhető");
          }
          console.error("Login hiba részlete:", err);
        }
      }
    }
  };
</script>