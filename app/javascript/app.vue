<template>
  <v-app>
    <TheHeader />

    <v-main class="bg main mb-16">
      <v-container>
        <transition 
          name="page"
          mode="out-in"
        >
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

<style lang="scss">
.content-enter{
  opacity: 0;
}
.content-enter-active{
  transition: opacity 1.1s;
}
</style>

<style lang="scss" scoped>
.bg{
  background-image: url('../assets/images/background');
  background-size: contain;
  background-repeat: repeat;
}

.main{
  color: var(--v-font-base);
}
</style>
