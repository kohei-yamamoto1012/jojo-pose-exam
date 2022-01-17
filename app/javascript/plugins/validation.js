import Vue from 'vue'
import { ValidationObserver, ValidationProvider, extend } from 'vee-validate'
import { required, image } from 'vee-validate/dist/rules'


Vue.component('ValidationObserver', ValidationObserver)
Vue.component('ValidationProvider', ValidationProvider)

extend('required', {
  ...required,
  message: '必須項目です'
})

extend('image', {
  ...image,
  message: '画像ファイルを選択してください'
})

export default ValidationProvider