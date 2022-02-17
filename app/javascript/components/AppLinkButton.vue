<template>
  <v-btn
    :color="color"
    large
    rounded
    :to="to"
    dark
    :min-width="minWidth"
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
    },
    minWidth: {
      type: [ String, Number ],
      default: 'none'
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