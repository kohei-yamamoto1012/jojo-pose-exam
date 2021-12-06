<template>
  <div class="py-4 container">
    <div class="text-center">
      <h2>検定一覧</h2>
    </div>
    <div class="row">
      <div class="mx-auto">
        <div
          v-for="exam in exams"
          :key="exam.id"
          class="col-12 my-5"
        >
          <router-link
            :to="{ name: 'ExamIndex', params: { exam_path: exam.path } }"
            @click.native="setSelectedExam(exam)"
          >
            <h5>{{ exam.title }}検定</h5>
            <img
              class="img-fluid border"
              :src="getImagePath(exam.title)"
            >
          </router-link>
        </div>
      </div>
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
  computed:{
    ...mapGetters('exams', ['exams'])
  },
  created() {
    this.fetchExams()
  },
  methods: {
    ...mapMutations('exams', ['setSelectedExam']),
    ...mapActions('exams', ['fetchExams']),

    getImagePath(title){
      return require(`../../../assets/images/${title}.png`)
    }

  }
}
</script>

<style scoped>

</style>
