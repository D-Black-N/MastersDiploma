import { createApp } from 'vue'
import { createPinia } from 'pinia'
import { library } from '@fortawesome/fontawesome-svg-core';
import { faChevronDown, faChevronUp, faSignOutAlt } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';

import App from './App.vue'
import router from './router'
import i18n from '@/i18n/index';

import './assets/styles/main.css'
import 'font-awesome/css/font-awesome.css';

library.add(faChevronDown, faChevronUp, faSignOutAlt);

createApp(App).component('font-awesome-icon', FontAwesomeIcon)
              .use(router)              
              .use(createPinia())
              .use(i18n)
              .mount('#app')
