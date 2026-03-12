<template>
  <div class="d-flex justify-content-center align-items-center mt-5">
    <form class="p-4 shadow rounded w-100 mt-5"  
          style="max-width: 400px;">

      <!-- New Password -->
      <div class="mb-3">
        <label class="form-label fw-semibold" 
               for="newPassword">
          {{ $t('profilePage.newPassword') }}
        </label>

        <div class="position-relative">
          <input
            :type="user.showPassword1 ? 'text' : 'password'"
            class="form-control form-control-lg pe-5"
            v-model="user.new_password"
            id="newPassword"
            maxlength="20"
          />
          <button
            type="button"
            @click="user.showPassword1 = !user.showPassword1"
            class="btn position-absolute top-0 end-0 h-100 border-0 bg-transparent"
            style="padding: 0 0.75rem;"
          >
            <i :class="user.showPassword1 ? 'bi bi-eye-slash' : 'bi bi-eye'"></i>
          </button>
        </div>

        <div class="text-danger small mt-1" 
             style="min-height: 22px;">
          <span v-if="user.new_password && !validPassword(user.new_password)">
            {{ $t('profilePage.passwordError') }}
          </span>
        </div>
      </div>

      <!-- Confirm Password -->
      <div class="mb-3">
        <label class="form-label fw-semibold" 
               for="againPassword">
          {{ $t('profilePage.newPasswordAgain') }}
        </label>

        <div class="position-relative">
          <input
            :type="user.showPassword2 ? 'text' : 'password'"
            class="form-control form-control-lg pe-5"
            v-model="user.new_password_again"
            id="againPassword"
            maxlength="20"
          />
          <button
            type="button"
            @click="user.showPassword2 = !user.showPassword2"
            class="btn position-absolute top-0 end-0 h-100 border-0 bg-transparent"
            style="padding: 0 0.75rem;"
          >
            <i :class="user.showPassword2 ? 'bi bi-eye-slash' : 'bi bi-eye'"></i>
          </button>
        </div>

        <div class="text-danger small mt-1" 
             style="min-height: 22px;">
          <span v-if="user.new_password_again && user.new_password !== user.new_password_again">
            {{ $t('profilePage.passwordAgainError') }}
          </span>
        </div>
      </div>

      <div class="row mt-3">
        <div class="col-md-6 mb-3">

          <!-- Submit Button -->
          <button type="button" 
                  class="btn btn-primary w-100 fw-semibold"
                  @click="updatePassword"
                  :disabled="!validPassword(user.new_password) || user.new_password !== user.new_password_again">
            {{ $t('passwordPage.changeDataButton') }}
          </button>
        </div>
        <div class="col-md-6 mb-3">

          <!--Cancel Button-->
          <button type="button" 
                  class="btn btn-danger w-100 fw-semibold"
                  @click="goToPage(auth.user ? '/profile' : '/login')">
            {{ $t('passwordPage.cancelButton') }}
          </button>
        </div>
      </div>

      
    </form>
  </div>
</template>

<script lang="ts" setup>
    import { ref } from 'vue'
    import type { PasswordUserdata } from '@/types/User'
    import { validPassword } from '@/utils/validation'
    import { passwordServices } from '@/services/passwordServices'
    import { useRouter } from 'vue-router'
    import { useAuthStore } from '@/stores/auth'
    import { goToPage } from '@/utils/passwordCancel'

    //Initialize custom type
    let user = ref<PasswordUserdata>({
      new_password: '',
      new_password_again: '',
      showPassword1: false,
      showPassword2: false,
    })

    //Initialize router
    const router = useRouter();
    const auth = useAuthStore();

    //Update function
    async function updatePassword() {

      try {

        //Get user data
        let response = await passwordServices.getUserData(
          auth.user.id,
          user.value.new_password
        )

        //Refresh the store and the local storage
        auth.login(response)

        //Feedback
        alert("Jelszó frissítve!")

        //Redirect to profile page
        router.push('/profile');

        //Error
      } catch (err: any) {
          console.error(err)
          alert(err.response?.data?.message || "Hiba a jelszó frissítésénél")
        }
    }

  </script>