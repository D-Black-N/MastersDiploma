import { createRouter, createWebHistory } from 'vue-router';

// Импортируем маршруты
import authRoutes from '@/features/Auth/routes/authRoutes';

// Собираем все маршруты
const routes = [
  ...authRoutes,
  {
    path: '/:pathMatch(.*)*', // Обработка 404
    component: () => import('@/shared/components/NotFound.vue'),
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
