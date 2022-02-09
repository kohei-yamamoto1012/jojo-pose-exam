<template>
  <v-app>
    <TheHeader />

    <v-main class="bg main">
      <v-container>
        <NotFound v-if="isNotFound" />
        <transition 
          name="page"
          mode="out-in"
          v-else
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
import NotFound from './pages/shared/NotFound.vue'
import { mapGetters, mapMutations } from 'vuex'

export default {
  components: {
    TheHeader,
    TheFooter,
    NotFound
  },
  computed: {
    ...mapGetters('isNotFound', ['isNotFound']),
  },
  methods: {
    ...mapMutations('isNotFound', ['setIsNotFound']),
  },
  watch: {
    $route() {
      this.setIsNotFound(false)
    }
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
