<template>
  <div class="applications-report">
    <div class="report-header">
      <h1>Отчет по заявкам</h1>
    </div>

    <!-- Фильтры -->
    <div class="filters-section">
      <div class="filters-grid">
        <div class="filter-group">
          <label>Статус</label>
          <select v-model="filters.status">
            <option value="">Все статусы</option>
            <option value="new">Новая</option>
            <option value="in_progress">В работе</option>
            <option value="approved">Одобрена</option>
            <option value="rejected">Отклонена</option>
          </select>
        </div>

        <div class="filter-group">
          <label>Уровень риска</label>
          <select v-model="filters.riskLevel">
            <option value="">Все уровни</option>
            <option value="low">Низкий</option>
            <option value="medium">Средний</option>
            <option value="high">Высокий</option>
          </select>
        </div>

        <div class="filter-group">
          <label>Дата создания (от)</label>
          <input v-model="filters.dateFrom" type="date">
        </div>

        <div class="filter-group">
          <label>Дата создания (до)</label>
          <input v-model="filters.dateTo" type="date">
        </div>
      </div>

      <button class="generate-button" @click="generateReport">
        Составить отчет
      </button>
    </div>

    <!-- Результаты отчета -->
    <div class="report-results">
      <div v-if="loading" class="loading-indicator">
        Загрузка данных...
      </div>
      
      <div v-else-if="reportData.length === 0" class="no-data">
        Нет данных для отображения
      </div>
      
      <table v-else class="report-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Клиент</th>
            <th>Статус</th>
            <th>Уровень риска</th>
            <th>Дата создания</th>
            <th>Сумма</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in reportData" :key="item.id">
            <td>{{ item.id }}</td>
            <td>{{ item.client }}</td>
            <td>
              <span class="status-badge" :class="item.status">
                {{ getStatusName(item.status) }}
              </span>
            </td>
            <td>
              <span class="risk-badge" :class="item.riskLevel">
                {{ getRiskLevelName(item.riskLevel) }}
              </span>
            </td>
            <td>{{ formatDate(item.createdAt) }}</td>
            <td>{{ formatPrice(item.amount) }}</td>
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
      filters: {
        status: '',
        riskLevel: '',
        dateFrom: '',
        dateTo: ''
      },
      reportData: [],
      loading: false
    }
  },
  methods: {
    generateReport() {
      this.loading = true
      
      // Здесь будет запрос к API
      console.log('Генерация отчета с фильтрами:', this.filters)
      
      // Моковые данные для демонстрации
      setTimeout(() => {
        this.reportData = [
          {
            id: 1001,
            client: 'Иванов И.И.',
            status: 'new',
            riskLevel: 'medium',
            createdAt: '2023-05-15',
            amount: 2500000
          },
          {
            id: 1002,
            client: 'Петров П.П.',
            status: 'approved',
            riskLevel: 'low',
            createdAt: '2023-05-10',
            amount: 1800000
          },
          {
            id: 1003,
            client: 'Сидорова С.С.',
            status: 'rejected',
            riskLevel: 'high',
            createdAt: '2023-05-05',
            amount: 3200000
          }
        ]
        this.loading = false
      }, 1000)
    },
    getStatusName(status) {
      const names = {
        new: 'Новая',
        in_progress: 'В работе',
        approved: 'Одобрена',
        rejected: 'Отклонена'
      }
      return names[status] || status
    },
    getRiskLevelName(level) {
      const names = {
        low: 'Низкий',
        medium: 'Средний',
        high: 'Высокий'
      }
      return names[level] || level
    },
    formatDate(dateString) {
      const options = { day: '2-digit', month: '2-digit', year: 'numeric' }
      return new Date(dateString).toLocaleDateString('ru-RU', options)
    },
    formatPrice(amount) {
      return new Intl.NumberFormat('ru-RU', {
        style: 'currency',
        currency: 'RUB',
        maximumFractionDigits: 0
      }).format(amount)
    }
  }
}
</script>

<style scoped>
.applications-report {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  padding: 24px;
}

.report-header {
  margin-bottom: 24px;
}

.report-header h1 {
  color: #3a0ca3;
}

.filters-section {
  margin-bottom: 24px;
  padding-bottom: 16px;
  border-bottom: 1px solid #eee;
}

.filters-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 16px;
  margin-bottom: 16px;
}

.filter-group {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.filter-group label {
  font-size: 0.9rem;
  color: #666;
}

.filter-group select,
.filter-group input {
  padding: 10px 12px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
}

.generate-button {
  padding: 10px 16px;
  background-color: #4361ee;
  color: white;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.generate-button:hover {
  background-color: #3a0ca3;
}

.report-results {
  margin-top: 24px;
}

.loading-indicator,
.no-data {
  padding: 20px;
  text-align: center;
  color: #666;
}

.report-table {
  width: 100%;
  border-collapse: collapse;
}

.report-table th,
.report-table td {
  padding: 12px 16px;
  text-align: left;
  border-bottom: 1px solid #eee;
}

.report-table th {
  background-color: #f8f9fa;
  font-weight: 500;
  color: #3a0ca3;
}

.status-badge {
  display: inline-block;
  padding: 4px 8px;
  border-radius: 12px;
  font-size: 0.85rem;
  font-weight: 500;
}

.status-badge.new {
  background-color: #e3f2fd;
  color: #1976d2;
}

.status-badge.in_progress {
  background-color: #fff8e1;
  color: #ff8f00;
}

.status-badge.approved {
  background-color: #e8f5e9;
  color: #2e7d32;
}

.status-badge.rejected {
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

.risk-badge.low {
  background-color: #e8f5e9;
  color: #2e7d32;
}

.risk-badge.medium {
  background-color: #fff8e1;
  color: #ff8f00;
}

.risk-badge.high {
  background-color: #ffebee;
  color: #c62828;
}

@media (max-width: 768px) {
  .filters-grid {
    grid-template-columns: 1fr;
  }
}

.applications-report {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
  padding: 24px;
}

.generate-button {
  background: linear-gradient(90deg, #3A0CA3 0%, #4361EE 100%);
  color: white;
  border: none;
  padding: 12px 24px;
  border-radius: 6px;
  font-weight: 500;
  transition: all 0.3s;
}

.generate-button:hover {
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(58, 12, 163, 0.2);
}
</style>
