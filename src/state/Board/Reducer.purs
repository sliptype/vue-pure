module State.Board.Reducer where

import Prelude
import State.Reducer (Reducer)
import State.Entity (EntityId, addInstance, nextId, updateInstance)
import State.Board (State, initialState)
import State.Board.Action (Action(..))
import State.Board.List (list, addItem)
import State.Board.Item (item)

reducer :: Reducer State Action
reducer (Initial) _ = initialState
reducer (AddList name) s = addList name s
reducer (AddItemToList id name) s = addItemToList id name s

addList :: String -> State -> State
addList name s =
  let
    newId = nextId s.list
    newList = list name
  in
  s { list = s.list # addInstance newId newList }

addItemToList :: EntityId -> String -> State -> State
addItemToList id name s =
  let
    newId = nextId s.item
    newItem = item name
  in
  s
   { item = s.item
      # addInstance newId newItem
   , list = s.list
      # updateInstance (addItem newId) id
   }
