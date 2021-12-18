<template>
  <div class="container">

    <div class="mt-4">
      <h5>{{ exam_result.exam.title }}検定</h5>
      <h2 class="text-center">{{ exam_result.total_score }}点 {{ pass_fail }}</h2>
      <img
        class="img-fluid border"
        :src="exam_result.upload_image_url"
      >
      <div class="text-center my-3">
        <span>~ 評価コメント ~</span>
        <div class="text-center rounded  py-2 border border-secondary">
          <h5>{{ comment }}</h5>
        </div>
      </div>

      <div class="text-center mb-3">
        <span>~ 各Pointの結果 ~</span>
        <div
          class="text-center rounded border border-secondary py-1 my-1"
          v-for="(check_item_result, index) in exam_result.check_item_results" :key="index"
        >
          <span>Point{{ index+1 }}: {{ check_item_result.content }}</span>
          <h5>{{ getResult(check_item_result.result) }}</h5>
        </div>
      </div>
    </div>

  </div>
</template>

<script>

export default {
  props: {
    exam_result_id: Number
  },
  data: function () {
    return {
      exam_result:{
        id: null,
        total_score: null,
        upload_image_url: null,
        check_item_results: [],
        exam: {
          id: null,
          title: "",
          description: ""
        }
      }
    }
  },
  computed:{
  },
  created() {
    this.getExamResult()
  },
  computed: {
    pass_fail(){
      if (this.exam_result.total_score >= 100){
        return "合格ッ！"
      }
      else {
        return "不合格！！"
      }
    },
    comment(){
      const score = this.exam_result.total_score
      if (score <= 40){
        return "やれやれだぜ"
      }
      else if (score <= 60){
        return "逆に考えるんだ こんなジョジョ立ちでもいいさと..."
      }
      else if (score <= 99){
        return "ブラボー！おお...ブラボー！！"
      }
      else if (score <= 100){
        return "グレートですよこいつはァ"
      }
    }
  },
  methods: {
    getExamResult(){
      this.$axios.get(`/api/exam_results/${this.exam_result_id}`)
        .then(res => {
          this.exam_result = res.data.exam_result
          console.log(res.data.exam_result)
        })
        .catch(err => console.log(err.status))
    },
    getResult(result){
      if(result == true){
        return "Clear!!"
      }
      else{
        return "Miss..."
      }
    }
  }
}
</script>

<style scoped>

</style>