import Vue from 'vue'
import App from '../app.vue'
import axios from '../plugins/axios'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import router from './router.js'
import store from '../store/store.js'

Vue.config.productionTip = false
Vue.prototype.$axios = axios

document.addEventListener('DOMContentLoaded', () => {
	const app = new Vue({
    store,
    router,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)
})