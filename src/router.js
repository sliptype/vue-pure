import Vue from 'vue'
import VueRouter from 'vue-router'

import Actions from './components/Actions.vue'
import Board from './components/Board.vue'

import Connected from './components/Connected/Connected.vue'

import Counter from './components/Counter/Counter.vue'
import CounterConnect from './components/Counter/Counter.purs'

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
    component: Connected,
    props: {
      component: Counter,
      mapDispatchToProps: CounterConnect.mapDispatchToProps,
      mapStateToProps: CounterConnect.mapStateToProps,
    },
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
    props: {
      ...x.props,
      store,
    },
  }))
