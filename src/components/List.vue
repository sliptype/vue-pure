<template>
  <li>
    <h3 v-text="list.name"></h3>
    <ul>
      <Item v-for="itemId in list.itemIds" :id="itemId"></Item>
    </ul>
  </li>
</template>

<script>
import { mapMutations, mapState } from 'vuex'

export default {
  name: 'List',

  computed: {
    ...mapState({
      list(s) {
        return s.listsById[this.id]
      },
    })
  },

  props: {
    id: String
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
