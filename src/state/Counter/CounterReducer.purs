module State.Counter.Reducer where

import Prelude
import State.Reducer
import State.Counter.Action

type State = Int

initialState :: State
initialState = 0

reducer :: Reducer State Action
reducer (Initial) _ = initialState
reducer (Increment x) s = increment s x
reducer (Decrement x) s = decrement s x

increment :: Reducer State Int
increment state x = state + x

decrement :: Reducer State Int
decrement state x = state - x
