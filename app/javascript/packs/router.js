import Vue from 'vue'
import VueRouter from 'vue-router'
import Top from '../pages/Top.vue'
import Terms from '../pages/shared/Terms.vue'
import Policy from '../pages/shared/Policy.vue'
import Contact from '../pages/shared/Contact.vue'
import ExamList from '../pages/ExamList.vue'
import Exam from '../pages/Exam.vue'
import ExamResult from '../pages/ExamResult.vue'
import NotFound from '../pages/shared/NotFound.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Top',
      component: Top
    },
    {
      path: '/terms',
      name: 'Terms',
      component: Terms
    },
    {
      path: '/policy',
      name: 'Policy',
      component: Policy
    },
    {
      path: '/contact',
      name: 'Contact',
      component: Contact
    },
    {
      path: '/exams',
      name: 'ExamList',
      component: ExamList
    },
    {
      path: '/exam/:exam_id',
      name: 'Exam',
      component: Exam,
      props: routes => ({
        examId: Number(routes.params.exam_id)
      })
    },
    {
      path: '/exam_results/:exam_result_id',
      name: 'ExamResult',
      component: ExamResult,
      props: routes => ({
        examResultId: routes.params.exam_result_id
      })
    },
    {
      path: "*",
      name: "NotFound",
      component: NotFound,
    }
  ],
  scrollBehavior (to, from, savedPosition) {
    return { x: 0, y: 0 }
  }
})