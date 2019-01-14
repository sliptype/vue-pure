import Vue from 'vue'
import Vuex from 'vuex'
import { reducers as createReducers } from 'vuex-reducer'

import App from './App.vue'
import { initialState as state } from './state/Model.purs'
import reducers from './state/Reducers.purs'

Vue.config.productionTip = false

Vue.use(Vuex)

const uncurry = f => (a, b) => f(a)(b)

const mapValues = (obj, f) =>
  Object
    .keys(obj)
    .reduce((result, current) => ({
      ...result,
      [current]: f(obj[current])
    }), {})

const mutations = createReducers(mapValues(reducers, uncurry))

const store = new Vuex.Store({
  state,
  mutations,
})

new Vue({
  render: h => h(App),
  store,
}).$mount('#app')
