<template>
  <div>
    <transition
      name="content"
      mode="out-in"
    >
      <div v-show="isExams">
        <v-row
          v-for="(exam) in exams"
          :key="exam.title"
          dense
          justify="center"
        >
          <v-col
            cols="11"
            md="6"
            lg="4"
            xl="3"
            class="mb-3"
          >
            <v-card :to="{ name: 'Exam', params: { exam_id: exam.id } }">
              <v-img :src="getImagePath(exam.title)" />
              <v-card-title class="py-1 card-exam-font font-weight-bold">
                {{ exam.title }}検定
              </v-card-title>
            </v-card>
          </v-col>
        </v-row>

        <v-row
          dense
          class="my-8"
          justify="center"
        >
          <span class="text-subtitle-1 text-md-h6 font-weight-black background">more coming soon...</span>
        </v-row>
      </div>
    </transition>
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
    ...mapGetters('exams', ['exams']),
    isExams(){
      return this.exams.length !== 0 ? true : false
    }
  },
  destroyed(){
    this.resetExams()
  },
  created() {
    this.fetchExams()
  },
  methods: {
    ...mapActions('exams', ['fetchExams']),
    ...mapMutations('exams', ['resetExams']),

    getImagePath(title){
      return require(`../../assets/images/exams/${title}`)
    }

  }
}
</script>

<style scoped>
.card-exam-font{
  color: var(--v-font-base);
}
</style>
