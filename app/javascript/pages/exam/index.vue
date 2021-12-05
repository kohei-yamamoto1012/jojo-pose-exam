<template>
  <div class="py-4 container">
    <div class="text-center">
      <h2>{{ selectedExam.title }}検定</h2>
    </div>
 
  </div>
</template>

<script>
import { mapGetters, mapActions, mapMutations } from 'vuex'

export default {
  data: function () {
    return {
    }
  },
  computed: {
    ...mapGetters('exams', ['selectedExam'])
  }

}
</script>

<style scoped>

</style>
