<template>
  <div class="d-flex justify-content-center align-items-center mt-5">
    <form @submit.prevent="login(user)"
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
               v-model="user.email"
               maxlength="150"
               autofocus
               required>

        <!--Email error-->
        <div class="text-danger mt-1 small" 
             style="min-height: 22px;">
          <span v-if="user.email && !validEmail(user)">
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
          <input :type="user.showPassword ? 'text' : 'password'"
                 class="form-control form-control-lg"
                 id="login_password"
                 v-model="user.password"
                 maxlength="20"
                 required
                 style="padding-right: 2.5rem;">

          <!-- show password -->
          <button type="button"
                  @click="user.showPassword = !user.showPassword"
                  class="btn position-absolute border-0 bg-transparent d-flex 
                         align-items-center justify-content-center p-0"
                  style="width: 2.5rem; height: 100%; right: 0; cursor: pointer;">
            <i :class="user.showPassword ? 'bi bi-eye-slash' : 'bi bi-eye'"
               style="font-size: 1.2rem; color: black;">
            </i>
          </button>
        </div>

        <!--password error -->
        <div class="text-danger mt-1 small" 
             style="min-height: 42px;">
          <span v-if="user.password && !validPassword(user)">
            {{ $t('loginPage.passwordError') }}
          </span>
        </div>
      </div>

      <!--login btn-->
      <button type="submit"
              class="btn btn_submit w-100 py-2 fw-semibold"
              :disabled="!user.email || 
                         !user.password ||
                         !validEmail(user) ||
                         !validPassword(user)">
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

<script lang="ts" setup>
  import { ref } from 'vue'
  import { useAuthStore } from '@/stores/auth'
  import { useRouter } from 'vue-router'
  import type { LoginUserdata } from '@/types/User'
  import { loginServices } from '@/services/loginServices'
  import { validEmail, validPassword } from '@/utils/validation'

  let user = ref<LoginUserdata>({
    email: '',
    password: '',
    showPassword: false
  })
    
  const router = useRouter();

  // Login
  async function login(user:LoginUserdata) {

    // Post request to backend
    const res = await loginServices.getUserData(
      
      user.email,
      user.password
    );
      
    // Error
    if (!res) {
      throw new Error('Hibás email vagy jelszó')
    }
      
    const auth = useAuthStore();
    auth.login(res); // Store user
      
    router.push('/');
  }     
</script>