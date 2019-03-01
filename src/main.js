import Vue from 'vue'

import App from './App.vue'
import createRouter from './router.js'
import createStore from './store.js'

const store = createStore();

new Vue({
  render: h => h(App),
  router: createRouter(store),
}).$mount('#app')
