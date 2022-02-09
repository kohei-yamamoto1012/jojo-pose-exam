import axios from 'axios'
import store from "../store/store.js"

const axiosInstance = axios.create({
  // baseURL: 'api'
})

axiosInstance.interceptors.response.use(
  response => response,
  error => {
    const { status } = error.response
    const notFound = 404
    if (status === notFound) {
      store.commit("isNotFound/setIsNotFound", true)
    }
    return Promise.reject(error)
  }
)

export default axiosInstance