import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', { // Create and export the auth store for login and logout
  state: () => ({ // Data
    user: JSON.parse(localStorage.getItem('user') || 'null') as any | null // Load in user data from localstorage
  }),
  getters: { // Calculations
    isLoggedIn: (state) => !!state.user // Returns if the user is logged in or not
  },
  actions: { // Changes
    login(user: any) {
      this.user = user // Set user in store
      localStorage.setItem('user', JSON.stringify(user)) // Convert it to object and save it in localstorage
    },
    logout() {
      this.user = null // Remove user from state
      localStorage.removeItem('user') // Remove user from the localstorage
    }
  }
})
