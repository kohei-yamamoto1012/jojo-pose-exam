export default {
  namespaced: true,

  state: {
    isNotFound: false
  },

  getters: {
    isNotFound(state){
      return state.isNotFound
    }
  },

  mutations: {
    setIsNotFound(state, bool){
      state.isNotFound = bool
    }
  }
}