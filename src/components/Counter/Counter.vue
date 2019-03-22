<template>
  <div>
    <h1>Counter: {{ props.value }}</h1>
    <button @click="actions.increment(1)">Increment</button>
    <button @click="actions.decrement(1)">Decrement</button>
  </div>
</template>

<script>
export default {
  name: 'Counter',
  props: ['actions', 'props'],
}
</script>
