<template>
  <div class="request-edit-page">
    <RequestHeader :header="$t('requests.pages.edit')" :buttons="headerButtons" />
    <RequestForm :request="request" />
  </div>
</template>

<script>
import RequestForm from '../components/RequestForm.vue';
import RequestHeader from '../components/RequestHeader.vue';

export default {
  components: {
    RequestHeader,
    RequestForm
  },

  data() {
    return {
      request: {
        id: 1,
        client: { id: 1, full_name: "Насибуллин Данил" },
        user: { id: 1, full_name: "Иванов Иван" },
        status: "Status",
        leasing_term: { value: 12, type: "month" },
        payment_type: "cash",
        conditions: {},
        verification_result: "approved",
        vehicle: { id: 1, brand: "BMW", model: "M5", vin: "111111111" },
      },
      headerButtons: [
        { type: "button", id: "discard", value: "requests.buttons.discard", disabled: false, action: this.handleDiscard },
        { type: "button", id: "save", value: "requests.buttons.save", disabled: false, action: this.handleSubmit },
      ]
    }
  },

  methods: {
    handleDiscard() {
      this.$router.push(`/request/${this.request.id}`)
    },

    handleSubmit() {
      this.$router.push(`/request/${this.request.id}`)
    }
  }
}
</script>

<style>
.request-edit-page {
  width: 90%;
  padding-top: 50px;
}
</style>
