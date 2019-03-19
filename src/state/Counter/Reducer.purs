module State.Counter.Reducer where

import Prelude
import Data.Maybe (Maybe)

import State.Reducer (withInitialState)
import State.Counter (State, initialState)
import State.Counter.Action (Action(..))

counterReducer :: Action -> State -> State
counterReducer (Increment x) state = state + x
counterReducer (Decrement x) state = state - x
counterReducer _ state = state

reducer :: (Maybe Action) -> State -> State
reducer = withInitialState counterReducer initialState
