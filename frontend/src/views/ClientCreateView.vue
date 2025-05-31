<template>
  <div class="client-create-view">
    <div class="page-header">
      <h1>Новый клиент</h1>
    </div>

    <div class="create-form">
      <div class="form-section">
        <h2>Основная информация</h2>
        <div class="form-grid">
          <div class="form-group">
            <label>Фамилия*</label>
            <input v-model="client.lastName" type="text" required>
          </div>
          <div class="form-group">
            <label>Имя*</label>
            <input v-model="client.firstName" type="text" required>
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
            <label>Телефон*</label>
            <input v-model="client.phone" type="tel" v-phone-mask required>
          </div>
          <div class="form-group">
            <label>Email</label>
            <input v-model="client.email" type="email">
          </div>
        </div>
      </div>

      <div class="form-actions">
        <button class="cancel-button" @click="goBack">
          Отменить
        </button>
        <button class="submit-button" @click="createClient">
          Создать клиента
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      client: {
        lastName: '',
        firstName: '',
        middleName: '',
        phone: '',
        email: ''
      }
    }
  },
  methods: {
    goBack() {
      // Возврат на предыдущую страницу или по returnTo
      const returnTo = this.$route.query.returnTo || '/clients'
      this.$router.push(returnTo)
    },

    createClient() {
      // Здесь будет логика создания клиента
      console.log('Создание клиента:', this.client)
      
      // После создания возвращаемся обратно
      const returnTo = this.$route.query.returnTo || '/clients'
      this.$router.push(returnTo)
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
.client-create-view {
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

.form-group input {
  padding: 10px 12px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
  transition: border-color 0.2s;
}

.form-group input:focus {
  outline: none;
  border-color: #4361ee;
  box-shadow: 0 0 0 2px rgba(67, 97, 238, 0.2);
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
</style>
