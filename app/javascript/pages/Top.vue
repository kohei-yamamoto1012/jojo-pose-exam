<template>
  <div>
    <v-row justify="center">
      <v-col
        cols="12"
        md="6"
        lg="4"
      >
        <v-img :src="logo_top_src" />
      </v-col>
    </v-row>

    <div class="text-center mb-16">
      <AppLinkButton :to="{ name: 'ExamList'}">
        受検する
      </AppLinkButton>
    </div>

    <v-divider
      class="mb-15"
      style="opacity: 0"
    />

    <AppSectionTitle>~ 受検手順 ~</AppSectionTitle>

    <v-row
      dense
      class="mb-12"
      justify="center"
    >
      <v-col
        v-for="(card, index) in cards"
        :key="card.title"
        cols="10"
        md="4"
        lg="3"
        class="mb-3"
      >
        <v-card
          rounded
          class="rounded-xl"
        >
          <p class="text-button text-center mb-2">
            Lesson{{ index + 1 }}
          </p>
          <v-img
            :src="card.src"
            class="mx-15 mt-2"
          />
          <v-card-title class="py-1">
            {{ card.title }}
          </v-card-title>
          <v-card-text>{{ card.text }}</v-card-text>
        </v-card>
      </v-col>
    </v-row>

    <div class="text-center mb-12">
      <AppLinkButton :to="{ name: 'ExamList'}">
        受検する
      </AppLinkButton>
    </div>
  </div>
</template>

<script>

export default {
  data: function () {
    return {
      logo_top_src: require('../../assets/images/logo_top.svg'),

      cards: [
        {
          title: '検定を選択',
          src: require('../../assets/images/select_exam.svg'),
          text: '検定一覧から受検したいジョジョ立ち検定を選択しましょう！覚悟はいいか？俺はできてる。'
        },
        {
          title: 'ジョジョ立ち撮影',
          src: require('../../assets/images/take_picture.svg'),
          text: '検定画像のモデルを参考に、チェックポイントを意識しながらをジョジョ立ちを行いましょう！'
        },
        {
          title: 'ジョジョ立ちアップロード',
          src: require('../../assets/images/upload_picture.svg'),
          text: '撮影したジョジョ立ち画像をアップロードしましょう。AIによる解析後に検定結果が表示されます！'
        }
      ]
    }
  }
}
</script>

<style  lang="scss" scoped>
.page-enter-active{
  transition: opacity 1.1s;
}
.page-enter{
  opacity: 0;
}
</style>