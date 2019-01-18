module State.Entity where

import Prelude

import Data.Array ((:), length)
import Data.Maybe (Maybe(..))
import Foreign.Object (Object(..), empty, insert, lookup)

import State.Item (Item(..), item)

type Entity a =
  { ids :: Array String
  , byId :: Object a
  }

entity :: forall a. Entity a
entity =
  { ids: []
  , byId: empty
  }

nextId :: forall a. Entity a -> String
nextId e = show $ length e.ids

addInstance :: forall a. String -> a -> Entity a -> Entity a
addInstance id i e =
  e { ids = id : e.ids
    , byId = insert id i e.byId
    }

updateInstance :: forall a. (a -> a) -> String -> Entity a -> Entity a
updateInstance f id e =
  let i = lookup id e.byId in
  case i of
    Nothing -> e
    Just ins ->
      e { byId = insert id (f ins) e.byId }


