<template>
  <div>
    <v-overlay 
      :value="comment_cutin"
      opacity="1"
      color="background"
    >
      <VueTyper
        v-if="isExamResult"
        :text="comment"
        :type-delay="90"
        :repeat="0"
        class="ma-5 text-h5 font-weight-bold"
        @completed="typingCompleted"
      />
    </v-overlay>

    <transition name="content" mode="out-in">
      <div v-show="isExamResult">
        <v-row
          dense
          justify="center"
        >
          <v-col
            cols="11"
            md="6"
            lg="3"
            class="mb-2"
          >
            <v-card>
              <v-card-title class="pb-0 justify-center text-subtitle-2">
                <span class="result-text">~ {{ exam_result.exam.title }}検定 ~</span>
              </v-card-title>
              <v-card-title class="pt-0 justify-center font-wheight-bold text-h5">
                <span
                  class="result-text"
                  :class="isPass ? 'pass_underline':'fail_underline'"
                >
                  {{ resultText }}
                </span>
              </v-card-title>

              <v-img
                :src="exam_result.upload_image_url"
              />
            </v-card>
          </v-col>

          <v-col
            cols="11"
            md="6"
            lg="4"
          >
            <v-card class="mb-4">
              <v-card-title class="py-2 card-font font-weight-bold">
                チェックポイント
              </v-card-title>

              <v-list
                v-for="check_item_result in exam_result.check_item_results"
                :key="check_item_result.content"
                class="py-0"
                dense
              >
                <v-list-item>
                  <v-icon
                    class="me-2"
                    :color="getCheckItemResultIcon(check_item_result.result).color"
                  >
                    {{ getCheckItemResultIcon(check_item_result.result).icon }}
                  </v-icon>
                  <span class="text-subtitle-2 text-sm-subtitle-1 card-font font-weight-bold">{{ check_item_result.content }}</span>
                </v-list-item>
              </v-list>
            </v-card>

            <v-card>
              <v-card-title class="py-2 card-font font-weight-bold">
                評価コメント
              </v-card-title>
              <v-card-text class="text-subtitle-1 card-font font-weight-bold">
                {{ comment }}
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>

        <v-row
          dense
          justify="center"
          class="mt-10 mb-5"
        >
          <v-btn
            :href="twitterShare"
            target="_blank"
            color="blue lighten-1"
            dark
            large
            rounded
            min-width="140"
          >
            <v-icon>mdi-twitter</v-icon>
             結果を共有
          </v-btn>

        </v-row>

        <v-row
          dense
          justify="center"
          class="mb-10"
        >
          <AppLinkButton
            :to="{ name: 'ExamIndex', params: { exam_id: exam_result.exam.id } }"
            color="red accent-2 "
            min-width="140"
          >
            <v-icon>mdi-replay</v-icon>
            リトライ
          </AppLinkButton>
        </v-row>
      </div>
    </transition>
  </div>
</template>

<script>
import { VueTyper } from 'vue-typer'

export default {
  beforeRouteEnter: (to, from, next) => {
    if(from.name == 'ExamIndex'){
      next( vm => vm.comment_cutin = true )
    }
    else{
      next( vm => vm.comment_cutin = false )
    }
  },
  components:{
    VueTyper
  },
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
        total_score: 100,
        upload_image_url: '',
        check_item_results: [],
        exam: {
          id: 0,
          title: '',
          description: ''
        },
        exam_result_comment: {
          content: ''
        }
      },
      comment_cutin: false,
    }
  },
  computed: {
    isExamResult(){
      return this.exam_result.exam.title
    },
    isPass(){
      return this.exam_result.total_score >= 80 ? true : false
    },
    resultText(){
      if(this.isPass){
        return `${this.exam_result.total_score}点 合格ッ！`
      }
      else{
        return `${this.exam_result.total_score}点 不合格！！`
      }
    },
    comment(){
      return this.exam_result.exam_result_comment.content.replaceAll('\\n', '\n')
    },
    twitterShare(){
      // const url = 'https://jojo-pose-exam.herokuapp.com…' // 末尾の…でツイート中のurl表示が省略されることを避ける
      const url = `${location.origin}/${this.exam_result.id}…` // 末尾の…でツイート中のurl表示が省略されることを避ける
      const text = `%0a%23ジョジョ立ち検定 を受検しました！%0a%0a検定名: ${this.exam_result.exam.title}検定%0a受験結果: ${this.resultText}%0a%0a▼ 受検結果ページ ▼%0a`

      return `https://twitter.com/intent/tweet?url=${url}&text=${text}`
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
        })
        .catch(err => console.log(err.status))
    },
    getCheckItemResultIcon(result){
      if(result == true){
        return { color: 'green', icon:'mdi-check-circle-outline' }
      }
      else{
        return { color: 'red', icon: 'mdi-close-octagon-outline' }
      }
    },
    typingCompleted(){
      setTimeout(() =>{
        this.comment_cutin = false
      }, 1500)
    }
  }
}
</script>

<style lang="scss" scoped>

.vue-typer{
  writing-mode: vertical-rl;
  white-space: pre-wrap;
}

.result-text{
  font-weight: bold;
  color: var(--v-font-base);
}

.pass_underline{
  background: linear-gradient(transparent 90%, red 50%);
}

.fail_underline{
  background: linear-gradient(transparent 90%, blue 50%);
}

.card-font{
  color: var(--v-font-base);
}
</style>