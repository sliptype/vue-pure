<template>
  <Provider :mapDispatchToProps="mapDispatchToProps" :mapStateToProps="mapStateToProps" :store="store">
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
  props: ['store'],

  methods: {
    mapStateToProps: (state) => ({
        value: state.counter
    }),

    mapDispatchToProps: (dispatch) => ({
      actions: {
        increment: () => dispatch({ "type": "increment", value: 1 }),
      },
    }),
  },

  components: {
    Counter,
    Provider
  },

}
</script>
