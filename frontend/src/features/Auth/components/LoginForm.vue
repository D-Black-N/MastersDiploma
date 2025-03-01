<template>
  <form class="login-form" @submit.prevent="login">
    <h2>{{ $t('auth.name') }}</h2>
    <p class="error">{{ errorMessage }}</p>
    <InputField type="text" :label="$t('auth.login')" v-model="form.login" required />
    <InputField type="password" :label="$t('auth.password')" v-model="form.password" required />
    <div class="buttons">
      <SubmitInput :value="$t('auth.forgot_password')" :disabled="this.loading" type="button" />
      <SubmitInput :value="$t('auth.sign_in')" :disabled="this.loading" type="submit" />
    </div>
  </form>
</template>

<script>
import { useAuthStore } from '../stores/useAuthStore';
import SubmitInput from '@/shared/components/input/SubmitInput.vue';
import InputField from '@/shared/components/input/InputField.vue';

export default {
  components: {
    InputField,
    SubmitInput
  },

  data() {
    return {
      form: {
        login: "",
        password: ""
      },
      errorMessage: "",
      loading: false
    }
  },

  methods: {
    async login() {
      const authStore = useAuthStore();

      this.loading = true;
      this.errorMessage = '';

      try {
        await authStore.login(this.form);
      } catch (error) {
        this.errorMessage = "Invalid email or password";
        setTimeout(() => { this.errorMessage = "" }, 5000)
      } finally {
        this.form = { login: "", password: "" }
        this.loading = false;
      }
    }
  }
}
// const login = async () => {



// };
</script>

<style scoped>
.login-form {
  background: #ffffff30;
  width: 40%;
  min-width: 300px;
  border-radius: 30px;
  height: 400px;
  margin-top: 5%;
}

.login-form h2 {
  font-size: 32px;
  padding-top: 20px;
  padding-bottom: 30px;
  color: #484889;
}

.login-form p {
  height: 10px;
  color: red;
  margin-bottom: 10px;
}

.login-form .buttons {
  display: flex;
  justify-content: space-between;
  padding: 0px 22%;
  margin-top: 20px;
}
</style>
