<template>
  <header>
    <v-navigation-drawer
      app
      v-model="drawer"
      :disable-resize-watcher="true"
    >
      <v-list-item>
        <router-link :to="{ name: 'TopIndex'}">
          <v-img
            :src="logo_nav_src"
            max-width="200"
            max-height="50"
          />
        </router-link>
      </v-list-item>

      <v-list class="py-0">
        <v-list-item 
        v-for="support in supports"
        :key="support.name"
        :to="support.link"
        >
          <v-list-item-icon>
            <v-icon>{{ support.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{ support.name }}</v-list-item-title>
          </v-list-item-content>

        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar
      absolute
      app
      dense
      flat
      color="transparent"
    >
      <v-toolbar-title v-if="$route.name != 'TopIndex'" style="cursor: pointer">
        <router-link :to="{ name: 'TopIndex'}">
          <v-img
            :src="logo_head_src"
            max-width="200"
            max-height="32"
          />
        </router-link>
      </v-toolbar-title>

      <v-spacer></v-spacer>

      <v-app-bar-nav-icon @click="drawer=!drawer"></v-app-bar-nav-icon>
    </v-app-bar>
  </header>
</template>

<script>
export default {
  name: 'TheHeader',
  data: function () {
    return {
      drawer: false,
      logo_nav_src: require('../../assets/images/logo_nav.svg'),
      logo_head_src: require('../../assets/images/logo_head.svg'),
      title: 'ジョジョ立ち検定',
      subtitle: 'jojo-pose-exam',
      supports:[
        {
          name: '検定一覧',
          icon: 'emoji_people',
          link: { name:'ExamListIndex' }
        }
      ]
    }
  },

}
</script>

<style scoped>

</style>