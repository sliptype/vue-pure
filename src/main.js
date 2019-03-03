import Vue from 'vue'

import App from './App.vue'
import createRouter from './router.js'

new Vue({
  render: h => h(App),
  router: createRouter(),
}).$mount('#app')
