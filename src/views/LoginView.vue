<template>
  <div class="d-flex justify-content-center align-items-center mt-5">
    <form @submit.prevent="login" 
          style="width: 100%; 
          max-width: 350px;">

      <h4 class="text-center mb-3">Bejelentkezés</h4>

      <div class="mb-2">
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
             class="text-danger mt-1 small">
          Érvénytelen email formátum
        </div>
      </div>

      <div class="mb-2 position-relative">
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
             class="text-danger mt-1 small">
          Legalább 6 karakter, nagybetű, szám és speciális karakter
        </div>
      </div>

      <div class="mb-2 form-check">
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
              class="btn btn-primary w-100" 
              :disabled="!email || 
                         !password || 
                         !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) || 
                         !/(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*_-]).{6,}/.test(password)">
        Bejelentkezés
      </button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      email: '',
      password: '',
      showPassword: false,
    };
  },
  methods: {
    login() {
      alert(`Bejelentkezés: ${this.email}`);
    }
  }
};
</script>