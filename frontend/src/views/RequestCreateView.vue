<template>
  <div class="application-create-view">
    <!-- Шапка страницы -->
    <div class="page-header">
      <button class="back-button" @click="goBack">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M19 12H5M12 19l-7-7 7-7" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        Назад
      </button>
      <h1>Новая заявка</h1>
    </div>

    <!-- Форма создания -->
    <div class="create-form">
      <!-- Клиент -->
      <div class="form-section">
        <h2>Клиент</h2>
        <div class="client-selection">
          <div class="form-group">
            <label>Выберите клиента</label>
            <select v-model="form.client_id">
              <option value="">-- Выберите клиента --</option>
              <option v-for="client in clients" :key="client.id" :value="client.id">
                {{ formatName(client) }} ({{ client.phone_number }})
              </option>
            </select>
          </div>
          <div class="or-divider">или</div>
          <router-link 
            to="/clients/create?returnTo=/requests/create"
            class="add-client-button"
          >
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M12 5V19M5 12H19" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
            </svg>
            Добавить нового клиента
          </router-link>
        </div>
      </div>

      <!-- Основные параметры -->
      <div class="form-section">
        <h2>Основные параметры</h2>
        <div class="form-grid">
          <div class="form-group">
            <label>Срок лизинга (мес.)</label>
            <input v-model="form.leasing_term" type="number" min="1">
          </div>
          <div class="form-group">
            <label>Тип платежа</label>
            <select v-model="form.payment_type">
              <option value="cash">Наличные</option>
              <option value="bank_card">Банковская карта</option>
              <option value="qr">QR код</option>
            </select>
          </div>
          <div class="form-group">
            <label>Условия</label>
            <textarea v-model="form.conditions" rows="3"></textarea>
          </div>
        </div>
      </div>

      <!-- Транспортное средство -->
      <div class="form-section">
        <h2>Транспортное средство</h2>
        <div class="form-grid">
          <div class="form-group">
            <label>Марка</label>
            <input v-model="form.vehicle_attributes.brand" type="text">
          </div>
          <div class="form-group">
            <label>Модель</label>
            <input v-model="form.vehicle_attributes.vehicle_model" type="text">
          </div>
          <div class="form-group">
            <label>Год выпуска</label>
            <input v-model="form.vehicle_attributes.year" type="number" min="1900" :max="new Date().getFullYear()">
          </div>
          <div class="form-group">
            <label>VIN</label>
            <input v-model="form.vehicle_attributes.vin" type="text">
          </div>
          <div class="form-group">
            <label>Стоимость (₽)</label>
            <input v-model="form.vehicle_attributes.price" type="number" min="0">
          </div>
        </div>
      </div>

      <!-- Кнопки действий -->
      <div class="form-actions">
        <button class="cancel-button" @click="goBack">
          Отменить
        </button>
        <button class="submit-button" @click="submitForm">
          Создать заявку
        </button>
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
      showClientForm: false,
      clients: [],
      newClient: {
        last_name: '',
        first_name: '',
        middle_name: '',
        phone_number: '',
        email: ''
      },
      form: {
        client_id: null,
        user_id: 5,
        leasing_term: 36,
        payment_type: 'cash',
        conditions: 'Стандартные условия',
        status: 'open',
        vehicle_attributes: {
          brand: '',
          vehicle_model: '',
          year: new Date().getFullYear(),
          vin: '',
          price: 0,
          status: 'ready'
        }
      }
    }
  },
  methods: {
    goBack() {
      this.$router.push('/requests')
    },

    onClientSelect() {
      this.showClientForm = false
    },

    formatPhone(phone) {
      return phone.replace(/(\+\d)(\d{3})(\d{3})(\d{2})(\d{2})/, '$1 ($2) $3 $4 $5')
    },

    formatName(person) {
      const parts = [
        person.last_name,
        person.first_name,
        person.middle_name
      ]

      return parts.filter(part => part).join(' ')
    },

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
        this.error = err.message || 'Не удалось загрузить клиента';
        console.error('Ошибка:', err);
      } finally {
        this.isLoading = false;
      }
    },

    async submitForm() {
      this.isLoading = true;
      this.error = null;

      try {
        const response = await fetch(`http://localhost:3000/api/v1/requests`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ request: this.form })
        });

        if (!response.ok) {
          throw new Error('Ошибка сервера');
        }

        const data = await response.json();
        this.request = data.request;
      } catch (err) {
        this.error = err.message || 'Не удалось загрузить клиента';
        console.error('Ошибка:', err);
      } finally {
        this.isLoading = false;
        this.$router.push({ name: 'RequestDetails', params: { id: this.request.id } })
      }
    }
  },

  directives: {
    'phone-mask': {
      inserted(el) {
        el.addEventListener('input', function(e) {
          let x = e.target.value.replace(/\D/g, '').match(/(\d{0,1})(\d{0,3})(\d{0,3})(\d{0,2})(\d{0,2})/)
          e.target.value = '+7' + (x[2] ? ' (' + x[2] : '') + (x[3] ? ') ' + x[3] : '') + (x[4] ? '-' + x[4] : '') + (x[5] ? '-' + x[5] : '')
        })
      }
    }
  },

  mounted() {
    this.fetchClients()
  }
}
</script>

<style scoped>
.application-create-view {
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

.create-form {
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
.form-group select,
.form-group textarea {
  padding: 10px 12px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
  transition: border-color 0.2s;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
  outline: none;
  border-color: #4361ee;
  box-shadow: 0 0 0 2px rgba(67, 97, 238, 0.2);
}

.form-group textarea {
  resize: vertical;
  min-height: 80px;
}

.client-selection {
  display: flex;
  align-items: center;
  gap: 16px;
  margin-bottom: 16px;
}

.or-divider {
  color: #999;
  font-size: 0.9rem;
}

.add-client-button {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px 12px;
  background-color: #f0f0f0;
  color: #333;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: all 0.2s;
  text-decoration: none;
}

.add-client-button:hover {
  background-color: #e0e0e0;
}

.add-client-button svg {
  stroke: currentColor;
}

.new-client-form {
  background: #f9f9f9;
  border-radius: 8px;
  padding: 16px;
  margin-top: 16px;
}

.form-actions {
  display: flex;
  justify-content: flex-end;
  gap: 12px;
  margin-top: 32px;
  padding-top: 16px;
  border-top: 1px solid #eee;
}

.cancel-button {
  padding: 10px 16px;
  background-color: #f0f0f0;
  color: #333;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.cancel-button:hover {
  background-color: #e0e0e0;
}

.submit-button {
  padding: 10px 16px;
  background-color: #4361ee;
  color: white;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.submit-button:hover {
  background-color: #3a0ca3;
}

@media (max-width: 768px) {
  .client-selection {
    flex-direction: column;
    align-items: flex-start;
  }
  
  .or-divider {
    align-self: center;
  }
}
</style>
