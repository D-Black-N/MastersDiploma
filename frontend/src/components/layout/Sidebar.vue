<template>
  <aside class="sidebar" :class="{ 'locked': isLocked }">
    <!-- Заглушка для заблокированного состояния -->
    <div v-if="isLocked" class="sidebar-lock-overlay">
      <!-- <div class="lock-message"> -->
        <!-- <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M12 15V17M6 21H18C19.1046 21 20 20.1046 20 19V13C20 11.8954 19.1046 11 18 11H6C4.89543 11 4 11.8954 4 13V19C4 20.1046 4.89543 21 6 21Z" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
          <path d="M16 11V7C16 4.79086 14.2091 3 12 3C9.79086 3 8 4.79086 8 7V11" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
        </svg>
        <p>Используйте кнопку "Назад" на странице</p> -->
      <!-- </div> -->
    </div>

    <!-- Основное содержимое панели -->
    <div class="sidebar-content">
      <!-- Лого и заголовок -->
      <div class="sidebar-header">
        <div class="logo">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M12 2L3 7L12 12L21 7L12 2Z" fill="white"/>
            <path d="M3 12L12 17L21 12" stroke="white" stroke-width="2"/>
            <path d="M3 17L12 22L21 17" stroke="white" stroke-width="2"/>
          </svg>
        </div>
        <h2 class="app-name">CSM System</h2>
      </div>

      <!-- Навигация -->
      <nav class="nav-menu">
        <router-link to="/requests" class="nav-item" active-class="active">
          <div class="nav-icon">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M9 5H7C5.89543 5 5 5.89543 5 7V19C5 20.1046 5.89543 21 7 21H17C18.1046 21 19 20.1046 19 19V7C19 5.89543 18.1046 5 17 5H15" stroke="currentColor" stroke-width="2"/>
              <path d="M12 12H15" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
              <path d="M12 16H15" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
              <path d="M9 5C9 3.89543 9.89543 3 11 3H13C14.1046 3 15 3.89543 15 5V7H9V5Z" stroke="currentColor" stroke-width="2"/>
            </svg>
          </div>
          <span class="nav-text">Список заявок</span>
        </router-link>

        <router-link to="/clients" class="nav-item" active-class="active">
          <div class="nav-icon">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M17 21V19C17 17.9391 16.5786 16.9217 15.8284 16.1716C15.0783 15.4214 14.0609 15 13 15H5C3.93913 15 2.92172 15.4214 2.17157 16.1716C1.42143 16.9217 1 17.9391 1 19V21" stroke="currentColor" stroke-width="2"/>
              <path d="M9 11C11.2091 11 13 9.20914 13 7C13 4.79086 11.2091 3 9 3C6.79086 3 5 4.79086 5 7C5 9.20914 6.79086 11 9 11Z" stroke="currentColor" stroke-width="2"/>
              <path d="M23 21V19C22.9993 18.1137 22.7044 17.2528 22.1614 16.5523C21.6184 15.8519 20.8581 15.3516 20 15.13" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
              <path d="M16 3.13C16.8604 3.3503 17.623 3.8507 18.1676 4.55231C18.7122 5.25392 19.0078 6.11683 19.0078 7.005C19.0078 7.89317 18.7122 8.75608 18.1676 9.45769C17.623 10.1593 16.8604 10.6597 16 10.88" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
            </svg>
          </div>
          <span class="nav-text">Список клиентов</span>
        </router-link>
      </nav>

      <!-- Профиль пользователя -->
      <div class="user-profile" @click="toggleAdminMenu">
        <div class="avatar">
          <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <circle cx="12" cy="7" r="5" stroke="currentColor" stroke-width="2"/>
            <path d="M17 14H7C4.79086 14 3 15.7909 3 18V21H21V18C21 15.7909 19.2091 14 17 14Z" stroke="currentColor" stroke-width="2"/>
          </svg>
        </div>
        <div class="user-info">
          <div class="user-name">Насибуллин Д.И.</div>
          <div class="user-role">Менеджер</div>
        </div>
        <button class="logout-btn" @click.stop="logout">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M13 12H22M22 12L18 16M22 12L18 8" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
            <path d="M14 7V5C14 4.46957 13.7893 3.96086 13.4142 3.58579C13.0391 3.21071 12.5304 3 12 3H5C4.46957 3 3.96086 3.21071 3.58579 3.58579C3.21071 3.96086 3 4.46957 3 5V19C3 19.5304 3.21071 20.0391 3.58579 20.4142C3.96086 20.7893 4.46957 21 5 21H12C12.5304 21 13.0391 20.7893 13.4142 20.4142C13.7893 20.0391 14 19.5304 14 19V17" stroke="currentColor" stroke-width="2"/>
          </svg>
        </button>

        <!-- Выпадающее меню администратора -->
        <transition name="slide-down">
          <div v-if="showAdminMenu && isAdmin" class="admin-menu">
            <router-link 
              to="/admin" 
              class="admin-menu-item"
              @click.native="hideAdminMenu"
            >
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M12 15C13.6569 15 15 13.6569 15 12C15 10.3431 13.6569 9 12 9C10.3431 9 9 10.3431 9 12C9 13.6569 10.3431 15 12 15Z" stroke="currentColor" stroke-width="2"/>
                <path d="M19.4 15C19.2669 15.3016 19.227 15.6362 19.2851 15.9606C19.3432 16.285 19.497 16.5843 19.726 16.8185C19.955 17.0527 20.2484 17.2105 20.5675 17.2707C20.8866 17.3309 21.216 17.2904 21.51 17.155L21.6 17.1C21.6 17.1 21.6 17.1 21.6 17.1C22.4 16.6 22.4 15.5 21.6 15L19.4 15Z" stroke="currentColor" stroke-width="2"/>
                <path d="M4.6 15C4.73314 15.3016 4.773 15.6362 4.71491 15.9606C4.65681 16.285 4.50302 16.5843 4.27402 16.8185C4.04502 17.0527 3.75159 17.2105 3.43249 17.2707C3.1134 17.3309 2.78404 17.2904 2.49 17.155L2.4 17.1C2.4 17.1 2.4 17.1 2.4 17.1C1.6 16.6 1.6 15.5 2.4 15L4.6 15Z" stroke="currentColor" stroke-width="2"/>
                <path d="M17.155 21.51C17.2904 21.216 17.3309 20.8866 17.2707 20.5675C17.2105 20.2484 17.0527 19.955 16.8185 19.726C16.5843 19.497 16.285 19.3432 15.9606 19.2851C15.6362 19.227 15.3016 19.2669 15 19.4L15 21.6C15 21.6 15 21.6 15 21.6C15.5 22.4 16.6 22.4 17.1 21.6L17.155 21.51Z" stroke="currentColor" stroke-width="2"/>
                <path d="M6.845 21.51C6.70964 21.216 6.66911 20.8866 6.72929 20.5675C6.78948 20.2484 6.94728 19.955 7.18148 19.726C7.41568 19.497 7.71504 19.3432 8.03944 19.2851C8.36384 19.227 8.69842 19.2669 9 19.4L9 21.6C9 21.6 9 21.6 9 21.6C8.5 22.4 7.4 22.4 6.9 21.6L6.845 21.51Z" stroke="currentColor" stroke-width="2"/>
                <path d="M15 4.6C15.3016 4.73314 15.6362 4.773 15.9606 4.71491C16.285 4.65681 16.5843 4.50302 16.8185 4.27402C17.0527 4.04502 17.2105 3.75159 17.2707 3.43249C17.3309 3.1134 17.2904 2.78404 17.155 2.49L17.1 2.4C17.1 2.4 17.1 2.4 17.1 2.4C16.6 1.6 15.5 1.6 15 2.4L15 4.6Z" stroke="currentColor" stroke-width="2"/>
                <path d="M9 4.6C8.69842 4.73314 8.36384 4.773 8.03944 4.71491C7.71504 4.65681 7.41568 4.50302 7.18148 4.27402C6.94728 4.04502 6.78948 3.75159 6.72929 3.43249C6.66911 3.1134 6.70964 2.78404 6.845 2.49L6.9 2.4C6.9 2.4 6.9 2.4 6.9 2.4C7.4 1.6 8.5 1.6 9 2.4L9 4.6Z" stroke="currentColor" stroke-width="2"/>
              </svg>
              Панель администратора
            </router-link>
          </div>
        </transition>
      </div>
    </div>
  </aside>
