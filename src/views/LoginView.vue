<template>
  <form class="mt-5" 
        @submit.prevent="login">

    <div class="mb-3">
      <label for="login_email" 
             class="form-label">
        Email:
      </label>
      <input type="email" 
             class="form-control" 
             id="login_email" 
             v-model="email"
             maxlength="150"
             required>
      <div v-if="email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)" 
                 class="text-danger mt-2">
        Érvénytelen email formátum
      </div>
    </div>

    <div class="mb-3">
      <label for="login_password" 
             class="form-label">
        Jelszó:
      </label>
      <input :type="showPassword ? 'text' : 'password'" 
             class="form-control" 
             id="login_password" 
             v-model="password"
             maxlength="20"
             required>
      <div v-if="password && !/(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*_-]).{6,}/.test(password)" 
           class="text-danger mt-2">
        A jelszónak legalább 6 karakterből kell állnia, tartalmaznia kell nagybetűt, számot és speciális karaktert
      </div>
    </div>

    <div class="mb-3 form-check">
      <input type="checkbox" 
             class="form-check-input" 
             id="login_showpass" 
             v-model="showPassword">
      <label class="form-check-label" 
             for="login_showpass">
        Jelszó megjelenítése
      </label>
    </div>

    <button type="submit" 
            class="btn btn-primary" 
           :disabled="!email || 
                      !password || 
                      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) || 
                      ! /(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*_-]).{6,}/.test(password)">
      Bejelentkezés
    </button>
  </form>
</template>
<script>
  export default {
    data() {
      return {
        email: '',
        password: '',
        showPassword: false,
      };
    }
  }
</script>