<template>
  <li class="list">
    <h3 v-text="list.name"></h3>
    <ul class="item-container">
      <Item v-for="itemId in list.itemIds" :id="itemId"></Item>
    </ul>
    <input v-model="newItemName" @keyup.enter="addItem" placeholder="New Item..."/>
  </li>
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
      this.newItemName = "";
    },
  },

  props: {
    id: String
  }
}
</script>

<style scoped lang="scss">

.list {
  border-top: 5px solid aquamarine;
  box-shadow: 0px 2px 5px 0px #cacaca;
  display: flex;
  flex-direction: column;
  margin: 0 10px;
  min-width: 20rem;
}

.item-container {
  flex-grow: 1;
  list-style-type: none;
  margin: 0 1rem;
  padding: 0;
}

input {
  border: none;
  padding: 1rem;
}
</style>
