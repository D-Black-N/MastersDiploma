<template>
  <form @submit.prevent="login">
    <div class="input-group">
      <label for="email">Email:</label>
      <input type="email" id="email" v-model="email" required />
    </div>
    <div class="input-group">
      <label for="password">Password:</label>
      <input type="password" id="password" v-model="password" required />
    </div>
    <button type="submit" :disabled="loading">Login</button>
    <p v-if="errorMessage" class="error">{{ errorMessage }}</p>
  </form>
</template>

<script setup>
import { ref } from 'vue';
import { useAuthStore } from '../stores/useAuthStore';

const email = ref('');
const password = ref('');
const authStore = useAuthStore();
const loading = ref(false);
const errorMessage = ref('');

const login = async () => {
  loading.value = true;
  errorMessage.value = '';
  try {
    await authStore.login(email.value, password.value);
  } catch (error) {
    errorMessage.value = 'Invalid email or password';
  } finally {
    loading.value = false;
  }
};
</script>

<style scoped>
.input-group {
  margin-bottom: 10px;
}
.error {
  color: red;
}
</style>
