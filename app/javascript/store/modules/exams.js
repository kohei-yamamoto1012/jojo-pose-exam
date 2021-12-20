import axios from '../../plugins/axios'

export default {
  namespaced: true,

  state: {
    exams: [],
    exam: {}
  },

  getters: {
    exams(state){
      return state.exams
    },
    exam(state){
      return state.exam
    }
  },

  mutations: {
    setExams(state, exams){
      state.exams = exams
    },
    setExam(state, exam){
      state.exam = exam
    }
  },

  actions: {
    fetchExams({commit}){
      axios.get('/api/exams')
        .then(res => commit('setExams', res.data))
        .catch(err => console.log(err.response))
    },
    fetchExam({commit}, exam_id){
      axios.get(`/api/exams/${exam_id}`)
        .then(res => commit('setExam', res.data.exam))
        .catch(err => console.log(err.response))
    }
  }
}