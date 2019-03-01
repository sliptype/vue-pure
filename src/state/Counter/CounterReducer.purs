module State.Counter.Reducer where

import Prelude
import State.Reducer
import State.Counter.Action

type State = Int

initialState :: State
initialState = 0

reducer :: forall a. Reducer State Action
reducer s (Increment x) = increment s x
reducer s (Decrement x) = decrement s x
reducer s _ = initialState

increment :: Reducer State Int
increment state x = state + x

decrement :: Reducer State Int
decrement state x = state - x
