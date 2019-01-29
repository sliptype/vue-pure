<template>
  <div>
    <h1>Actions</h1>
    <button @click="addList('test')">Add List</button>
    <button @click="addList('test')">Add Item</button>
    <button @click="addList('test')">Move Item</button>
  </div>
</template>

<script>
import { mapMutations, mapState } from 'vuex'
import actions from '../state/actions.js'

export default {
  name: 'Actions',

  methods: {
    ...mapMutations([
      actions.addList
    ])
  },
}
</script>

<style scoped lang="scss">
</style>
