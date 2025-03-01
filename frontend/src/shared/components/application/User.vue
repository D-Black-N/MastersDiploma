<template>
  <div class="user">
    <div class="user-menu" @click="onClick">
      <p>Насибуллин Данил</p>
      <font-awesome-icon v-if="isActive" icon="chevron-up"/>
      <font-awesome-icon v-else icon="chevron-down"/>
      <UserDropdown v-if="isActive" />
    </div>
  </div>
</template>

<script>
import UserDropdown from '@/shared/components/application/UserDropdown.vue'

export default {
  components: {
    UserDropdown
  },

  data() {
    return {
      isActive: false
    }
  },

  methods: {
    onClick() {
      this.isActive = !this.isActive
    }
  }
}
</script>

<style>
.user {
  width: 30%;
  display: flex;
  justify-content: right;
}

.user .user-menu {
  display: flex;
  align-items: center;
  justify-content: right;
  padding: 10px 20px;
}

.user-menu p {
  margin-right: 10px;
}

.user .user-menu:hover {
  cursor: pointer;
  background: #ffffff70;
}

.user-menu p {
  color: #484889;
  font-weight: bold;
}
</style>
