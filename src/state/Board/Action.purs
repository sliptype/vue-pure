module State.Board.Action where

import State.Entity (EntityId)

data Action =
  Initial
  | AddList String
  | AddItemToList EntityId String
