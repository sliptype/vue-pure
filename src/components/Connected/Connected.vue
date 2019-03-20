<template>
  <div v-if="connector">
    <Provider
      :mapDispatchToProps="connector.mapDispatchToProps"
      :mapStateToProps="connector.mapStateToProps"
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
  </div>
</template>

<script>
import Provider from 'vuejs-redux'
import Store from '../../state/store.js'

/**
 * This component dynamically connects a given component to the store
 * using a naming convention by default and optionally a path.
 * By default 'Counter/Counter.vue' will be connected with 'Counter/Counter.purs'
 */
export default {
  components: {
    Provider
  },

  data() {
    return {
      connector: null,
    }
  },

  mixins: [Store],

  methods: {
    async getConnector() {

      // Dynamically import the connector, which should contain mapDispatchToProps & mapStateToProps
      this.connector = await import(`../${ this.component.name }/${ this.component.name }.purs`)

      if (!this.connector) {
        throw new Error('Could not find specified store connector, did you declare a corresponding .purs file?')
      }
    },
  },

  mounted() {
    this.getConnector();
  },

  props: {
    component: {
      type: Object,
      required: true,
    },
    componentProps: {
      type: Object,
      required: false,
    },
    connectorPath: {
      type: String,
      required: false,
    },
  },
}
</script>
