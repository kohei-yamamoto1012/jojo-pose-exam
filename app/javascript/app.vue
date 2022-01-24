<template>
  <v-app>
    <TheHeader />

    <v-main class="bg main">
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
  },
  data: function(){
    return {
      transitionName: 'normal'
    }
  },
  watch: {
    '$route' (to, from){
      if(from.name == 'ExamIndex' && to.name == 'ExamResultIndex'){
        this.transitionName = 'leave'
      }
      else{
        this.transitionName = 'normal'
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.normal-enter-active, .normal-leave-active {
  transition: opacity .6s;
}
.normal-enter, .normal-leave-to {
  opacity: 0;
}

.leave-leave-active {
  transition: opacity .6s;
}
.leave-leave-to {
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
