<template>
  <v-btn
    :color="color"
    large
    rounded
    :to="to"
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
    to: {
      type: Object,
      required: true
    }//,
    // toParams: {
    //   type: Object,
    //   required: false,
    // }
  }
}
</script>

<style scoped>

</style>