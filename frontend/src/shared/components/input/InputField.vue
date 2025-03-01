<template>
  <div class="text-input">
    <label :for="id" :class="{ required: this.required }">{{ label }}</label>
    <input :type :id :required :placeholder
      :value="modelValue"
      @input="$emit('update:modelValue', $event.target.value)" />
  </div>
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
.text-input {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
  padding-bottom: 30px;
  gap: 5px;
}

.text-input label {
  color: #484889;
  font-weight: bold;
  font-size: 16px;
  width: 50%;
  text-align: left;
}

.text-input input {
  border: none;
  border-radius: 2px;
  width: 50%;
  font-size: 16px;
  padding: 10px 20px;
}

.text-input label.required::after {
  content: "*";
  color: #f41212;
  font-size: 1em;
}
</style>