</template>

<script>
import { mapActions } from 'pinia'
import { useAuthStore } from '@/store/auth'

export default {
  props: {
    isLocked: {
      type: Boolean,
      default: false
    }
  },

  data() {
    return {
      newApplicationsCount: 3,
      showAdminMenu: false,
      isAdmin: true // В реальном приложении это должно приходить из store/auth
    }
  },

  methods: {
    ...mapActions(useAuthStore, ['logout']),

    toggleAdminMenu() {
      if (this.isAdmin) {
        this.showAdminMenu = !this.showAdminMenu
      }
    },

    hideAdminMenu() {
      this.showAdminMenu = false
    },

    handleLogout() {
      this.logout() // Вызываем действие хранилища
      this.$router.push({ name: 'Login' }) // Используем this.$router для навигации
    },

    lockMenu() {
      this.isLocked = !this.isLocked
    }
  }
}
</script>

<style scoped>
.sidebar {
  width: 280px;
  height: 95vh;
  background: linear-gradient(180deg, #3A0CA3 0%, #4361EE 100%);
  color: white;
  display: flex;
  flex-direction: column;
  padding: 24px;
  box-shadow: 4px 0 20px rgba(0, 0, 0, 0.1);
}

.sidebar-header {
  display: flex;
  align-items: center;
  margin-bottom: 40px;
}

.logo {
  width: 36px;
  height: 36px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-right: 12px;
}

.app-name {
  font-size: 18px;
  font-weight: 600;
}

.nav-menu {
  display: flex;
  flex-direction: column;
  gap: 8px;
  flex-grow: 1;
}

.nav-item {
  display: flex;
  align-items: center;
  padding: 12px 16px;
  border-radius: 8px;
  color: rgba(255, 255, 255, 0.8);
  text-decoration: none;
  transition: all 0.2s ease;
  position: relative;
}

.nav-item:hover {
  background: rgba(255, 255, 255, 0.1);
  color: white;
}

.nav-item.active {
  background: rgba(255, 255, 255, 0.15);
  color: white;
  font-weight: 500;
}

.nav-icon {
  margin-right: 12px;
  display: flex;
}

.nav-text {
  flex-grow: 1;
}

.nav-badge {
  background: #F72585;
  color: white;
  font-size: 12px;
  font-weight: 600;
  padding: 2px 8px;
  border-radius: 10px;
}

.sidebar-content {
  display: flex;
  flex-direction: column;
  height: 95vh;
}

.user-profile {
  display: flex;
  align-items: center;
  padding: 16px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 12px;
  margin-top: auto;
}

.avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.1);
  display: flex;
  align-items: center;
  justify-content: center;
  margin-right: 12px;
}

