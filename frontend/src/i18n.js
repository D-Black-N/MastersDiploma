import { createI18n } from 'vue-i18n';

// Загрузка локализаций срезов из features
import authRU from '@/features/Auth/i18n/ru'

const messages = {
  ru: {
    ...authRU
  },
};

const i18n = createI18n({
  legacy: false, // Для использования нового API
  locale: 'ru', // Язык по умолчанию
  messages,
});

export default i18n;
