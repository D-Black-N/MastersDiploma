<template>
  <input class="custom-button" :type :id :value :disabled />
</template>

<script>
export default {
  props: {
    id: String,
    type: String,
    value: String,
    disabled: Boolean
  }
}
</script>

<style>
.custom-button {
  height: 40px;
  border: none;
  border-radius: 20px;
  background: #E8662F80;
  color: #484889;
  font-weight: bold;
  font-size: 16px;
  min-width: 150px;
  margin: 10px;
}

.custom-button:hover {
  cursor: pointer;
  background: #E8662F;
}

.custom-button:disabled {
  cursor: default;
  background: #E8662F80;
}
</style>
