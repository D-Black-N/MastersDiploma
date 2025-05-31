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
                {{ request.client.fullName }}
              </router-link>
            </td>
            <td>
              <span class="status-badge">
                {{ request.status }}
              </span>
            </td>
            <td>
              <span class="risk-level">
                {{ getRiskLevelName(request.riskLevel) }}
              </span>
            </td>
            <td>{{ formatDate(request.createdAt) }}</td>
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
      requests: [
        {
          id: 1,
          client: {
            id: 1,
            fullName: 'Иванов Иван Иванович'
          },
          status: 'Новая',
          riskLevel: 1,
          createdAt: '2023-05-15T10:30:00'
        },
        {
          id: 2,
          client: {
            id: 2,
            fullName: 'Петрова Мария Сергеевна'
          },
          status: 'В работе',
          riskLevel: 2,
          createdAt: '2023-05-14T14:45:00'
        },
        {
          id: 3,
          client: {
            id: 3,
            fullName: 'Сидоров Алексей Петрович'
          },
          status: 'Завершена',
          riskLevel: 3,
          createdAt: '2023-05-10T09:15:00'
        },
        {
          id: 4,
          client: {
            id: 4,
            fullName: 'Кузнецова Елена Владимировна'
          },
          status: 'Отклонена',
          riskLevel: 2,
          createdAt: '2023-05-08T16:20:00'
        },
        {
          id: 5,
          client: {
            id: 5,
            fullName: 'Васильев Дмитрий Николаевич'
          },
          status: 'Новая',
          riskLevel: 1,
          createdAt: '2023-05-17T11:10:00'
        }
      ]
    }
  },
  methods: {
    goBack() {
      this.$emit('unlock-sidebar')
      this.$router.push('/')
    },

    formatDate(dateString) {
      const options = { day: '2-digit', month: '2-digit', year: 'numeric' }
      return new Date(dateString).toLocaleDateString('ru-RU', options)
    },

    getRiskLevelName(level) {
      const levels = {
        1: 'Низкий',
        2: 'Средний',
        3: 'Высокий'
      }
      return levels[level] || 'Не определен'
    }
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