<template>
  <v-row
    dense
    class="mb-6"
    justify="center"
  >
    <v-col
      cols="12"
      md="11"
      lg="7"
    >
      <v-card>
        <v-card-title class="font-weight-bold">お問い合わせ</v-card-title>
        <v-card-text class="text-subtitle-2 font-weight-bold py-1">
          <p>ジョジョ立ち検定に関するお問い合わせ、不具合の報告などございましたら、以下のTwitterアカウントまでご連絡ください。</p>
          <span>ご感想もお待ちしております！</span> 
        </v-card-text>

        <v-card-actions>
          <v-btn
            href="https://twitter.com/koheiyamamoto26"
            color="blue lighten-1"
            dark
            class="text-lowercase pe-4"
            target="_blank"
          >
            <v-icon
              left
            >
              mdi-twitter
            </v-icon>
            @koheiyamamoto26
          </v-btn>
        </v-card-actions>

      </v-card>
    </v-col>
  </v-row>
</template>

<style  lang="scss" scoped>
.page-enter-active{
  transition: opacity 1.1s;
}
.page-enter{
  opacity: 0;
}
</style>