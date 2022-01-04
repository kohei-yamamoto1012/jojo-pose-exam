<template>
  <div class="container vld-parent">
    <loading 
      :active.sync="isLoading"
      :opacity="0.9"
    >
      <div>
        <img :src="require(`../../../assets/images/loading.gif`)">
        <h4 class="mt-3">
          解析中ッ
        </h4>
      </div>
    </loading>

    <div class="mt-4">
      <h2>{{ exam.title }}検定</h2>
      <img
        v-if="exam.title"
        class="img-fluid border"
        :src="getImagePath(exam.title)"
      >
      <p>{{ exam.description }}</p>
    </div>

    <div class="text-center">
      <span>~ Point List ~</span>
      <div
        v-for="(check_item, index) in exam.check_items"
        :key="check_item.id"
      >
        <div class="rounded border border-secondary py-1 my-1">
          <div class="pl-2 py-1">
            Point{{ index + 1 }}: {{ check_item.content }}
          </div>
        </div>
      </div>
    </div>

    <ValidationObserver v-slot="{ handleSubmit }">
      <!-- eslint-disable vue/no-unused-vars -->
      <ValidationProvider
        v-slot="{ errors, validate }"
        ref="provider"
        name="ジョジョ立ち画像"
        rules="required|image"
      >
        <div class="form-group mt-4">
          <label
            for="jojo-pose-image"
            class="d-block"
          >ジョジョ立ち画像を添付</label>

          <input
            id="jojo-pose-image"
            type="file"
            accept="image/*"
            class="form-control-file"
            @change="handleChange"
          >
          <span class="text-danger">{{ errors[0] }}</span>
        </div>
      </ValidationProvider>
      
      <div class="text-center my-4">
        <button
          type="submit"
          class="btn btn-secondary"
          @click="handleSubmit(takeExam)"
        >
          受検するッ！
        </button>
      </div>
    </ValidationObserver>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
import Loading from 'vue-loading-overlay'
import 'vue-loading-overlay/dist/vue-loading.css';

export default {
  components: {
    Loading
  },
  props: {
    examId:{
      type: Number,
      default: null
    }
  },
  data: function () {
    return {
      check_items: [],
      upload_image: null,
      isLoading: false,
    }
  },
  computed: {
    ...mapGetters('exams', ['exam'])
  },
  created(){
    this.fetchExam(this.examId)
  },
  methods: {
    ...mapActions('exams', ['fetchExam']),

    getImagePath(title){
      return require(`../../../assets/images/${title}.png`)
    },

    async handleChange(e){
      const { valid } = await this.$refs.provider.validate(e) // バリデーションチェック

      if (valid){
        this.upload_image = e.target.files[0]
      }
    },

    takeExam(){
      this.isLoading = true

      const formData = new FormData()
      formData.append('exam_result[exam_id]', this.exam.id)
      formData.append('exam_result[upload_image]', this.upload_image)

      this.$axios.post('/api/exam_results', formData)
      .then(res => {
        // console.log(res.data.exam_result)
        const exam_result = res.data.exam_result

        this.isLoading = false
        this.$router.push({ name: 'ExamResultIndex', params: { exam_result_id: exam_result.id } })
      })
    }

  }
}
</script>

<style scoped>

</style>
