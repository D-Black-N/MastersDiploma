<template>
  <div class="clients-view">
    <!-- Шапка страницы с кнопкой назад -->
    <div class="page-header">
      <button class="back-button" @click="goBack">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M19 12H5M12 19l-7-7 7-7" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        Назад
      </button>
      <h1>Список клиентов</h1>
    </div>

    <!-- Таблица клиентов -->
    <div class="clients-table-container">
      <table class="clients-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>ФИО</th>
            <th>Телефон</th>
            <th>Ответственный менеджер</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="client in clients" :key="client.id">
            <td>
              <router-link 
                :to="{ name: 'ClientDetails', params: { id: client.id } }" 
                class="client-id-link"
              >
                {{ client.id }}
              </router-link>
            </td>
            <td>{{ formatName(client) }}</td>
            <td>{{ client.phone_number }}</td>
            <td>
              <span class="manager-badge">
                {{ formatName(client.user) }}
              </span>
            </td>
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
      clients: [],
      isLoading: false,
      error: null
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

      return parts.filter(part => part).join(' ');
    },

    // formatPhone(phone) {
    //   // Форматирование телефона в +7 (XXX) XXX-XX-XX
    //   return phone.replace(/(\+\d)(\d{3})(\d{3})(\d{2})(\d{2})/, '$1 ($2) $3 $4 $5')
    // },

    async fetchClients() {
      this.isLoading = true;
      this.error = null;
      
      try {
        const response = await fetch('http://localhost:3000/api/v1/clients', {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
          }
        });

        if (!response.ok) {
          throw new Error('Ошибка сервера');
        }

        const data = await response.json();
        this.clients = data.clients;
      } catch (err) {
        this.error = err.message || 'Не удалось загрузить клиентов';
        console.error('Ошибка:', err);
      } finally {
        this.isLoading = false;
      }
    }
  },

  mounted() {
    this.fetchClients();
  }
}
</script>

<style scoped>
.clients-view {
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

.clients-table-container {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  overflow: hidden;
}

.clients-table {
  width: 100%;
  border-collapse: collapse;
}

.clients-table th, .clients-table td {
  padding: 12px 16px;
  text-align: left;
  border-bottom: 1px solid #eee;
}

.clients-table th {
  background-color: #f8f9fa;
  font-weight: 500;
  color: #3a0ca3;
}

.manager-badge {
  display: inline-block;
  padding: 6px 10px;
  border-radius: 16px;
  font-size: 0.85rem;
  font-weight: 500;
  background-color: #f0f0f0;
}

/* Анимация при наведении на строки */
.clients-table tbody tr {
  transition: background-color 0.2s;
}

.clients-table tbody tr:hover {
  background-color: #f5f5f5;
}

.client-id-link {
  color: #4361ee;
  text-decoration: none;
  font-weight: 500;
  transition: color 0.2s;
}

.client-id-link:hover {
  color: #3a0ca3;
  text-decoration: underline;
}

/* Улучшаем hover для всей строки */
.clients-table tbody tr:hover td {
  background-color: #f5f5f5;
}

.clients-table tbody tr:hover .client-id-link {
  color: #3a0ca3;
}

.clients-table tbody tr:hover .manager-badge {
  opacity: 0.9;
}
</style>
