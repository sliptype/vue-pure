module State.Board.List where

import Prelude

import Data.Array ((:))

import State.Entity (EntityId)

type List =
  { name :: String
  , itemIds :: Array String
  }

list :: String -> List
list name =
  { name
  , itemIds: []
  }

addItem :: EntityId -> List -> List
addItem id l = l { itemIds = id : l.itemIds }

