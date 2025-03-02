<template>
  <div class="request-header">
    <h2>{{ header }}</h2>
    <div class="right-buttons">
      <CustomButton v-for="button in buttons"
                    :type="button.type"
                    :id="button.id"
                    :value="$t(button.value)"
                    :disabled="button.disabled"
                    @click="button.action" />
    </div>
  </div>
</template>

<script>
import CustomButton from '@/shared/components/input/CustomButton.vue';

export default {
  components: {
    CustomButton
  },

  props: {
    header: String,
    buttons: Object
  }
}
</script>

<style>
.request-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.request-header h2 {
  padding-left: 40px;
  font-size: 36px;
  color: white;
  margin-bottom: 10px;
}

.request-header .right-buttons {
  display: flex;
  padding-top: 5px;
}
</style>
