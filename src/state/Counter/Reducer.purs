module State.Counter.Reducer where

import Prelude
import State.Reducer
import State.Counter.State
import State.Counter.Action

reducer :: Reducer State Action
reducer (Initial) _ = initialState
reducer (Increment x) s = increment s x
reducer (Decrement x) s = decrement s x

increment :: Reducer State Int
increment state x = state + x

decrement :: Reducer State Int
decrement state x = state - x
