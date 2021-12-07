import Vue from 'vue'
import { ValidationObserver, ValidationProvider, extend } from 'vee-validate'

Vue.component('ValidationObserver', ValidationObserver)
Vue.component('ValidationProvider', ValidationProvider)



export default ValidationProvider