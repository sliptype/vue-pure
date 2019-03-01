<template>
  <div>
    <h1>Counter</h1>
    <button @click="actions.increment()">Increment</button>
    <button @click="addList('test')">Decrement</button>
  </div>
</template>

<script>
export default {
  name: 'Counter',
  props: ['actions', 'value'],
}
</script>

<style scoped lang="scss">
</style>
