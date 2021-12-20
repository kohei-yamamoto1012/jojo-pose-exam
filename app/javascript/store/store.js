import Vue from 'vue'
import Vuex from 'vuex'
import ExamsModule from './modules/exams'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    exams: ExamsModule
  }
})