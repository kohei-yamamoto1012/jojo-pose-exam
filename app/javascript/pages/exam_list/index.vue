<template>
  <div>
     <TheSectionTitle>~ 検定一覧 ~</TheSectionTitle>

    <v-row dense class="mb-10" justify="center">
      <v-col
        v-for="(exam) in exams"
        :key="exam.title"
        cols="11"
        md="6"
        class="mb-8"
      >
        <v-card :to="{ name: 'ExamIndex', params: { exam_id: exam.id } }">
          <v-img
            :src="getImagePath(exam.title)"
          ></v-img>
            <div class="card-exam-title text-center pb-3 text-h6 font-weight-bold">
              {{ exam.title }}検定
            </div>
        </v-card>
      </v-col>
    </v-row>

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
    ...mapActions('exams', ['fetchExams']),

    getImagePath(title){
      return require(`../../../assets/images/${title}.png`)
    }

  }
}
</script>

<style scoped>
.card-exam-title{
  color: var(--v-font-base);
}
</style>
