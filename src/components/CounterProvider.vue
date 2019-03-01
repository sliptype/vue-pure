<template>
  <Provider :mapDispatchToProps="mapDispatchToProps" :mapStateToProps="mapStateToProps" :store="store">
    <template v-slot="{value, actions}">
      <Counter :value="value" :actions="actions"/>
    </template>
  </Provider>
</template>

<script>
import { dispatch } from 'redux'
import Provider from 'vuejs-redux'

import Counter from './Counter.vue'
import Actions from '../state/Counter/CounterAction.purs'

const {
  increment,
  decrement,
} = Actions;

export default {
  props: ['store'],

  methods: {
    mapStateToProps: (state) => ({
        value: state.counter
    }),

    mapDispatchToProps: (dispatch) => ({
      actions: {
        increment: () => {
console.log(increment);
console.log(increment(1));
          dispatch({ ...increment(1) });
        }
      },
    }),
  },

  components: {
    Counter,
    Provider
  },

}
</script>
