<template>
  <div class="page-links">
    <router-link class="link" to="/requests">{{ $t('requests.list') }}</router-link>
    <router-link class="link" to="/clients">{{ 'Clients' }}</router-link>
    <router-link class="link" to="/admin">{{ 'Admin' }}</router-link>
  </div>
</template>

<style>
.page-links {
  display: flex;
  width: 70%;
  justify-content: left;
}

.page-links .link {
  flex-grow: 1;
  text-align: center;
  align-content: center;
  color: #484889;
  font-weight: bold;
  font-size: 16px;
  text-decoration: none;
}

.page-links .link:hover {
  background: #ffffff70;
}

.page-links .router-link-active {
  background: #ffffff70;
}
</style>
