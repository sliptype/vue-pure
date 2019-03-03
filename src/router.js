import Vue from 'vue'
import VueRouter from 'vue-router'

import Actions from './components/Actions.vue'
import Board from './components/Board/Board.vue'
import Connected from './components/Connected/Connected.vue'
import Counter from './components/Counter/Counter.vue'

const routes = [
  {
    path: '/',
    component: Connected,
    props: {
      component: Board,
    },
  },
  {
    path: '/actions',
    component: Actions,
  },
  {
    path: '/counter',
    component: Connected,
    props: {
      component: Counter,
    },
  }
];

export default function createRouter(store) {
  Vue.use(VueRouter)

  return new VueRouter({
    routes,
  });
}
