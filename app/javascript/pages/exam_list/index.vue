<template>
  <div>
    <v-row dense class="mb-10" justify="center">
      <v-col
        v-for="(exam) in exams"
        :key="exam.title"
        cols="11"
        md="6"
        lg="3"
        class="mb-6"
      >
        <v-card :to="{ name: 'ExamIndex', params: { exam_id: exam.id } }">
          <v-img
            :src="getImagePath(exam.title)"
          ></v-img>
            <v-card-title class="py-1 card-exam-font font-weight-bold">
              {{ exam.title }}検定
            </v-card-title>
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
.card-exam-font{
  color: var(--v-font-base);
}
</style>
