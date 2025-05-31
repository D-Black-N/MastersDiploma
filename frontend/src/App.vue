<template>
  <div class="app-container">
    <component :is="layout">
      <router-view />
    </component>
  </div>
</template>

<script>
import { computed } from 'vue'
import { useRoute } from 'vue-router'
import AppLayout from '@/components/layout/AppLayout.vue'
import AuthLayout from '@/components/layout/AuthLayout.vue'

export default {
  components: {
    AppLayout,
    AuthLayout
  },

  setup() {
    const route = useRoute()
    
    const layout = computed(() => {
      return route.meta.layout || 'AppLayout'
    })

    return {
      layout
    }
  }
}
</script>

<style>
body {
  margin: 0;
}

.app-container {
  height: 100vh;
}
</style>
