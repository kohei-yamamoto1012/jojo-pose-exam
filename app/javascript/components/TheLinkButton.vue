<template>
  <v-btn
    :color="color"
    large
    rounded
    :to="{ name: toName}"
  >
    <slot></slot>
  </v-btn>
</template>

<script>
export default {
  data: function () {
    return {

    }
  },
  props: {
    color: {
      type: String,
      default: 'primary'
    },
    toName: {
      type: String,
      required: true
    }
  }
}
</script>

<style scoped>

</style>