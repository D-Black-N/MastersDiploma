<template>
  <div class="app-layout">
    <Sidebar :isLocked="isSidebarLocked" />
    <MainContent>
      <router-view v-slot="{ Component }">
        <component 
          :is="Component" 
          v-if="$route.matched.length"
          @unlock-sidebar="unlockSidebar"
        />
        <EmptyState v-else />
      </router-view>
    </MainContent>
  </div>
</template>


<script>
import Sidebar from './Sidebar.vue'
import MainContent from './MainContent.vue'
import EmptyState from './EmptyState.vue'

export default {
  components: {
    Sidebar,
    MainContent,
    EmptyState
  },
  data() {
    return {
      isSidebarLocked: false
    }
  },
  methods: {
    unlockSidebar() {
      this.isSidebarLocked = false
    }
  },
  watch: {
    $route(to) {
      // Блокируем панель только если переходим на конкретную страницу
      this.isSidebarLocked = to.matched.length > 0
    }
  },
  created() {
    // При создании компонента панель разблокирована
    this.isSidebarLocked = false
  }
}
</script>

<style scoped>
.app-layout {
  display: flex;
  width: 100%;
  height: 100%;
}
</style>