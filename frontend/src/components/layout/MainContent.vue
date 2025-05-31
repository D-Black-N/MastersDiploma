<template>
  <main class="main-content">
    <slot></slot>
  </main>
</template>

<script>
export default {
  name: 'MainContent'
}
</script>

<style scoped>
.main-content {
  flex: 1;
  padding: 20px;
  background: #f8f9fa;
  overflow-y: auto;
}
</style>
