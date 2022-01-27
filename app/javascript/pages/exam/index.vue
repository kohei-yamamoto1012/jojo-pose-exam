<template>
  <div>
    <transition name="content" mode="out-in">
      <v-row 
        dense
        class="mt-1 mb-16"
        justify="center"
        v-show="isExam"
      >
        <v-col
          cols="11"
          md="6"
          lg="3"
          class="mb-2"
        >
          <v-card>
            <v-img
              v-if="isExam"
              :src="getImagePath(exam.title)"
            />
            <v-card-title class="py-1 card-font font-weight-bold">
              {{ exam.title }}検定
            </v-card-title>
            <v-card-text>{{ exam.description }}</v-card-text>
          </v-card>
        </v-col>

        <v-col
          cols="11"
          md="6"
          lg="3"
        >
          <v-card class="mb-4">
            <v-card-title class="py-2 card-font font-weight-bold">
              チェックポイント
            </v-card-title>

            <v-list
              v-for="check_item in exam.check_items"
              :key="check_item.id"
              class="py-0"
              dense
            >
              <v-list-item>
                <v-icon
                  class="me-2"
                  color="accent"
                >
                  star
                </v-icon>
                <span class="text-subtitle-2 text-sm-subtitle-1 card-font font-weight-bold">{{ check_item.content }}</span>
              </v-list-item>
            </v-list>
          </v-card>

          <v-card>
            <v-card-title class="py-2 card-font font-weight-bold">
              受検フォーム
            </v-card-title>

            <ValidationObserver v-slot="{ handleSubmit }">
              <!-- eslint-disable vue/no-unused-vars -->
              <ValidationProvider
                v-slot="{ errors, validate }"
                ref="provider"
                rules="required|image"
              >
                <v-file-input
                  accept="image/*"
                  prepend-icon="add_a_photo"
                  label="ジョジョ立ち画像"
                  :error-messages="errors"
                  class="mx-5"
                  color="font"
                  :disabled="isLoading"
                  @change="handleChange"
                />
              </ValidationProvider>

              <v-card-actions class="justify-center">
                <v-btn
                  color="primary"
                  block
                  :loading="isLoading"
                  :disabled="isLoading"
                  @click="handleSubmit(takeExam)"
                >
                  受検するッ！
                  <template v-slot:loader>
                    <span>解析中ッ</span>
                    <span class="custom-loader">
                      <v-icon>cached</v-icon>
                    </span>
                  </template>
                </v-btn>
              </v-card-actions>
            </ValidationObserver>
          </v-card>
        </v-col>
      </v-row>
    </transition>
  </div>
</template>

<script>
import { mapGetters, mapActions, mapMutations } from 'vuex'

export default {
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
    ...mapGetters('exams', ['exam']),
    isExam(){
      return Object.keys(this.exam).length
    }
  },
  created(){
    this.fetchExam(this.examId)
  },
  destroyed(){
    this.resetExam()
  },
  methods: {
    ...mapActions('exams', ['fetchExam']),
    ...mapMutations('exams', ['resetExam']),

    getImagePath(title){
      return require(`../../../assets/images/${title}.jpg.webp`)
    },

    async handleChange(e){
      const { valid } = await this.$refs.provider.validate(e) // バリデーションチェック

      if (valid){
        this.upload_image = e
      }
    },

    takeExam(){
      this.isLoading = true

      const formData = new FormData()
      formData.append('exam_result[exam_id]', this.exam.id)
      formData.append('exam_result[upload_image]', this.upload_image)

      this.$axios.post('/api/exam_results', formData)
      .then(res => {
        const exam_result = res.data.exam_result

        this.isLoading = false
        this.$router.push({ name: 'ExamResultIndex', params: { exam_result_id: exam_result.id } })
      })
    }

  }
}
</script>

<style scoped>
.card-font{
  color: var(--v-font-base);
}

  .custom-loader {
    animation: loader 1s infinite;
    display: flex;
  }
  @-moz-keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
  @-webkit-keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
  @-o-keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
  @keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
</style>
