<template>
  <div class="client-edit-view">
    <!-- Шапка страницы -->
    <div class="page-header">
      <button class="back-button" @click="goBack">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M19 12H5M12 19l-7-7 7-7" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        Назад
      </button>
      <h1>Редактирование клиента</h1>
      <div class="header-actions">
        <button class="save-button" @click="saveClient">
          Сохранить
        </button>
      </div>
    </div>

    <!-- Форма редактирования -->
    <div class="edit-form">
      <div class="form-section">
        <h2>Основная информация</h2>
        <div class="form-grid">
          <div class="form-group">
            <label>Фамилия</label>
            <input v-model="client.last_name" type="text">
          </div>
          <div class="form-group">
            <label>Имя</label>
            <input v-model="client.first_name" type="text">
          </div>
          <div class="form-group">
            <label>Отчество</label>
            <input v-model="client.middle_name" type="text">
          </div>
        </div>
      </div>

      <div class="form-section">
        <h2>Контактные данные</h2>
        <div class="form-grid">
          <div class="form-group">
            <label>Телефон</label>
            <input v-model="client.phone_number" type="tel" v-phone-mask>
          </div>
          <div class="form-group">
            <label>Email</label>
            <input v-model="client.email" type="email">
          </div>
        </div>
      </div>

      <div class="form-section">
        <h2>Документы</h2>
        <div class="form-grid">
          <div class="form-group">
            <label>Серия паспорта</label>
            <input v-model="client.passport_series" type="text" maxlength="4">
          </div>
          <div class="form-group">
            <label>Номер паспорта</label>
            <input v-model="client.passport_number" type="text" maxlength="6">
          </div>
        </div>
      </div>

      <div class="form-section">
        <h2>Дополнительно</h2>
        <div class="form-group">
          <label>Ответственный менеджер</label>
          <select v-model="client.user_id">
            <option v-for="manager in managers" :key="manager.id" :value="manager.id">
              {{ formatName(manager) }}
            </option>
          </select>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isLoading: false,
      erorr: null,
      client: {},
      managers: []
    }
  },

  methods: {
    goBack() {
      this.$router.push(`/clients/${this.$route.params.id}`)
    },

    formatName(user) {
      if (!user) return 'Не указан'

      const parts = [
        user.last_name,
        user.first_name,
        user.middle_name
      ]

      return parts.filter(part => part).join(' ')
    },

    async saveClient() {
      try {
        const response = await fetch(`http://localhost:3000/api/v1/clients/${this.client.id}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ client: this.client })
        });

        if (!response.ok) {
          throw new Error('Ошибка сервера');
        }

        const data = await response.json();
        this.client = data.client;
        this.$router.push({ name: 'ClientDetails', params: { id: this.client.id, client: this.client } })
      } catch (err) {
        this.error = err.message || 'Не удалось загрузить клиента';
        console.error('Ошибка:', err);
      }
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
    },

    async fetchManagers() {
      this.isLoading = true;
      this.error = null;

      try {
        const response = await fetch(`http://localhost:3000/api/v1/users`, {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
          }
        });

        if (!response.ok) {
          throw new Error('Ошибка сервера');
        }

        const data = await response.json();
        this.managers = data.users;
      } catch (err) {
        this.error = err.message || 'Не удалось загрузить менеджеров';
        console.error('Ошибка:', err);
      } finally {
        this.isLoading = false;
      }
    }
  },

  directives: {
    'phone-mask': {
      inserted(el) {
        el.addEventListener('input', function(e) {
          let x = e.target.value.replace(/\D/g, '').match(/(\d{0,1})(\d{0,3})(\d{0,3})(\d{0,2})(\d{0,2})/)
          e.target.value = '+7' + (x[2] ? ' (' + x[2] : '') + (x[3] ? ') ' + x[3] : '') + (x[4] ? ' ' + x[4] : '') + (x[5] ? ' ' + x[5] : '')
        })
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

    this.fetchManagers()
  },
}
</script>

<style scoped>
.client-edit-view {
  padding: 24px;
  height: 100%;
}

.page-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 24px;
}

.header-actions {
  display: flex;
  gap: 12px;
}

.back-button {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px 12px;
  background-color: #f0f0f0;
  color: #333;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.back-button:hover {
  background-color: #e0e0e0;
}

.back-button svg {
  stroke: currentColor;
}

.save-button {
  padding: 8px 16px;
  background-color: #4361ee;
  color: white;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.save-button:hover {
  background-color: #3a0ca3;
}

.edit-form {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  padding: 24px;
}

.form-section {
  margin-bottom: 32px;
}

.form-section h2 {
  color: #3a0ca3;
  font-size: 1.1rem;
  margin-bottom: 16px;
  padding-bottom: 8px;
  border-bottom: 1px solid #eee;
}

.form-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 20px;
}

.form-group {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.form-group label {
  font-size: 0.9rem;
  color: #666;
}

.form-group input,
.form-group select {
  padding: 10px 12px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
  transition: border-color 0.2s;
}

.form-group input:focus,
.form-group select:focus {
  outline: none;
  border-color: #4361ee;
  box-shadow: 0 0 0 2px rgba(67, 97, 238, 0.2);
}

/* Адаптивность */
@media (max-width: 768px) {
  .form-grid {
    grid-template-columns: 1fr;
  }
  
  .page-header {
    flex-direction: column;
    align-items: flex-start;
    gap: 12px;
  }
  
  .header-actions {
    width: 100%;
    justify-content: flex-end;
  }
}
</style>
