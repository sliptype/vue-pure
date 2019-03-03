module State.Entity where

import Prelude

import Data.Array ((:), length)
import Data.Maybe (Maybe(..))
import Foreign.Object (Object(..), empty, insert, lookup)

type EntityId = String

type Entity a =
  { ids :: Array EntityId
  , byId :: Object a
  }

entity :: forall a. Entity a
entity =
  { ids: []
  , byId: empty
  }

nextId :: forall a. Entity a -> EntityId
nextId e = show $ length e.ids

addInstance :: forall a. EntityId -> a -> Entity a -> Entity a
addInstance id i e =
  e { ids = id : e.ids
    , byId = insert id i e.byId
    }

updateInstance :: forall a. (a -> a) -> EntityId -> Entity a -> Entity a
updateInstance f id e =
  let i = lookup id e.byId in
  case i of
    Nothing -> e
    Just ins ->
      e { byId = insert id (f ins) e.byId }


