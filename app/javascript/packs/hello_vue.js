import Vue from 'vue'
import App from '../app.vue'
import axios from '../plugins/axios'
import router from './router.js'
import store from '../store/store.js'
import '../plugins/validation.js'
import vuetify from '../plugins/vuetify.js'

import TheLinkButton from '../components/TheLinkButton.vue'
import TheSectionTitle from '../components/TheSectionTitle.vue'
Vue.component('TheLinkButton', TheLinkButton)
Vue.component('TheSectionTitle', TheSectionTitle)

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