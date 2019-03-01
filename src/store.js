import Vue from 'vue'
import { createStore, combineReducers } from 'redux';
import Counter from './state/Counter.purs'
import { uncurry } from './utils/utils.js'

const store = createStore(
  combineReducers({
    counter: uncurry(Counter.reducer)
  }),
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__()
);

// TODO: Maybe no mixin to better compat with vuejs-redux Provider
export default function injectStore() {
  Vue.mixin({
    data() {
      return { globalStore: store };
    },
  });
}
