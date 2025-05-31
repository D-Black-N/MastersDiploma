<template>
  <div class="application-details-view">
    <!-- Шапка страницы -->
    <div class="page-header">
      <button class="back-button" @click="goBack">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M19 12H5M12 19l-7-7 7-7" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        Назад к списку
      </button>
      <h1>Заявка #{{ application.id }}</h1>
      <div class="status-badge" :class="application.status.toLowerCase()">
        {{ application.status }}
      </div>
    </div>

    <!-- Основная информация -->
    <div class="application-card">
      <!-- Основные параметры -->
      <div class="section">
        <h2>Основные параметры</h2>
        <div class="info-grid">
          <div class="info-row">
            <span class="info-label">Срок лизинга:</span>
            <span class="info-value">{{ application.leasing_term }} месяцев</span>
          </div>
          <div class="info-row">
            <span class="info-label">Тип платежа:</span>
            <span class="info-value">{{ application.payment_type }}</span>
          </div>
          <div class="info-row">
            <span class="info-label">Условия:</span>
            <span class="info-value">{{ application.conditions }}</span>
          </div>
        </div>
      </div>

      <!-- Результаты проверки -->
      <div class="section">
        <h2>Результаты проверки</h2>
        <div class="info-grid">
          <div class="info-row">
            <span class="info-label">Верификация:</span>
            <span class="info-value verification-badge" :class="application.verification_result.toLowerCase()">
              {{ application.verification_result }}
            </span>
          </div>
          <div class="info-row">
            <span class="info-label">Уровень риска:</span>
            <span class="info-value risk-badge" :class="'risk-' + application.risk_level">
              {{ getRiskLevelName(application.risk_level) }}
            </span>
          </div>
        </div>
      </div>

      <!-- Участники -->
      <div class="section">
        <h2>Участники</h2>
        <div class="info-grid">
          <div class="info-row">
            <span class="info-label">Менеджер:</span>
            <span class="info-value manager-badge">
              {{ application.manager.name }}
              <span class="manager-contact">{{ application.manager.phone }}</span>
            </span>
          </div>
          <div class="info-row">
            <span class="info-label">Клиент:</span>
            <span class="info-value">
              {{ application.client.name }}
              <span class="client-contact">{{ application.client.phone }}</span>
            </span>
          </div>
        </div>
      </div>

      <!-- Транспортное средство -->
      <div class="section">
        <h2>Транспортное средство</h2>
        <div class="vehicle-details">
          <div class="vehicle-image-placeholder">
            <svg width="60" height="60" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M5 17H3V12L5.93 6H16L19 12V17H17M5 17H19M5 17V19C5 19.5523 5.44772 20 6 20H8C8.55228 20 9 19.5523 9 19V17H15V19C15 19.5523 15.4477 20 16 20H18C18.5523 20 19 19.5523 19 19V17M17 13C17 13.5523 16.5523 14 16 14C15.4477 14 15 13.5523 15 13C15 12.4477 15.4477 12 16 12C16.5523 12 17 12.4477 17 13ZM7 13C7 13.5523 6.55228 14 6 14C5.44772 14 5 13.5523 5 13C5 12.4477 5.44772 12 6 12C6.55228 12 7 12.4477 7 13Z" stroke="#4361EE" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
          </div>
          <div class="vehicle-info">
            <div class="vehicle-title">{{ application.vehicle.brand }} {{ application.vehicle.model }}</div>
            <div class="vehicle-desc">
              <span>Год: {{ application.vehicle.year }}</span>
              <span>VIN: {{ application.vehicle.vin }}</span>
              <span>Стоимость: {{ formatPrice(application.vehicle.price) }}</span>
            </div>
          </div>
        </div>
      </div>

      <!-- Действия -->
      <div class="actions-section">
        <button class="action-button edit-button">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M11 4H4C3.46957 4 2.96086 4.21071 2.58579 4.58579C2.21071 4.96086 2 5.46957 2 6V20C2 20.5304 2.21071 21.0391 2.58579 21.4142C2.96086 21.7893 3.46957 22 4 22H18C18.5304 22 19.0391 21.7893 19.4142 21.4142C19.7893 21.0391 20 20.5304 20 20V13" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
            <path d="M18.5 2.5C18.8978 2.10217 19.4374 1.87868 20 1.87868C20.5626 1.87868 21.1022 2.10217 21.5 2.5C21.8978 2.89782 22.1213 3.43739 22.1213 4C22.1213 4.56261 21.8978 5.10217 21.5 5.5L12 15L8 16L9 12L18.5 2.5Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
          Редактировать
        </button>
        
        <button class="action-button history-button">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M12 8V12L15 15M21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
          История изменений
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      application: {
        id: 1024,
        leasing_term: 36,
        payment_type: 'Аннуитетный',
        status: 'На проверке',
        conditions: 'Стандартные условия',
        verification_result: 'Пройдена',
        risk_level: 2,
        manager: {
          id: 1,
          name: 'Петрова М.С.',
          phone: '+7 (916) 123-45-67'
        },
        client: {
          id: 1,
          name: 'Иванов Иван Иванович',
          phone: '+7 (912) 345-67-89'
        },
        vehicle: {
          brand: 'Toyota',
          model: 'Camry',
          year: 2022,
          vin: 'JT2BF22KXW0156789',
          price: 2500000
        }
      }
    }
  },
  methods: {
    goBack() {
      this.$router.push('/applications')
    },
    getRiskLevelName(level) {
      const levels = {
        1: 'Низкий',
        2: 'Средний',
        3: 'Высокий'
      }
      return levels[level] || 'Не определен'
    },
    formatPrice(price) {
      return new Intl.NumberFormat('ru-RU', {
        style: 'currency',
        currency: 'RUB',
        maximumFractionDigits: 0
      }).format(price)
    }
  }
}
</script>

