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

export default {
  name: 'Actions',

  methods: {
    ...mapMutations([
      'addList'
    ])
  },
}
</script>

<style scoped lang="scss">
</style>
