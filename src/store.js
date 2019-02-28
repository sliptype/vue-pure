import Vue from 'vue'
import s from './state/Model.purs'

export default function injectStore() {
  Vue.mixin({
    data() {
      const store = s.createStore();
      console.log(store);
      return {
        store
      };
    },
  });
}
