import Vue from 'vue'
import VueRouter from 'vue-router'
import TopIndex from '../pages/top/index.vue'
import ExamListIndex from '../pages/exam_list/index.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'TopIndex',
      component: TopIndex
    },
    {
      path: '/exams',
      name: 'ExamListIndex',
      component: ExamListIndex
    }
  ]
})