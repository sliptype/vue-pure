<template>
  <div>
    <li>
      <h3 v-text="list.name"></h3>
      <ul>
        <Item v-for="itemId in list.itemIds" :id="itemId"></Item>
      </ul>
    </li>
    <input v-model="newItemName" @keyup.enter="addItem" placeholder="New Item..."/>
  </div>
</template>

<script>
import Item from './Item.vue'
import { mapMutations, mapState } from 'vuex'

export default {
  name: 'List',

  components: {
    Item,
  },

  computed: {
    ...mapState({
      list(s) {
        return s.list.byId[this.id]
      },
    })
  },

  data() {
    return {
      newItemName: "",
    }
  },

  methods: {
    addItem() {
      this.$store.commit('addItem', {
        id: this.id,
        name: this.newItemName,
      });
    },
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
