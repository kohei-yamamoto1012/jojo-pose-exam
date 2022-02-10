export default {
  namespaced: true,

  state: {
    responseStatus: null
  },

  getters: {
    responseStatus(state){
      return state.responseStatus
    }
  },

  mutations: {
    setResponseStatus(state, status){
      state.responseStatus = status
    }
  }
}