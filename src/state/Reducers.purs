module State.Reducers where

import Prelude

import Data.Array ((:))

import State.Entity (addInstance, updateInstance, nextId)
import State.Model (State)
import State.List (list, addItemToList)
import State.Item (item)

type Reducer a = State -> a -> State

type ItemAddition =
  { id:: String
  , name :: String
  }

addList :: Reducer String
addList s name =
  let
    newId = nextId s.list
    newList = list name
  in
  s { list = addInstance newId newList s.list }

addItem :: Reducer ItemAddition
addItem s { id, name } =
  let
    newId = nextId s.item
  in
  s
   { item = addInstance newId (item name) s.item
   , list = updateInstance (addItemToList newId) id s.list
   }
