<template>
  <select :name :id class="select-input" @select="onSelect">
    <option value="">{{ placeholder }}</option>
    <option v-for="option in options" :value="option.value">{{ option.name }}</option>
  </select>
</template>

<script>
export default {
  props: {
    id: String,
    label: String,
    options: Object,
    required: Boolean,
    modelValue: String,
    placeholder: String,
  },

  methods: {
    onSelect() {

    }
  }
}
</script>

<style>
.select-input {
  padding: 10px;
  font-size: 16px;
  margin: 20px 10px;
  width: 420px;
  border: none;
  background: none;
  border-bottom: 2px solid #484889;
}

.select-input:focus {
  outline: none;
}

.select-input:hover {
  border-bottom: 2px solid #1d1d67;
}
</style>
