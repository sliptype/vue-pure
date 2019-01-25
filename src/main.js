import Vue from 'vue'
import Vuex from 'vuex'
import { reducers as createMutations } from 'vuex-reducer'

import App from './App.vue'
import { mapObjectValues, uncurry } from './utils/utils.js'
import { initialState as state } from './state/Model.purs'
import reducers from './state/Reducers.purs'

Vue.config.productionTip = false

Vue.use(Vuex)

const uncurriedReducers = mapObjectValues(reducers, uncurry)
const mutations = createMutations(uncurriedReducers)

const store = new Vuex.Store({
  state,
  mutations,
})

new Vue({
  render: h => h(App),
  store,
}).$mount('#app')
