module State.Board.Reducer where

import Prelude
import Data.Maybe (Maybe)

import State.Reducer (Reducer, withInitialState)
import State.Entity (EntityId, addInstance, nextId, updateInstance)
import State.Board (State, initialState)
import State.Board.Action (Action(..))
import State.Board.List (list, addItem)
import State.Board.Item (item)

boardReducer :: Reducer State Action
boardReducer (AddList name) s = addList name s
boardReducer (AddItemToList id name) s = addItemToList id name s
boardReducer _ s = s
-- TODO: Determine how to avoid having to specify default

reducer :: (Maybe Action) -> State -> State
reducer = withInitialState boardReducer initialState

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
