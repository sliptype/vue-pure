import Vue from 'vue'
import VueRouter from 'vue-router'

import Actions from './components/Actions.vue'

import Connected from './components/Connected/Connected.vue'

import Board from './components/Board/Board.vue'
import BoardConnect from './components/Board/Board.purs'

import Counter from './components/Counter/Counter.vue'
import CounterConnect from './components/Counter/Counter.purs'

const routes = (store) => [
  {
    path: '/',
    component: Connected,
    props: {
      component: Board,
      componentProps: { store },
      mapDispatchToProps: BoardConnect.mapDispatchToProps,
      mapStateToProps: BoardConnect.mapStateToProps,
      store: store,
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
      mapDispatchToProps: CounterConnect.mapDispatchToProps,
      mapStateToProps: CounterConnect.mapStateToProps,
      store: store,
    },
  }
];

export default function createRouter(store) {
  Vue.use(VueRouter)

  return new VueRouter({
    routes: routes(store),
  });
}
