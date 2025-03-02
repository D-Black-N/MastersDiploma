<template>
  <input :type
         :id
         :required
         :placeholder
         :value="modelValue"
         class="input-field"
         @input="$emit('update:modelValue', $event.target.value)" />
</template>

<script>
export default {
  props: {
    id: String,
    type: String,
    label: String,
    required: Boolean,
    errorNames: Object,
    modelValue: String,
    placeholder: String
  },
}
</script>

<style>
.input-field {
  padding: 10px;
  font-size: 16px;
  margin: 20px 10px;
  width: 400px;
  border: none;
  background: none;
  border-bottom: 2px solid #484889;
}

.input-field:focus {
  outline: none;
}

.input-field:hover {
  border-bottom: 2px solid #1d1d67;
}
</style>
