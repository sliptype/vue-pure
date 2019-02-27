import Vue from 'vue'
import store  from './state/Store.purs'

export default function createStore() {
  Vue.Mixin({
    data() {
      return {
        store,
      };
    },
  });
}
