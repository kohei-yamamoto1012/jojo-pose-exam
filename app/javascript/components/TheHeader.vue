<template>
  <header>
    <nav class="navbar navbar-expand navbar-dark bg-dark justify-content-between">
      <router-link :to="{ name: 'TopIndex' }" class="navbar-brand mb-0 h1">{{ title }}</router-link> 
    </nav>
  </header>
</template>

<script>

export default {
  name: 'TheHeader',
  data: function () {
    return {
      title: 'ジョジョ立ち検定'
    }
  },

}
</script>

<style scoped>

</style>