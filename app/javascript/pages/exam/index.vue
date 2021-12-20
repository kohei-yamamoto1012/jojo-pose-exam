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
      <span>~ Point一覧 ~</span>
      <div
        v-for="(check_item, index) in exam.check_items"
        :key="check_item.id"
      >
        <div class="rounded border border-secondary py-1 my-1">
          <div class="pl-2 py-1">
            Point: {{ index + 1 }} {{ check_item.content }}
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
import * as poseDetection from '@tensorflow-models/pose-detection'
import '@tensorflow/tfjs-backend-webgl'
import Loading from 'vue-loading-overlay'
import 'vue-loading-overlay/dist/vue-loading.css';

export default {
  components: {
    Loading
  },
  props: {
    examId: Number
  },
  data: function () {
    return {
      check_items: [],
      detector: null,
      image_file: null,
      image_element: null,
      isLoading: false,
    }
  },
  computed: {
    ...mapGetters('exams', ['exam'])
  },
  created(){
    this.fetchExam(this.examId)
    this.createDetector()
  },
  methods: {
    ...mapActions('exams', ['fetchExam']),

    async createDetector(){
      const detectorConfig = {
        modelType: poseDetection.movenet.modelType.SINGLEPOSE_THUNDER,
        enableSmoothing: false
      }
      this.detector = await poseDetection.createDetector(poseDetection.SupportedModels.MoveNet, detectorConfig)
    },

    getImagePath(title){
      return require(`../../../assets/images/${title}.png`)
    },

    async handleChange(e){
      const { valid } = await this.$refs.provider.validate(e) // バリデーションチェック

      if (valid){
        const image_file = e.target.files[0]
        this.setImageFile(image_file)
        this.setImageElement(image_file)
      }
    },

    setImageFile(image_file){
      this.image_file = image_file
    },

    setImageElement(image_file){
      const url = URL.createObjectURL(image_file)
      if(this.image_element) URL.revokeObjectURL(this.image_element.src)

      this.image_element = new Image()
      this.image_element.src = url
    },

    async estimatePoses(){
      console.log("姿勢推定を実施")
      const poses = await this.detector.estimatePoses(this.image_element)
      const examResultKeypoints = poses[0].keypoints.map(item => {
        return {
          x_coordinate: Math.round(item.x),
          y_coordinate: Math.round(item.y),
          score: Math.round(item.score * 100),
          name: item.name
        }
      })
      console.log(examResultKeypoints)
      return examResultKeypoints
    },

    uploadImageFile(exam_result){
      if (this.image_file){
        const formData = new FormData()
        formData.append('exam_result[upload_image]', this.image_file)
        this.$axios.post(`/api/exam_results/${exam_result.id}/upload_image`, formData)
      }
    },

    takeExam(){
      this.isLoading = true

      setTimeout(async() =>{
        this.$axios.post('/api/exam_results', {
          exam_result: {
            exam_id: this.exam.id,
            privacy_setting: true,
            hide_face: false,
            exam_result_keypoints: await this.estimatePoses()
          }
        })
        .then(res => {
          const exam_result = res.data.exam_result
          this.uploadImageFile(exam_result)
          this.isLoading = false
          this.$router.push({ name: 'ExamResultIndex', params: { exam_result_id: exam_result.id } })
        })
      }, 500)
    }
  }
}
</script>

<style scoped>

</style>
