<template>
  <div class="app-container">
    <Header />
    <div class="main">
      <router-view />
    </div>
  </div>
</template>

<script>
import Header from '@/shared/components/application/Header.vue'

export default {
  components: {
    Header
  }
}
</script>

<style scoped>
.app-container {
  display: flex;
  flex-flow: column;
  width: 100vw;
  min-height: 100vh;
}

.app-container .main {
  width: 100%;
  display: flex;
  justify-content: center;
  padding-bottom: 50px;
}
</style>
