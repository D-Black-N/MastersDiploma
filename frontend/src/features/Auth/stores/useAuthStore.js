import { defineStore } from 'pinia';
import { useRouter } from 'vue-router';

export const useAuthStore = defineStore('auth', {
  state: () => ({
    user: null,
  }),
  getters: {
    isAuthenticated: (state) => !!state.user,
  },
  actions: {
    async login(email, password) {
      // Здесь прописать логику работы с авторизацией
      if (email === 'admin@example.com' && password === 'password') {
        this.user = { email };
        const router = useRouter();
        router.push('/dashboard');
      } else {
        throw new Error('Invalid credentials');
      }
    },
    logout() {
      this.user = null;
      const router = useRouter();
      router.push('/login');
    },
  },
});
