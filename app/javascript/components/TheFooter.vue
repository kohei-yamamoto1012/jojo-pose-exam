<template>
  <v-footer
    padless
    color="indigo lighten-5"
  >
    <v-row
      justify="center"
      no-gutters
      class="mt-2"
    >
      <v-col 
        cols="12"
        md="4"
        lg="2"
        v-for="link in links"
        :key="link.name"
      >
        <v-list
          dense
          class="indigo lighten-5 pt-0"
          shaped
        >
          <v-list-item class="mx-10" :to="link.to">
            <v-list-item-title class=" font--text">{{ link.name }}</v-list-item-title>
            <v-icon 
              color="grey lighten-1"
            >
             mdi-chevron-right
            </v-icon>
          </v-list-item>
        </v-list>
      </v-col>

      <v-col
        class="text-center mb-2"
        cols="12"
      >
        <span class="text-caption font--text">&copy; 2022 ジョジョ立ち検定</span>
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

</style>