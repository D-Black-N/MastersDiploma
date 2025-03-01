<template>
  <div class="requests-container">
    <div class="requests-header">
      <h2>{{ $t('requests.many') }}</h2>
      <SubmitInput type="button" :value="$t('requests.buttons.create')" @click="onClick" />
    </div>
    <TableList :data="this.data" link-path="request" locale-path="requests.model.fields" />
  </div>
</template>

<script>
import SubmitInput from '@/shared/components/input/SubmitInput.vue';
import TableList from '@/shared/components/tables/TableList.vue'

export default {
  components: {
    TableList,
    SubmitInput
  },

  data() {
    return {
      data: [
        { id: 1, name: 'Test', value: 'Test' },
        { id: 2, name: 'Test', value: 'Test' },
        { id: 3, name: 'Test', value: 'Test' },
        { id: 4, name: 'Test', value: 'Test' },
      ]
    }
  },

  methods: {
    onClick() {
      this.$router.push("/requests/new")
    }
  }
}
</script>

<style scoped>
.requests-container {
  width: 90%;
  padding-top: 50px;
}

.requests-container .requests-header {
  display: flex;
  justify-content: space-between;
}

.requests-container .requests-header h2 {
  color: white;
  font-size: 36px;
  padding-left: 20px;
  margin-bottom: 30px;
}
</style>
