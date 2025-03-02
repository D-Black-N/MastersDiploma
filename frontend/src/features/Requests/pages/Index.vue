<template>
  <div class="requests-list">
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
        { id: 1, client: 'Насибуллин Данил', user: 'Иванов Иван', status: "Status" },
        { id: 2, client: 'Насибуллин Данил', user: 'Иванов Иван', status: "Status" },
        { id: 3, client: 'Насибуллин Данил', user: 'Иванов Иван', status: "Status" },
        { id: 4, client: 'Насибуллин Данио', user: 'Иванов Иван', status: "Status" },
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
.requests-list {
  width: 90%;
  padding-top: 50px;
}
</style>