.user-info {
  flex-grow: 1;
}

.user-name {
  font-weight: 500;
  font-size: 14px;
}

.user-role {
  font-size: 12px;
  opacity: 0.8;
}

.logout-btn {
  background: none;
  border: none;
  color: white;
  opacity: 0.7;
  cursor: pointer;
  transition: opacity 0.2s;
  padding: 4px;
}

.logout-btn:hover {
  opacity: 1;
}

.user-profile {
  position: relative;
  cursor: pointer;
}

.admin-menu {
  position: absolute;
  bottom: 100%;
  left: 0;
  width: 100%;
  background: white;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
  overflow: hidden;
  z-index: 10;
  margin-bottom: 10px;
}

.admin-menu-item {
  display: flex;
  align-items: center;
  padding: 12px 16px;
  color: #3A0CA3;
  text-decoration: none;
  font-weight: 500;
  transition: background 0.2s;
}

.admin-menu-item svg {
  margin-right: 10px;
  color: #4361EE;
}

.admin-menu-item:hover {
  background: #f3f4ff;
}

/* Анимация выпадающего меню */
.slide-down-enter-active, .slide-down-leave-active {
  transition: all 0.3s ease;
  transform-origin: top center;
}

.slide-down-enter, .slide-down-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}

.sidebar.locked {
  position: relative;
}

.sidebar-lock-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 10;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  color: white;
}
</style>
