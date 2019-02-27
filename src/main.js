import Vue from 'vue'

import App from './App.vue'
import createRouter from './router.js'
import createStore from './store.js'

// This will inject a the store into every component using a mixin
createStore();

new Vue({
  render: h => h(App),
  router: createRouter(),
}).$mount('#app')
