module State.Model where

import Prelude

import Data.Array ((:))
import Foreign.Object (Object(..), empty)
import Effect (Effect)
import Effect.Console (log)

type Item =
  { name :: String }

type List =
  { name :: String
  , itemIds :: Array String
  }

type State =
  { listIds :: Array String
  , listsById :: Object List
  , itemIds :: Array String
  , itemsById :: Object Item
  }

initialState :: State
initialState =
  { listIds: []
  , listsById: empty
  , itemIds: []
  , itemsById: empty
  }

emptyList :: String -> List
emptyList name =
  { name
  , itemIds: []
  }

addItemToList :: String -> List -> List
addItemToList itemId list = list { itemIds = itemId : list.itemIds }

item :: String -> Item
item name =
  { name }

