<template>
  <div class="client-documents-view">
    <!-- Шапка страницы -->
    <div class="page-header">
      <div class="header-content">
        <button class="back-button" @click="goBack">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M19 12H5M12 19l-7-7 7-7" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
          Назад
        </button>
        <div class="header-title">
          <h1>Документы клиента</h1>
          <div class="client-info">
            {{ client.name }} (ID: {{ client.id }})
          </div>
        </div>
      </div>
      <button class="submit-button" @click="submitForVerification">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M22 11.08V12C21.9988 14.1564 21.3005 16.2547 20.0093 17.9818C18.7182 19.709 16.9033 20.9725 14.8354 21.5839C12.7674 22.1953 10.5573 22.1219 8.53447 21.3746C6.51168 20.6273 4.78465 19.2461 3.61096 17.4371C2.43727 15.628 1.87979 13.4881 2.02168 11.3363C2.16356 9.18455 2.99721 7.13631 4.39828 5.49706C5.79935 3.85781 7.69279 2.71537 9.79619 2.24013C11.8996 1.7649 14.1003 1.98232 16.07 2.86" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          <path d="M22 4L12 14.01L9 11.01" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        Отправить на проверку
      </button>
    </div>

    <!-- Основное содержимое -->
    <div class="documents-container">
      <!-- Кнопка загрузки -->
      <div class="upload-section">
        <button class="upload-button">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M21 15V19C21 19.5304 20.7893 20.0391 20.4142 20.4142C20.0391 20.7893 19.5304 21 19 21H5C4.46957 21 3.96086 20.7893 3.58579 20.4142C3.21071 20.0391 3 19.5304 3 19V15" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M17 8L12 3L7 8" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M12 3V15" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
          Загрузить документ
        </button>
      </div>

      <!-- Список документов -->
      <div class="documents-list">
        <div v-for="document in documents" :key="document.id" class="document-card">
          <div class="document-icon">
            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M14 2H6C5.46957 2 4.96086 2.21071 4.58579 2.58579C4.21071 2.96086 4 3.46957 4 4V20C4 20.5304 4.21071 21.0391 4.58579 21.4142C4.96086 21.7893 5.46957 22 6 22H18C18.5304 22 19.0391 21.7893 19.4142 21.4142C19.7893 21.0391 20 20.5304 20 20V8L14 2Z" stroke="#4361EE" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M14 2V8H20" stroke="#4361EE" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
          </div>
          <div class="document-info">
            <div class="document-name">{{ document.name }}</div>
            <div class="document-meta">
              <span>{{ document.type }}</span>
              <span>{{ formatDate(document.uploaded_at) }}</span>
              <span>{{ formatSize(document.size) }}</span>
            </div>
          </div>
          <div class="document-actions">
            <button class="action-button view-button" @click="viewDocument(document)">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M1 12C1 12 5 4 12 4C19 4 23 12 23 12C23 12 19 20 12 20C5 20 1 12 1 12Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M12 15C13.6569 15 15 13.6569 15 12C15 10.3431 13.6569 9 12 9C10.3431 9 9 10.3431 9 12C9 13.6569 10.3431 15 12 15Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </button>
            <button class="action-button download-button" @click="downloadDocument(document)">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M21 15V19C21 19.5304 20.7893 20.0391 20.4142 20.4142C20.0391 20.7893 19.5304 21 19 21H5C4.46957 21 3.96086 20.7893 3.58579 20.4142C3.21071 20.0391 3 19.5304 3 19V15" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M7 10L12 15L17 10" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M12 15V3" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </button>
            <button class="action-button delete-button" @click="deleteDocument(document)">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M3 6H5H21" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M8 6V4C8 3.46957 8.21071 3.96086 8.58579 3.58579C8.96086 3.21071 9.46957 3 10 3H14C14.5304 3 15.0391 3.21071 15.4142 3.58579C15.7893 3.96086 16 3.46957 16 4V6M19 6V20C19 20.5304 18.7893 21.0391 18.4142 21.4142C18.0391 21.7893 17.5304 22 17 22H7C6.46957 22 5.96086 21.7893 5.58579 21.4142C5.21071 21.0391 5 20.5304 5 20V6H19Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </button>
          </div>
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
        id: this.$route.params.id,
        name: 'Иванов Иван Иванович'
      },
      documents: [
        {
          id: 1,
          name: '2-НДФЛ',
          type: 'NDFL',
          uploaded_at: '2023-05-15T10:30:00',
          size: 245678,
          url: '/documents/passport.pdf'
        }
      ]
    }
  },
  methods: {
    goBack() {
      this.$router.go(-1)
    },

    formatDate(dateString) {
      const options = { day: '2-digit', month: '2-digit', year: 'numeric' }
      return new Date(dateString).toLocaleDateString('ru-RU', options)
    },

    formatSize(bytes) {
      if (bytes < 1024) return bytes + ' Б'
      if (bytes < 1048576) return (bytes / 1024).toFixed(1) + ' КБ'
      return (bytes / 1048576).toFixed(1) + ' МБ'
    },

    viewDocument(document) {
      console.log('Просмотр документа:', document.url)
      // Реализация просмотра документа
    },

    downloadDocument(document) {
      console.log('Скачивание документа:', document.url)
      // Реализация скачивания
    },

    deleteDocument(document) {
      if (confirm(`Удалить документ "${document.name}"?`)) {
        console.log('Удаление документа:', document.id)
        // Реализация удаления
      }
    },

    submitForVerification() {
      if (confirm('Отправить все документы на проверку?')) {
        console.log('Отправка документов на проверку')
        // Реализация отправки
      }
    }
  }
}
</script>

