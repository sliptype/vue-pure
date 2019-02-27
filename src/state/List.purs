module State.List where

import Prelude

import Data.Array ((:), filter, findIndex)
import Data.Maybe (Maybe(..))

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

findItemIndex :: String -> List -> Maybe Int
findItemIndex id l = findIndex (_ == id) l.itemIds

removeItemFromList :: String -> List -> List
removeItemFromList id l = l { itemIds = filter (_ /= id) l.itemIds }

