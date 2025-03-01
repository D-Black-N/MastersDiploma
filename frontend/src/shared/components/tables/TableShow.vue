<template>
  <table>
    <tr v-for="field in fields">
      <td>{{ field }}</td>
      <td>{{ this.object[field] }}</td>
    </tr>
  </table>
</template>

<script>
export default {
  props: {
    object: Object,
  },

  computed: {
    fields() {
      return Object.keys(object).filter(field => field !== "id")
    }
  }
}
</script>

<style>

</style>
