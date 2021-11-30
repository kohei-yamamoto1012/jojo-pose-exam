import Vue from 'vue'
import VueRouter from 'vue-router'
import TopIndex from '../pages/top/index.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'TopIndex',
      component: TopIndex
    }
  ]
})