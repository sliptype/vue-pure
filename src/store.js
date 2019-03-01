import Vue from 'vue'
import { createStore, combineReducers } from 'redux';
import Counter from './state/Counter/CounterReducer.purs'
import { uncurry } from './utils/utils.js'

export default () => createStore(
  combineReducers({
    counter: uncurry(Counter.reducer)
  }),
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__()
);
