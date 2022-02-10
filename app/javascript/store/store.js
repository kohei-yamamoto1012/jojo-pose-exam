import Vue from 'vue'
import Vuex from 'vuex'
import ExamsModule from './modules/exams'
import responseStatus from './modules/responseStatus'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    exams: ExamsModule,
    responseStatus
  }
})