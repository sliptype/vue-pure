<template>
  <li class="list">
    <h3 v-text="props.name"></h3>
    <ul class="item-container">
      <Connected
        v-for="id in props.itemIds"
        :component="item"
        :componentProps="{ id }"/>
    </ul>
    <input v-model="newItemName" @keyup.enter="actions.addItem(newItemName)" placeholder="New Item..."/>
  </li>
</template>

<script>
import Connected from '../Connected/Connected.vue'
import Item from '../Item/Item.vue'

export default {
  name: 'List',

  data() {
    return {
      item: Item,
      newItemName: "",
    }
  },

  props: {
    props: Object,
    actions: Object,
  },

  components: {
    Connected,
    Item,
  },

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
