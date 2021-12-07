import Vue from 'vue'
import { ValidationObserver, ValidationProvider, extend } from 'vee-validate'
import { required, image } from 'vee-validate/dist/rules'


Vue.component('ValidationObserver', ValidationObserver)
Vue.component('ValidationProvider', ValidationProvider)

extend('required', {
  ...required,
  message: '{_field_}は必須項目です'
})

extend('image', {
  ...image,
  message: '{_field_}は画像形式で入力してください'
})

export default ValidationProvider