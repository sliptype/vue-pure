import { createStore, compose, applyMiddleware } from 'redux'

import { reducer as rootReducer } from './Board/Reducer.purs'
import { Initial } from './Board/Action.purs'

/**
 * Pass data into the purescript reducer
 * @param { Object } state
 * @param { Object } action
 */
const reducer = (state, action) => (
  state === undefined
    ? rootReducer (Initial.value) ({})
    : rootReducer (action.data) (state)
)

/**
 * Redux middleware to transform purescript action into a standard action
 * @param { Function } next
 * @param { Object } action
 */
const standardizeAction = _ => next => action => (
  next({
    type: action.constructor.name,
    data: action
  })
)

const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose

const store = createStore(reducer, composeEnhancers(applyMiddleware(
  standardizeAction,
)))

/**
 * Export a Vue mixin that expose the store
 * @returns { Mixin }
 */
export default {
  data() {
    return {
      store,
    };
  },
}
