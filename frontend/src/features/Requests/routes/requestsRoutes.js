import Index from '../pages/Index.vue';
import Show from '../pages/Show.vue';
import Create from '../pages/Create.vue';
import Edit from '../pages/Edit.vue';

export default [
  { path: '/requests', component: Index },
  { path: '/request/:id', component: Show },
  { path: '/requests/new', component: Create },
  { path: '/request/:id/edit', component: Edit },
]