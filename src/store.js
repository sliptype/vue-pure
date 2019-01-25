import Vue from 'vue'
import Vuex from 'vuex'
import { reducers as createMutations } from 'vuex-reducer'

import { mapObjectValues, uncurry } from './utils/utils.js'
import { initialState as state } from './state/Model.purs'
import reducers from './state/Reducers.purs'

export default function createStore() {
  Vue.use(Vuex)

  const uncurriedReducers = mapObjectValues(reducers, uncurry)
  const mutations = createMutations(uncurriedReducers)

  return new Vuex.Store({
    state,
    mutations,
  })
}
