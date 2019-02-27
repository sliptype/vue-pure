module State.Counter where

import Prelude

-- Defines a type "State" that is a record (object)
-- containing a field "count" of type Int
type State = {
    count :: Int
  }

-- Defines a function "initialState" of the type State
-- meaning it takes 0 arguments and returns a State
initialState :: State
initialState = {
    count: 0
  }

-- Defines a function "increment" of the type State -> State
-- meaning it takes 1 argument of type State and returns a value
-- of type State
increment :: State -> State
increment state = state {
    count = state.count + 1
  }

