<template>
  <table class="request-show">
    <tr>
      <th>{{ $t('requests.model.fields.id') }}</th>
      <td>{{ request.id }}</td>
    </tr>
    <tr>
      <th>{{ $t('requests.model.fields.status') }}</th>
      <td>{{ request.status }}</td>
    </tr>
    <tr>
      <th>{{ $t('requests.model.fields.leasing_term') }}</th>
      <td>{{ request.leasing_term.value + $t(`dates.${request.leasing_term.type}`) }}</td>
    </tr>
    <tr>
      <th>{{ $t('requests.model.fields.payment_type') }}</th>
      <td>{{ $t(`requests.model.enums.payment_type.${request.payment_type}`) }}</td>
    </tr>
    <tr>
      <th>{{ $t('requests.model.fields.conditions') }}</th>
      <td>{{ request.conditions }}</td>
    </tr>
    <tr>
      <th>{{ $t('requests.model.fields.user') }}</th>
      <td><router-link :to="`/admin/user/${request.user.id}`">{{ request.user.full_name }}</router-link></td>
    </tr>
    <tr>
      <th>{{ $t('requests.model.fields.client') }}</th>
      <td><router-link :to="`/client/${request.client.id}`">{{ request.client.full_name }}</router-link></td>
    </tr>
    <tr>
      <th>{{ $t('requests.model.fields.vehicle') }}</th>
      <td>{{ request.vehicle.vin + " " + request.vehicle.brand + " " + request.vehicle.model }}</td>
    </tr>
    <tr>
      <th>{{ $t('requests.model.fields.comment') }}</th>
      <td>{{ request.comment }}</td>
    </tr>
  </table>
</template>

<script>
export default {
  props: {
    request: Object
  }
}
</script>

<style>
.request-show {
  height: 90%;
  background: #ffffff50;
  border-radius: 50px;
  padding: 50px;
  padding-right: 0;
  width: 100%;
  table-layout: fixed;
  text-align: left;
}

.request-show th {
  padding: 10px;
}
</style>
