<template>
  <div class="container">
    <div class="mt-4">
      <h5>{{ exam_result.exam.title }}検定</h5>
      <h2 class="text-center">
        {{ exam_result.total_score }}点 {{ pass_fail }}
      </h2>
      
      <div class="text-center">
        <img
          class="img-fluid border"
          :src="exam_result.upload_image_url"
        >
      </div>

      <div class="text-center my-3">
        <span>~ Comment ~</span>
        <div class="text-center rounded border border-secondary">
          <h5 class="my-2">
            {{ comment }}
          </h5>
        </div>
      </div>

      <div class="text-center mb-3">
        <span>~ Point Result ~</span>
        <div
          v-for="(check_item_result, index) in exam_result.check_item_results"
          :key="index"
          class="text-center rounded border border-secondary py-1 my-1"
        >
          <span>Point{{ index+1 }}: {{ check_item_result.content }}</span>
          <h5>{{ getResult(check_item_result.result) }}</h5>
        </div>
      </div>

      <div class="text-center">
        <router-link
          :to="{ name: 'ExamIndex', params: { exam_id: exam_result.exam.id } }"
        >
          再挑戦する
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  props: {
    examResultId: {
      type: String,
      default: null
    }
  },
  data: function () {
    return {
      exam_result:{
        id: 0,
        total_score: 0,
        upload_image_url: "",
        check_item_results: [],
        exam: {
          id: 0,
          title: "",
          description: ""
        },
        exam_result_comment: {
          content: ""
        }
      }
    }
  },
  computed: {
    pass_fail(){
      if (this.exam_result.total_score >= 80){
        return "合格ッ！"
      }
      else {
        return "不合格！！"
      }
    },
    comment(){
      return this.exam_result.exam_result_comment.content
    }
  },
  created() {
    this.getExamResult()
  },
  methods: {
    getExamResult(){
      this.$axios.get(`/api/exam_results/${this.examResultId}`)
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