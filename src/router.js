import Vue from 'vue'
import VueRouter from 'vue-router'

import Actions from './components/Actions.vue'
import Board from './components/Board.vue'
import CounterProvider from './components/CounterProvider.vue'

export default function createRouter() {
  Vue.use(VueRouter)

  return new VueRouter({
    routes: [
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
    ]
  })
}
