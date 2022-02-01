<template>
  <v-footer
    app
    padless
    color="background"
    absolute
  >
  <v-row
    justify="center"
    no-gutters
  >
    <v-btn
      v-for="link in links"
      :key="link.name"
      :to="link.to"
      text
      class="mt-1"
      rounded
      :small="$vuetify.breakpoint.xs || $vuetify.breakpoint.sm"
      active-class="no-active"
    >
      {{ link.name }}
    </v-btn>

    <v-col
      class="text-center mb-2"
      cols="12"
    >
      <span class="test text-caption">&copy; 2022 ジョジョ立ち検定</span>
    </v-col>
  </v-row>
  </v-footer>
</template>

<script>
export default {
  name: 'TheFooter',
  data: function () {
    return {
      links: [
        { name: '利用規約', to: {name: 'Terms'} },
        { name: 'プライバシーポリシー', to: {name: 'Policy'} },
        { name: 'お問い合わせ', to: {name: 'Contact'} }
      ]
    }
  }
}
</script>

<style scoped>
.v-btn--active.no-active::before {
  opacity: 0 !important;
}
</style>