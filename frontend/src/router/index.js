import { createRouter, createWebHistory } from 'vue-router';

// Импортируем маршруты
import authRoutes from '@/features/Auth/routes/authRoutes';
import { useAuthStore } from '@/features/Auth/stores/useAuthStore';
import NotFound from '@/shared/pages/NotFound.vue';
import AuthLayout from '@/layouts/AuthLayout.vue';
import DefaultLayout from '@/layouts/DefaultLayout.vue';

// Собираем все маршруты
const routes = [
  // Для layout авторизации
  {
    path: '/login',
    component: AuthLayout,
    children: [...authRoutes]
  },
  // Для авторизованных пользователей
  {
    path: '/',
    component: DefaultLayout,
    meta: { requiredAuth: true },
    children: []
  },
  { path: '/:pathMatch(.*)*', component: NotFound } // Обработка 404
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

// Защита маршрутов
router.beforeEach((to, from, next) => {
  const authStore = useAuthStore();
  if (to.meta.requiredAuth && !authStore.isAuthenticated) {
    next({ name: 'Login' });
  } else {
    next();
  }
});

export default router;
