<template>
  <div>
    <v-row justify="center">
      <v-col cols="12" md="6" lg="4">
        <v-img :src="logo_top_src" />
      </v-col>
    </v-row>

    <div class="text-center mb-16">
      <TheLinkButton :to="{ name: 'ExamListIndex'}">受験する</TheLinkButton>
    </div>

    <TheSectionTitle>~ 受検手順 ~</TheSectionTitle>

    <v-row dense class="mb-6" justify="center">
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
          <p class="text-button text-center mb-2">Lesson{{ index + 1 }}</p>
          <v-img
            :src="card.src"
            class="mx-15 mt-2"
          ></v-img>
          <v-card-title class="py-1">{{ card.title }}</v-card-title>
          <v-card-text>{{ card.text }}</v-card-text>
        </v-card>
      </v-col>
    </v-row>


    <div class="text-center mb-16">
      <TheLinkButton :to="{ name: 'ExamListIndex'}">受験する</TheLinkButton>
    </div>

  </div>
</template>

<script>

export default {
  data: function () {
    return {
      logo_top_src: require('../../../assets/images/logo_top.svg'),
      select_exam_src: require('../../../assets/images/select_exam.svg'),
      take_picture_src: require('../../../assets/images/take_picture.svg'),
      upload_picture_src: require('../../../assets/images/upload_picture.svg'),

      cards: [
        {
          title: '検定を選択',
          src: require('../../../assets/images/select_exam.svg'),
          text: '検定一覧から受験したいジョジョ立ち検定を選択しましょう。'
        },
        {
          title: 'ジョジョ立ち撮影',
          src: require('../../../assets/images/take_picture.svg'),
          text: 'ジョジョ立ちを撮影しましょう。全身が映るように撮影する必要があります。'
        },
        {
          title: 'ジョジョ立ちアップロード',
          src: require('../../../assets/images/upload_picture.svg'),
          text: '撮影したジョジョ立ち画像をアップロードしましょう。ジョジョ立ち解析後に検定結果が表示されます！'
        }

      ]
    }
  }
}
</script>

<style scoped>


</style>

<style  lang="scss" scoped>

</style>