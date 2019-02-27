<template>
  <li class="item">
    <button><</button>
    <div class="name" v-text="item.name"></div>
    <button>></button>
  </li>
</template>

<script>
import { mapMutations, mapState } from 'vuex'
import actions from '../state/actions.js'

export default {
  name: 'Item',

  computed: {
    ...mapState({
      item(s) {
        return s.item.byId[this.id]
      },
    })
  },

  methods: {
    ...mapMutations([
      actions.moveItemRight,
      actions.moveItemLeft,
    ])
  },

  props: {
    id: String
  }
}
</script>

<style scoped lang="scss">

.item {
  display: flex;
  text-align: left;
  padding: 1rem 0
}

.name {
  flex: 1;
  margin: 0 1rem;
}

button {
  border: none;
}

</style>
