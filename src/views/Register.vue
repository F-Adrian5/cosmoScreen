<script lang="ts" setup>
  import { ref } from 'vue';
  import { useRouter } from 'vue-router';
  import type { RegisterUserdata } from '@/types/User';
  import { registerServices } from '@/services/registerServices';
  import { validEmail, validPassword } from '@/utils/validation';
  import { useModalStore } from '@/stores/modal';
  import { ModalPreset } from '@/types/Modal';
  import language from '@/languages/language';

  //Initialize custom type
  let user = ref<RegisterUserdata>({
    name: '',
    email: '',
    password: '',
    showPassword: false
  });

  //Initialize router
  const router = useRouter();

  const modal = useModalStore()

  //Register function
  async function register(user:RegisterUserdata) {
    try {

      //Receive data from the server
      const data = await registerServices.getUserData(
        user.name,
        user.email,
        user.password
      );

      await modal.openPreset(
        ModalPreset.SUCCESS,
        language.t('registerPage.succesfulRegistrationMessage')
      ) 

      console.log("Sikeres regisztráció:", data);

      //Store user data
      localStorage.setItem("user", JSON.stringify(data));

      //Redirect to the home page after registration
      router.push('/');

    } catch (err: any) {

      //Server response error
      if (err.response) {
        alert(err.response.data.message);
      } else {
        alert("Szerver nem elérhető");
      }
      console.error("Register hiba részlete:", err);
    };
  };
  
</script>

<template>
  <div class="d-flex justify-content-center align-items-center mt-5">
    <form class="p-4 shadow rounded mt-5"
          style="width: 100%; max-width: 380px;"
          @submit.prevent="register(user)">

      <h4 class="text-center mb-4 fw-bold mx-1">
        <i class="fa-regular fa-id-card"></i>
        {{ $t('registerPage.registerTitle') }}
      </h4>

      <!--name-->
      <div class="mb-3">
        <i class="fa-solid fa-signature mx-2"></i>
        <label for="register_name" 
               class="form-label fw-semibold">
          {{$t('registerPage.name') }}
        </label>

        <input type="text"
               class="form-control form-control-lg"
               id="register_name"
               v-model="user.name"
               name="name"
               maxlength="100"
               autofocus
               required>

        <!--name error-->
        <div class="text-danger mt-1 small" 
             style="min-height: 42px;">
          <span v-if="user.name && !/^[a-zA-ZáéíóöőúüűÁÉÍÓÖŐÚÜŰ -]+$/.test(user.name)">
           {{ $t('registerPage.nameError') }}
          </span>
        </div>
      </div>

      <!-- Email -->
      <div class="mb-3">
        <i class="fa-solid fa-envelope mx-2"></i>
        <label for="register_email" 
               class="form-label fw-semibold">
          {{ $t('registerPage.email') }}
        </label>

        <input type="email"
               class="form-control form-control-lg"
               id="register_email"
               v-model="user.email"
               name="email"
               maxlength="150"
               required>

        <!--Email error-->
        <div class="text-danger mt-1 small" 
             style="min-height: 22px;">
          <span v-if="user.email && !validEmail(user.email)">
           {{ $t('registerPage.emailError') }}
          </span>
        </div>
      </div>

      <!-- password -->
      <div class="mb-3 position-relative">
        <i class="fa-solid fa-key mx-2"></i>
        <label for="register_password" 
               class="form-label fw-semibold">
          {{ $t('registerPage.password') }}
        </label>

        <div class="d-flex align-items-center position-relative">
          <input :type="user.showPassword ? 'text' : 'password'"
                 class="form-control form-control-lg"
                 id="register_password"
                 v-model="user.password"
                 name="password"
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

        <!-- password error -->
        <div class="text-danger mt-1 small" 
             style="min-height: 42px;">
          <span v-if="user.password && !validPassword(user.password)">
            {{ $t('registerPage.passwordError') }}
          </span>
        </div>
      </div>

      <!-- registration btn-->
      <button type="submit"
              class="btn btn_submit w-100 fw-semibold"
              :disabled="!user.name || !user.email || !user.password || 
                         !validEmail(user.email) || !validPassword(user.password)">
          <i class="fa-regular fa-id-card mx-1"></i>
          {{ $t('registerPage.registerButton') }}
      </button>

       <!-- registration link-->
       <div class="text-center mt-3">
        <span>{{ $t('registerPage.existingAccount') }} 
          <RouterLink to="/login"
                      class="login-link">
            {{ $t('registerPage.loginLink') }}
          </RouterLink>
          !
        </span>
      </div>
    </form>
  </div>
</template>

<style>
  .register-bg {
    background-image: radial-gradient(circle, #63a3a4, #57828e, #4e626f, #41454d, #2c2c2c);
  };
</style>