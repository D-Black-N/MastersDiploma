<template>
  <div class="admin-layout">
    <!-- Горизонтальное меню в новой цветовой гамме -->
    <nav class="admin-menu">
      <router-link 
        to="/admin/clients-report" 
        class="menu-item"
        active-class="active"
        exact-active-class="exact-active"
      >
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="menu-icon">
          <path d="M17 21V19C17 17.9391 16.5786 16.9217 15.8284 16.1716C15.0783 15.4214 14.0609 15 13 15H5C3.93913 15 2.92172 15.4214 2.17157 16.1716C1.42143 16.9217 1 17.9391 1 19V21" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
          <path d="M9 11C11.2091 11 13 9.20914 13 7C13 4.79086 11.2091 3 9 3C6.79086 3 5 4.79086 5 7C5 9.20914 6.79086 11 9 11Z" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
          <path d="M23 21V19C22.9993 18.1137 22.7044 17.2528 22.1614 16.5523C21.6184 15.8519 20.8581 15.3516 20 15.13" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
          <path d="M16 3.13C16.8604 3.3503 17.623 3.8507 18.1676 4.55231C18.7122 5.25392 19.0078 6.11683 19.0078 7.005C19.0078 7.89317 18.7122 8.75608 18.1676 9.45769C17.623 10.1593 16.8604 10.6597 16 10.88" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
        </svg>
        <span class="menu-text">Отчет по клиентам</span>
      </router-link>
      
      <router-link 
        to="/admin/requests-report" 
        class="menu-item"
        active-class="active"
        exact-active-class="exact-active"
      >
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="menu-icon">
          <path d="M14 2H6C5.46957 2 4.96086 2.21071 4.58579 2.58579C4.21071 2.96086 4 3.46957 4 4V20C4 20.5304 4.21071 21.0391 4.58579 21.4142C4.96086 21.7893 5.46957 22 6 22H18C18.5304 22 19.0391 21.7893 19.4142 21.4142C19.7893 21.0391 20 20.5304 20 20V8L14 2Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          <path d="M14 2V8H20" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          <path d="M16 13H8" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          <path d="M16 17H8" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          <path d="M10 9H9H8" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <span class="menu-text">Отчет по заявкам</span>
      </router-link>
      
      <router-link 
        to="/admin/users" 
        class="menu-item"
        active-class="active"
        exact-active-class="exact-active"
      >
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="menu-icon">
          <path d="M12 15C13.6569 15 15 13.6569 15 12C15 10.3431 13.6569 9 12 9C10.3431 9 9 10.3431 9 12C9 13.6569 10.3431 15 12 15Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          <path d="M19.4 15C19.2669 15.3016 19.227 15.6362 19.2851 15.9606C19.3432 16.285 19.497 16.5843 19.726 16.8185C19.955 17.0527 20.2484 17.2105 20.5675 17.2707C20.8866 17.3309 21.216 17.2904 21.51 17.155L21.6 17.1C21.6 17.1 21.6 17.1 21.6 17.1C22.4 16.6 22.4 15.5 21.6 15L19.4 15Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          <path d="M4.6 15C4.73314 15.3016 4.773 15.6362 4.71491 15.9606C4.65681 16.285 4.50302 16.5843 4.27402 16.8185C4.04502 17.0527 3.75159 17.2105 3.43249 17.2707C3.1134 17.3309 2.78404 17.2904 2.49 17.155L2.4 17.1C2.4 17.1 2.4 17.1 2.4 17.1C1.6 16.6 1.6 15.5 2.4 15L4.6 15Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          <path d="M17.155 21.51C17.2904 21.216 17.3309 20.8866 17.2707 20.5675C17.2105 20.2484 17.0527 19.955 16.8185 19.726C16.5843 19.497 16.285 19.3432 15.9606 19.2851C15.6362 19.227 15.3016 19.2669 15 19.4L15 21.6C15 21.6 15 21.6 15 21.6C15.5 22.4 16.6 22.4 17.1 21.6L17.155 21.51Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          <path d="M6.845 21.51C6.70964 21.216 6.66911 20.8866 6.72929 20.5675C6.78948 20.2484 6.94728 19.955 7.18148 19.726C7.41568 19.497 7.71504 19.3432 8.03944 19.2851C8.36384 19.227 8.69842 19.2669 9 19.4L9 21.6C9 21.6 9 21.6 9 21.6C8.5 22.4 7.4 22.4 6.9 21.6L6.845 21.51Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          <path d="M15 4.6C15.3016 4.73314 15.6362 4.773 15.9606 4.71491C16.285 4.65681 16.5843 4.50302 16.8185 4.27402C17.0527 4.04502 17.2105 3.75159 17.2707 3.43249C17.3309 3.1134 17.2904 2.78404 17.155 2.49L17.1 2.4C17.1 2.4 17.1 2.4 17.1 2.4C16.6 1.6 15.5 1.6 15 2.4L15 4.6Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          <path d="M9 4.6C8.69842 4.73314 8.36384 4.773 8.03944 4.71491C7.71504 4.65681 7.41568 4.50302 7.18148 4.27402C6.94728 4.04502 6.78948 3.75159 6.72929 3.43249C6.66911 3.1134 6.70964 2.78404 6.845 2.49L6.9 2.4C6.9 2.4 6.9 2.4 6.9 2.4C7.4 1.6 8.5 1.6 9 2.4L9 4.6Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
        <span class="menu-text">Список пользователей</span>
      </router-link>
    </nav>

    <!-- Контент страницы -->
    <div class="admin-content">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
export default {
  name: 'AdminLayout'
}
</script>

<style scoped>
.admin-layout {
  display: flex;
  flex-direction: column;
  height: 100%;
}

.admin-menu {
  display: flex;
  background: linear-gradient(90deg, #3A0CA3 0%, #4361EE 100%);
  padding: 0 20px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.menu-item {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 16px 24px;
  color: rgba(255, 255, 255, 0.8);
  text-decoration: none;
  font-weight: 500;
  transition: all 0.3s;
  border-bottom: 3px solid transparent;
  position: relative;
}

.menu-item:hover {
  color: white;
  background-color: rgba(255, 255, 255, 0.1);
}

.menu-item.active {
  color: white;
  background-color: rgba(255, 255, 255, 0.1);
}

.menu-item.exact-active {
  border-bottom-color: #F72585;
}

.menu-icon {
  stroke: currentColor;
}

.menu-text {
  white-space: nowrap;
}

.admin-content {
  flex: 1;
  padding: 24px;
  background: #f5f7fa;
  overflow-y: auto;
}

@media (max-width: 768px) {
  .admin-menu {
    overflow-x: auto;
    padding: 0 10px;
  }
  
  .menu-item {
    padding: 12px 16px;
    font-size: 0.9rem;
  }
  
  .menu-icon {
    display: none;
  }
}
</style>
