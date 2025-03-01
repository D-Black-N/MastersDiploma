<template>
  <div class="submit-input">
    <input :type :id :value :disabled />
  </div>
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
.submit-input input {
  height: 40px;
  border: none;
  border-radius: 20px;
  background: #E8662F80;
  color: #484889;
  font-weight: bold;
  font-size: 16px;
  padding: 0px 10px;
  min-width: 150px;
}

.submit-input input:hover {
  cursor: pointer;
  background: #E8662F;
}

.submit-input input:disabled {
  cursor: default;
  background: #E8662F80;
}
</style>
