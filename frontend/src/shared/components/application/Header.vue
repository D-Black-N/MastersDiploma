<template>
  <div class="header">
    <Links />
    <User />
  </div>
</template>

<script>
import Links from './Links.vue';
import User from './User.vue';

export default {
  components: {
    Links,
    User
  }
}
</script>

<style>
.header {
  width: 100%;
  height: 50px;
  display: flex;
  justify-content: space-between;
  background: #ffffff50;
}
</style>
