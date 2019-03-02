<template>
  <div>
    <h1>Counter: {{value}}</h1>
    <button @click="actions.increment(1)">Increment</button>
    <button @click="actions.decrement(2)">Decrement</button>
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
