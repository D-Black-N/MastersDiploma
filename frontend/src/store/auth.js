import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {
  state: () => ({
    isAuthenticated: false,
    user: null
  }),

  actions: {
    login(userData) {
      this.isAuthenticated = true
      this.user = userData
    },

    logout() {
      this.isAuthenticated = false
      this.user = null
    },

    async initialize() {
      try {
        const token = localStorage.getItem('token')
        if (token) {
          // const userData = await yourAuthService.fetchUser()
          this.login({ id: 1 })
        }
      } catch (error) {
        this.logout()
      }
    }
  }
})
