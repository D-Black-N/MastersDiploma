<template>
  <div class="login-view">
    <div class="login-container">
      <div class="login-header">
        <svg width="48" height="48" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="logo-icon">
          <path d="M12 2C6.48 2 2 6.48 2 12C2 17.52 6.48 22 12 22C17.52 22 22 17.52 22 12C22 6.48 17.52 2 12 2ZM12 5C13.66 5 15 6.34 15 8C15 9.66 13.66 11 12 11C10.34 11 9 9.66 9 8C9 6.34 10.34 5 12 5ZM12 19.2C9.5 19.2 7.29 17.92 6 15.98C6.03 13.99 10 12.9 12 12.9C13.99 12.9 17.97 13.99 18 15.98C16.71 17.92 14.5 19.2 12 19.2Z" fill="#4361EE"/>
        </svg>
        <h1>Вход в систему</h1>
      </div>

      <form @submit.prevent="handleLogin" class="login-form">
        <div class="form-group">
          <label for="email">Электронная почта</label>
          <input
            id="email"
            v-model="email"
            type="email"
            required
            placeholder="Введите ваш email"
            class="form-input"
          >
        </div>

        <div class="form-group">
          <label for="password">Пароль</label>
          <input
            id="password"
            v-model="password"
            type="password"
            required
            placeholder="Введите ваш пароль"
            class="form-input"
          >
        </div>

        <button type="submit" class="login-button">
          Войти
        </button>
      </form>
    </div>
  </div>
</template>

<script>
import { mapActions } from 'pinia'
import { useAuthStore } from '@/store/auth'

export default {
  data() {
    return {
      email: '',
      password: '',
      isLoading: false,
      error: null
    }
  },

  methods: {
    ...mapActions(useAuthStore, ['login']),

    handleLogin() {
      this.isLoading = true
      this.error = null

      try {
        // Здесь должна быть ваша логика аутентификации
        // const userData = await yourAuthService.login(email.value, password.value)
        this.login({ id: 1 })
        
        // Перенаправляем на страницу, с которой пришли, или на главную
        const redirect = this.$router.currentRoute.value.query.redirect || 'Dashboard'
        this.$router.push(redirect)
      } catch (error) {
        // Показать сообщение об ошибке
        console.error('Login failed:', error)
      }
    }
  }
}
</script>

<style scoped>
.login-view {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f7fa;
  padding: 20px;
}

.login-container {
  width: 100%;
  max-width: 400px;
  background: white;
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
  padding: 40px;
}

.login-header {
  text-align: center;
  margin-bottom: 32px;
}

.logo-icon {
  margin-bottom: 16px;
}

.login-header h1 {
  color: #3A0CA3;
  font-size: 1.5rem;
  font-weight: 600;
}

.login-form {
  display: flex;
  flex-direction: column;
  gap: 24px;
}

.form-group {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.form-group label {
  font-size: 0.9rem;
  color: #3A0CA3;
  font-weight: 500;
}

.form-input {
  padding: 12px 16px;
  border: 1px solid #e0e0e0;
  border-radius: 6px;
  font-size: 1rem;
  transition: all 0.3s;
}

.form-input:focus {
  outline: none;
  border-color: #4361EE;
  box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
}

.login-button {
  padding: 14px;
  background: linear-gradient(90deg, #3A0CA3 0%, #4361EE 100%);
  color: white;
  border: none;
  border-radius: 6px;
  font-size: 1rem;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s;
  margin-top: 8px;
}

.login-button:hover {
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(58, 12, 163, 0.2);
}

@media (max-width: 480px) {
  .login-container {
    padding: 30px 20px;
  }
  
  .login-header h1 {
    font-size: 1.3rem;
  }
  
  .form-input, .login-button {
    padding: 12px;
  }
}
</style>
