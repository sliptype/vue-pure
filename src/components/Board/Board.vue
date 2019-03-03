<template>
  <div>
    <ul class="board">
      <Connected :component="list" v-for="id in props.listIds" :ownProps="{ id }" :store="props.store"></Connected>
    </ul>
  </div>
</template>

<script>
import Connected from '../Connected/Connected.vue'
import List from '../List/List.vue'

export default {
  name: 'Board',

  props: ['actions', 'props'],

  data: function () {
    return {
      list: List,
    }
  },

  components: {
    Connected,
    List,
  },
}
</script>

<style scoped lang="scss">
.board {
  display: flex;
  justify-content: space-between;
  max-width: 1200px;
  margin: 10rem auto;
}
</style>
