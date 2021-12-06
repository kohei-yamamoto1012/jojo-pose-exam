<template>
  <div class="container">

    <div class="mt-4">
      <h2>{{ selectedExam.title }}検定</h2>
      <img class="img-fluid border" :src="getImagePath(selectedExam.title)" />
      <p>{{ selectedExam.description }}</p>
    </div>

    <div v-for="(check_item, index) in selectedExamCheckItems" :key="check_item.id">
      <div class="border py-1 my-2" >
        <div class="pl-2 py-1">
          Point: {{ index + 1 }} {{ check_item.content }}
        </div>
      </div>
    </div>

    <div class="form-group mt-4">
      <label for="jojo-pose-image" class="d-block">ジョジョ立ち画像を添付</label>
      <input
        id="jojo-pose-image"
        type="file"
        class="form-control-file"
      >
      <div class="text-center my-4">
        <button
          type="submit"
          class="btn btn-secondary"
          @click="takeExam()"
        >
        受検するッ！
        </button>
      </div>
    </div>

  </div>
</template>

<script>
import { mapGetters, mapActions, mapMutations } from 'vuex'

export default {
  created(){
    this.getCheckItems()
  },
  data: function () {
    return {
      check_items: []
    }
  },
  computed: {
    ...mapGetters('exams', ['selectedExam']),
    selectedExamCheckItems(){
      return this.check_items.filter( check_item => check_item.exam_id === this.selectedExam.id )
    }
  },
  methods: {
    getCheckItems(){
      this.$axios.get('/api/check_items')
        .then(res => {
          this.check_items = res.data
        })
        .catch(err => console.log(err.status))
    },
    getImagePath(title){
      return require(`../../../assets/images/${title}.png`)
    },
    takeExam(){
      console.log("受検ッ")
    }
  }

}
</script>

<style scoped>

</style>
