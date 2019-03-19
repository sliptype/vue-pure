import { applyMiddleware, combineReducers, compose, createStore } from 'redux'
import { mapObjectValues } from '../utils/utils.js'

import { reducer as counter } from './Counter/Reducer.purs'
import { reducer as board } from './Board/Reducer.purs'
import { initialAction } from './App/Reducer.purs'

/**
 * Pass data into the purescript reducer
 * @param { Object } state
 * @param { Object } action
 */
const uncurryReducer = (curriedReducer) => (state, action) => (
  state === undefined
    ? curriedReducer (initialAction) ({})
    : curriedReducer (action.data) (state)
)

/**
 * Redux middleware to transform purescript action into a standard action
 * @param { Function } next
 * @param { Object } action
 */
const standardizeAction = () => next => action => (
  next({
    type: action.constructor.name,
    data: action
  })
)

/**
 * Combine reducers into root reducer
 * TODO: Do this in purescript
 */
const rootReducer = combineReducers(mapObjectValues({
  counter,
  board,
}, uncurryReducer));

const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose

const store = createStore(rootReducer, composeEnhancers(applyMiddleware(
  standardizeAction,
)))

/**
 * A Vue mixin that exposes the store
 * @returns { Mixin }
 */
export default {
  data() {
    return {
      store,
    };
  },
}
