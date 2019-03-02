<template>
  <li class="item">
    <span v-text="item.name"></span>
  </li>
</template>

<script>

export default {
  name: 'Item',

  computed: {},

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
