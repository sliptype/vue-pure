import Vue from 'vue'
import VueRouter from 'vue-router'

import Board from './components/Board/Board.vue'
import Connected from './components/Connected/Connected.vue'
import Counter from './components/Counter/Counter.vue'

const routes = [
  {
    path: '/',
    component: Connected,
    props: {
      component: Counter,
    },
  },
  {
    path: '/board',
    component: Connected,
    props: {
      component: Board,
    },
  },
];

export default function createRouter() {
  Vue.use(VueRouter)

  return new VueRouter({
    routes,
  });
}
