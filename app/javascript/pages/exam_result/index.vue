<template>
  <div>
    <v-overlay 
      :value="comment_cutin"
      opacity="1"
      color="background"
    >
      <VueTyper
        :text="comment"
        :type-delay="90"
        :repeat="0"
        class="ma-5 text-h5 font-weight-bold"
        @completed="typingCompleted"
      />
    </v-overlay>

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
          <v-card-title class="pb-0 justify-center text-subtitle-1">
            <span class="result-text">~ {{ exam_result.exam.title }}検定 ~</span>
          </v-card-title>
          <v-card-title class="pt-0 justify-center font-wheight-bold text-h5">
            <span
              class="result-text"
              :class="isPass ? 'pass_underline':'fail_underline'"
            >
              {{ result_text }}
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

    <div class="text-center mt-8 mb-16">
      <TheLinkButton 
        :to="{ name: 'ExamIndex', params: { exam_id: exam_result.exam.id } }"
      >
        再挑戦する
      </TheLinkButton>
    </div>
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
      next()
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
          content: 'content'
        }
      },
      comment_cutin: false,
    }
  },
  computed: {
    isPass(){
      return this.exam_result.total_score >= 80 ? true : false
    },
    result_text(){
      if(this.isPass){
        return `${this.exam_result.total_score}点 合格ッ！`
      }
      else{
        return `${this.exam_result.total_score}点 不合格！！`
      }
    },
    comment(){
      return this.exam_result.exam_result_comment.content.replaceAll('\\n', '\n')
    }
  },
  async created() {
    await this.getExamResult()
  },
  methods: {
    async getExamResult(){
      await this.$axios.get(`/api/exam_results/${this.examResultId}`)
        .then(res => {
          this.exam_result = res.data.exam_result
          // console.log(res.data.exam_result)
        })
        .catch(err => console.log(err.status))
    },
    getCheckItemResultIcon(result){
      if(result == true){
        return { color: 'green', icon:'task_alt' }
      }
      else{
        return { color: 'red', icon: 'highlight_off' }
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
@import url('https://fonts.googleapis.com/css2?family=Kaisei+HarunoUmi:wght@500&display=swap');

.vue-typer{
  writing-mode: vertical-rl;
  white-space: pre-wrap;
}
.result-text{
  font-family: 'Kaisei HarunoUmi', serif;
  font-weight: bold;
  color: var(--v-font-base);
}

.pass_underline{
  background: linear-gradient(transparent 90%, red 95%);
}

.fail_underline{
  background: linear-gradient(transparent 90%, blue 95%);
}

.card-font{
  color: var(--v-font-base);
}
</style>