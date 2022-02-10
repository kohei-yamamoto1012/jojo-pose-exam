<template>
  <v-app>
    <TheHeader />

    <v-main class="bg main">
      <v-container>
        <transition 
          name="page"
          mode="out-in"
        >
          <NotFound v-if="responseStatus === 404" />
          <InternalServerError v-else-if="responseStatus === 500" />
          <router-view v-else />
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
import InternalServerError from './pages/shared/InternalServerError.vue'
import { mapGetters, mapMutations } from 'vuex'

export default {
  components: {
    TheHeader,
    TheFooter,
    NotFound,
    InternalServerError
  },
  computed: {
    ...mapGetters('responseStatus', ['responseStatus']),
  },
  methods: {
    ...mapMutations('responseStatus', ['setResponseStatus']),
  },
  watch: {
    $route() {
      this.setResponseStatus(null)
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
