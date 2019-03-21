module State.Counter.Reducer where

import Prelude
import Data.Maybe (Maybe)

import State.Reducer (withInitialState)
import State.Counter (State, initialState)
import State.Counter.Action (Action(..))

-- counterReducer is a function taking an Action, a State, and returning a State
-- The action is destructured via pattern matching
-- The bottom case handles any action not explicitly handled
counterReducer :: Action -> State -> State
counterReducer (Increment x) state = state + x
counterReducer (Decrement x) state = state - x
counterReducer _ state = state

-- reducer wraps counterReducer to provide an initial state
reducer :: (Maybe Action) -> State -> State
reducer = withInitialState counterReducer initialState
