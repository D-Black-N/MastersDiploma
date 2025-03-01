<template>
  <div class="app-container">
    <Header />
    <div class="main">
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
  width: 100vw;
  min-height: 100vh;
}
</style>
