import Vue from 'vue'
import Vuex from 'vuex'
import { reducers } from 'vuex-reducer'
import App from './App.vue'

Vue.config.productionTip = false

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    value: {
      name: 'foo'
    },
    history: []
  },

  mutations: reducers({
    update: (state, name) => ({
      value: {
        name
      },
      history: [...state.history, state.value]
    })
  })
})

new Vue({
  render: h => h(App),
  store,
}).$mount('#app')
