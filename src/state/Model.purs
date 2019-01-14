module State.Model where

import Prelude

import Foreign.Object (Object(..), empty)
import Effect (Effect)
import Effect.Console (log)

type Item =
  { name :: String }

type List =
  { name :: String
  , itemIds :: Array Int
  }

type State =
  { listIds :: Array Int
  , listsById :: Object List
  , itemIds :: Array Int
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

item :: String -> Item
item name =
  { name }

