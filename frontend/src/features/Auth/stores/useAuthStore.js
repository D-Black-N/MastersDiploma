import { defineStore } from 'pinia';
import { useRouter } from 'vue-router';

export const useAuthStore = defineStore('auth', {
  state: () => ({
    user: { email: 'test@test.ru' },
  }),

  getters: {
    isAuthenticated: (state) => !!state.user,
  },

  actions: {
    async login(form) {
      // Здесь прописать логику работы с авторизацией
      if (form.email === 'admin@example.com' && form.password === 'password') {
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
