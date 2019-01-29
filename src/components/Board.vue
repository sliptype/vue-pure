<template>
  <div>
    <ul class="board">
      <List v-for="listId in listIds" :id="listId"></List>
    </ul>
  </div>
</template>

<script>
import List from './List.vue'
import { mapMutations, mapState } from 'vuex'
import actions from '../state/actions.js'

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
      actions.addList
    ])
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
