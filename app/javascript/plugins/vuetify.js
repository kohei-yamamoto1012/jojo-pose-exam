import '@mdi/font/css/materialdesignicons.css'
import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'

Vue.use(Vuetify)

export default new Vuetify({
  icons: {
    iconfont: 'mdi',
  },
  theme: {
    themes: {
      light: {
        primary: '#7C4DFF',
        accent: '#FFD059',
        background: '#F2F3FB',
        font: '#595959'
      }
    },
    options: { customProperties: true, variations: false }
  }
})