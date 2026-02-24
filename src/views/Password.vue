<template>
  <div class="d-flex justify-content-center align-items-center mt-5">
    <form class="p-4 shadow rounded mt-5"
          style="width: 100%; max-width: 500px;">

      <!-- Password row -->
      <div class="row mt-3">

        <!-- Új jelszó -->
        <div class="col-md-6 mb-3">
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
        </div>
      
        <!-- Jelszó újra -->
        <div class="col-md-6 mb-3">
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
          new_password: "",
          new_password_again: "",
          showPassword1: false,
          showPassword2: false,
        };
      },

      computed: {

        //password validation
        validPassword() {
          return /(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*_\-?:+]).{6,}/.test(this.new_password);
        }
      }
    })

  </script>