<template>
  <div class="d-flex flex-column min-vh-100">
    <TheHeader class="mb-auto" />
    <transition mode="out-in">
      <router-view />
    </transition>
    <TheFooter class="mt-auto" />
  </div>
</template>

<script>
import TheHeader from './components/TheHeader.vue'
import TheFooter from './components/TheFooter.vue'

export default {
  components: {
    TheHeader,
    TheFooter
  },
  data: function () {
    return {
    }
  }
}
</script>

<style scoped>
.v-enter-active, .v-leave-active {
  transition: opacity .5s;
}
.v-enter, .v-leave-to {
  opacity: 0;
}
</style>
