module State.Counter where

-- State is a type synonym of Int
type State = Int

-- initialState is a function taking zero arguments
-- and returning a value of type State
initialState :: State
initialState = 0
