<template>
  <Provider :mapDispatchToProps="mapDispatchToProps" :mapStateToProps="mapStateToProps" :store="store">
    <template v-slot="{ props, actions }">
      <component :is="component" :props="props" :actions="actions"/>
    </template>
  </Provider>
</template>

<script>
import Provider from 'vuejs-redux'

export default {
  props: [
    'component',
    'mapStateToProps',
    'mapDispatchToProps',
    'store',
  ],

  components: {
    Provider
  },

}
</script>
