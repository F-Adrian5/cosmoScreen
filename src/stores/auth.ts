import { defineStore } from 'pinia';

// Create and export the authentication for login and logout
export const useAuthStore = defineStore('auth', {
  
  //Data
  state: () => ({

    // Load user data from localstorage
    user: JSON.parse(localStorage.getItem('user') || 'null') as any | null
  }),

  // Calculation
  getters: {

    // Returns if the user is logged in or not
    isLoggedIn: (state) => !!state.user
  },

  // Changes
  actions: {
    login(user: any) {

      // Set user in store
      this.user = user;

      // Convert it to object and save it in localstorage
      localStorage.setItem('user', JSON.stringify(user));
    },

    logout() {

      // Remove user from state
      this.user = null;

      // Remove user from the localstorage
      localStorage.removeItem('user');
    }
  }
});