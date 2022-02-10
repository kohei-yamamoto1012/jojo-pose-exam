import axios from 'axios'
import store from "../store/store.js"

const axiosInstance = axios.create({
  // baseURL: 'api'
})

axiosInstance.interceptors.response.use(
  response => response,
  error => {
    const { status } = error.response
    store.commit("responseStatus/setResponseStatus", status)
    return Promise.reject(error)
  }
)

export default axiosInstance