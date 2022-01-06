<template>
  <header>
    <v-navigation-drawer
      app
      v-model="drawer"
    >
      <v-list-item>
        <router-link v-slot="{navigate}" :to="{ name:'TopIndex' }" custom>
          <v-list-item-content role="link" @click="navigate">
            <v-list-item-title>
              {{ title }}
            </v-list-item-title>
            <v-list-item-subtitle>
              {{ subtitle }}
            </v-list-item-subtitle>
          </v-list-item-content>
        </router-link>
      </v-list-item>

      <v-divider class="my-1"></v-divider>

      <v-list>
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
      app
      dense
      elevation="1"
      color="white"
    >
      <v-toolbar-title style="cursor: pointer">
        <router-link v-slot="{navigate}" :to="{ name:'TopIndex' }" custom>
          <span role="link" @click="navigate" class="text-subtitle-1">
            {{ title }}
          </span>
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