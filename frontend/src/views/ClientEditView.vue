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
            <input v-model="client.lastName" type="text">
          </div>
          <div class="form-group">
            <label>Имя</label>
            <input v-model="client.firstName" type="text">
          </div>
          <div class="form-group">
            <label>Отчество</label>
            <input v-model="client.middleName" type="text">
          </div>
        </div>
      </div>

      <div class="form-section">
        <h2>Контактные данные</h2>
        <div class="form-grid">
          <div class="form-group">
            <label>Телефон</label>
            <input v-model="client.phone" type="tel" v-phone-mask>
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
            <input v-model="client.passportSeries" type="text" maxlength="4">
          </div>
          <div class="form-group">
            <label>Номер паспорта</label>
            <input v-model="client.passportNumber" type="text" maxlength="6">
          </div>
        </div>
      </div>

      <div class="form-section">
        <h2>Дополнительно</h2>
        <div class="form-group">
          <label>Ответственный менеджер</label>
          <select v-model="client.managerId">
            <option v-for="manager in managers" :key="manager.id" :value="manager.id">
              {{ manager.name }}
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
      client: {
        id: 1,
        firstName: 'Иван',
        lastName: 'Иванов',
        middleName: 'Иванович',
        phone: '+79161234567',
        email: 'ivanov@example.com',
        passportSeries: '4510',
        passportNumber: '123456',
        managerId: 1
      },
      managers: [
        { id: 1, name: 'Петрова М.С.' },
        { id: 2, name: 'Сидоров А.П.' },
        { id: 3, name: 'Козлов В.И.' }
      ]
    }
  },
  methods: {
    goBack() {
      this.$router.go(-1)
    },
    saveClient() {
      // Здесь будет логика сохранения
      console.log('Сохранение клиента:', this.client)
      this.$router.push({ name: 'ClientDetails', params: { id: this.client.id } })
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
