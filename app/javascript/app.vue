<template>
  <v-app>
      <TheHeader />

      <v-main class="bg main">
        <v-container>
          <transition mode="out-in">
            <router-view />
          </transition>
        </v-container>
      </v-main>

      <TheFooter />
  </v-app>
</template>

<script>

import TheHeader from './components/TheHeader.vue'
import TheFooter from './components/TheFooter.vue'

export default {
  components: {
    TheHeader,
    TheFooter
  }
}
</script>

<style lang="scss" scoped>
.v-enter-active, .v-leave-active {
  transition: opacity .5s;
}
.v-enter, .v-leave-to {
  opacity: 0;
}

.bg{
  background-image: url('../assets/images/background');
  background-size: contain;
  background-repeat: repeat;
}

.main{
  color: var(--v-font-base);
}
</style>
