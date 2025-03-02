<template>
  <div class="requests-list-page">
    <RequestHeader :header="$t('requests.pages.list')" :buttons="headerButtons" />
    <RequestsList :requests="requests" />
  </div>
</template>

<script>
import RequestHeader from '../components/RequestHeader.vue';
import RequestsList from '../components/RequestsList.vue'

export default {
  components: {
    RequestHeader,
    RequestsList
  },

  data() {
    return {
      requests: [
        { id: 1, client: 'Насибуллин Данил', user: 'Иванов Иван', status: "Status", vehicle: "BMW M5" },
        { id: 2, client: 'Насибуллин Данил', user: 'Иванов Иван', status: "Status", vehicle: "Mercedes CLA" },
        { id: 3, client: 'Насибуллин Данил', user: 'Иванов Иван', status: "Status", vehicle: "Test" },
        { id: 4, client: 'Насибуллин Данио', user: 'Иванов Иван', status: "Status", vehicle: "Custom" },
      ],
      headerButtons: [
        { id: "create", type: "button", value: "requests.buttons.create", disabled: false, action: this.handleClick }
      ]
    }
  },

  methods: {
    handleClick() {
      this.$router.push("/requests/new")
    }
  }
}
</script>

<style>
.requests-list-page {
  width: 90%;
  padding-top: 50px;
}
</style>
