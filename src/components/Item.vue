<template>
  <li>
    <h3 v-text="item.name"></h3>
  </li>
</template>

<script>
import { mapMutations, mapState } from 'vuex'

export default {
  name: 'Item',

  computed: {
    ...mapState({
      item(s) {
        return s.itemsById[this.id]
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
