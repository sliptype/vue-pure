<template>
  <div id="app">
    <button @click="addList('test')">Add List</button>
    <button @click="addList('test')">Add Item</button>
    <button @click="addList('test')">Move Item</button>
    <ul>
      <List v-for="listId in listIds" :id="listId"></List>
    </ul>
  </div>
</template>

<script>
import List from './components/List.vue'
import { mapMutations, mapState } from 'vuex'

export default {
  name: 'app',

  components: {
    List
  },

  computed: {
    ...mapState({
      listIds: s => s.list.ids
    })
  },

  methods: {
    ...mapMutations([
      'addList'
    ])
},

}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