<style scoped>
.application-details-view {
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

.status-badge {
  display: inline-block;
  padding: 6px 12px;
  border-radius: 12px;
  font-size: 0.9rem;
  font-weight: 500;
}

.status-badge.на.проверке {
  background-color: #fff8e1;
  color: #ff8f00;
}

.status-badge.одобрена {
  background-color: #e8f5e9;
  color: #2e7d32;
}

.status-badge.отклонена {
  background-color: #ffebee;
  color: #c62828;
}

.application-card {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  padding: 24px;
}

.section {
  margin-bottom: 24px;
}

.section h2 {
  color: #3a0ca3;
  font-size: 1.1rem;
  margin-bottom: 16px;
  padding-bottom: 8px;
  border-bottom: 1px solid #eee;
}

.info-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 16px;
}

.info-row {
  display: flex;
  align-items: flex-start;
  padding: 8px 0;
}

.info-label {
  width: 160px;
  font-weight: 500;
  color: #666;
}

.info-value {
  flex: 1;
}

.verification-badge {
  display: inline-block;
  padding: 4px 8px;
  border-radius: 12px;
  font-size: 0.85rem;
  font-weight: 500;
}

.verification-badge.пройдена {
  background-color: #e8f5e9;
  color: #2e7d32;
}

.verification-badge.не.пройдена {
  background-color: #ffebee;
  color: #c62828;
}

.risk-badge {
  display: inline-block;
  padding: 4px 8px;
  border-radius: 12px;
  font-size: 0.85rem;
  font-weight: 500;
}

.risk-1 {
  background-color: #e8f5e9;
  color: #2e7d32;
}

.risk-2 {
  background-color: #fff8e1;
  color: #ff8f00;
}

.risk-3 {
  background-color: #ffebee;
  color: #c62828;
}

.manager-badge {
  display: inline-flex;
  flex-direction: column;
  padding: 4px 8px;
  border-radius: 6px;
  background-color: #e3f2fd;
  color: #1976d2;
}

.manager-contact,
.client-contact {
  font-size: 0.8rem;
  color: #666;
  margin-top: 2px;
}

.vehicle-details {
  display: flex;
  gap: 16px;
  align-items: center;
}

.vehicle-image-placeholder {
  width: 80px;
  height: 80px;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #f5f5f5;
  border-radius: 8px;
}

.vehicle-title {
  font-weight: 500;
  font-size: 1.1rem;
  margin-bottom: 4px;
}

.vehicle-desc {
  display: flex;
  flex-direction: column;
  gap: 2px;
  font-size: 0.9rem;
  color: #666;
}

.actions-section {
  display: flex;
  gap: 12px;
  margin-top: 24px;
  padding-top: 16px;
  border-top: 1px solid #eee;
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
  background-color: #f0f0f0;
  color: #333;
}

.action-button:hover {
  background-color: #e0e0e0;
}

.action-button svg {
  stroke: currentColor;
}
</style>
