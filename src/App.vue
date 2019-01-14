<template>
  <div id="app">
    <img @click="addList('test')" alt="Vue logo" src="./assets/logo.png">
    <HelloWorld msg="Welcome to Your Vue.js App"/>
  </div>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'
import { mapMutations } from 'vuex'

export default {
  name: 'app',

  components: {
    HelloWorld
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
