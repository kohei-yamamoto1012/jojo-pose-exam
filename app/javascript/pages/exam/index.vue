<template>
  <div class="container">
    <div class="mt-4">
      <h2>{{ selectedExam.title }}検定</h2>
      <img
        class="img-fluid border"
        :src="getImagePath(selectedExam.title)"
      >
      <p>{{ selectedExam.description }}</p>
    </div>

    <div
      v-for="(check_item, index) in selectedExamCheckItems"
      :key="check_item.id"
    >
      <div class="border py-1 my-2">
        <div class="pl-2 py-1">
          Point: {{ index + 1 }} {{ check_item.content }}
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
import { mapGetters, mapActions, mapMutations } from 'vuex'
import * as poseDetection from '@tensorflow-models/pose-detection'
import '@tensorflow/tfjs-backend-webgl'

export default {
  data: function () {
    return {
      check_items: [],
      detector: null,
      uploadImageElement: null
    }
  },
  computed: {
    ...mapGetters('exams', ['selectedExam']),
    selectedExamCheckItems(){
      return this.check_items.filter( check_item => check_item.exam_id === this.selectedExam.id )
    }
  },
  async created(){
    this.getCheckItems()
    this.createDetector()
  },
  methods: {
    getCheckItems(){
      this.$axios.get('/api/check_items')
        .then(res => {
          this.check_items = res.data
        })
        .catch(err => console.log(err.status))
    },
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
        const image_file = e.target.files[0] // イベントオブジェクトからファイルを取得
        const url = URL.createObjectURL(image_file) // ファイルからurl作成
        if(this.uploadImageElement) URL.revokeObjectURL(this.uploadImageElement.src)
        
        this.uploadImageElement = new Image()
        this.uploadImageElement.src = url
      }
    },
    async takeExam(){
      console.log("姿勢推定を実施")
      const poses = await this.detector.estimatePoses(this.uploadImageElement)
      console.log(this.uploadImageElement)
      console.log(poses)

      let examResultKeypoints = poses[0].keypoints.map(item => {
        return {
          x_coordinate: Math.round(item.x),
          y_coordinate: Math.round(item.y),
          score: Math.round(item.score * 100),
          name: item.name
        }
      })
      console.log(examResultKeypoints)

      this.$axios.post('/api/exam_results', {
        exam_result: {
          exam_id: this.selectedExam.id,
          privacy_setting: true,
          hide_face: false,
          exam_result_keypoints: examResultKeypoints
        }
      })
    }
  }

}
</script>

<style scoped>

</style>
