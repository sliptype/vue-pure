module State.List where

import Prelude

import Data.Array ((:))

type List =
  { name :: String
  , itemIds :: Array String
  }

list :: String -> List
list name =
  { name
  , itemIds: []
  }

addItemToList :: String -> List -> List
addItemToList id l = l { itemIds = id : l.itemIds }

