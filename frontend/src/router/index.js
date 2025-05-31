import { createRouter, createWebHistory } from 'vue-router'
import { useAuthStore } from '@/store/auth'
import RequestsView from '@/views/RequestsView.vue'
import RequestDetailsView from '@/views/RequestDetailsView.vue'
import RequestCreateView from '@/views/RequestCreateView.vue'
import ClientsView from '@/views/ClientsView.vue'
import ClientDetailsView from '@/views/ClientDetailsView.vue'
import ClientCreateView from '@/views/ClientCreateView.vue'
import ClientEditView from '@/views/ClientEditView.vue'
import ClientDocumentsView from '@/views/ClientDocumentsView.vue'
import AdminLayout from '@/components/layout/AdminLayout.vue'
import AuthLayout from '@/components/layout/AuthLayout.vue'
import AppLayout from '@/components/layout/AppLayout.vue'
import RequestsReportView from '@/views/RequestsReportView.vue'
import LoginView from '@/views/LoginView.vue'

const routes = [
  {
    path: '/auth',
    meta: { layout: AuthLayout, guestOnly: true },
    children: [
      {
        path: '',
        name: 'Login',
        component: LoginView
      }
    ]
  },
  {
    path: '/',
    meta: { layout: AppLayout, requiresAuth: true },
    children: [
      {
        path: '/requests',
        name: 'Requests',
        component: RequestsView
      },
      {
        path: '/requests/:id',
        name: 'RequestDetails',
        component: RequestDetailsView,
        props: true
      },
      {
        path: '/requests/create',
        name: 'RequestCreate',
        component: RequestCreateView
      },
      {
        path: '/clients',
        name: 'Clients',
        component: ClientsView
      },
      {
        path: '/clients/:id',
        name: 'ClientDetails',
        component: ClientDetailsView,
        props: true
      },
      {
        path: '/clients/create',
        name: 'ClientCreate',
        component: ClientCreateView,
        props: route => ({ returnTo: route.query.returnTo })
      },
      {
        path: '/clients/:id/edit',
        name: 'ClientEdit',
        component: ClientEditView,
        props: true
      },
      {
        path: '/clients/:id/documents',
        name: 'ClientDocuments',
        component: ClientDocumentsView,
        props: true
      },
      {
        path: '', // Нет редиректа - будет показано пустое состояние
      },
      {
        path: '/admin',
        component: AdminLayout,
        children: [
          // {
          //   path: 'clients-report',
          //   name: 'ClientsReport',
          //   component: ClientsReportView // Нужно создать аналогично ApplicationsReportView
          // },
          {
            path: 'requests-report',
            name: 'RequestsReport',
            component: RequestsReportView
          },
          // {
          //   path: 'users',
          //   name: 'UsersList',
          //   component: UsersListView // Нужно создать
          // },
          {
            path: '',
            redirect: '/admin/requests-report'
          }
        ]
      }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

router.beforeEach((to, from, next) => {
  const authStore = useAuthStore()
  // Проверяем, требует ли маршрут аутентификации
  if (to.fullPath === '/' || to.matched.some(record => record.meta.requiresAuth)) {
    if (!authStore.isAuthenticated) {
      // Перенаправляем на страницу входа
      next({ name: 'Login', query: { redirect: to.fullPath } })
    } else {
      next()
    }
  } 
  // Проверяем маршруты только для гостей (например, страница входа)
  else if (to.matched.some(record => record.meta.guestOnly)) {
    if (authStore.isAuthenticated) {
      // Если пользователь авторизован, перенаправляем на главную
      next({ name: 'Dashboard' })
    } else {
      next()
    }
  } 
  // Для всех остальных маршрутов
  else {
    next()
  }
})

export default router
