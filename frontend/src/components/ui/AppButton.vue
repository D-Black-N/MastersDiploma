<template>
  <button 
    class="app-button"
    @click="$emit('click')"
  >
    <slot></slot>
  </button>
</template>

<script>
export default {
  name: 'AppButton'
}
</script>

<style scoped>
.app-button {
  padding: 8px 16px;
  background: #f44336;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background 0.3s;
}

.app-button:hover {
  background: #d32f2f;
}
</style>
