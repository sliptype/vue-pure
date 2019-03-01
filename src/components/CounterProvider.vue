<template>
  <Provider :mapDispatchToProps="mapDispatchToProps" :mapStateToProps="mapStateToProps" :store="globalStore">
    <template v-slot="{value, actions}">
      <Counter :value="value" :actions="actions"/>
    </template>
  </Provider>
</template>

<script>
import { dispatch } from 'redux';
import Provider from 'vuejs-redux';

import Counter from './Counter.vue';

export default {
  name: 'CounterProvider',

  methods: {
    mapStateToProps(state) {
      return {
        value: state.counter
      }
    },

    mapDispatchToProps(dispatch) {
      return {
        actions: {
          increment: () => dispatch({ "type": "increment", value: 1 }),
        },
      };
    }
  },

  components: {
    Counter,
    Provider
  },

}
</script>
