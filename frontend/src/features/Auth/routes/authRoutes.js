import LoginView from '@/features/Auth/pages/LoginView.vue';

export default [
  {
    path: '',
    name: 'Login',
    component: LoginView,
    meta: { layout: 'auth' }
  }
]