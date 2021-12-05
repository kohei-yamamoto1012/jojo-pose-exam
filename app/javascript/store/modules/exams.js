import axios from '../../plugins/axios'

export default {
  namespaced: true,

  state: {
    exams: [],
    selectedExam: {}
  },

  getters: {
    exams(state){
      return state.exams
    },
    selectedExam(state){
      return state.selectedExam
    }
  },

  mutations: {
    setExams(state, exams){
      state.exams = exams
    },
    setSelectedExam(state, exam){
      state.selectedExam = exam
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