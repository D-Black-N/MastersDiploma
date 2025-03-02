<template>
  <table class="requests-list">
    <tr class="requests-list-header">
      <th class="cell-id">{{ $t('requests.model.fields.id') }}</th>
      <th>{{ $t('requests.model.fields.client') }}</th>
      <th>{{ $t('requests.model.fields.user') }}</th>
      <th>{{ $t('requests.model.fields.status') }}</th>
      <th></th>
    </tr>
    <tr v-for="request in requests" class="requests-list-body">
      <td class="cell-id"><router-link :to="`/request/${request.id}`">#{{ request.id }}</router-link></td>
      <td>{{ request.client }}</td>
      <td>{{ request.user }}</td>
      <td>{{ request.status }}</td>
    </tr>
  </table>
</template>

<script>
export default {
  props: {
    requests: Object
  }
}
</script>

<style>
.requests-list {
  border-collapse: collapse;
  width: 100%;
  font-size: 18px;
  font-weight: bold;
}

.requests-list-header {
  background: #E8662F80;
  color: #484889;
}

.requests-list td, .requests-list th {
  padding: 10px;
  text-align: left;
}

.requests-list .cell-id {
  text-align: center;
}

.requests-list-header th:first-child {
  border-top-left-radius: 20px;
}

.requests-list-header th:last-child {
  border-top-right-radius: 20px;
}

.requests-list .requests-list-body:hover {
  background: #ffffff10;
}
</style>
