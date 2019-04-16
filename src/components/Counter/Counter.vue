<template>
  <div class="counter">
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

<style scoped>
.counter {
  margin-top: 5rem;
}

button {
  background-color: aquamarine;
  color: black;
  padding: 1rem;
  text-transform: uppercase;
  border: none;
  margin: 1rem;
  cursor: pointer;
}

button:hover {
  background-color: darkcyan;
  color: white;
}
</style>
