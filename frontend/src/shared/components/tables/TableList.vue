<template>
  <table>
    <thead>
      <tr><th v-for="name in headers">{{ $t(`${localePath}.${name}`) }}</th></tr>
    </thead>
    <tbody>
      <tr v-for="object in data" :key="object.id">
        <td class="col-id"><router-link :to="`${linkPath}/${object.id}`">{{ object.id }}</router-link></td>
        <td v-for="key in headersWithoutID">{{ object[key] }}</td>
      </tr>
    </tbody>
  </table>
</template>

<script>
export default {
  props: {
    data: Object,
    linkPath: String,
    localePath: String,
  },

  computed: {
    headers() {
      return Object.keys(this.data[0])
    },

    headersWithoutID() {
      return this.headers.filter(key => key !== "id")
    }
  }
}
</script>

<style>
table {
  width: 100%;
  font-size: 16px;
  border-collapse: collapse;
}

table tbody {
  background: white;
}

table tr {
  height: 50px;
  background: #ffffff50;
}

th, td {
  padding-left: 20px;
  text-align: start;
}

td.col-id {
  width: 150px;
}

th:first-child {
  border-top-left-radius: 15px;
}

th:last-child {
  border-top-right-radius: 15px;
}
</style>
