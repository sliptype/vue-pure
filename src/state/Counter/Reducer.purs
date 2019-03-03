module State.Counter.Reducer where

import Prelude

import State.Counter (State, initialState)
import State.Counter.Action (Action(..))

reducer :: Action -> State -> State
reducer (Initial) _ = initialState
reducer (Increment x) state = state + x 
reducer (Decrement x) state = state - x
