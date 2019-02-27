module State.Entity where

import Prelude

import Data.Array ((:), length)
import Data.Foldable (class Foldable, elem)
import Data.Maybe (Maybe(..))
import Foreign.Object (Object(..), empty, insert, lookup, mapWithKey)
import State.Item (Item(..), item)

type Entity a =
  { ids :: Array String
  , byId :: Object a
  }

type EntityId a = String

instance foldableEntity :: Foldable Entity where
  foldr f b e = foldr f b (map (\x -> x.ids) e)
  foldl f b e = foldl f b (map (\x -> x.ids) e)

instance functorEntity :: Functor Entity a where
  map f e =
    e { byId = mapWithKey updateValue e.byId }
    where
      updateValue :: String -> a -> a
      updateValue _ value = f value

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

