module State.Counter
  ( increment
  , decrement
  , reducer
  ) where

import Prelude
import Data.Maybe (Maybe(..))

type Action a = { "type" :: String | a }
type IncrementAction = Action ( value :: Int )

type Reducer a = State -> a -> State

type State = Int

initialState :: State
initialState = 0

-- TODO: Clean up this pattern matching
-- TODO: How to pass different payloads?
reducer :: Reducer IncrementAction
reducer s { "type": "increment", value: x }= increment s x
reducer s { "type": "decrement", value: x } = decrement s x
reducer s { "type": _ } = initialState

increment :: Reducer Int
increment state x = state + x

decrement :: Reducer Int
decrement state x = state - x
