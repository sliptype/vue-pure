<template>
  <Provider
    :mapDispatchToProps="mapDispatchToProps"
    :mapStateToProps="mapStateToProps"
    :ownProps="componentProps"
    :store="store"
  >
    <template v-slot="{ props, actions }">
      <component
        :actions="actions"
        :is="component"
        :props="{ ...props, ...componentProps }"
      />
    </template>
  </Provider>
</template>

<script>
import Provider from 'vuejs-redux'

export default {
  props: [
    'component',
    'componentProps',
    'mapStateToProps',
    'mapDispatchToProps',
    'store',
  ],

  components: {
    Provider
  },

}
</script>
