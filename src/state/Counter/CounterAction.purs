module State.Counter.Action where

data Action
  = Increment Int
  | Decrement Int

increment :: Int -> Action
increment i = Increment i

decrement :: Int -> Action
decrement i = Increment i
