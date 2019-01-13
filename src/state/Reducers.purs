module State.Reducers where

import Prelude

import Effect (Effect)
import Effect.Console (log)

import State.Model (State)

update :: State -> Int -> State
update state payload = state { count = payload }



