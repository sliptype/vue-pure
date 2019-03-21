module State.Counter.Action where

-- Action is a tagged union
-- with a constructor for each type of action
data Action
  = Increment Int
  | Decrement Int
