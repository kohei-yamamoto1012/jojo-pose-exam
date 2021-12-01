<template>
  <div class="py-4 container">
    <div class="text-center">
      <h2>検定一覧</h2>
    </div>
    <div class="row">
      <div class="mx-auto">
       <div v-for="exam in exams" :key="exam.id" class="col-12 my-5">
          <h5>{{ exam.title }}検定</h5>
          <img class="img-fluid border" :src="getImagePath(exam.title)" />
        </div>
      </div>
    </div>

  </div>
</template>

<script>

export default {
  created() {
    this.getTasks()
  },
  data: function () {
    return {
      exams: []
    }
  },
  methods: {
    getTasks(){
      this.$axios.get('exams')
        .then(res => this.exams = res.data)
        .catch(err => console.log(err.status))
    },
    getImagePath(title){
      return require(`../../../assets/images/${title}.png`)
    }
  }
}
</script>

<style scoped>

</style>
