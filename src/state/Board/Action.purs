module State.Board.Action where

import State.Entity (EntityId)

data Action
  = AddList String
  | AddItemToList EntityId String
