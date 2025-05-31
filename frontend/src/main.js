import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import { createPinia } from 'pinia'
import { useAuthStore } from './store/auth'

const app = createApp(App)

// Создаем экземпляр Pinia
const pinia = createPinia()

// Подключаем Pinia к приложению
app.use(pinia)
app.use(router)

// Проверяем аутентификацию перед первым рендерингом
const authStore = useAuthStore()
authStore.initialize() // Нужно добавить этот метод в хранилище

app.mount('#app')
