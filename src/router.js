import Vue from 'vue'
import VueRouter from 'vue-router'

import Actions from './components/Actions.vue'
import Board from './components/Board.vue'
import CounterProvider from './components/CounterProvider.vue'

const routes = [
  {
    path: '/',
    component: Board,
  },
  {
    path: '/actions',
    component: Actions,
  },
  {
    path: '/counter',
    component: CounterProvider,
  }
];

export default function createRouter(store) {
  Vue.use(VueRouter)

  return new VueRouter({
    routes: augmentRoutesWithStore(routes)(store),
  });
}

const augmentRoutesWithStore = (routes) => (store) =>
  routes.map(x => ({
    ...x,
    props: { store },
  }))
