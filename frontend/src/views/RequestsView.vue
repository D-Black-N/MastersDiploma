<template>
  <div class="applications-view">
    <!-- Шапка страницы с кнопкой назад -->
    <div class="page-header">
      <div class="header-left">
        <button class="back-button" @click="goBack">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M19 12H5M12 19l-7-7 7-7" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
          Назад
        </button>
        <h1>Список заявок</h1>
      </div>
      <router-link to="/requests/create" class="create-button">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M12 5V19M5 12H19" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
        </svg>
        Новая заявка
      </router-link>
    </div>

    <!-- Таблица заявок -->
    <div class="applications-table-container">
      <table class="applications-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Клиент</th>
            <th>Статус</th>
            <th>Уровень риска</th>
            <th>Дата создания</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="request in requests" :key="request.id">
            <td>
              <router-link 
                :to="{ name: 'RequestDetails', params: { id: request.id } }" 
                class="request-id-link"
              >
                {{ request.id }}
              </router-link>
            </td>
            <td>
              <router-link 
                :to="{ name: 'ClientDetails', params: { id: request.client.id } }" 
                class="client-id-link"
              >
                {{ formatName(request.client) }}
              </router-link>
            </td>
            <td>
              <span class="status-badge">
                {{ request.status }}
              </span>
            </td>
            <td>
              <span class="risk-level">
                {{ request.risk_level }}
              </span>
            </td>
            <td>{{ formatDate(request.created_at) }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isLoading: false,
      error: null,
      requests: []
    }
  },

  methods: {
    goBack() {
      this.$emit('unlock-sidebar')
      this.$router.push('/')
    },

    formatName(person) {
      const parts = [
        person.last_name,
        person.first_name,
        person.middle_name
      ]

      return parts.filter(part => part).join(' ')
    },

    formatDate(dateString) {
      const options = { minute: '2-digit', hour: '2-digit', day: '2-digit', month: '2-digit', year: 'numeric' }
      return new Date(dateString).toLocaleDateString('ru-RU', options)
    },

    // getRiskLevelName(level) {
    //   const levels = {
    //     1: 'Низкий',
    //     2: 'Средний',
    //     3: 'Высокий'
    //   }
    //   return levels[level] || 'Не определен'
    // },

    async fetchRequests() {
      this.isLoading = true
      this.error = null

      try {
        const response = await fetch('http://localhost:3000/api/v1/requests', {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
          }
        });

        if (!response.ok) {
          throw new Error('Ошибка сервера');
        }

        const data = await response.json();
        this.requests = data.requests;
      } catch (err) {
        this.error = err.message || 'Не удалось загрузить клиентов';
        console.error('Ошибка:', err);
      } finally {
        this.isLoading = false;
      }
    }
  },

  created() {
    this.fetchRequests()
  }
}
</script>

<style scoped>
.applications-view {
  padding: 24px;
  height: 100%;
}

.page-header {
  gap: 16px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 24px;
}

.header-left {
  display: flex;
  align-items: center;
  gap: 16px;
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

.applications-table-container {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  overflow: hidden;
}

.applications-table {
  width: 100%;
  border-collapse: collapse;
}

.applications-table th, .applications-table td {
  padding: 12px 16px;
  text-align: left;
  border-bottom: 1px solid #eee;
}

.applications-table th {
  background-color: #f8f9fa;
  font-weight: 500;
  color: #3a0ca3;
}

.client-id-link, .request-id-link {
  color: #4361ee;
  text-decoration: none;
  font-weight: 500;
  transition: color 0.2s;
}

.client-id-link:hover, .request-id-link:hover {
  color: #3a0ca3;
  text-decoration: underline;
}

.create-button {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px 12px;
  background-color: #4361ee;
  color: white;
  border-radius: 6px;
  text-decoration: none;
  transition: background-color 0.2s;
}

.create-button:hover {
  background-color: #3a0ca3;
}

.create-button svg {
  stroke: currentColor;
}
</style>