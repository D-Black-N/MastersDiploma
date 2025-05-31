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
            <select v-model="form.clientId">
              <option value="">-- Выберите клиента --</option>
              <option v-for="client in clients" :key="client.id" :value="client.id">
                {{ client.fullName }} ({{ formatPhone(client.phone) }})
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
              <option value="Аннуитетный">Аннуитетный</option>
              <option value="Дифференцированный">Дифференцированный</option>
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
            <input v-model="form.vehicle.brand" type="text">
          </div>
          <div class="form-group">
            <label>Модель</label>
            <input v-model="form.vehicle.model" type="text">
          </div>
          <div class="form-group">
            <label>Год выпуска</label>
            <input v-model="form.vehicle.year" type="number" min="1900" :max="new Date().getFullYear()">
          </div>
          <div class="form-group">
            <label>VIN</label>
            <input v-model="form.vehicle.vin" type="text">
          </div>
          <div class="form-group">
            <label>Стоимость (₽)</label>
            <input v-model="form.vehicle.price" type="number" min="0">
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
      showClientForm: false,
      clients: [
        { id: 1, fullName: 'Иванов Иван Иванович', phone: '+79161234567', email: 'ivanov@example.com' },
        { id: 2, fullName: 'Петров Петр Петрович', phone: '+79031234568', email: 'petrov@example.com' },
        { id: 3, fullName: 'Сидорова Мария Сергеевна', phone: '+79261234569', email: 'sidorova@example.com' }
      ],
      newClient: {
        lastName: '',
        firstName: '',
        middleName: '',
        phone: '',
        email: ''
      },
      form: {
        clientId: '',
        leasing_term: 36,
        payment_type: 'Аннуитетный',
        conditions: 'Стандартные условия',
        vehicle: {
          brand: '',
          model: '',
          year: new Date().getFullYear(),
          vin: '',
          price: 0
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
      return phone.replace(/(\+\d)(\d{3})(\d{3})(\d{2})(\d{2})/, '$1 ($2) $3-$4-$5')
    },

    submitForm() {
      // Проверка данных
      if (!this.form.clientId && !this.showClientForm) {
        alert('Выберите клиента или создайте нового')
        return
      }

      if (this.showClientForm) {
        // Создание нового клиента
        const newClientId = Math.max(...this.clients.map(c => c.id)) + 1
        this.clients.push({
          id: newClientId,
          fullName: `${this.newClient.lastName} ${this.newClient.firstName} ${this.newClient.middleName}`,
          phone: this.newClient.phone,
          email: this.newClient.email
        })
        this.form.clientId = newClientId
      }

      // Здесь будет отправка формы на сервер
      console.log('Создана новая заявка:', this.form)
      
      // Переход к списку заявок
      this.$router.push('/applications')
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
