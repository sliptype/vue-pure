<template>
  <li class="item">
    <span v-text="item.name"></span>
  </li>
</template>

<script>
import { mapMutations, mapState } from 'vuex'

export default {
  name: 'Item',

  computed: {
    ...mapState({
      item(s) {
        return s.item.byId[this.id]
      },
    })
  },

  props: {
    id: String
  }
}
</script>

<style scoped lang="scss">

.item {
  text-align: left;
  padding: 1rem 0
}

</style>
