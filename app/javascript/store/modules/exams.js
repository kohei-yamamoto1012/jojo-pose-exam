import axios from '../../plugins/axios'

export default {
  namespaced: true,

  state: {
    exams: []
  },

  getters: {
    exams(state){
      return state.exams
    }
  },

  mutations: {
    setExams(state, exams){
      state.exams = exams
    }
  },

  actions: {
    fetchExams({commit}){
      axios.get('exams')
        .then(res => commit('setExams', res.data))
        .catch(err => console.log(err.response))
    }
  }
}