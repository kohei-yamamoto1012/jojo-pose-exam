import Vue from 'vue'
import VueRouter from 'vue-router'
import TopIndex from '../pages/top/index.vue'
import ExamListIndex from '../pages/exam_list/index.vue'
import ExamIndex from '../pages/exam/index.vue'
import ExamResultIndex from '../pages/exam_result/index.vue'

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
    },
    {
      path: '/exam/:exam_id',
      name: 'ExamIndex',
      component: ExamIndex,
      props: routes => ({
        examId: Number(routes.params.exam_id)
      })
    },
    {
      path: '/exam_results/:exam_result_id',
      name: 'ExamResultIndex',
      component: ExamResultIndex,
      props: routes => ({
        examResultId: routes.params.exam_result_id
      })
    }
  ],
  scrollBehavior (to, from, savedPosition) {
    return { x: 0, y: 0 }
  }
})