<template>
  <li class="item">
    <span v-text="props.name"></span>
  </li>
</template>

<script>

export default {
  name: 'Item',

  computed: {},

  props: {
    props: Object,
    actions: Object,
  },
}
</script>

<style scoped lang="scss">

.item {
  text-align: left;
  padding: 1rem 0
}

</style>
