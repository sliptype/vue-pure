module State.Board where

import Prelude
import Data.Array (findIndex)
import Data.Maybe (Maybe(..))

import State.Reducer (Reducer)
import State.Entity (Entity, addInstance, entity)
import State.List (List, list)
import State.Item (Item)

type State =
  { list :: Entity List
  , item :: Entity Item
  }

type ItemAddition =
  { id :: String
  , name :: String
  }

type ItemMove =
  { id :: String
    listId :: String
    right :: Boolean
  }

initialState :: State
initialState =
  { list: entity
      # addInstance "0" (list "Todo")
      # addInstance "1" (list "Doing")
      # addInstance "2" (list "Done")
  , item: entity
  }

findListIndex :: String -> State -> Maybe Int
findListIndex id s = findIndex (_ == id) s.list.ids

addList :: Reducer String
addList s name =
  let
    newId = nextId s.list
    newList = list name
  in
  s { list = s.list # addInstance newId newList }

addItem :: Reducer ItemAddition
addItem s { id, name } =
  let
    newId = nextId s.item
  in
  s
   { item = s.item
      # addInstance newId (item name)
   , list = s.list
      # updateInstance (addItemToList newId) id
   }

moveItemTo :: State -> EntityId Item -> EntityId List -> EntityId List -> State
moveItemTo s id fromId toId =
  s
    { list = s.list
      # updateInstance (removeItemFromList id) fromId
      # updateInstance (addItemToList id) toId
    }

-- moveItem :: Reducer ItemMove
-- moveItem s { id, listId, right } = 

-- -- ensure item exists
-- -- ensure fromList exists
-- -- get toListId
-- -- ensure toList exists

--   | right =
--     let fromIndex = findListIndex listId s in
--     case fromIndex of
--       Just i -> moveItemTo s id i (i + 1) -- Need to ensure this list exists
--       Nothing -> s
--   | not right =
--     let fromIndex = findListIndex listId s in
--     case fromIndex of
--       Just i -> moveItemTo s id i (i - 1)
--       Nothing -> s
