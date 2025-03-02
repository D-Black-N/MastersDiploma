<template>
  <div class="request-create-page">
    <RequestHeader :header="$t('requests.pages.create')" :buttons="headerButtons" />
    <RequestForm />
  </div>
</template>

<script>
import RequestForm from '../components/RequestForm.vue';
import RequestHeader from '../components/RequestHeader.vue';

export default {
  components: {
    RequestForm,
    RequestHeader
  },

  data() {
    return {
      disabled: false,
      headerButtons: [
        { type: "button", id: "discard", value: "requests.buttons.discard", disabled: this.disabled, action: this.handleDiscard },
        { type: "submit", id: "submit", value: "requests.buttons.create", disabled: this.disabled, action: this.handleCreate }
      ],
    }
  },

  methods: {
    handleDiscard() {
      this.$router.push('/requests')
    },

    handleCreate() {
      
    }
  }
}
</script>

<style>
.request-create-page {
  width: 90%;
  padding-top: 50px;
}
</style>

