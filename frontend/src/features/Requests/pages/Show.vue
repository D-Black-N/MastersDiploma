<template>
  <div class="request-show-page">
    <RequestHeader :header="$t('requests.pages.show', { id: request.id })" :buttons="headerButtons" />
    <RequestShow :request="request" />
  </div>
</template>

<script>
import RequestHeader from '../components/RequestHeader.vue';
import RequestShow from '../components/RequestShow.vue';

export default {
  components: {
    RequestHeader,
    RequestShow,
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
        { type: "button", id: "edit", value: "requests.buttons.edit", disabled: false, action: this.handleClick },
      ]
    }
  },

  methods: {
    handleClick() {
      this.$router.push(`/request/${this.request.id}/edit`)
    }
  }
}
</script>

<style>
.request-show-page {
  width: 90%;
  padding-top: 50px;
}
</style>
