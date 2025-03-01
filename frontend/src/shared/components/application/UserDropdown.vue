<template>
  <div class="dropdown">
    <router-link class="link" to="/user/:id">{{ 'User info' }}</router-link>
    <router-link class="link" to="/logout">{{ 'Exit' }}</router-link>
  </div>
</template>

<script>

</script>

<style>
.dropdown {
  position: absolute;
  top: 50px;
  right: 0px;
  width: 219px;
  background: #ffffff50;
}

.dropdown .link {
  display: flex;
  align-items: center;
  color: #484889;
  font-weight: bold;
  font-size: 16px;
  text-decoration: none;
  height: 50px;
  padding-left: 20px;
}

.dropdown .link:hover {
  background: #ffffff70;
}
</style>
