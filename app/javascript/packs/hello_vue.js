import Vue from 'vue'
import App from '../app.vue'
import axios from '../plugins/axios'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import router from './router.js'
import store from '../store/store.js'
import '../plugins/validation.js'
import vuetify from '../plugins/vuetify.js'

import TheButton from '../components/TheButton.vue'
Vue.component('TheButton', TheButton)

Vue.config.productionTip = false
Vue.prototype.$axios = axios

document.addEventListener('DOMContentLoaded', () => {
	const app = new Vue({
    store,
    router,
    vuetify,
    render: h => h(App)
  }).$mount()
  document.body.appendChild(app.$el)
})