<template>
  <div class="empty-state">
    <div class="empty-content">
      <h2>Добро пожаловать в систему</h2>
      <p>Выберите раздел в боковом меню для продолжения работы</p>
      <div class="hint">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M14 5L21 12L14 19" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
          <path d="M21 12H3" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
        </svg>
        <span>Используйте боковое меню для навигации</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'EmptyState'
}
</script>

<style scoped>
.empty-state {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  padding: 20px;
}

.empty-content {
  text-align: center;
  max-width: 400px;
}

.empty-content h2 {
  color: #3A0CA3;
  margin-bottom: 15px;
}

.empty-content p {
  color: #666;
  margin-bottom: 20px;
}

.hint {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  color: #4361EE;
  font-weight: 500;
}

.hint svg {
  stroke: #4361EE;
}
</style>
