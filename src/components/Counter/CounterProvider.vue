<template>
  <Provider :mapDispatchToProps="mapDispatchToProps" :mapStateToProps="mapStateToProps" :store="store">
    <template v-slot="{ value, actions }">
      <Counter :value="value" :actions="actions"/>
    </template>
  </Provider>
</template>

<script>
import Provider from 'vuejs-redux'

import Counter from './Counter.vue'
import { mapStateToProps, mapDispatchToProps } from './CounterConnect.purs'

console.log('dispatch', mapDispatchToProps);

export default {
  props: ['store'],

  methods: {
    mapStateToProps,
    mapDispatchToProps,
  },

  components: {
    Counter,
    Provider
  },

}
</script>
