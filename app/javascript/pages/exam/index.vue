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

    <!-- <button
      type="submit"
      class="btn btn-secondary"
      @click="poseEstimateTest"
    >
      姿勢推定(テスト)
    </button> -->

  </div>
</template>

<script>
import { mapGetters, mapActions, mapMutations } from 'vuex'
import * as poseDetection from '@tensorflow-models/pose-detection'
import '@tensorflow/tfjs-backend-webgl'

export default {
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
  created(){
    this.getCheckItems()
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
    },
    async handleChange(e){
      const { valid } = await this.$refs.provider.validate(e) // バリデーションチェック
      if (valid) console.log("valid")
      // if (valid) this.uploadAvatar = e.target.files[0] // イベントオブジェクトからファイルを取得して、dataに格納
    },
    // async poseEstimateTest(){
    //   const detector = await poseDetection.createDetector(poseDetection.SupportedModels.MoveNet);
    //   const imageElement = document.getElementById('img')
      
    //   const poses = await detector.estimatePoses(imageElement)
    //   console.log(poses[0].keypoints)
    // }
  }

}
</script>

<style scoped>

</style>
