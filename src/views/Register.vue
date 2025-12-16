<template>
  <div class="d-flex justify-content-center align-items-center mt-5">
    <form class="p-4 shadow rounded mt-5"
          style="width: 100%; max-width: 380px;">

      <h4 class="text-center mb-4 fw-bold">
        Regisztráció
      </h4>

      <!--name-->
      <div class="mb-3">
        <label for="register_name" 
               class="form-label fw-semibold">
          Név
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
             style="min-height: 22px;">
          <span v-if="name && /\d/.test(name)">
            A név nem tartalmazhat számot
          </span>
        </div>
      </div>

      <!-- Email -->
      <div class="mb-3">
        <label for="register_email" 
               class="form-label fw-semibold">
          Email cím
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
            Érvénytelen email formátum
          </span>
        </div>
      </div>

      <!-- password -->
      <div class="mb-3 position-relative">
        <label for="register_password" 
               class="form-label fw-semibold">
          Jelszó
        </label>

        <div class="d-flex align-items-center position-relative">
          <input
            :type="showPassword ? 'text' : 'password'"
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
            Minimum 6 karakter, nagybetű, szám, speciális karakter
          </span>
        </div>
      </div>

      <!-- registration btn-->
      <button type="submit"
              class="btn btn_submit w-100 py-2 fw-semibold"
              :disabled="!name || !email || !password || 
                         !validEmail || !validPassword">
          Regisztráció
      </button>

       <!-- registration link-->
       <div class="text-center mt-2">
        <p>Ha már van fiókja 
          <RouterLink to="/login"
                      class="link_color">
            jelentkezzen be
          </RouterLink>
          !
        </p>
      </div>

    </form>
  </div>
</template>

<script>

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

      // register function
      register() {
        alert(`Regisztráció: ${this.name} (${this.email})`);
      }
    }
  };
</script>