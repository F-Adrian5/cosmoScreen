import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', { //create and export the auth store
  state: () => ({
    user: JSON.parse(localStorage.getItem('user') || 'null') as any | null
  }),
  getters: {
    isLoggedIn: (state) => !!state.user
  },
  actions: {
    login(user: any) {
      this.user = user
      localStorage.setItem('user', JSON.stringify(user))
    },
    logout() {
      this.user = null
      localStorage.removeItem('user')
    }
  }
})
