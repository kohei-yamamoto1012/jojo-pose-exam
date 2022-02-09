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
        <v-card-title class="font-weight-bold">404 NotFound</v-card-title>
        <v-card-text class="text-subtitle-2 font-weight-bold py-1">
          <p>お探しのページが見つかりませんでした。</p>
          <p>一時的にアクセスができない状況にあるか、移動もしくは削除された可能性があります。</p>
          <p>URLにお間違いがないか再度ご確認ください。</p>
        </v-card-text>

        <v-card-actions>
          <v-btn
            :to="{ name: 'Top'}"
            color="font"
            dark
            class="text-lowercase pe-4"
          >
            <v-icon
              left
            >
              mdi-home
            </v-icon>
            トップページに戻る
          </v-btn>

        </v-card-actions>

      </v-card>
    </v-col>
  </v-row>

</template>

<script>
export default {

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