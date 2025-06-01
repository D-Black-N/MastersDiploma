<template>
  <div class="client-details-view">
    <!-- Шапка страницы с кнопкой назад -->
    <div class="page-header">
      <button class="back-button" @click="goBack">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M19 12H5M12 19l-7-7 7-7" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        Назад
      </button>
      <h1>Карточка клиента</h1>
    </div>

    <!-- Основная информация о клиенте -->
    <div class="client-card">
      <div class="client-info">
        <div class="info-row">
          <span class="info-label">Имя:</span>
          <span class="info-value">{{ client.first_name }}</span>
        </div>
        
        <div class="info-row">
          <span class="info-label">Фамилия:</span>
          <span class="info-value">{{ client.last_name }}</span>
        </div>
        
        <div class="info-row">
          <span class="info-label">Отчество:</span>
          <span class="info-value">{{ client.middle_name }}</span>
        </div>
        
        <div class="info-row">
          <span class="info-label">Телефон:</span>
          <span class="info-value">{{ client.phone_number }}</span>
        </div>
        
        <div class="info-row">
          <span class="info-label">Email:</span>
          <span class="info-value">{{ client.email }}</span>
        </div>
        
        <div class="info-row">
          <span class="info-label">Менеджер:</span>
          <span class="info-value manager-badge">{{ formatManager(client.user) }}</span>
        </div>
        
        <div class="info-row">
          <span class="info-label">Паспорт:</span>
          <span class="info-value">{{ formatPassport(client) }}</span>
        </div>
      </div>

      <!-- Дополнительные действия -->
      <div class="client-actions">
        <router-link 
          :to="{ name: 'ClientEdit', params: { id: client.id, client: client } }"
          class="action-button edit-button"
        >
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M11 4H4C3.46957 4 2.96086 4.21071 2.58579 4.58579C2.21071 4.96086 2 5.46957 2 6V20C2 20.5304 2.21071 21.0391 2.58579 21.4142C2.96086 21.7893 3.46957 22 4 22H18C18.5304 22 19.0391 21.7893 19.4142 21.4142C19.7893 21.0391 20 20.5304 20 20V13" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
            <path d="M18.5 2.5C18.8978 2.10217 19.4374 1.87868 20 1.87868C20.5626 1.87868 21.1022 2.10217 21.5 2.5C21.8978 2.89782 22.1213 3.43739 22.1213 4C22.1213 4.56261 21.8978 5.10217 21.5 5.5L12 15L8 16L9 12L18.5 2.5Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
          Редактировать
        </router-link>

        <!-- Добавляем новую кнопку -->
        <router-link 
          :to="{ name: 'ClientDocuments', params: { id: client.id, client: client } }"
          class="action-button documents-button"
        >
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M14 2H6C5.46957 2 4.96086 2.21071 4.58579 2.58579C4.21071 2.96086 4 3.46957 4 4V20C4 20.5304 4.21071 21.0391 4.58579 21.4142C4.96086 21.7893 5.46957 22 6 22H18C18.5304 22 19.0391 21.7893 19.4142 21.4142C19.7893 21.0391 20 20.5304 20 20V8L14 2Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M14 2V8H20" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M16 13H8" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M16 17H8" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M10 9H9H8" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
          Документы
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isLoading: false,
      error: null,
      client: {}
    }
  },

  methods: {
    goBack() {
      this.$router.go(-1)
    },

    formatPassport(client) {
      return `${client.passport_series} ${client.passport_number}`
    },

    formatManager(manager) {
      if (!manager) return 'Не указан';

      const parts = [
        manager.last_name,
        manager.first_name,
        manager.middle_name
      ]

      return parts.filter(part => part).join(' ');
    },

    async fetchClient() {
      this.isLoading = true;
      this.error = null;

      try {
        const response = await fetch(`http://localhost:3000/api/v1/clients/${this.$route.params.id}`, {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
          }
        });

        if (!response.ok) {
          throw new Error('Ошибка сервера');
        }

        const data = await response.json();
        this.client = data.client;
      } catch (err) {
        this.error = err.message || 'Не удалось загрузить клиента';
        console.error('Ошибка:', err);
      } finally {
        this.isLoading = false;
      }
    }
  },

  created() {
    // Получаем данные из параметров маршрута
    if (this.$route.params.client) {
      this.client = this.$route.params.client
    } else {
      // Если переход был без данных - загружаем с сервера
      this.fetchClient()
    }
  }
}
</script>

<style scoped>
.client-details-view {
  padding: 24px;
  height: 100%;
}

.page-header {
  display: flex;
  align-items: center;
  gap: 16px;
  margin-bottom: 24px;
}

.back-button {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px 12px;
  background-color: #4361ee;
  color: white;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.back-button:hover {
  background-color: #3a0ca3;
}

.back-button svg {
  stroke: white;
}

.client-card {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  padding: 24px;
  display: flex;
  gap: 40px;
}

.client-info {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.info-row {
  display: flex;
  align-items: center;
  padding: 8px 0;
  border-bottom: 1px solid #f0f0f0;
}

.info-label {
  width: 180px;
  font-weight: 500;
  color: #666;
}

.info-value {
  flex: 1;
}

.manager-badge {
  display: inline-block;
  padding: 4px 8px;
  border-radius: 12px;
  background-color: #e3f2fd;
  color: #1976d2;
  font-size: 0.9rem;
}

.client-actions {
  width: 220px;
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.action-button {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 10px 12px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: all 0.2s;
  font-size: 0.9rem;
}

.edit-button {
  background-color: #4361ee;
  color: white;
  text-decoration: none;
}

.edit-button:hover {
  background-color: #3a0ca3;
}

.history-button {
  background-color: #f0f0f0;
  color: #333;
}

.history-button:hover {
  background-color: #e0e0e0;
}

.action-button svg {
  stroke: currentColor;
}

.documents-button {
  background-color: #f0f0f0;
  color: #333;
  text-decoration: none;
}

.documents-button:hover {
  background-color: #e0e0e0;
}
</style>
