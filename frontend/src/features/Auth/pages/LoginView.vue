<template>
  <div class="login-container">
    <h2>{{ $t('system-name') }}</h2>
    <LoginForm />
  </div>
</template>

<script setup>
import LoginForm from '../components/LoginForm.vue';
</script>

<style scoped>
.login-container {
  width: 100%;
  height: 100%;
  text-align: center;
  color: white;
  justify-items: center;
  overflow-y: hidden;
}

.login-container h2 {
  font-size: 42px;
  padding-top: 20px;
  padding-bottom: 50px;
}
</style>