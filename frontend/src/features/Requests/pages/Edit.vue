<template>
  <div class="request-page">
    <div class="request-header">
      <h2>{{ $t('requests.one') + "#" + request.id }}</h2>
      <div class="right-buttons">
        <SubmitInput type="button" :value="$t('requests.buttons.discard')" @click="handleDiscard" style="margin: 0px 10px" />
        <SubmitInput type="button" :value="$t('requests.buttons.save')" @click="onClick" />
      </div>
    </div>
    <table>
      <tr v-for="field in fields">
        <td>{{ $t(`requests.model.fields.${field}`) }}</td>
        <td><InputField type="text" v-model="request[field]" /></td>
      </tr>
    </table>
  </div>
</template>

<script>
import InputField from '@/shared/components/input/InputField.vue';
import SubmitInput from '@/shared/components/input/SubmitInput.vue';

export default {
  components: {
    SubmitInput,
    InputField
  },

  data() {
    return {
      request: {
        id: 1,
        name: "test",
        value: "Test"
      }
    }
  },

  computed: {
    fields() {
      return Object.keys(this.request).filter(field => field !== "id")
    }
  },

  methods: {
    toShow() {
      this.$router.push(`/request/${this.request.id}`)
    },

    handleSave() {
      // Еще логику добавить
      this.toShow
    },

    handleDiscard() {
      this.toShow
    }
  }
}
</script>

<style>
.request-page {
  width: 90%;
  padding-top: 50px;
}

.request-page h2 {
  font-size: 36px;
  color: white;
  margin-bottom: 20px;
}

.request-page .request-header {
  display: flex;
  justify-content: space-between;
}

td .text-input {
  padding-bottom: 0px;
}

.request-header .right-buttons {
  display: flex;
}

.request-page table {
  padding-bottom: 20px;
}
</style>
