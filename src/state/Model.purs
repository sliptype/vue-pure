module State.Model where

import Prelude

import Effect (Effect)
import Effect.Console (log)

type State =
  { count :: Int }

initialState :: State
initialState =
  {
    count: 1
  }