<style scoped>
.client-documents-view {
  padding: 24px;
  height: 100%;
}

.page-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 24px;
  gap: 16px;
}

.header-content {
  display: flex;
  align-items: flex-start;
  gap: 16px;
}

.header-title {
  flex: 1;
}

.header-title h1 {
  margin-top: 0;
}

.back-button {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-top: 5px;
  padding: 8px 12px;
  background-color: #f0f0f0;
  color: #333;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.2s;
  white-space: nowrap;
}

.back-button:hover {
  background-color: #e0e0e0;
}

.back-button svg {
  stroke: currentColor;
}

.client-info {
  color: #666;
  font-size: 0.9rem;
  margin-top: 4px;
}

.submit-button {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 8px 12px;
  margin-top: 5px;
  background-color: #4cc9f0;
  color: white;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.2s;
  white-space: nowrap;
}

.submit-button:hover {
  background-color: #3a9fc5;
}

.submit-button svg {
  stroke: currentColor;
}

.documents-container {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  padding: 24px;
}

.upload-section {
  margin-bottom: 24px;
  padding-bottom: 16px;
  border-bottom: 1px solid #eee;
}

.upload-button {
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

.upload-button:hover {
  background-color: #3a0ca3;
}

.upload-button svg {
  stroke: currentColor;
}

.documents-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.document-card {
  display: flex;
  align-items: center;
  padding: 12px;
  border: 1px solid #eee;
  border-radius: 6px;
  transition: box-shadow 0.2s;
}

.document-card:hover {
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.document-icon {
  margin-right: 16px;
}

.document-info {
  flex: 1;
}

.document-name {
  font-weight: 500;
  margin-bottom: 4px;
}

.document-meta {
  display: flex;
  gap: 12px;
  font-size: 0.8rem;
  color: #666;
}

.document-actions {
  display: flex;
  gap: 8px;
}

.action-button {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 32px;
  height: 32px;
  border: none;
  border-radius: 50%;
  cursor: pointer;
  transition: background-color 0.2s;
}

.view-button {
  background-color: #e3f2fd;
  color: #1976d2;
}

.view-button:hover {
  background-color: #bbdefb;
}

.download-button {
  background-color: #e8f5e9;
  color: #2e7d32;
}

.download-button:hover {
  background-color: #c8e6c9;
}

.delete-button {
  background-color: #ffebee;
  color: #c62828;
}

.delete-button:hover {
  background-color: #ffcdd2;
}

.action-button svg {
  stroke: currentColor;
}

@media (max-width: 768px) {
  .page-header {
    flex-direction: column;
    align-items: stretch;
  }
  
  .header-content {
    flex-direction: column;
    gap: 12px;
  }
  
  .document-meta {
    flex-direction: column;
    gap: 4px;
  }
}
</style>
