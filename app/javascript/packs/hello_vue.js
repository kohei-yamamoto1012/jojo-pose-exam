import Vue from 'vue'
import App from '../app.vue'
import axios from '../plugins/axios'
import router from './router.js'
import store from '../store/store.js'
import '../plugins/validation.js'
import vuetify from '../plugins/vuetify.js'

import AppLinkButton from '../components/AppLinkButton.vue'
import AppSectionTitle from '../components/AppSectionTitle.vue'
Vue.component('AppLinkButton', AppLinkButton)
Vue.component('AppSectionTitle', AppSectionTitle)

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