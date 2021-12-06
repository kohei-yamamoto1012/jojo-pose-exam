import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'
import ExamsModule from './modules/exams'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    exams: ExamsModule
  },
  plugins: [createPersistedState(
    {
      key: 'jojoPoseExam',
      paths:[
        'exams.selectedExam'
      ],
      storage: window.localStorage
    }
  )]
})