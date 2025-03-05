<template>
  <form class="request-form">
    <table>
      <tr>
        <td class="label">{{ $t('requests.model.fields.vehicle') }}</td>
        <td><SelectField id="select-vehicle" :options="this.vehicles" v-model="request.vehicle.id" /></td>
      </tr>
      <tr>
        <td class="label">{{$t('requests.model.fields.client') }}</td>
        <td><SelectField id="select-client" :options="this.clients" v-model="request.client.id" /></td>
        <td><CustomButton type="button" :value="$t('requests.buttons.create')" @click="handleCreateClient"/></td>
      </tr>
      <tr>
        <td class="label">{{ $t('requests.model.fields.leasing_term') }}</td>
        <td><InputField v-model="request.leasing_term.value" /></td>
      </tr>
      <tr>
        <td class="label">{{ $t('requests.model.fields.payment_type') }}</td>
        <td><InputField v-model="request.payment_type" /></td>
      </tr>
      <tr>
        <td class="label">{{ $t('requests.model.fields.comment') }}</td>
        <td><InputField v-model="request.comment" /></td>
      </tr>
    </table>
  </form>
</template>

<script>
import CustomButton from '@/shared/components/input/CustomButton.vue';
import InputField from '@/shared/components/input/InputField.vue';
import SelectField from '@/shared/components/input/SelectField.vue';

export default {
  components: {
    InputField,
    SelectField,
    CustomButton
  },

  props: {
    request: Object
  },

  data() {
    return {
      vehicles: [{ id: 1, name: "BMW" }, { id: 2, name: "Mercedes" }],
      clients: [{ id: 1, name: 'Насибуллин Данил' }, { id: 2, name: 'Иван Иванов' }]
    }
  },

  methods: {
    handleCreateClient() {
      this.$router.push(`/clients/new`)
    }
  }
}
</script>

<style>
.request-form {
  height: 90%;
  background: #ffffff50;
  border-radius: 50px;
  padding-top: 50px;
  padding-left: 50px;
  gap: 20px;
  display: flex;
  flex-flow: column;
}

.request-form .input-block {
  display: flex;
}

.request-form .label {
  font-weight: bold;
  color: white;
}

.request-form table {
  font-size: 18px;
  table-layout: auto;
  width: 100%;
  border-collapse: collapse;
}

.request-form td {
  width: auto;
  white-space: nowrap;
}
</style>
