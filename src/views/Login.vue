<template>
  <div class="d-flex justify-content-center align-items-center mt-5">
    <form @submit.prevent="login"
          class="p-4 shadow rounded mt-5"
          style="width: 100%; max-width: 380px;">

      <h4 class="text-center mb-4 fw-bold">{{ $t('loginPage.loginTitle') }}</h4>

      <!--Email-->
      <div class="mb-3">
        <label for="login_email" 
               class="form-label fw-semibold">
          {{ $t('loginPage.email') }}
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
            {{ $t('loginPage.emailError') }}
          </span>
        </div>
      </div>

      <!-- password -->
      <div class="mb-3">
        <label for="login_password" 
               class="form-label fw-semibold">
          {{ $t('loginPage.password') }}
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
            {{ $t('loginPage.passwordError') }}
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
          {{ $t('loginPage.loginButton') }}
      </button>
      
      <!--register link-->
      <div class="text-center mt-3">
        <span>{{ $t('loginPage.noAccountReg') }}
          <RouterLink to="/register"
                      class="register-link">
              {{ $t('loginPage.registerLink') }}
          </RouterLink>
          !
        </span>
      </div>
    </form>
  </div>
</template>

<script>
  import { defineComponent } from 'vue'
  import { useAuthStore } from '@/stores/auth'

  // exporting the component
  export default defineComponent ({
    
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
        const res = await fetch('http://localhost:3000/login', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            email: this.email,
            password: this.password
          })
        })
      
        if (!res.ok) {
          throw new Error('Hibás email vagy jelszó')
        }
      
        const user = await res.json()
    
        const auth = useAuthStore();
        auth.login(user);
      
        this.$router.push('/')
      }     
    }
  });
</script>