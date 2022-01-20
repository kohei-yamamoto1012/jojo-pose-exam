<template>
  <v-btn
    :color="color"
    large
    rounded
    :to="to"
  >
    <slot />
  </v-btn>
</template>

<script>
export default {
  props: {
    color: {
      type: String,
      default: 'primary'
    },
    to: {
      type: Object,
      required: true
    }
  },
  data: function () {
    return {

    }
  }
}
</script>

<style scoped>

</style>